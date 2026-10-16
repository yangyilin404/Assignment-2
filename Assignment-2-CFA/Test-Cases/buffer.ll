; ModuleID = 'Test-Cases/buffer.c'
source_filename = "Test-Cases/buffer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @create_buffer(i32 noundef %0, i32 noundef %1) #0 !dbg !10 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata ptr %5, metadata !20, metadata !DIExpression()), !dbg !21
  %7 = load i32, ptr %3, align 4, !dbg !22
  %8 = sext i32 %7 to i64, !dbg !22
  %9 = mul i64 %8, 4, !dbg !23
  %10 = call noalias ptr @malloc(i64 noundef %9) #4, !dbg !24
  store ptr %10, ptr %5, align 8, !dbg !21
  %11 = load i32, ptr %4, align 4, !dbg !25
  %12 = icmp ne i32 %11, 0, !dbg !25
  br i1 %12, label %13, label %28, !dbg !27

13:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %6, metadata !28, metadata !DIExpression()), !dbg !31
  store i32 0, ptr %6, align 4, !dbg !31
  br label %14, !dbg !32

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %6, align 4, !dbg !33
  %16 = load i32, ptr %3, align 4, !dbg !35
  %17 = icmp slt i32 %15, %16, !dbg !36
  br i1 %17, label %18, label %27, !dbg !37

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4, !dbg !38
  %20 = load ptr, ptr %5, align 8, !dbg !40
  %21 = load i32, ptr %6, align 4, !dbg !41
  %22 = sext i32 %21 to i64, !dbg !40
  %23 = getelementptr inbounds i32, ptr %20, i64 %22, !dbg !40
  store i32 %19, ptr %23, align 4, !dbg !42
  br label %24, !dbg !43

24:                                               ; preds = %18
  %25 = load i32, ptr %6, align 4, !dbg !44
  %26 = add nsw i32 %25, 1, !dbg !44
  store i32 %26, ptr %6, align 4, !dbg !44
  br label %14, !dbg !45, !llvm.loop !46

27:                                               ; preds = %14
  br label %28, !dbg !49

28:                                               ; preds = %27, %2
  %29 = load ptr, ptr %5, align 8, !dbg !50
  ret ptr %29, !dbg !51
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 !dbg !52 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !55, metadata !DIExpression()), !dbg !56
  %3 = call ptr @create_buffer(i32 noundef 10, i32 noundef 1), !dbg !57
  store ptr %3, ptr %1, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %2, metadata !58, metadata !DIExpression()), !dbg !59
  %4 = call ptr @create_buffer(i32 noundef 10, i32 noundef 0), !dbg !60
  store ptr %4, ptr %2, align 8, !dbg !59
  %5 = load ptr, ptr %1, align 8, !dbg !61
  call void @free(ptr noundef %5) #5, !dbg !62
  %6 = load ptr, ptr %2, align 8, !dbg !63
  call void @free(ptr noundef %6) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Test-Cases/buffer.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-2/Assignment-2-CFA", checksumkind: CSK_MD5, checksum: "92d8a773442c48b4a42dcd9f4506e5e0")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!10 = distinct !DISubprogram(name: "create_buffer", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !14}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "size", arg: 1, scope: !10, file: !1, line: 3, type: !14)
!17 = !DILocation(line: 3, column: 24, scope: !10)
!18 = !DILocalVariable(name: "initialize", arg: 2, scope: !10, file: !1, line: 3, type: !14)
!19 = !DILocation(line: 3, column: 34, scope: !10)
!20 = !DILocalVariable(name: "buf", scope: !10, file: !1, line: 4, type: !13)
!21 = !DILocation(line: 4, column: 10, scope: !10)
!22 = !DILocation(line: 4, column: 23, scope: !10)
!23 = !DILocation(line: 4, column: 28, scope: !10)
!24 = !DILocation(line: 4, column: 16, scope: !10)
!25 = !DILocation(line: 5, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !10, file: !1, line: 5, column: 9)
!27 = !DILocation(line: 5, column: 9, scope: !10)
!28 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 6, type: !14)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 6, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 5, column: 21)
!31 = !DILocation(line: 6, column: 18, scope: !29)
!32 = !DILocation(line: 6, column: 14, scope: !29)
!33 = !DILocation(line: 6, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 6, column: 9)
!35 = !DILocation(line: 6, column: 29, scope: !34)
!36 = !DILocation(line: 6, column: 27, scope: !34)
!37 = !DILocation(line: 6, column: 9, scope: !29)
!38 = !DILocation(line: 7, column: 22, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !1, line: 6, column: 40)
!40 = !DILocation(line: 7, column: 13, scope: !39)
!41 = !DILocation(line: 7, column: 17, scope: !39)
!42 = !DILocation(line: 7, column: 20, scope: !39)
!43 = !DILocation(line: 8, column: 9, scope: !39)
!44 = !DILocation(line: 6, column: 36, scope: !34)
!45 = !DILocation(line: 6, column: 9, scope: !34)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 8, column: 9, scope: !29)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 9, column: 5, scope: !30)
!50 = !DILocation(line: 10, column: 12, scope: !10)
!51 = !DILocation(line: 10, column: 5, scope: !10)
!52 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !53, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DISubroutineType(types: !54)
!54 = !{null}
!55 = !DILocalVariable(name: "buf1", scope: !52, file: !1, line: 14, type: !13)
!56 = !DILocation(line: 14, column: 10, scope: !52)
!57 = !DILocation(line: 14, column: 17, scope: !52)
!58 = !DILocalVariable(name: "buf2", scope: !52, file: !1, line: 15, type: !13)
!59 = !DILocation(line: 15, column: 10, scope: !52)
!60 = !DILocation(line: 15, column: 17, scope: !52)
!61 = !DILocation(line: 17, column: 7, scope: !52)
!62 = !DILocation(line: 17, column: 2, scope: !52)
!63 = !DILocation(line: 18, column: 7, scope: !52)
!64 = !DILocation(line: 18, column: 2, scope: !52)
!65 = !DILocation(line: 19, column: 1, scope: !52)
