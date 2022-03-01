; ModuleID = 'src/stdlib.c'
source_filename = "src/stdlib.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: nounwind ssp uwtable
define i8* @__quantum__rt__tuple_create(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  store i64 %0, i64* %2, align 8, !tbaa !3
  %7 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6
  %8 = load i64, i64* %2, align 8, !tbaa !3
  %9 = add i64 %8, 24
  %10 = call i8* @malloc(i64 %9) #7
  store i8* %10, i8** %3, align 8, !tbaa !7
  %11 = bitcast i64** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #6
  %12 = load i8*, i8** %3, align 8, !tbaa !7
  %13 = bitcast i8* %12 to i64*
  store i64* %13, i64** %4, align 8, !tbaa !7
  %14 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #6
  %15 = load i8*, i8** %3, align 8, !tbaa !7
  %16 = getelementptr inbounds i8, i8* %15, i64 8
  %17 = bitcast i8* %16 to i64*
  store i64* %17, i64** %5, align 8, !tbaa !7
  %18 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %18) #6
  %19 = load i8*, i8** %3, align 8, !tbaa !7
  %20 = getelementptr inbounds i8, i8* %19, i64 16
  %21 = bitcast i8* %20 to i64*
  store i64* %21, i64** %6, align 8, !tbaa !7
  %22 = load i64, i64* %2, align 8, !tbaa !3
  %23 = load i64*, i64** %4, align 8, !tbaa !7
  store i64 %22, i64* %23, align 8, !tbaa !3
  %24 = load i64*, i64** %5, align 8, !tbaa !7
  store i64 1, i64* %24, align 8, !tbaa !3
  %25 = load i64*, i64** %6, align 8, !tbaa !7
  store i64 0, i64* %25, align 8, !tbaa !3
  %26 = load i8*, i8** %3, align 8, !tbaa !7
  %27 = getelementptr inbounds i8, i8* %26, i64 24
  %28 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #6
  %29 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #6
  %30 = bitcast i64** %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #6
  %31 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %31) #6
  ret i8* %27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define void @__quantum__rt__tuple_update_reference_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i32 %1, i32* %4, align 4, !tbaa !9
  %7 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6
  %8 = load i8*, i8** %3, align 8, !tbaa !7
  %9 = getelementptr inbounds i8, i8* %8, i64 -24
  store i8* %9, i8** %5, align 8, !tbaa !7
  %10 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #6
  %11 = load i8*, i8** %5, align 8, !tbaa !7
  %12 = getelementptr inbounds i8, i8* %11, i64 8
  %13 = bitcast i8* %12 to i64*
  store i64* %13, i64** %6, align 8, !tbaa !7
  %14 = load i32, i32* %4, align 4, !tbaa !9
  %15 = sext i32 %14 to i64
  %16 = load i64*, i64** %6, align 8, !tbaa !7
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = add nsw i64 %17, %15
  store i64 %18, i64* %16, align 8, !tbaa !3
  %19 = load i32, i32* %4, align 4, !tbaa !9
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %2
  %22 = load i64*, i64** %6, align 8, !tbaa !7
  %23 = load i64, i64* %22, align 8, !tbaa !3
  %24 = icmp sle i64 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  %26 = load i8*, i8** %5, align 8, !tbaa !7
  call void @free(i8* %26)
  br label %27

27:                                               ; preds = %25, %21
  br label %28

28:                                               ; preds = %27, %2
  %29 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #6
  %30 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #6
  ret void
}

declare void @free(i8*) #3

