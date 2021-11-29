; ModuleID = 'combined.ll'
source_filename = "qat-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%Qubit = type opaque
%Result = type opaque

define i64 @ConstArrayReduction__Main__Interop(i64 %z) local_unnamed_addr #0 {
ConstArrayReduction__Main__body.29.exit:
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  %0 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  %1 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  %2 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Result* nonnull inttoptr (i64 3 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 3 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Result* nonnull inttoptr (i64 4 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  %4 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 4 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Result* nonnull inttoptr (i64 5 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  %5 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 5 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Result* nonnull inttoptr (i64 6 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Qubit* null)
  %6 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 6 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Result* nonnull inttoptr (i64 7 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  %7 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 7 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Result* nonnull inttoptr (i64 8 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  %8 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 8 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Result* nonnull inttoptr (i64 9 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Qubit* null)
  tail call void @__quantum__qis__s__adj(%Qubit* null)
  %9 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 9 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Result* nonnull inttoptr (i64 10 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  %10 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 10 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Result* nonnull inttoptr (i64 11 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  %11 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 11 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Result* nonnull inttoptr (i64 12 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  %12 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 12 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Result* nonnull inttoptr (i64 13 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  %13 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 13 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Result* nonnull inttoptr (i64 14 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  %14 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 14 to %Result*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i64
  %17 = xor i1 %13, true
  %18 = zext i1 %17 to i64
  %19 = xor i1 %12, true
  %20 = zext i1 %19 to i64
  %21 = insertelement <8 x i1> undef, i1 %1, i32 0
  %22 = insertelement <8 x i1> %21, i1 %0, i32 1
  %23 = insertelement <8 x i1> %22, i1 %2, i32 2
  %24 = insertelement <8 x i1> %23, i1 %3, i32 3
  %25 = insertelement <8 x i1> %24, i1 %4, i32 4
  %26 = insertelement <8 x i1> %25, i1 %5, i32 5
  %27 = insertelement <8 x i1> %26, i1 %6, i32 6
  %28 = insertelement <8 x i1> %27, i1 %7, i32 7
  %29 = xor <8 x i1> %28, <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>
  %30 = zext <8 x i1> %29 to <8 x i64>
  %31 = xor i1 %8, true
  %32 = zext i1 %31 to i64
  %33 = xor i1 %9, true
  %34 = zext i1 %33 to i64
  %35 = xor i1 %10, true
  %36 = zext i1 %35 to i64
  %37 = xor i1 %11, true
  %38 = zext i1 %37 to i64
  %39 = call i64 @llvm.experimental.vector.reduce.add.v8i64(<8 x i64> %30)
  %40 = add nuw nsw i64 %39, %32
  %41 = add nuw nsw i64 %40, %34
  %42 = add nuw nsw i64 %41, %36
  %43 = add nuw nsw i64 %42, %38
  %44 = add nuw nsw i64 %43, %20
  %45 = add nuw nsw i64 %44, %18
  %46 = add nuw nsw i64 %45, %16
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Result* nonnull inttoptr (i64 15 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Result* nonnull inttoptr (i64 16 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Result* nonnull inttoptr (i64 17 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Result* nonnull inttoptr (i64 18 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 19 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* nonnull inttoptr (i64 20 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Result* nonnull inttoptr (i64 21 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*), %Result* nonnull inttoptr (i64 22 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*), %Result* nonnull inttoptr (i64 23 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  %47 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 15 to %Result*))
  %48 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 16 to %Result*))
  %49 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 17 to %Result*))
  %50 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 18 to %Result*))
  %51 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 19 to %Result*))
  %52 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 20 to %Result*))
  %53 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 21 to %Result*))
  %54 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 22 to %Result*))
  %55 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 23 to %Result*))
  %56 = xor i1 %47, true
  %57 = zext i1 %56 to i64
  %58 = xor i1 %48, true
  %59 = zext i1 %58 to i64
  %60 = xor i1 %49, true
  %61 = zext i1 %60 to i64
  %62 = xor i1 %50, true
  %63 = zext i1 %62 to i64
  %64 = xor i1 %51, true
  %65 = zext i1 %64 to i64
  %66 = xor i1 %52, true
  %67 = zext i1 %66 to i64
  %68 = xor i1 %53, true
  %69 = zext i1 %68 to i64
  %70 = xor i1 %54, true
  %71 = zext i1 %70 to i64
  %72 = xor i1 %55, true
  %73 = zext i1 %72 to i64
  %74 = add nuw nsw i64 %46, %57
  %75 = add nuw nsw i64 %74, %59
  %76 = add nuw nsw i64 %75, %61
  %77 = add nuw nsw i64 %76, %63
  %78 = add nuw nsw i64 %77, %65
  %79 = add nuw nsw i64 %78, %67
  %80 = add nuw nsw i64 %79, %69
  %81 = add nuw nsw i64 %80, %71
  %82 = add nuw nsw i64 %81, %73
  ret i64 %82
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

; Function Attrs: nounwind readnone willreturn
declare i64 @llvm.experimental.vector.reduce.add.v8i64(<8 x i64>) #1

attributes #0 = { "InteropFriendly" "requiredQubits"="24" "requiredResults"="24" }
attributes #1 = { nounwind readnone willreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"Homebrew clang version 11.1.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
