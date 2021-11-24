; ModuleID = 'src/stdlib.c'
source_filename = "src/stdlib.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%struct.Array = type opaque

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @__quantum__rt__tuple_create(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  store i64 %0, i64* %2, align 8
  %7 = load i64, i64* %2, align 8
  %8 = add i64 %7, 24
  %9 = call i8* @malloc(i64 %8) #5
  store i8* %9, i8** %3, align 8
  %10 = load i8*, i8** %3, align 8
  %11 = bitcast i8* %10 to i64*
  store i64* %11, i64** %4, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 8
  %14 = bitcast i8* %13 to i64*
  store i64* %14, i64** %5, align 8
  %15 = load i8*, i8** %3, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 16
  %17 = bitcast i8* %16 to i64*
  store i64* %17, i64** %6, align 8
  %18 = load i64, i64* %2, align 8
  %19 = load i64*, i64** %4, align 8
  store i64 %18, i64* %19, align 8
  %20 = load i64*, i64** %5, align 8
  store i64 1, i64* %20, align 8
  %21 = load i64*, i64** %6, align 8
  store i64 0, i64* %21, align 8
  %22 = load i8*, i8** %3, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 24
  ret i8* %23
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__quantum__rt__tuple_update_reference_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load i8*, i8** %3, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 -24
  store i8* %8, i8** %5, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to i64*
  store i64* %11, i64** %6, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = load i64*, i64** %6, align 8
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, %13
  store i64 %16, i64* %14, align 8
  %17 = load i64*, i64** %6, align 8
  %18 = load i64, i64* %17, align 8
  %19 = icmp sle i64 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %2
  %21 = load i8*, i8** %5, align 8
  call void @free(i8* %21)
  br label %22

22:                                               ; preds = %20, %2
  ret void
}

