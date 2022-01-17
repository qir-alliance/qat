; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Result = type opaque
%String = type opaque
%Range = type { i64, i64, i64 }

@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@PartialApplication__2__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__2__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@MemoryManagement__2__FunctionTable = internal constant [2 x void (%Tuple*, i32)*] [void (%Tuple*, i32)* @MemoryManagement__2__RefCount, void (%Tuple*, i32)* @MemoryManagement__2__AliasCount]
@0 = internal constant [52 x i8] c"Length of shift and qs must be twice the value of u\00"
@Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@PartialApplication__1__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@MemoryManagement__1__FunctionTable = internal constant [2 x void (%Tuple*, i32)*] [void (%Tuple*, i32)* @MemoryManagement__1__RefCount, void (%Tuple*, i32)* @MemoryManagement__1__AliasCount]
@1 = internal constant [42 x i8] c"Length of qs must be twice the value of u\00"
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]

define { i64, i8* }* @Microsoft__Quantum__Samples__RunHiddenShift__Interop(i64 %patternInt, i64 %registerSize) local_unnamed_addr #0 {
entry:
  %nQubits.i = shl i64 %registerSize, 1
  %0 = icmp ult i64 %nQubits.i, 64
  %1 = trunc i64 %nQubits.i to i32
  tail call void @llvm.assume(i1 %0)
  %2 = icmp sgt i64 %patternInt, -1
  tail call void @llvm.assume(i1 %2)
  %3 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  %4 = fptosi double %3 to i64
  %5 = icmp sgt i64 %4, %patternInt
  tail call void @llvm.assume(i1 %5)
  %6 = tail call %Array* @__quantum__rt__array_create_1d(i32 1, i64 %nQubits.i)
  %.not.not6.not.i.i = icmp eq i64 %nQubits.i, 0
  br i1 %.not.not6.not.i.i, label %exit__2.critedge.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %7 = phi i64 [ %10, %body__1.i.i ], [ 0, %entry ]
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %7)
  %9 = bitcast i8* %8 to i1*
  store i1 false, i1* %9, align 1
  %10 = add nuw nsw i64 %7, 1
  %.not.not.i.i = icmp ult i64 %10, %nQubits.i
  br i1 %.not.not.i.i, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %exit__1.i.i
  %11 = phi i64 [ %18, %body__2.i.i ], [ %patternInt, %exit__1.i.i ]
  %12 = phi %Array* [ %13, %body__2.i.i ], [ %6, %exit__1.i.i ]
  %idxBit8.i.i = phi i64 [ %19, %body__2.i.i ], [ 0, %exit__1.i.i ]
  %13 = tail call %Array* @__quantum__rt__array_copy(%Array* %12, i1 false)
  %14 = and i64 %11, 1
  %15 = icmp ne i64 %14, 0
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 %idxBit8.i.i)
  %17 = bitcast i8* %16 to i1*
  store i1 %15, i1* %17, align 1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 1)
  %18 = sdiv i64 %11, 2
  tail call void @__quantum__rt__array_update_reference_count(%Array* %12, i32 -1)
  %19 = add nuw nsw i64 %idxBit8.i.i, 1
  %.not3.not.i.i = icmp ult i64 %19, %nQubits.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 -1)
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

exit__2.critedge.i.i:                             ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  br label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %exit__2.critedge.i.i
  %.lcssa.i.i = phi %Array* [ %6, %exit__2.critedge.i.i ], [ %13, %body__2.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 1)
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { %Callable*, i64 }*
  %22 = bitcast %Tuple* %20 to %Callable**
  %23 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %21, i64 0, i32 1
  %24 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %24, %Callable** %22, align 8
  store i64 %registerSize, i64* %23, align 4
  %25 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %20)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 1)
  %26 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %27 = bitcast %Tuple* %26 to { %Callable*, %Array*, i64 }*
  %28 = bitcast %Tuple* %26 to %Callable**
  %29 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %27, i64 0, i32 1
  %30 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %27, i64 0, i32 2
  %31 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 1)
  store %Callable* %31, %Callable** %28, align 8
  store %Array* %.lcssa.i.i, %Array** %29, align 8
  store i64 %registerSize, i64* %30, align 4
  %32 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__2__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__2__FunctionTable, %Tuple* %26)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %25, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %25, i32 1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 1)
  %qubits.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %33 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %34 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %35 = add i64 %34, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not1.i.i.i = icmp slt i64 %35, 0
  br i1 %.not1.i.i.i, label %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i, %body__1.i.i.i
  %idxQubit2.i.i.i = phi i64 [ %41, %body__1.i.i.i ], [ 0, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i ]
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxQubit2.i.i.i)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = load %Qubit*, %Qubit** %37, align 8
  %39 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %40 = bitcast %Tuple* %39 to %Qubit**
  store %Qubit* %38, %Qubit** %40, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %33, %Tuple* %39, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %39, i32 -1)
  %41 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %41, %35
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i: ; preds = %body__1.i.i.i, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %42 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %43 = bitcast %Tuple* %42 to %Array**
  store %Array* %qubits.i.i, %Array** %43, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %32, %Tuple* %42, %Tuple* null)
  %44 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %44, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %44, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %45 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %46 = add i64 %45, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not1.i1.i.i = icmp slt i64 %46, 0
  br i1 %.not1.i1.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

body__1.i4.i.i:                                   ; preds = %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, %body__1.i4.i.i
  %idxQubit2.i2.i.i = phi i64 [ %52, %body__1.i4.i.i ], [ 0, %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i ]
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxQubit2.i2.i.i)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = load %Qubit*, %Qubit** %48, align 8
  %50 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %51 = bitcast %Tuple* %50 to %Qubit**
  store %Qubit* %49, %Qubit** %51, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %44, %Tuple* %50, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %52 = add i64 %idxQubit2.i2.i.i, 1
  %.not.i3.i.i = icmp sgt i64 %52, %46
  br i1 %.not.i3.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i4.i.i, %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %44, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %44, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %53 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %54 = bitcast %Tuple* %53 to %Array**
  store %Array* %qubits.i.i, %Array** %54, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %25, %Tuple* %53, %Tuple* null)
  %55 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %55, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %55, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %56 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %__qsVar0__idxQubit__1.i.i.i = add i64 %56, -1
  %57 = icmp sgt i64 %__qsVar0__idxQubit__1.i.i.i, -1
  br i1 %57, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i

body__1.i5.i.i:                                   ; preds = %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, %body__1.i5.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i5.i.i ], [ %__qsVar0__idxQubit__1.i.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i ]
  %58 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %55, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %58, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %58)
  %59 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %__qsVar0__idxQubit__2.i.i.i)
  %60 = bitcast i8* %59 to %Qubit**
  %61 = load %Qubit*, %Qubit** %60, align 8
  %62 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %63 = bitcast %Tuple* %62 to %Qubit**
  store %Qubit* %61, %Qubit** %63, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %58, %Tuple* %62, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %58, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %58, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %62, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %64 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %64, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i5.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %55, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %55, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %65 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %65, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %65, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %66 = tail call %Result* @__quantum__rt__result_get_zero()
  %67 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %68 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %67)
  %69 = add i64 %67, -1
  %.not2.i.i.i = icmp slt i64 %69, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

