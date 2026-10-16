#include "CFGA.h"
#include <algorithm>
#include <functional>
#include <set>
#include <utility>
#include <vector>

using namespace SVF;
using namespace llvm;
using namespace std;

int main(int argc, char **argv)
{
    auto moduleNameVec =
            OptionBase::parseOptions(argc, argv, "Whole Program Points-to Analysis",
                                     "[options] <input-bitcode...>");

    LLVMModuleSet::buildSVFModule(moduleNameVec);

    SVFIRBuilder builder;
    auto pag = builder.build();
    auto icfg = pag->getICFG();

    CFGAnalysis analyzer = CFGAnalysis(icfg);
    analyzer.analyze(icfg);
    analyzer.dumpPaths();
    LLVMModuleSet::releaseLLVMModuleSet();
    return 0;
}

void CFGAnalysis::analyze(SVF::ICFG *icfg)
{
    reachablePaths.clear();

    // Same ICFG node can be visited during DIFFERENT calls to a function.
    // The DFS state must therefore include its calling context.
    using State = pair<unsigned, vector<unsigned>>;

    for (unsigned src : sources)
    {
        for (unsigned snk : sinks)
        {
            vector<unsigned> path;
            vector<unsigned> activeCalls;
            set<State> onPath;

            function<void(const ICFGNode *)> dfs = [&](const ICFGNode *node)
            {
                if (!node)
                    return;

                const unsigned id = node->getId();
                const State state{id, activeCalls};
                if (!onPath.insert(state).second)
                    return; // Cycle in the same call context.

                path.push_back(id);

                if (id == snk)
                {
                    // A path is valid only after all outstanding calls return.
                    if (activeCalls.empty())
                        recordPath(path);
                }
                else
                {
                    for (const auto *edge : node->getOutEdges())
                    {
                        if (const auto *call = SVFUtil::dyn_cast<CallCFGEdge>(edge))
                        {
                            const unsigned callId = call->getCallSite()->getId();
                            // Recursive expansion of the same call site is unbounded.
                            // Enumerate finite, non-recursive calling contexts.
                            if (find(activeCalls.begin(), activeCalls.end(), callId)
                                != activeCalls.end())
                                continue;

                            activeCalls.push_back(callId);
                            dfs(edge->getDstNode());
                            activeCalls.pop_back();
                        }
                        else if (const auto *ret = SVFUtil::dyn_cast<RetCFGEdge>(edge))
                        {
                            const unsigned callId = ret->getCallSite()->getId();
                            // Do not jump back to a different caller of this function.
                            if (activeCalls.empty() || activeCalls.back() != callId)
                                continue;

                            activeCalls.pop_back();
                            dfs(edge->getDstNode());
                            activeCalls.push_back(callId); // Restore for DFS backtracking.
                        }
                        else
                        {
                            dfs(edge->getDstNode()); // Intra-procedural edge.
                        }
                    }
                }

                path.pop_back();
                onPath.erase(state);
            };

            dfs(icfg->getICFGNode(src));
        }
    }
}
