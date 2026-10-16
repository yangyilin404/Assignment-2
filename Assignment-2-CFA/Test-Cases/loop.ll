; ModuleID = 'Test-Cases/loop.c'
source_filename = "Test-Cases/loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, ptr %2, align 4, !dbg !16
  br label %3, !dbg !17

3:                                                ; preds = %6, %0
  %4 = load i32, ptr %2, align 4, !dbg !18
  %5 = icmp slt i32 %4, 100, !dbg !19
  br i1 %5, label %6, label %9, !dbg !17

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !dbg !20
  %8 = add nsw i32 %7, 1, !dbg !20
  store i32 %8, ptr %2, align 4, !dbg !20
  br label %3, !dbg !17, !llvm.loop !21

9:                                                ; preds = %3
  ret i32 0, !dbg !23
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Test-Cases/loop.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-2/Assignment-2-CFA", checksumkind: CSK_MD5, checksum: "8976b22ba65df23fc6a406830884a936")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 2, type: !13)
!16 = !DILocation(line: 2, column: 7, scope: !10)
!17 = !DILocation(line: 3, column: 3, scope: !10)
!18 = !DILocation(line: 3, column: 10, scope: !10)
!19 = !DILocation(line: 3, column: 12, scope: !10)
!20 = !DILocation(line: 4, column: 5, scope: !10)
!21 = distinct !{!21, !17, !20, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = !DILocation(line: 5, column: 3, scope: !10)