; Function Attrs: nounwind ssp uwtable
define void @__quantum__rt__tuple_update_alias_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i32 %1, i32* %4, align 4, !tbaa !9
  %7 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6
  %8 = load i8*, i8** %3, align 8, !tbaa !7
  %9 = getelementptr inbounds i8, i8* %8, i64 -24
  store i8* %9, i8** %5, align 8, !tbaa !7
  %10 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #6
  %11 = load i8*, i8** %5, align 8, !tbaa !7
  %12 = getelementptr inbounds i8, i8* %11, i64 24
  %13 = bitcast i8* %12 to i64*
  store i64* %13, i64** %6, align 8, !tbaa !7
  %14 = load i32, i32* %4, align 4, !tbaa !9
  %15 = sext i32 %14 to i64
  %16 = load i64*, i64** %6, align 8, !tbaa !7
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = add nsw i64 %17, %15
  store i64 %18, i64* %16, align 8, !tbaa !3
  %19 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6
  %20 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #6
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i8* @__quantum__rt__array_create_1d(i32 %0, i64 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i64*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i64*, align 8
  store i32 %0, i32* %3, align 4, !tbaa !9
  store i64 %1, i64* %4, align 8, !tbaa !3
  %10 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #6
  %11 = load i64, i64* %4, align 8, !tbaa !3
  %12 = load i32, i32* %3, align 4, !tbaa !9
  %13 = sext i32 %12 to i64
  %14 = mul nsw i64 %11, %13
  %15 = add i64 %14, 32
  %16 = call i8* @malloc(i64 %15) #7
  store i8* %16, i8** %5, align 8, !tbaa !7
  %17 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #6
  %18 = load i8*, i8** %5, align 8, !tbaa !7
  %19 = getelementptr inbounds i8, i8* %18, i64 0
  %20 = bitcast i8* %19 to i64*
  store i64* %20, i64** %6, align 8, !tbaa !7
  %21 = bitcast i64** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #6
  %22 = load i8*, i8** %5, align 8, !tbaa !7
  %23 = getelementptr inbounds i8, i8* %22, i64 8
  %24 = bitcast i8* %23 to i64*
  store i64* %24, i64** %7, align 8, !tbaa !7
  %25 = bitcast i64** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25) #6
  %26 = load i8*, i8** %5, align 8, !tbaa !7
  %27 = getelementptr inbounds i8, i8* %26, i64 16
  %28 = bitcast i8* %27 to i64*
  store i64* %28, i64** %8, align 8, !tbaa !7
  %29 = bitcast i64** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #6
  %30 = load i8*, i8** %5, align 8, !tbaa !7
  %31 = getelementptr inbounds i8, i8* %30, i64 24
  %32 = bitcast i8* %31 to i64*
  store i64* %32, i64** %9, align 8, !tbaa !7
  %33 = load i32, i32* %3, align 4, !tbaa !9
  %34 = sext i32 %33 to i64
  %35 = load i64*, i64** %6, align 8, !tbaa !7
  store i64 %34, i64* %35, align 8, !tbaa !3
  %36 = load i64, i64* %4, align 8, !tbaa !3
  %37 = load i64*, i64** %7, align 8, !tbaa !7
  store i64 %36, i64* %37, align 8, !tbaa !3
  %38 = load i64*, i64** %8, align 8, !tbaa !7
  store i64 1, i64* %38, align 8, !tbaa !3
  %39 = load i64*, i64** %9, align 8, !tbaa !7
  store i64 0, i64* %39, align 8, !tbaa !3
  %40 = load i8*, i8** %5, align 8, !tbaa !7
  %41 = bitcast i64** %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #6
  %42 = bitcast i64** %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %42) #6
  %43 = bitcast i64** %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %43) #6
  %44 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #6
  %45 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #6
  ret i8* %40
}

; Function Attrs: nounwind ssp uwtable
define i64 @__quantum__rt__array_get_size_1d(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !7
  %4 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = load i8*, i8** %2, align 8, !tbaa !7
  %6 = getelementptr inbounds i8, i8* %5, i64 8
  %7 = bitcast i8* %6 to i64*
  store i64* %7, i64** %3, align 8, !tbaa !7
  %8 = load i64*, i64** %3, align 8, !tbaa !7
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6
  ret i64 %9
}

; Function Attrs: nounwind ssp uwtable
define i8* @__quantum__rt__array_get_element_ptr_1d(i8* %0, i64 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i64 %1, i64* %4, align 8, !tbaa !3
  %6 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6
  %7 = load i8*, i8** %3, align 8, !tbaa !7
  %8 = bitcast i8* %7 to i64*
  store i64* %8, i64** %5, align 8, !tbaa !7
  %9 = load i8*, i8** %3, align 8, !tbaa !7
  %10 = load i64*, i64** %5, align 8, !tbaa !7
  %11 = load i64, i64* %10, align 8, !tbaa !3
  %12 = load i64, i64* %4, align 8, !tbaa !3
  %13 = mul nsw i64 %11, %12
  %14 = getelementptr inbounds i8, i8* %9, i64 %13
  %15 = getelementptr inbounds i8, i8* %14, i64 32
  %16 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #6
  ret i8* %15
}