body__1.i7.i.i:                                   ; preds = %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i, %body__1.i7.i.i
  %70 = phi i64 [ %73, %body__1.i7.i.i ], [ 0, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i ]
  %71 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %68, i64 %70)
  %72 = bitcast i8* %71 to %Result**
  store %Result* %66, %Result** %72, align 8
  %73 = add i64 %70, 1
  %.not.i6.i.i = icmp sgt i64 %73, %69
  br i1 %.not.i6.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i7.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %68, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %74 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %75 = add i64 %74, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not13.i.i.i = icmp slt i64 %75, 0
  br i1 %.not13.i.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %76 = phi %Array* [ %77, %body__2.i.i.i ], [ %68, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %88, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %76, i32 -1)
  %77 = tail call %Array* @__quantum__rt__array_copy(%Array* %76, i1 false)
  %78 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxElement4.i.i.i)
  %79 = bitcast i8* %78 to %Qubit**
  %80 = load %Qubit*, %Qubit** %79, align 8
  %81 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %82 = bitcast %Tuple* %81 to %Qubit**
  store %Qubit* %80, %Qubit** %82, align 8
  %83 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %65, %Tuple* %81, %Tuple* %83)
  %84 = bitcast %Tuple* %83 to %Result**
  %85 = load %Result*, %Result** %84, align 8
  %86 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %77, i64 %idxElement4.i.i.i)
  %87 = bitcast i8* %86 to %Result**
  store %Result* %85, %Result** %87, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %77, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %76, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %81, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %83, i32 -1)
  %88 = add i64 %idxElement4.i.i.i, 1
  %.not1.i8.i.i = icmp sgt i64 %88, %75
  br i1 %.not1.i8.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %68, %exit__1.i.i.i ], [ %77, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %65, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %65, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %25, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %25, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %42, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %44, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %44, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %53, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %55, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %55, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %65, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %65, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %qubits.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %25, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %25, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %32, i32 -1)
  %89 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %90 = tail call i8* @__quantum__rt__memory_allocate(i64 %89)
  %91 = ptrtoint i8* %90 to i64
  %92 = add i64 %89, -1
  %.not4 = icmp slt i64 %92, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, %body__1
  %93 = phi i64 [ %98, %body__1 ], [ 0, %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit ]
  %94 = add i64 %93, %91
  %95 = inttoptr i64 %94 to i8*
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %93)
  %97 = bitcast i8* %96 to %Result**
  %98 = add i64 %93, 1
  %99 = icmp sgt i64 %98, %92
  %100 = load %Result*, %Result** %97, align 8
  %101 = tail call i1 @__quantum__qis__read_result__body(%Result* %100)
  %102 = sext i1 %101 to i8
  store i8 %102, i8* %95, align 1
  br i1 %99, label %exit__1, label %body__1

exit__1:                                          ; preds = %body__1, %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit
  %103 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %104 = bitcast i8* %103 to i64*
  store i64 %89, i64* %104, align 4
  %105 = getelementptr i8, i8* %103, i64 8
  %106 = bitcast i8* %105 to i8**
  store i8* %90, i8** %106, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %107 = phi i64 [ %109, %body__2 ], [ 0, %exit__1 ]
  %108 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %107)
  %109 = add i64 %107, 1
  %.not3 = icmp sgt i64 %109, %92
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %110 = bitcast i8* %103 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i.i, i32 -1)
  ret { i64, i8* }* %110
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*) local_unnamed_addr

declare i8* @__quantum__rt__memory_allocate(i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare %Result* @__quantum__rt__result_get_zero() local_unnamed_addr

declare void @__quantum__rt__array_update_reference_count(%Array*, i32) local_unnamed_addr

declare void @__quantum__rt__array_update_alias_count(%Array*, i32) local_unnamed_addr

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32) local_unnamed_addr

declare %Array* @__quantum__rt__qubit_allocate_array(i64) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*) local_unnamed_addr

declare %Tuple* @__quantum__rt__tuple_create(i64) local_unnamed_addr

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32) local_unnamed_addr

declare void @__quantum__rt__qubit_release_array(%Array*) local_unnamed_addr

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare %Array* @__quantum__rt__array_copy(%Array*, i1) local_unnamed_addr

