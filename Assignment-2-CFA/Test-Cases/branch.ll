; ModuleID = 'Test-Cases/branch.c'
source_filename = "Test-Cases/branch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bar(i32 noundef %0) #0 !dbg !10 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !15, metadata !DIExpression()), !dbg !16
  %3 = load i32, ptr %2, align 4, !dbg !17
  ret i32 %3, !dbg !18
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !19 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = call i32 (...) @source(), !dbg !24
  store i32 %5, ptr %2, align 4, !dbg !23
  %6 = load i32, ptr %2, align 4, !dbg !25
  %7 = icmp sgt i32 %6, 0, !dbg !27
  br i1 %7, label %8, label %12, !dbg !28

8:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata ptr %3, metadata !29, metadata !DIExpression()), !dbg !31
  %9 = load i32, ptr %2, align 4, !dbg !32
  %10 = call i32 @bar(i32 noundef %9), !dbg !33
  store i32 %10, ptr %3, align 4, !dbg !31
  %11 = load i32, ptr %3, align 4, !dbg !34
  call void @sink(i32 noundef %11), !dbg !35
  br label %16, !dbg !36

12:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !39
  %13 = load i32, ptr %2, align 4, !dbg !40
  %14 = call i32 @bar(i32 noundef %13), !dbg !41
  store i32 %14, ptr %4, align 4, !dbg !39
  %15 = load i32, ptr %4, align 4, !dbg !42
  call void @sink(i32 noundef %15), !dbg !43
  br label %16

16:                                               ; preds = %12, %8
  ret i32 0, !dbg !44
}

declare i32 @source(...) #2

declare void @sink(i32 noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Test-Cases/branch.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-2/Assignment-2-CFA", checksumkind: CSK_MD5, checksum: "77d192efee8870565e1eb97d5020d120")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!10 = distinct !DISubprogram(name: "bar", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "s", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 13, scope: !10)
!17 = !DILocation(line: 5, column: 10, scope: !10)
!18 = !DILocation(line: 5, column: 3, scope: !10)
!19 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !20, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!20 = !DISubroutineType(types: !21)
!21 = !{!13}
!22 = !DILocalVariable(name: "a", scope: !19, file: !1, line: 9, type: !13)
!23 = !DILocation(line: 9, column: 7, scope: !19)
!24 = !DILocation(line: 9, column: 11, scope: !19)
!25 = !DILocation(line: 10, column: 7, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !1, line: 10, column: 7)
!27 = !DILocation(line: 10, column: 9, scope: !26)
!28 = !DILocation(line: 10, column: 7, scope: !19)
!29 = !DILocalVariable(name: "p", scope: !30, file: !1, line: 11, type: !13)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 10, column: 13)
!31 = !DILocation(line: 11, column: 9, scope: !30)
!32 = !DILocation(line: 11, column: 17, scope: !30)
!33 = !DILocation(line: 11, column: 13, scope: !30)
!34 = !DILocation(line: 12, column: 10, scope: !30)
!35 = !DILocation(line: 12, column: 5, scope: !30)
!36 = !DILocation(line: 13, column: 3, scope: !30)
!37 = !DILocalVariable(name: "q", scope: !38, file: !1, line: 14, type: !13)
!38 = distinct !DILexicalBlock(scope: !26, file: !1, line: 13, column: 8)
!39 = !DILocation(line: 14, column: 9, scope: !38)
!40 = !DILocation(line: 14, column: 17, scope: !38)
!41 = !DILocation(line: 14, column: 13, scope: !38)
!42 = !DILocation(line: 15, column: 10, scope: !38)
!43 = !DILocation(line: 15, column: 5, scope: !38)
!44 = !DILocation(line: 17, column: 3, scope: !19)