; Function Attrs: nounwind ssp uwtable
define void @__quantum__rt__array_update_alias_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i32 %1, i32* %4, align 4, !tbaa !9
  %6 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6
  %7 = load i8*, i8** %3, align 8, !tbaa !7
  %8 = getelementptr inbounds i8, i8* %7, i64 24
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %5, align 8, !tbaa !7
  %10 = load i32, i32* %4, align 4, !tbaa !9
  %11 = sext i32 %10 to i64
  %12 = load i64*, i64** %5, align 8, !tbaa !7
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = add nsw i64 %13, %11
  store i64 %14, i64* %12, align 8, !tbaa !3
  %15 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #6
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @__quantum__rt__array_update_reference_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i32 %1, i32* %4, align 4, !tbaa !9
  %6 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6
  %7 = load i8*, i8** %3, align 8, !tbaa !7
  %8 = getelementptr inbounds i8, i8* %7, i64 16
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %5, align 8, !tbaa !7
  %10 = load i32, i32* %4, align 4, !tbaa !9
  %11 = sext i32 %10 to i64
  %12 = load i64*, i64** %5, align 8, !tbaa !7
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = add nsw i64 %13, %11
  store i64 %14, i64* %12, align 8, !tbaa !3
  %15 = load i32, i32* %4, align 4, !tbaa !9
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %2
  %18 = load i64*, i64** %5, align 8, !tbaa !7
  %19 = load i64, i64* %18, align 8, !tbaa !3
  %20 = icmp sle i64 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = load i8*, i8** %3, align 8, !tbaa !7
  call void @free(i8* %22)
  br label %23

23:                                               ; preds = %21, %17
  br label %24