define internal void @Microsoft__Quantum__Measurement__MResetZ__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = bitcast %Tuple* %result-tuple to %Result**
  %2 = load %Qubit*, %Qubit** %0, align 8
  %3 = tail call %Result* @__quantum__qis__m__body(%Qubit* %2)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* %3, %Result** %1, align 8
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__H__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %12 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %12)
  %13 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %14 = bitcast %Tuple* %13 to { %Array*, %Qubit* }*
  %15 = bitcast %Tuple* %13 to %Array**
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %15, align 8
  store %Qubit* %4, %Qubit** %16, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 1)
  %controls.i.i = load %Array*, %Array** %15, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %16, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %17 = phi i64 [ %26, %body__1.i.i ], [ 0, %else__1.i ]
  %18 = shl nuw i64 %17, 1
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %18)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = or i64 %18, 1
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %21)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %17)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = add nuw nsw i64 %17, 1
  %27 = icmp slt i64 %26, %numControlPairs.i.i
  %28 = load %Qubit*, %Qubit** %20, align 8
  %29 = load %Qubit*, %Qubit** %23, align 8
  %30 = load %Qubit*, %Qubit** %25, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %28)
  tail call void @__quantum__qis__cnot__body(%Qubit* %28, %Qubit* %29)
  tail call void @__quantum__qis__t__body(%Qubit* %29)
  tail call void @__quantum__qis__t__adj(%Qubit* %28)
  tail call void @__quantum__qis__t__body(%Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %28)
  tail call void @__quantum__qis__cnot__body(%Qubit* %28, %Qubit* %29)
  tail call void @__quantum__qis__t__adj(%Qubit* %29)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %29)
  tail call void @__quantum__qis__h__body(%Qubit* %30)
  br i1 %27, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %31 = and i64 %numControls.i.i, 1
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %33 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %33, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = add i64 %numControls.i.i, -1
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %36)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  store %Qubit* %39, %Qubit** %35, align 8
  %40 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %33)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %33, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %40, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %41 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %42 = bitcast %Tuple* %41 to { %Array*, %Qubit* }*
  %43 = bitcast %Tuple* %41 to %Array**
  %44 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %42, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %43, align 8
  store %Qubit* %arg.i.i, %Qubit** %44, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %41, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %45 = phi i64 [ %54, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %46 = shl nuw i64 %45, 1
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %46)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = or i64 %46, 1
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %45)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = add i64 %45, -1
  %55 = icmp sgt i64 %54, -1
  %56 = load %Qubit*, %Qubit** %48, align 8
  %57 = load %Qubit*, %Qubit** %51, align 8
  %58 = load %Qubit*, %Qubit** %53, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %58)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %57)
  tail call void @__quantum__qis__t__body(%Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %56, %Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %56)
  tail call void @__quantum__qis__t__adj(%Qubit* %58)
  tail call void @__quantum__qis__t__body(%Qubit* %56)
  tail call void @__quantum__qis__t__adj(%Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %56, %Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %56)
  tail call void @__quantum__qis__h__body(%Qubit* %58)
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %41, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %12 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %12)
  %13 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %14 = bitcast %Tuple* %13 to { %Array*, %Qubit* }*
  %15 = bitcast %Tuple* %13 to %Array**
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %15, align 8
  store %Qubit* %4, %Qubit** %16, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 1)
  %controls.i.i = load %Array*, %Array** %15, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %16, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %17 = phi i64 [ %26, %body__1.i.i ], [ 0, %else__1.i ]
  %18 = shl nuw i64 %17, 1
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %18)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = or i64 %18, 1
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %21)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %17)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = add nuw nsw i64 %17, 1
  %27 = icmp slt i64 %26, %numControlPairs.i.i
  %28 = load %Qubit*, %Qubit** %20, align 8
  %29 = load %Qubit*, %Qubit** %23, align 8
  %30 = load %Qubit*, %Qubit** %25, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %28)
  tail call void @__quantum__qis__cnot__body(%Qubit* %28, %Qubit* %29)
  tail call void @__quantum__qis__t__body(%Qubit* %29)
  tail call void @__quantum__qis__t__adj(%Qubit* %28)
  tail call void @__quantum__qis__t__body(%Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %28)
  tail call void @__quantum__qis__cnot__body(%Qubit* %28, %Qubit* %29)
  tail call void @__quantum__qis__t__adj(%Qubit* %29)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %29)
  tail call void @__quantum__qis__h__body(%Qubit* %30)
  br i1 %27, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %31 = and i64 %numControls.i.i, 1
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %33 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %33, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = add i64 %numControls.i.i, -1
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %36)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  store %Qubit* %39, %Qubit** %35, align 8
  %40 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %33)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %33, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %40, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %41 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %42 = bitcast %Tuple* %41 to { %Array*, %Qubit* }*
  %43 = bitcast %Tuple* %41 to %Array**
  %44 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %42, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %43, align 8
  store %Qubit* %arg.i.i, %Qubit** %44, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %41, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %45 = phi i64 [ %54, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %46 = shl nuw i64 %45, 1
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %46)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = or i64 %46, 1
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %45)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = add i64 %45, -1
  %55 = icmp sgt i64 %54, -1
  %56 = load %Qubit*, %Qubit** %48, align 8
  %57 = load %Qubit*, %Qubit** %51, align 8
  %58 = load %Qubit*, %Qubit** %53, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %58)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %57)
  tail call void @__quantum__qis__t__body(%Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %56, %Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %56)
  tail call void @__quantum__qis__t__adj(%Qubit* %58)
  tail call void @__quantum__qis__t__body(%Qubit* %56)
  tail call void @__quantum__qis__t__adj(%Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %56, %Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %56)
  tail call void @__quantum__qis__h__body(%Qubit* %58)
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %41, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

define internal void @MemoryManagement__2__RefCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array*, i64 }*
  %1 = bitcast %Tuple* %capture-tuple to %Callable**
  %2 = load %Callable*, %Callable** %1, align 8
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %2, i32 %count-change)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %2, i32 %count-change)
  %3 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %0, i64 0, i32 1
  %4 = load %Array*, %Array** %3, align 8
  tail call void @__quantum__rt__array_update_reference_count(%Array* %4, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

define internal void @MemoryManagement__2__AliasCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array*, i64 }*
  %1 = bitcast %Tuple* %capture-tuple to %Callable**
  %2 = load %Callable*, %Callable** %1, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %2, i32 %count-change)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %2, i32 %count-change)
  %3 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %0, i64 0, i32 1
  %4 = load %Array*, %Array** %3, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

declare void @__quantum__rt__tuple_update_alias_count(%Tuple*, i32) local_unnamed_addr

define internal void @Lifted__PartialApplication__2__body__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array*, i64 }*
  %1 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %0, i64 0, i32 1
  %2 = load %Array*, %Array** %1, align 8
  %3 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %0, i64 0, i32 2
  %4 = load i64, i64* %3, align 4
  %5 = bitcast %Tuple* %arg-tuple to %Array**
  %6 = load %Array*, %Array** %5, align 8
  %7 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %8 = bitcast %Tuple* %7 to { %Array*, i64, %Array* }*
  %9 = bitcast %Tuple* %7 to %Array**
  %10 = getelementptr inbounds { %Array*, i64, %Array* }, { %Array*, i64, %Array* }* %8, i64 0, i32 1
  %11 = getelementptr inbounds { %Array*, i64, %Array* }, { %Array*, i64, %Array* }* %8, i64 0, i32 2
  store %Array* %2, %Array** %9, align 8
  store i64 %4, i64* %10, align 4
  store %Array* %6, %Array** %11, align 8
  %12 = bitcast %Tuple* %capture-tuple to %Callable**
  %13 = load %Callable*, %Callable** %12, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %13, %Tuple* %7, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, i64, %Array* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, i64, %Array* }, { %Array*, i64, %Array* }* %0, i64 0, i32 1
  %3 = getelementptr inbounds { %Array*, i64, %Array* }, { %Array*, i64, %Array* }* %0, i64 0, i32 2
  %4 = load %Array*, %Array** %1, align 8
  %5 = load i64, i64* %2, align 4
  %6 = load %Array*, %Array** %3, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  %n.i = shl i64 %5, 1
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %.not10.i = icmp eq i64 %7, %n.i
  br i1 %.not10.i, label %condContinue__1.i, label %then0__1.i

condContinue__1.i:                                ; preds = %entry
  %8 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %6)
  %.not11.i = icmp eq i64 %8, %n.i
  br i1 %.not11.i, label %continue__1.i, label %then0__1.i

then0__1.i:                                       ; preds = %condContinue__1.i, %entry
  %9 = tail call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @0, i64 0, i64 0))
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  tail call void @__quantum__rt__fail(%String* %9)
  unreachable

continue__1.i:                                    ; preds = %condContinue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  %10 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %11 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %6)
  %12 = icmp slt i64 %10, %11
  %..i = select i1 %12, i64 %10, i64 %11
  %13 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %14 = bitcast %Tuple* %13 to { i1, %Qubit* }*
  %15 = bitcast %Tuple* %13 to i1*
  %16 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %14, i64 0, i32 1
  store i1 false, i1* %15, align 1
  store %Qubit* null, %Qubit** %16, align 8
  %17 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %..i)
  %18 = add i64 %..i, -1
  %.not7.i3 = icmp slt i64 %18, 0
  br i1 %.not7.i3, label %exit__2.thread.i, label %body__1.i5

