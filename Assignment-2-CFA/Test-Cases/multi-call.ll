; ModuleID = 'Test-Cases/multi-call.c'
source_filename = "Test-Cases/multi-call.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inc(i32 noundef %0) #0 !dbg !10 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !15, metadata !DIExpression()), !dbg !16
  %3 = load i32, ptr %2, align 4, !dbg !17
  %4 = add nsw i32 %3, 1, !dbg !17
  store i32 %4, ptr %2, align 4, !dbg !17
  ret i32 %3, !dbg !18
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !19 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !22, metadata !DIExpression()), !dbg !23
  %4 = call i32 @inc(i32 noundef 10), !dbg !24
  store i32 %4, ptr %2, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata ptr %3, metadata !25, metadata !DIExpression()), !dbg !26
  %5 = call i32 @inc(i32 noundef 100), !dbg !27
  store i32 %5, ptr %3, align 4, !dbg !26
  ret i32 0, !dbg !28
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Test-Cases/multi-call.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-2/Assignment-2-CFA", checksumkind: CSK_MD5, checksum: "e3f238f173536503bf9fab766ee9faa1")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!10 = distinct !DISubprogram(name: "inc", scope: !1, file: !1, line: 1, type: !11, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 1, type: !13)
!16 = !DILocation(line: 1, column: 13, scope: !10)
!17 = !DILocation(line: 2, column: 10, scope: !10)
!18 = !DILocation(line: 2, column: 2, scope: !10)
!19 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !20, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!20 = !DISubroutineType(types: !21)
!21 = !{!13}
!22 = !DILocalVariable(name: "a", scope: !19, file: !1, line: 6, type: !13)
!23 = !DILocation(line: 6, column: 6, scope: !19)
!24 = !DILocation(line: 6, column: 10, scope: !19)
!25 = !DILocalVariable(name: "b", scope: !19, file: !1, line: 7, type: !13)
!26 = !DILocation(line: 7, column: 6, scope: !19)
!27 = !DILocation(line: 7, column: 10, scope: !19)
!28 = !DILocation(line: 8, column: 2, scope: !19)