24:                                               ; preds = %23, %2
  %25 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #6
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i8* @__quantum__rt__array_concatenate(i8* %0, i8* %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !7
  store i8* %1, i8** %4, align 8, !tbaa !7
  %12 = bitcast i64* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #6
  %13 = load i8*, i8** %3, align 8, !tbaa !7
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !3
  store i64 %16, i64* %5, align 8, !tbaa !3
  %17 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #6
  %18 = load i8*, i8** %3, align 8, !tbaa !7
  %19 = getelementptr inbounds i8, i8* %18, i64 8
  %20 = bitcast i8* %19 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !3
  store i64 %21, i64* %6, align 8, !tbaa !3
  %22 = bitcast i64* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %22) #6
  %23 = load i8*, i8** %4, align 8, !tbaa !7
  %24 = getelementptr inbounds i8, i8* %23, i64 8
  %25 = bitcast i8* %24 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !3
  store i64 %26, i64* %7, align 8, !tbaa !3
  %27 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %27) #6
  %28 = load i64, i64* %5, align 8, !tbaa !3
  %29 = trunc i64 %28 to i32
  %30 = load i64, i64* %6, align 8, !tbaa !3
  %31 = load i64, i64* %7, align 8, !tbaa !3
  %32 = add nsw i64 %30, %31
  %33 = call i8* @__quantum__rt__array_create_1d(i32 %29, i64 %32)
  store i8* %33, i8** %8, align 8, !tbaa !7
  %34 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %34) #6
  %35 = load i8*, i8** %3, align 8, !tbaa !7
  %36 = getelementptr inbounds i8, i8* %35, i64 32
  store i8* %36, i8** %9, align 8, !tbaa !7
  %37 = bitcast i8** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %37) #6
  %38 = load i8*, i8** %4, align 8, !tbaa !7
  %39 = getelementptr inbounds i8, i8* %38, i64 32
  store i8* %39, i8** %10, align 8, !tbaa !7
  %40 = bitcast i8** %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %40) #6
  %41 = load i8*, i8** %8, align 8, !tbaa !7
  %42 = getelementptr inbounds i8, i8* %41, i64 32
  store i8* %42, i8** %11, align 8, !tbaa !7
  %43 = load i8*, i8** %11, align 8, !tbaa !7
  %44 = load i8*, i8** %9, align 8, !tbaa !7
  %45 = load i64, i64* %6, align 8, !tbaa !3
  %46 = load i64, i64* %5, align 8, !tbaa !3
  %47 = mul nsw i64 %45, %46
  %48 = load i8*, i8** %11, align 8, !tbaa !7
  %49 = call i64 @llvm.objectsize.i64.p0i8(i8* %48, i1 false, i1 true, i1 false)
  %50 = call i8* @__memcpy_chk(i8* %43, i8* %44, i64 %47, i64 %49) #6
  %51 = load i8*, i8** %11, align 8, !tbaa !7
  %52 = load i64, i64* %6, align 8, !tbaa !3
  %53 = load i64, i64* %5, align 8, !tbaa !3
  %54 = mul nsw i64 %52, %53
  %55 = getelementptr inbounds i8, i8* %51, i64 %54
  %56 = load i8*, i8** %10, align 8, !tbaa !7
  %57 = load i64, i64* %7, align 8, !tbaa !3
  %58 = load i64, i64* %5, align 8, !tbaa !3
  %59 = mul nsw i64 %57, %58
  %60 = load i8*, i8** %11, align 8, !tbaa !7
  %61 = load i64, i64* %6, align 8, !tbaa !3
  %62 = load i64, i64* %5, align 8, !tbaa !3
  %63 = mul nsw i64 %61, %62
  %64 = getelementptr inbounds i8, i8* %60, i64 %63
  %65 = call i64 @llvm.objectsize.i64.p0i8(i8* %64, i1 false, i1 true, i1 false)
  %66 = call i8* @__memcpy_chk(i8* %55, i8* %56, i64 %59, i64 %65) #6
  %67 = load i8*, i8** %8, align 8, !tbaa !7
  %68 = bitcast i8** %11 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %68) #6
  %69 = bitcast i8** %10 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %69) #6
  %70 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %70) #6
  %71 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %71) #6
  %72 = bitcast i64* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #6
  %73 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #6
  %74 = bitcast i64* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #6
  ret i8* %67
}

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8*, i8*, i64, i64) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #5

; Function Attrs: nounwind ssp uwtable
define i8* @__quantum__rt__array_copy(i8* %0, i1 zeroext %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8, align 1
  %6 = alloca i64*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64*, align 8
  store i8* %0, i8** %4, align 8, !tbaa !7
  %12 = zext i1 %1 to i8
  store i8 %12, i8* %5, align 1, !tbaa !11
  %13 = load i8*, i8** %4, align 8, !tbaa !7
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  store i8* null, i8** %3, align 8
  br label %70

16:                                               ; preds = %2
  %17 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #6
  %18 = load i8*, i8** %4, align 8, !tbaa !7
  %19 = getelementptr inbounds i8, i8* %18, i64 24
  %20 = bitcast i8* %19 to i64*
  store i64* %20, i64** %6, align 8, !tbaa !7
  %21 = load i8, i8* %5, align 1, !tbaa !11, !range !13
  %22 = trunc i8 %21 to i1
  br i1 %22, label %27, label %23

23:                                               ; preds = %16
  %24 = load i64*, i64** %6, align 8, !tbaa !7
  %25 = load i64, i64* %24, align 8, !tbaa !3
  %26 = icmp sgt i64 %25, 0
  br i1 %26, label %27, label %58

27:                                               ; preds = %23, %16
  %28 = bitcast i64* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28) #6
  %29 = load i8*, i8** %4, align 8, !tbaa !7
  %30 = getelementptr inbounds i8, i8* %29, i64 0
  %31 = bitcast i8* %30 to i64*
  %32 = load i64, i64* %31, align 8, !tbaa !3
  store i64 %32, i64* %7, align 8, !tbaa !3
  %33 = bitcast i64* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %33) #6
  %34 = load i8*, i8** %4, align 8, !tbaa !7
  %35 = getelementptr inbounds i8, i8* %34, i64 8
  %36 = bitcast i8* %35 to i64*
  %37 = load i64, i64* %36, align 8, !tbaa !3
  store i64 %37, i64* %8, align 8, !tbaa !3
  %38 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %38) #6
  %39 = load i64, i64* %7, align 8, !tbaa !3
  %40 = trunc i64 %39 to i32
  %41 = load i64, i64* %8, align 8, !tbaa !3
  %42 = call i8* @__quantum__rt__array_create_1d(i32 %40, i64 %41)
  store i8* %42, i8** %9, align 8, !tbaa !7
  %43 = load i8*, i8** %9, align 8, !tbaa !7
  %44 = getelementptr inbounds i8, i8* %43, i64 32
  %45 = load i8*, i8** %4, align 8, !tbaa !7
  %46 = getelementptr inbounds i8, i8* %45, i64 32
  %47 = load i64, i64* %7, align 8, !tbaa !3
  %48 = load i64, i64* %8, align 8, !tbaa !3
  %49 = mul nsw i64 %47, %48
  %50 = load i8*, i8** %9, align 8, !tbaa !7
  %51 = getelementptr inbounds i8, i8* %50, i64 32
  %52 = call i64 @llvm.objectsize.i64.p0i8(i8* %51, i1 false, i1 true, i1 false)
  %53 = call i8* @__memcpy_chk(i8* %44, i8* %46, i64 %49, i64 %52) #6
  %54 = load i8*, i8** %9, align 8, !tbaa !7
  store i8* %54, i8** %3, align 8
  store i32 1, i32* %10, align 4
  %55 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %55) #6
  %56 = bitcast i64* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %56) #6
  %57 = bitcast i64* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %57) #6
  br label %68