body__1.i5:                                       ; preds = %continue__1.i, %body__1.i5
  %19 = phi i64 [ %22, %body__1.i5 ], [ 0, %continue__1.i ]
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 %19)
  %21 = bitcast i8* %20 to %Tuple**
  store %Tuple* %13, %Tuple** %21, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 1)
  %22 = add i64 %19, 1
  %.not.i4 = icmp sgt i64 %22, %18
  br i1 %.not.i4, label %body__2.i6, label %body__1.i5

body__2.i6:                                       ; preds = %body__1.i5, %body__2.i6
  %23 = phi i64 [ %27, %body__2.i6 ], [ 0, %body__1.i5 ]
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 %23)
  %25 = bitcast i8* %24 to %Tuple**
  %26 = load %Tuple*, %Tuple** %25, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %26, i32 1)
  %27 = add i64 %23, 1
  %.not4.i = icmp sgt i64 %27, %18
  br i1 %.not4.i, label %body__3.preheader.i, label %body__2.i6

exit__2.thread.i:                                 ; preds = %continue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 1)
  br label %exit__3.i8

body__3.preheader.i:                              ; preds = %body__2.i6
  tail call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 1)
  br label %body__3.i7

body__3.i7:                                       ; preds = %body__3.i7, %body__3.preheader.i
  %28 = phi %Array* [ %29, %body__3.i7 ], [ %17, %body__3.preheader.i ]
  %idxElement10.i = phi i64 [ %43, %body__3.i7 ], [ 0, %body__3.preheader.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %29 = tail call %Array* @__quantum__rt__array_copy(%Array* %28, i1 false)
  %30 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %31 = bitcast %Tuple* %30 to { i1, %Qubit* }*
  %32 = bitcast %Tuple* %30 to i1*
  %33 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %31, i64 0, i32 1
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 %idxElement10.i)
  %35 = bitcast i8* %34 to i1*
  %36 = load i1, i1* %35, align 1
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %idxElement10.i)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  store i1 %36, i1* %32, align 1
  store %Qubit* %39, %Qubit** %33, align 8
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %29, i64 %idxElement10.i)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %30, i32 1)
  %41 = bitcast i8* %40 to %Tuple**
  %42 = load %Tuple*, %Tuple** %41, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %42, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %42, i32 -1)
  store %Tuple* %30, %Tuple** %41, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %29, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  %43 = add i64 %idxElement10.i, 1
  %.not5.i = icmp sgt i64 %43, %18
  br i1 %.not5.i, label %exit__3.i8, label %body__3.i7

exit__3.i8:                                       ; preds = %body__3.i7, %exit__2.thread.i
  %.lcssa.i = phi %Array* [ %17, %exit__2.thread.i ], [ %29, %body__3.i7 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i)
  %45 = add i64 %44, -1
  %.not611.i = icmp slt i64 %45, 0
  br i1 %.not611.i, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit, label %body__4.i10

body__4.i10:                                      ; preds = %exit__3.i8, %body__4.i10
  %46 = phi i64 [ %50, %body__4.i10 ], [ 0, %exit__3.i8 ]
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i, i64 %46)
  %48 = bitcast i8* %47 to %Tuple**
  %49 = load %Tuple*, %Tuple** %48, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %49, i32 -1)
  %50 = add i64 %46, 1
  %.not6.i9 = icmp sgt i64 %50, %45
  br i1 %.not6.i9, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit, label %body__4.i10

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit: ; preds = %body__4.i10, %exit__3.i8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  %51 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i)
  %52 = add i64 %51, -1
  %.not12.i = icmp slt i64 %52, 0
  br i1 %.not12.i, label %exit__1.i, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit, %exiting__1.i
  %53 = phi i64 [ %60, %exiting__1.i ], [ 0, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit ]
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i, i64 %53)
  %55 = bitcast i8* %54 to { i1, %Qubit* }**
  %56 = load { i1, %Qubit* }*, { i1, %Qubit* }** %55, align 8
  %57 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %56, i64 0, i32 0
  %__qsVar0__shiftBit__.i = load i1, i1* %57, align 1
  br i1 %__qsVar0__shiftBit__.i, label %then0__2.i, label %exiting__1.i

then0__2.i:                                       ; preds = %body__1.i
  %58 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %56, i64 0, i32 1
  %59 = load %Qubit*, %Qubit** %58, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %59)
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %then0__2.i, %body__1.i
  %60 = add i64 %53, 1
  %.not.i = icmp sgt i64 %60, %52
  br i1 %.not.i, label %exit__1.i, label %body__1.i

exit__1.i:                                        ; preds = %exiting__1.i, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit
  %61 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %62 = bitcast %Tuple* %61 to { %Callable*, i64 }*
  %63 = bitcast %Tuple* %61 to %Callable**
  %64 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %62, i64 0, i32 1
  %65 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %65, %Callable** %63, align 8
  store i64 %5, i64* %64, align 4
  %66 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %61)
  %67 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %68 = bitcast %Tuple* %67 to %Array**
  store %Array* %6, %Array** %68, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %66, %Tuple* %67, %Tuple* null)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  %69 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %70 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %6)
  %71 = icmp slt i64 %69, %70
  %..i12 = select i1 %71, i64 %69, i64 %70
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %73 = bitcast %Tuple* %72 to { i1, %Qubit* }*
  %74 = bitcast %Tuple* %72 to i1*
  %75 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %73, i64 0, i32 1
  store i1 false, i1* %74, align 1
  store %Qubit* null, %Qubit** %75, align 8
  %76 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %..i12)
  %77 = add i64 %..i12, -1
  %.not7.i13 = icmp slt i64 %77, 0
  br i1 %.not7.i13, label %exit__2.thread.i18, label %body__1.i15

body__1.i15:                                      ; preds = %exit__1.i, %body__1.i15
  %78 = phi i64 [ %81, %body__1.i15 ], [ 0, %exit__1.i ]
  %79 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 %78)
  %80 = bitcast i8* %79 to %Tuple**
  store %Tuple* %72, %Tuple** %80, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 1)
  %81 = add i64 %78, 1
  %.not.i14 = icmp sgt i64 %81, %77
  br i1 %.not.i14, label %body__2.i17, label %body__1.i15

body__2.i17:                                      ; preds = %body__1.i15, %body__2.i17
  %82 = phi i64 [ %86, %body__2.i17 ], [ 0, %body__1.i15 ]
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 %82)
  %84 = bitcast i8* %83 to %Tuple**
  %85 = load %Tuple*, %Tuple** %84, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %85, i32 1)
  %86 = add i64 %82, 1
  %.not4.i16 = icmp sgt i64 %86, %77
  br i1 %.not4.i16, label %body__3.preheader.i19, label %body__2.i17