declare void @free(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__quantum__rt__tuple_update_alias_count(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load i8*, i8** %3, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 -24
  store i8* %8, i8** %5, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 24
  %11 = bitcast i8* %10 to i64*
  store i64* %11, i64** %6, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = load i64*, i64** %6, align 8
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, %13
  store i64 %16, i64* %14, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.Array* @__quantum__rt__array_create_1d(i32 %0, i64 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i64*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i64*, align 8
  store i32 %0, i32* %3, align 4
  store i64 %1, i64* %4, align 8
  %10 = load i64, i64* %4, align 8
  %11 = load i32, i32* %3, align 4
  %12 = sext i32 %11 to i64
  %13 = mul nsw i64 %10, %12
  %14 = add i64 %13, 32
  %15 = call i8* @malloc(i64 %14) #5
  store i8* %15, i8** %5, align 8
  %16 = load i8*, i8** %5, align 8
  %17 = bitcast i8* %16 to i64*
  store i64* %17, i64** %6, align 8
  %18 = load i8*, i8** %5, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 8
  %20 = bitcast i8* %19 to i64*
  store i64* %20, i64** %7, align 8
  %21 = load i8*, i8** %5, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 16
  %23 = bitcast i8* %22 to i64*
  store i64* %23, i64** %8, align 8
  %24 = load i8*, i8** %5, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 24
  %26 = bitcast i8* %25 to i64*
  store i64* %26, i64** %9, align 8
  %27 = load i32, i32* %3, align 4
  %28 = sext i32 %27 to i64
  %29 = load i64*, i64** %6, align 8
  store i64 %28, i64* %29, align 8
  %30 = load i64, i64* %4, align 8
  %31 = load i64*, i64** %7, align 8
  store i64 %30, i64* %31, align 8
  %32 = load i64*, i64** %8, align 8
  store i64 1, i64* %32, align 8
  %33 = load i64*, i64** %9, align 8
  store i64 0, i64* %33, align 8
  %34 = load i8*, i8** %5, align 8
  %35 = bitcast i8* %34 to %struct.Array*
  ret %struct.Array* %35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i64 @__quantum__rt__array_get_size_1d(%struct.Array* %0) #0 {
  %2 = alloca %struct.Array*, align 8
  %3 = alloca i64*, align 8
  store %struct.Array* %0, %struct.Array** %2, align 8
  %4 = load %struct.Array*, %struct.Array** %2, align 8
  %5 = bitcast %struct.Array* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 8
  %7 = bitcast i8* %6 to i64*
  store i64* %7, i64** %3, align 8
  %8 = load i64*, i64** %3, align 8
  %9 = load i64, i64* %8, align 8
  ret i64 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @__quantum__rt__array_get_element_ptr_1d(%struct.Array* %0, i64 %1) #0 {
  %3 = alloca %struct.Array*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64*, align 8
  store %struct.Array* %0, %struct.Array** %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load %struct.Array*, %struct.Array** %3, align 8
  %7 = bitcast %struct.Array* %6 to i64*
  store i64* %7, i64** %5, align 8
  %8 = load %struct.Array*, %struct.Array** %3, align 8
  %9 = bitcast %struct.Array* %8 to i8*
  %10 = load i64*, i64** %5, align 8
  %11 = load i64, i64* %10, align 8
  %12 = load i64, i64* %4, align 8
  %13 = mul nsw i64 %11, %12
  %14 = getelementptr inbounds i8, i8* %9, i64 %13
  %15 = getelementptr inbounds i8, i8* %14, i64 32
  ret i8* %15
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__quantum__rt__array_update_alias_count(%struct.Array* %0, i32 %1) #0 {
  %3 = alloca %struct.Array*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 8
  store %struct.Array* %0, %struct.Array** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.Array*, %struct.Array** %3, align 8
  %7 = bitcast %struct.Array* %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 24
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %5, align 8
  %10 = load i32, i32* %4, align 4
  %11 = sext i32 %10 to i64
  %12 = load i64*, i64** %5, align 8
  %13 = load i64, i64* %12, align 8
  %14 = add nsw i64 %13, %11
  store i64 %14, i64* %12, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__quantum__rt__array_update_reference_count(%struct.Array* %0, i32 %1) #0 {
  %3 = alloca %struct.Array*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 8
  store %struct.Array* %0, %struct.Array** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.Array*, %struct.Array** %3, align 8
  %7 = bitcast %struct.Array* %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 16
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %5, align 8
  %10 = load i32, i32* %4, align 4
  %11 = sext i32 %10 to i64
  %12 = load i64*, i64** %5, align 8
  %13 = load i64, i64* %12, align 8
  %14 = add nsw i64 %13, %11
  store i64 %14, i64* %12, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.Array* @__quantum__rt__array_concatenate(%struct.Array* %0, i8* %1) #0 {
  %3 = alloca %struct.Array*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  store %struct.Array* %0, %struct.Array** %3, align 8
  store i8* %1, i8** %4, align 8
  %12 = load %struct.Array*, %struct.Array** %3, align 8
  %13 = bitcast %struct.Array* %12 to i64*
  %14 = load i64, i64* %13, align 8
  store i64 %14, i64* %5, align 8
  %15 = load %struct.Array*, %struct.Array** %3, align 8
  %16 = bitcast %struct.Array* %15 to i8*
  %17 = getelementptr inbounds i8, i8* %16, i64 8
  %18 = bitcast i8* %17 to i64*
  %19 = load i64, i64* %18, align 8
  store i64 %19, i64* %6, align 8
  %20 = load i8*, i8** %4, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 8
  %22 = bitcast i8* %21 to i64*
  %23 = load i64, i64* %22, align 8
  store i64 %23, i64* %7, align 8
  %24 = load %struct.Array*, %struct.Array** %3, align 8
  %25 = bitcast %struct.Array* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 32
  store i8* %26, i8** %8, align 8
  %27 = load i8*, i8** %4, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 32
  store i8* %28, i8** %9, align 8
  %29 = load i64, i64* %5, align 8
  %30 = trunc i64 %29 to i32
  %31 = load i64, i64* %6, align 8
  %32 = load i64, i64* %7, align 8
  %33 = add nsw i64 %31, %32
  %34 = call %struct.Array* @__quantum__rt__array_create_1d(i32 %30, i64 %33)
  %35 = bitcast %struct.Array* %34 to i8*
  store i8* %35, i8** %10, align 8
  %36 = load i8*, i8** %10, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 32
  store i8* %37, i8** %11, align 8
  %38 = load i8*, i8** %11, align 8
  %39 = load i8*, i8** %8, align 8
  %40 = load i64, i64* %6, align 8
  %41 = load i64, i64* %5, align 8
  %42 = mul nsw i64 %40, %41
  %43 = load i8*, i8** %11, align 8
  %44 = call i64 @llvm.objectsize.i64.p0i8(i8* %43, i1 false, i1 true, i1 false)
  %45 = call i8* @__memcpy_chk(i8* %38, i8* %39, i64 %42, i64 %44) #6
  %46 = load i8*, i8** %11, align 8
  %47 = load i64, i64* %6, align 8
  %48 = load i64, i64* %5, align 8
  %49 = mul nsw i64 %47, %48
  %50 = getelementptr inbounds i8, i8* %46, i64 %49
  %51 = load i8*, i8** %9, align 8
  %52 = load i64, i64* %7, align 8
  %53 = load i64, i64* %5, align 8
  %54 = mul nsw i64 %52, %53
  %55 = load i8*, i8** %11, align 8
  %56 = load i64, i64* %6, align 8
  %57 = load i64, i64* %5, align 8
  %58 = mul nsw i64 %56, %57
  %59 = getelementptr inbounds i8, i8* %55, i64 %58
  %60 = call i64 @llvm.objectsize.i64.p0i8(i8* %59, i1 false, i1 true, i1 false)
  %61 = call i8* @__memcpy_chk(i8* %50, i8* %51, i64 %54, i64 %60) #6
  %62 = load i8*, i8** %10, align 8
  %63 = bitcast i8* %62 to %struct.Array*
  ret %struct.Array* %63
}

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8*, i8*, i64, i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define %struct.Array* @__quantum__rt__array_copy(%struct.Array* %0, i8 signext %1) #0 {
  %3 = alloca %struct.Array*, align 8
  %4 = alloca i8, align 1
  store %struct.Array* %0, %struct.Array** %3, align 8
  store i8 %1, i8* %4, align 1
  %5 = load %struct.Array*, %struct.Array** %3, align 8
  ret %struct.Array* %5
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { allocsize(0) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew clang version 11.1.0"}