58:                                               ; preds = %23
  %59 = bitcast i64** %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %59) #6
  %60 = load i8*, i8** %4, align 8, !tbaa !7
  %61 = getelementptr inbounds i8, i8* %60, i64 16
  %62 = bitcast i8* %61 to i64*
  store i64* %62, i64** %11, align 8, !tbaa !7
  %63 = load i64*, i64** %11, align 8, !tbaa !7
  %64 = load i64, i64* %63, align 8, !tbaa !3
  %65 = add nsw i64 %64, 1
  store i64 %65, i64* %63, align 8, !tbaa !3
  %66 = load i8*, i8** %4, align 8, !tbaa !7
  store i8* %66, i8** %3, align 8
  store i32 1, i32* %10, align 4
  %67 = bitcast i64** %11 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %67) #6
  br label %68

68:                                               ; preds = %58, %27
  %69 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %69) #6
  br label %70

70:                                               ; preds = %68, %15
  %71 = load i8*, i8** %3, align 8
  ret i8* %71
}

; Function Attrs: nounwind ssp uwtable
define i64 @__quantum__dev__array_get_element_size(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !7
  %3 = load i8*, i8** %2, align 8, !tbaa !7
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = bitcast i8* %4 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !3
  ret i64 %6
}

; Function Attrs: nounwind ssp uwtable
define i64 @__quantum__dev__array_get_alias_count(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !7
  %4 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = load i8*, i8** %2, align 8, !tbaa !7
  %6 = getelementptr inbounds i8, i8* %5, i64 24
  %7 = bitcast i8* %6 to i64*
  store i64* %7, i64** %3, align 8, !tbaa !7
  %8 = load i64*, i64** %3, align 8, !tbaa !7
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6
  ret i64 %9
}

; Function Attrs: nounwind ssp uwtable
define i64 @__quantum__dev__array_get_ref_count(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !7
  %4 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = load i8*, i8** %2, align 8, !tbaa !7
  %6 = getelementptr inbounds i8, i8* %5, i64 16
  %7 = bitcast i8* %6 to i64*
  store i64* %7, i64** %3, align 8, !tbaa !7
  %8 = load i64*, i64** %3, align 8, !tbaa !7
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6
  ret i64 %9
}

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precize-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precize-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precize-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precize-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }
attributes #7 = { allocsize(0) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew Clang version 11.1.0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"_Bool", !5, i64 0}
!13 = !{i8 0, i8 2}