exit__2.thread.i18:                               ; preds = %exit__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %76, i32 1)
  br label %exit__3.i25

body__3.preheader.i19:                            ; preds = %body__2.i17
  tail call void @__quantum__rt__array_update_alias_count(%Array* %76, i32 1)
  br label %body__3.i22

body__3.i22:                                      ; preds = %body__3.i22, %body__3.preheader.i19
  %87 = phi %Array* [ %88, %body__3.i22 ], [ %76, %body__3.preheader.i19 ]
  %idxElement10.i20 = phi i64 [ %102, %body__3.i22 ], [ 0, %body__3.preheader.i19 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %87, i32 -1)
  %88 = tail call %Array* @__quantum__rt__array_copy(%Array* %87, i1 false)
  %89 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %90 = bitcast %Tuple* %89 to { i1, %Qubit* }*
  %91 = bitcast %Tuple* %89 to i1*
  %92 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %90, i64 0, i32 1
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 %idxElement10.i20)
  %94 = bitcast i8* %93 to i1*
  %95 = load i1, i1* %94, align 1
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %idxElement10.i20)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = load %Qubit*, %Qubit** %97, align 8
  store i1 %95, i1* %91, align 1
  store %Qubit* %98, %Qubit** %92, align 8
  %99 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %88, i64 %idxElement10.i20)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %89, i32 1)
  %100 = bitcast i8* %99 to %Tuple**
  %101 = load %Tuple*, %Tuple** %100, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %101, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %101, i32 -1)
  store %Tuple* %89, %Tuple** %100, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %88, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %87, i32 -1)
  %102 = add i64 %idxElement10.i20, 1
  %.not5.i21 = icmp sgt i64 %102, %77
  br i1 %.not5.i21, label %exit__3.i25, label %body__3.i22

exit__3.i25:                                      ; preds = %body__3.i22, %exit__2.thread.i18
  %.lcssa.i23 = phi %Array* [ %76, %exit__2.thread.i18 ], [ %88, %body__3.i22 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  %103 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i23)
  %104 = add i64 %103, -1
  %.not611.i24 = icmp slt i64 %104, 0
  br i1 %.not611.i24, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29, label %body__4.i27

body__4.i27:                                      ; preds = %exit__3.i25, %body__4.i27
  %105 = phi i64 [ %109, %body__4.i27 ], [ 0, %exit__3.i25 ]
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i23, i64 %105)
  %107 = bitcast i8* %106 to %Tuple**
  %108 = load %Tuple*, %Tuple** %107, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %108, i32 -1)
  %109 = add i64 %105, 1
  %.not6.i26 = icmp sgt i64 %109, %104
  br i1 %.not6.i26, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29, label %body__4.i27

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29: ; preds = %body__4.i27, %exit__3.i25
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i23, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  %110 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %111 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %6)
  %112 = icmp slt i64 %110, %111
  %..i30 = select i1 %112, i64 %110, i64 %111
  %113 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %114 = bitcast %Tuple* %113 to { i1, %Qubit* }*
  %115 = bitcast %Tuple* %113 to i1*
  %116 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %114, i64 0, i32 1
  store i1 false, i1* %115, align 1
  store %Qubit* null, %Qubit** %116, align 8
  %117 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %..i30)
  %118 = add i64 %..i30, -1
  %.not7.i31 = icmp slt i64 %118, 0
  br i1 %.not7.i31, label %exit__2.thread.i36, label %body__1.i33

body__1.i33:                                      ; preds = %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29, %body__1.i33
  %119 = phi i64 [ %122, %body__1.i33 ], [ 0, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29 ]
  %120 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %117, i64 %119)
  %121 = bitcast i8* %120 to %Tuple**
  store %Tuple* %113, %Tuple** %121, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %113, i32 1)
  %122 = add i64 %119, 1
  %.not.i32 = icmp sgt i64 %122, %118
  br i1 %.not.i32, label %body__2.i35, label %body__1.i33

body__2.i35:                                      ; preds = %body__1.i33, %body__2.i35
  %123 = phi i64 [ %127, %body__2.i35 ], [ 0, %body__1.i33 ]
  %124 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %117, i64 %123)
  %125 = bitcast i8* %124 to %Tuple**
  %126 = load %Tuple*, %Tuple** %125, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %126, i32 1)
  %127 = add i64 %123, 1
  %.not4.i34 = icmp sgt i64 %127, %118
  br i1 %.not4.i34, label %body__3.preheader.i37, label %body__2.i35

exit__2.thread.i36:                               ; preds = %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29
  tail call void @__quantum__rt__array_update_alias_count(%Array* %117, i32 1)
  br label %exit__3.i43

body__3.preheader.i37:                            ; preds = %body__2.i35
  tail call void @__quantum__rt__array_update_alias_count(%Array* %117, i32 1)
  br label %body__3.i40

body__3.i40:                                      ; preds = %body__3.i40, %body__3.preheader.i37
  %128 = phi %Array* [ %129, %body__3.i40 ], [ %117, %body__3.preheader.i37 ]
  %idxElement10.i38 = phi i64 [ %143, %body__3.i40 ], [ 0, %body__3.preheader.i37 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %128, i32 -1)
  %129 = tail call %Array* @__quantum__rt__array_copy(%Array* %128, i1 false)
  %130 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %131 = bitcast %Tuple* %130 to { i1, %Qubit* }*
  %132 = bitcast %Tuple* %130 to i1*
  %133 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %131, i64 0, i32 1
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 %idxElement10.i38)
  %135 = bitcast i8* %134 to i1*
  %136 = load i1, i1* %135, align 1
  %137 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %idxElement10.i38)
  %138 = bitcast i8* %137 to %Qubit**
  %139 = load %Qubit*, %Qubit** %138, align 8
  store i1 %136, i1* %132, align 1
  store %Qubit* %139, %Qubit** %133, align 8
  %140 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %129, i64 %idxElement10.i38)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %130, i32 1)
  %141 = bitcast i8* %140 to %Tuple**
  %142 = load %Tuple*, %Tuple** %141, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %142, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %142, i32 -1)
  store %Tuple* %130, %Tuple** %141, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %129, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %128, i32 -1)
  %143 = add i64 %idxElement10.i38, 1
  %.not5.i39 = icmp sgt i64 %143, %118
  br i1 %.not5.i39, label %exit__3.i43, label %body__3.i40

exit__3.i43:                                      ; preds = %body__3.i40, %exit__2.thread.i36
  %.lcssa.i41 = phi %Array* [ %117, %exit__2.thread.i36 ], [ %129, %body__3.i40 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  %144 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i41)
  %145 = add i64 %144, -1
  %.not611.i42 = icmp slt i64 %145, 0
  br i1 %.not611.i42, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47, label %body__4.i45

body__4.i45:                                      ; preds = %exit__3.i43, %body__4.i45
  %146 = phi i64 [ %150, %body__4.i45 ], [ 0, %exit__3.i43 ]
  %147 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i41, i64 %146)
  %148 = bitcast i8* %147 to %Tuple**
  %149 = load %Tuple*, %Tuple** %148, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %149, i32 -1)
  %150 = add i64 %146, 1
  %.not6.i44 = icmp sgt i64 %150, %145
  br i1 %.not6.i44, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47, label %body__4.i45

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47: ; preds = %body__4.i45, %exit__3.i43
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i41, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %113, i32 -1)
  %151 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i41)
  %152 = add i64 %151, -1
  %153 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %152, 0
  %154 = insertvalue %Range %153, i64 -1, 1
  %155 = insertvalue %Range %154, i64 0, 2
  %156 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %.lcssa.i23, %Range %155, i1 true)
  %157 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %156)
  %158 = add i64 %157, -1
  %.not613.i = icmp slt i64 %158, 0
  br i1 %.not613.i, label %exit__2.i, label %body__2.i

body__2.i:                                        ; preds = %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47, %exiting__2.i
  %159 = phi i64 [ %166, %exiting__2.i ], [ 0, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47 ]
  %160 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %156, i64 %159)
  %161 = bitcast i8* %160 to { i1, %Qubit* }**
  %162 = load { i1, %Qubit* }*, { i1, %Qubit* }** %161, align 8
  %163 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %162, i64 0, i32 0
  %__qsVar0____qsVar0__shiftBit____.i = load i1, i1* %163, align 1
  br i1 %__qsVar0____qsVar0__shiftBit____.i, label %then0__3.i, label %exiting__2.i

then0__3.i:                                       ; preds = %body__2.i
  %164 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %162, i64 0, i32 1
  %165 = load %Qubit*, %Qubit** %164, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %165)
  br label %exiting__2.i

exiting__2.i:                                     ; preds = %then0__3.i, %body__2.i
  %166 = add i64 %159, 1
  %.not6.i = icmp sgt i64 %166, %158
  br i1 %.not6.i, label %exit__2.i, label %body__2.i

exit__2.i:                                        ; preds = %exiting__2.i, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  br i1 %.not12.i, label %exit__3.i, label %body__3.i

body__3.i:                                        ; preds = %exit__2.i, %body__3.i
  %167 = phi i64 [ %171, %body__3.i ], [ 0, %exit__2.i ]
  %168 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i, i64 %167)
  %169 = bitcast i8* %168 to %Tuple**
  %170 = load %Tuple*, %Tuple** %169, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %170, i32 -1)
  %171 = add i64 %167, 1
  %.not7.i = icmp sgt i64 %171, %52
  br i1 %.not7.i, label %exit__3.i, label %body__3.i

exit__3.i:                                        ; preds = %body__3.i, %exit__2.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %67, i32 -1)
  %172 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i23)
  %173 = add i64 %172, -1
  %.not815.i = icmp slt i64 %173, 0
  br i1 %.not815.i, label %exit__4.i, label %body__4.i

body__4.i:                                        ; preds = %exit__3.i, %body__4.i
  %174 = phi i64 [ %178, %body__4.i ], [ 0, %exit__3.i ]
  %175 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i23, i64 %174)
  %176 = bitcast i8* %175 to %Tuple**
  %177 = load %Tuple*, %Tuple** %176, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %177, i32 -1)
  %178 = add i64 %174, 1
  %.not8.i = icmp sgt i64 %178, %173
  br i1 %.not8.i, label %exit__4.i, label %body__4.i

exit__4.i:                                        ; preds = %body__4.i, %exit__3.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i23, i32 -1)
  %.not916.i = icmp slt i64 %152, 0
  br i1 %.not916.i, label %Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit, label %body__5.i

body__5.i:                                        ; preds = %exit__4.i, %body__5.i
  %179 = phi i64 [ %183, %body__5.i ], [ 0, %exit__4.i ]
  %180 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i41, i64 %179)
  %181 = bitcast i8* %180 to %Tuple**
  %182 = load %Tuple*, %Tuple** %181, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %182, i32 -1)
  %183 = add i64 %179, 1
  %.not9.i = icmp sgt i64 %183, %152
  br i1 %.not9.i, label %Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit, label %body__5.i

Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit: ; preds = %body__5.i, %exit__4.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i41, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %156, i32 -1)
  ret void
}

declare %String* @__quantum__rt__string_create(i8*) local_unnamed_addr

declare void @__quantum__rt__fail(%String*) local_unnamed_addr

declare %Array* @__quantum__rt__array_slice_1d(%Array*, %Range, i1) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

define internal void @MemoryManagement__1__RefCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to %Callable**
  %1 = load %Callable*, %Callable** %0, align 8
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

define internal void @MemoryManagement__1__AliasCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to %Callable**
  %1 = load %Callable*, %Callable** %0, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

define internal void @Lifted__PartialApplication__1__body__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, i64 }*
  %1 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %0, i64 0, i32 1
  %2 = load i64, i64* %1, align 4
  %3 = bitcast %Tuple* %arg-tuple to %Array**
  %4 = load %Array*, %Array** %3, align 8
  %5 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %6 = bitcast %Tuple* %5 to { i64, %Array* }*
  %7 = bitcast %Tuple* %5 to i64*
  %8 = getelementptr inbounds { i64, %Array* }, { i64, %Array* }* %6, i64 0, i32 1
  store i64 %2, i64* %7, align 4
  store %Array* %4, %Array** %8, align 8
  %9 = bitcast %Tuple* %capture-tuple to %Callable**
  %10 = load %Callable*, %Callable** %9, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %10, %Tuple* %5, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { i64, %Array* }*
  %1 = bitcast %Tuple* %arg-tuple to i64*
  %2 = getelementptr inbounds { i64, %Array* }, { i64, %Array* }* %0, i64 0, i32 1
  %3 = load i64, i64* %1, align 4
  %4 = load %Array*, %Array** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %6 = shl i64 %3, 1
  %.not.i = icmp eq i64 %5, %6
  br i1 %.not.i, label %continue__1.i, label %then0__1.i

then0__1.i:                                       ; preds = %entry
  %7 = tail call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i64 0, i64 0))
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__fail(%String* %7)
  unreachable

continue__1.i:                                    ; preds = %entry
  %8 = add i64 %3, -1
  %9 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %8, 2
  %xs.i = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %4, %Range %9, i1 true)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %xs.i, i32 1)
  %10 = add i64 %5, -1
  %11 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %3, 0
  %12 = insertvalue %Range %11, i64 1, 1
  %13 = insertvalue %Range %12, i64 %10, 2
  %ys.i = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %4, %Range %13, i1 true)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ys.i, i32 1)
  %.not12.i = icmp slt i64 %8, 0
  br i1 %.not12.i, label %Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body.exit, label %body__1.i

body__1.i:                                        ; preds = %continue__1.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit
  %idx3.i = phi i64 [ %118, %Microsoft__Quantum__Intrinsic__Z__ctl.exit ], [ 0, %continue__1.i ]
  %14 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %xs.i, i64 %idx3.i)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = load %Qubit*, %Qubit** %18, align 8
  store %Qubit* %19, %Qubit** %16, align 8
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ys.i, i64 %idx3.i)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = load %Qubit*, %Qubit** %21, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 1)
  %23 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %14)
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %quantum, label %test1__1.i

quantum:                                          ; preds = %body__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %22)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %body__1.i
  %25 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %14)
  %26 = icmp eq i64 %25, 1
  br i1 %26, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %29, %Qubit* %22)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %30 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %14)
  %31 = icmp eq i64 %30, 2
  br i1 %31, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 1)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 1)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 1)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 1)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = load %Qubit*, %Qubit** %33, align 8
  %59 = load %Qubit*, %Qubit** %35, align 8
  %60 = load %Qubit*, %Qubit** %37, align 8
  %61 = load %Qubit*, %Qubit** %39, align 8
  %62 = load %Qubit*, %Qubit** %41, align 8
  %63 = load %Qubit*, %Qubit** %43, align 8
  %64 = load %Qubit*, %Qubit** %45, align 8
  %65 = load %Qubit*, %Qubit** %47, align 8
  %66 = load %Qubit*, %Qubit** %49, align 8
  %67 = load %Qubit*, %Qubit** %51, align 8
  %68 = load %Qubit*, %Qubit** %53, align 8
  %69 = load %Qubit*, %Qubit** %55, align 8
  %70 = load %Qubit*, %Qubit** %57, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %22, %Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %62, %Qubit* %22)
  tail call void @__quantum__qis__cnot__body(%Qubit* %63, %Qubit* %64)
  tail call void @__quantum__qis__t__body(%Qubit* %22)
  tail call void @__quantum__qis__t__adj(%Qubit* %65)
  tail call void @__quantum__qis__cnot__body(%Qubit* %66, %Qubit* %22)
  tail call void @__quantum__qis__cnot__body(%Qubit* %22, %Qubit* %67)
  tail call void @__quantum__qis__t__adj(%Qubit* %22)
  tail call void @__quantum__qis__t__body(%Qubit* %68)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %71 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %71)
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %73 = bitcast %Tuple* %72 to { %Array*, %Qubit* }*
  %74 = bitcast %Tuple* %72 to %Array**
  %75 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %73, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 1)
  store %Array* %14, %Array** %74, align 8
  store %Qubit* %22, %Qubit** %75, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %71, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %71, i32 1)
  %controls.i.i = load %Array*, %Array** %74, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %75, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %76 = phi i64 [ %85, %body__1.i.i ], [ 0, %else__1.i ]
  %77 = shl nuw i64 %76, 1
  %78 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %77)
  %79 = bitcast i8* %78 to %Qubit**
  %80 = or i64 %77, 1
  %81 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %80)
  %82 = bitcast i8* %81 to %Qubit**
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %76)
  %84 = bitcast i8* %83 to %Qubit**
  %85 = add nuw nsw i64 %76, 1
  %86 = icmp slt i64 %85, %numControlPairs.i.i
  %87 = load %Qubit*, %Qubit** %79, align 8
  %88 = load %Qubit*, %Qubit** %82, align 8
  %89 = load %Qubit*, %Qubit** %84, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %89)
  tail call void @__quantum__qis__cnot__body(%Qubit* %89, %Qubit* %87)
  tail call void @__quantum__qis__cnot__body(%Qubit* %87, %Qubit* %88)
  tail call void @__quantum__qis__t__body(%Qubit* %88)
  tail call void @__quantum__qis__t__adj(%Qubit* %87)
  tail call void @__quantum__qis__t__body(%Qubit* %89)
  tail call void @__quantum__qis__cnot__body(%Qubit* %89, %Qubit* %87)
  tail call void @__quantum__qis__cnot__body(%Qubit* %87, %Qubit* %88)
  tail call void @__quantum__qis__t__adj(%Qubit* %88)
  tail call void @__quantum__qis__cnot__body(%Qubit* %89, %Qubit* %88)
  tail call void @__quantum__qis__h__body(%Qubit* %89)
  br i1 %86, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %90 = and i64 %numControls.i.i, 1
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %92 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %92, i64 0)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = add i64 %numControls.i.i, -1
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %95)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = load %Qubit*, %Qubit** %97, align 8
  store %Qubit* %98, %Qubit** %94, align 8
  %99 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %92)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %99, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %92, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %99, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %99, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %100 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %101 = bitcast %Tuple* %100 to { %Array*, %Qubit* }*
  %102 = bitcast %Tuple* %100 to %Array**
  %103 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %101, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %102, align 8
  store %Qubit* %arg.i.i, %Qubit** %103, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %71, %Tuple* %100, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %104 = phi i64 [ %113, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %105 = shl nuw i64 %104, 1
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %105)
  %107 = bitcast i8* %106 to %Qubit**
  %108 = or i64 %105, 1
  %109 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %108)
  %110 = bitcast i8* %109 to %Qubit**
  %111 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %104)
  %112 = bitcast i8* %111 to %Qubit**
  %113 = add i64 %104, -1
  %114 = icmp sgt i64 %113, -1
  %115 = load %Qubit*, %Qubit** %107, align 8
  %116 = load %Qubit*, %Qubit** %110, align 8
  %117 = load %Qubit*, %Qubit** %112, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %117)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %116)
  tail call void @__quantum__qis__t__body(%Qubit* %116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %115)
  tail call void @__quantum__qis__t__adj(%Qubit* %117)
  tail call void @__quantum__qis__t__body(%Qubit* %115)
  tail call void @__quantum__qis__t__adj(%Qubit* %116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %115)
  tail call void @__quantum__qis__h__body(%Qubit* %117)
  br i1 %114, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %100, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 -1)
  %118 = add i64 %idx3.i, 1
  %.not1.i = icmp sgt i64 %118, %8
  br i1 %.not1.i, label %Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body.exit, label %body__1.i

Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body.exit: ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit, %continue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %xs.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ys.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %xs.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ys.i, i32 -1)
  ret void
}

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__Z__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = load %Qubit*, %Qubit** %15, align 8
  %41 = load %Qubit*, %Qubit** %17, align 8
  %42 = load %Qubit*, %Qubit** %19, align 8
  %43 = load %Qubit*, %Qubit** %21, align 8
  %44 = load %Qubit*, %Qubit** %23, align 8
  %45 = load %Qubit*, %Qubit** %25, align 8
  %46 = load %Qubit*, %Qubit** %27, align 8
  %47 = load %Qubit*, %Qubit** %29, align 8
  %48 = load %Qubit*, %Qubit** %31, align 8
  %49 = load %Qubit*, %Qubit** %33, align 8
  %50 = load %Qubit*, %Qubit** %35, align 8
  %51 = load %Qubit*, %Qubit** %37, align 8
  %52 = load %Qubit*, %Qubit** %39, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %40)
  tail call void @__quantum__qis__t__adj(%Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %45, %Qubit* %46)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %47)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %53 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %53)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %55 = bitcast %Tuple* %54 to { %Array*, %Qubit* }*
  %56 = bitcast %Tuple* %54 to %Array**
  %57 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %56, align 8
  store %Qubit* %4, %Qubit** %57, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 1)
  %controls.i.i = load %Array*, %Array** %56, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %57, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %58 = phi i64 [ %67, %body__1.i.i ], [ 0, %else__1.i ]
  %59 = shl nuw i64 %58, 1
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %59)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = or i64 %59, 1
  %63 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %62)
  %64 = bitcast i8* %63 to %Qubit**
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %58)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = add nuw nsw i64 %58, 1
  %68 = icmp slt i64 %67, %numControlPairs.i.i
  %69 = load %Qubit*, %Qubit** %61, align 8
  %70 = load %Qubit*, %Qubit** %64, align 8
  %71 = load %Qubit*, %Qubit** %66, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__t__adj(%Qubit* %69)
  tail call void @__quantum__qis__t__body(%Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__t__adj(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %70)
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  br i1 %68, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %72 = and i64 %numControls.i.i, 1
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %74 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %76 = bitcast i8* %75 to %Qubit**
  %77 = add i64 %numControls.i.i, -1
  %78 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %77)
  %79 = bitcast i8* %78 to %Qubit**
  %80 = load %Qubit*, %Qubit** %79, align 8
  store %Qubit* %80, %Qubit** %76, align 8
  %81 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %74)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %81, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %81, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %81, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %82 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %83 = bitcast %Tuple* %82 to { %Array*, %Qubit* }*
  %84 = bitcast %Tuple* %82 to %Array**
  %85 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %83, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %84, align 8
  store %Qubit* %arg.i.i, %Qubit** %85, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %82, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %86 = phi i64 [ %95, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %87 = shl nuw i64 %86, 1
  %88 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %87)
  %89 = bitcast i8* %88 to %Qubit**
  %90 = or i64 %87, 1
  %91 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %90)
  %92 = bitcast i8* %91 to %Qubit**
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %86)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = add i64 %86, -1
  %96 = icmp sgt i64 %95, -1
  %97 = load %Qubit*, %Qubit** %89, align 8
  %98 = load %Qubit*, %Qubit** %92, align 8
  %99 = load %Qubit*, %Qubit** %94, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %99)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %98)
  tail call void @__quantum__qis__t__body(%Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %97, %Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %97)
  tail call void @__quantum__qis__t__adj(%Qubit* %99)
  tail call void @__quantum__qis__t__body(%Qubit* %97)
  tail call void @__quantum__qis__t__adj(%Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %97, %Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %97)
  tail call void @__quantum__qis__h__body(%Qubit* %99)
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %82, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = load %Qubit*, %Qubit** %15, align 8
  %41 = load %Qubit*, %Qubit** %17, align 8
  %42 = load %Qubit*, %Qubit** %19, align 8
  %43 = load %Qubit*, %Qubit** %21, align 8
  %44 = load %Qubit*, %Qubit** %23, align 8
  %45 = load %Qubit*, %Qubit** %25, align 8
  %46 = load %Qubit*, %Qubit** %27, align 8
  %47 = load %Qubit*, %Qubit** %29, align 8
  %48 = load %Qubit*, %Qubit** %31, align 8
  %49 = load %Qubit*, %Qubit** %33, align 8
  %50 = load %Qubit*, %Qubit** %35, align 8
  %51 = load %Qubit*, %Qubit** %37, align 8
  %52 = load %Qubit*, %Qubit** %39, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %40)
  tail call void @__quantum__qis__t__adj(%Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %45, %Qubit* %46)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %47)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %53 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %53)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %55 = bitcast %Tuple* %54 to { %Array*, %Qubit* }*
  %56 = bitcast %Tuple* %54 to %Array**
  %57 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %56, align 8
  store %Qubit* %4, %Qubit** %57, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 1)
  %controls.i.i = load %Array*, %Array** %56, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %57, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %58 = phi i64 [ %67, %body__1.i.i ], [ 0, %else__1.i ]
  %59 = shl nuw i64 %58, 1
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %59)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = or i64 %59, 1
  %63 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %62)
  %64 = bitcast i8* %63 to %Qubit**
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %58)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = add nuw nsw i64 %58, 1
  %68 = icmp slt i64 %67, %numControlPairs.i.i
  %69 = load %Qubit*, %Qubit** %61, align 8
  %70 = load %Qubit*, %Qubit** %64, align 8
  %71 = load %Qubit*, %Qubit** %66, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__t__adj(%Qubit* %69)
  tail call void @__quantum__qis__t__body(%Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__t__adj(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %70)
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  br i1 %68, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %72 = and i64 %numControls.i.i, 1
  %73 = icmp eq i64 %72, 0
  br i1 %73, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %74 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %76 = bitcast i8* %75 to %Qubit**
  %77 = add i64 %numControls.i.i, -1
  %78 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %77)
  %79 = bitcast i8* %78 to %Qubit**
  %80 = load %Qubit*, %Qubit** %79, align 8
  store %Qubit* %80, %Qubit** %76, align 8
  %81 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %74)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %81, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %81, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %81, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %82 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %83 = bitcast %Tuple* %82 to { %Array*, %Qubit* }*
  %84 = bitcast %Tuple* %82 to %Array**
  %85 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %83, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %84, align 8
  store %Qubit* %arg.i.i, %Qubit** %85, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %82, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %86 = phi i64 [ %95, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %87 = shl nuw i64 %86, 1
  %88 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %87)
  %89 = bitcast i8* %88 to %Qubit**
  %90 = or i64 %87, 1
  %91 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %90)
  %92 = bitcast i8* %91 to %Qubit**
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %86)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = add i64 %86, -1
  %96 = icmp sgt i64 %95, -1
  %97 = load %Qubit*, %Qubit** %89, align 8
  %98 = load %Qubit*, %Qubit** %92, align 8
  %99 = load %Qubit*, %Qubit** %94, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %99)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %98)
  tail call void @__quantum__qis__t__body(%Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %97, %Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %97)
  tail call void @__quantum__qis__t__adj(%Qubit* %99)
  tail call void @__quantum__qis__t__body(%Qubit* %97)
  tail call void @__quantum__qis__t__adj(%Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %97, %Qubit* %98)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %97)
  tail call void @__quantum__qis__h__body(%Qubit* %99)
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %82, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.powi.f64(double, i32) #1

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #2

attributes #0 = { "InteropFriendly" "requiredQubits"="0" "requiredResults"="0" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
