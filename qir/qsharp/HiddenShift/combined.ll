; ModuleID = 'qat-link'
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
  %2 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  tail call void @llvm.assume(i1 %0)
  %3 = icmp sgt i64 %patternInt, -1
  tail call void @llvm.assume(i1 %3)
  %4 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  %5 = fptosi double %4 to i64
  %6 = icmp sgt i64 %5, %patternInt
  tail call void @llvm.assume(i1 %6)
  %7 = tail call %Array* @__quantum__rt__array_create_1d(i32 1, i64 %nQubits.i)
  %.not.not6.not.i.i = icmp eq i64 %nQubits.i, 0
  br i1 %.not.not6.not.i.i, label %exit__2.critedge.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %8 = phi i64 [ %11, %body__1.i.i ], [ 0, %entry ]
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %7, i64 %8)
  %10 = bitcast i8* %9 to i1*
  store i1 false, i1* %10, align 1
  %11 = add nuw nsw i64 %8, 1
  %.not.not.i.i = icmp ult i64 %11, %nQubits.i
  br i1 %.not.not.i.i, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 -1)
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %exit__1.i.i
  %12 = phi i64 [ %19, %body__2.i.i ], [ %patternInt, %exit__1.i.i ]
  %13 = phi %Array* [ %14, %body__2.i.i ], [ %7, %exit__1.i.i ]
  %idxBit8.i.i = phi i64 [ %20, %body__2.i.i ], [ 0, %exit__1.i.i ]
  %14 = tail call %Array* @__quantum__rt__array_copy(%Array* %13, i1 false)
  %15 = and i64 %12, 1
  %16 = icmp ne i64 %15, 0
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 %idxBit8.i.i)
  %18 = bitcast i8* %17 to i1*
  store i1 %16, i1* %18, align 1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 1)
  %19 = sdiv i64 %12, 2
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  %20 = add nuw nsw i64 %idxBit8.i.i, 1
  %.not3.not.i.i = icmp ult i64 %20, %nQubits.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 -1)
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

exit__2.critedge.i.i:                             ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 -1)
  br label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %exit__2.critedge.i.i
  %.lcssa.i.i = phi %Array* [ %7, %exit__2.critedge.i.i ], [ %14, %body__2.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 1)
  %21 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %22 = bitcast %Tuple* %21 to { %Callable*, i64 }*
  %23 = bitcast %Tuple* %21 to %Callable**
  %24 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %22, i64 0, i32 1
  %25 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %25, %Callable** %23, align 8
  store i64 %registerSize, i64* %24, align 4
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %21)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 1)
  %27 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %28 = bitcast %Tuple* %27 to { %Callable*, %Array*, i64 }*
  %29 = bitcast %Tuple* %27 to %Callable**
  %30 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %28, i64 0, i32 1
  %31 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %28, i64 0, i32 2
  %32 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 1)
  store %Callable* %32, %Callable** %29, align 8
  store %Array* %.lcssa.i.i, %Array** %30, align 8
  store i64 %registerSize, i64* %31, align 4
  %33 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__2__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__2__FunctionTable, %Tuple* %27)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 1)
  %qubits.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %34 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %34, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %34, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %35 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %36 = add i64 %35, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not1.i.i.i = icmp slt i64 %36, 0
  br i1 %.not1.i.i.i, label %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i, %body__1.i.i.i
  %idxQubit2.i.i.i = phi i64 [ %42, %body__1.i.i.i ], [ 0, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i ]
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxQubit2.i.i.i)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  %40 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %41 = bitcast %Tuple* %40 to %Qubit**
  store %Qubit* %39, %Qubit** %41, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %34, %Tuple* %40, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %40, i32 -1)
  %42 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %42, %36
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i: ; preds = %body__1.i.i.i, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %34, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %34, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %43 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %44 = bitcast %Tuple* %43 to %Array**
  store %Array* %qubits.i.i, %Array** %44, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %33, %Tuple* %43, %Tuple* null)
  %45 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %45, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %45, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %46 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %47 = add i64 %46, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not1.i1.i.i = icmp slt i64 %47, 0
  br i1 %.not1.i1.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

body__1.i4.i.i:                                   ; preds = %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i, %body__1.i4.i.i
  %idxQubit2.i2.i.i = phi i64 [ %53, %body__1.i4.i.i ], [ 0, %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i ]
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxQubit2.i2.i.i)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = load %Qubit*, %Qubit** %49, align 8
  %51 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %52 = bitcast %Tuple* %51 to %Qubit**
  store %Qubit* %50, %Qubit** %52, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %45, %Tuple* %51, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %51, i32 -1)
  %53 = add i64 %idxQubit2.i2.i.i, 1
  %.not.i3.i.i = icmp sgt i64 %53, %47
  br i1 %.not.i3.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i4.i.i, %Microsoft__Quantum__Canon___c840b4a6fb0d47b2a038180b73724945_ApplyToEach__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %45, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %45, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %55 = bitcast %Tuple* %54 to %Array**
  store %Array* %qubits.i.i, %Array** %55, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %26, %Tuple* %54, %Tuple* null)
  %56 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %57 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %__qsVar0__idxQubit__1.i.i.i = add i64 %57, -1
  %58 = icmp sgt i64 %__qsVar0__idxQubit__1.i.i.i, -1
  br i1 %58, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i

body__1.i5.i.i:                                   ; preds = %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i, %body__1.i5.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i5.i.i ], [ %__qsVar0__idxQubit__1.i.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i ]
  %59 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %56, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %59, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %59)
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %__qsVar0__idxQubit__2.i.i.i)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = load %Qubit*, %Qubit** %61, align 8
  %63 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %64 = bitcast %Tuple* %63 to %Qubit**
  store %Qubit* %62, %Qubit** %64, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %59, %Tuple* %63, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %59, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %59, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %63, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %65 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %65, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i5.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %66 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %66, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %66, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %67 = tail call %Result* @__quantum__rt__result_get_zero()
  %68 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %69 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %68)
  %70 = add i64 %68, -1
  %.not2.i.i.i = icmp slt i64 %70, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

body__1.i7.i.i:                                   ; preds = %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i, %body__1.i7.i.i
  %71 = phi i64 [ %74, %body__1.i7.i.i ], [ 0, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i ]
  %72 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %69, i64 %71)
  %73 = bitcast i8* %72 to %Result**
  store %Result* %67, %Result** %73, align 8
  %74 = add i64 %71, 1
  %.not.i6.i.i = icmp sgt i64 %74, %70
  br i1 %.not.i6.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i7.i.i, %Microsoft__Quantum__Canon___b8e63fadf16749c9ad0b9c5ffffad533_ApplyToEachA__adj.exit.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %69, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 1)
  %75 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %76 = add i64 %75, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  %.not13.i.i.i = icmp slt i64 %76, 0
  br i1 %.not13.i.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %77 = phi %Array* [ %78, %body__2.i.i.i ], [ %69, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %89, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %77, i32 -1)
  %78 = tail call %Array* @__quantum__rt__array_copy(%Array* %77, i1 false)
  %79 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i.i, i64 %idxElement4.i.i.i)
  %80 = bitcast i8* %79 to %Qubit**
  %81 = load %Qubit*, %Qubit** %80, align 8
  %82 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %83 = bitcast %Tuple* %82 to %Qubit**
  store %Qubit* %81, %Qubit** %83, align 8
  %84 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %66, %Tuple* %82, %Tuple* %84)
  %85 = bitcast %Tuple* %84 to %Result**
  %86 = load %Result*, %Result** %85, align 8
  %87 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %78, i64 %idxElement4.i.i.i)
  %88 = bitcast i8* %87 to %Result**
  store %Result* %86, %Result** %88, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %78, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %77, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %82, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %84, i32 -1)
  %89 = add i64 %idxElement4.i.i.i, 1
  %.not1.i8.i.i = icmp sgt i64 %89, %76
  br i1 %.not1.i8.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %69, %exit__1.i.i.i ], [ %78, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %34, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %34, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %43, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %45, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %45, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %66, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %qubits.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %33, i32 -1)
  %90 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %91 = tail call i8* @__quantum__rt__memory_allocate(i64 %90)
  %92 = ptrtoint i8* %91 to i64
  %93 = add i64 %90, -1
  %.not4 = icmp slt i64 %93, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, %exit_quantum_grouping
  %94 = phi i64 [ %99, %exit_quantum_grouping ], [ 0, %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit ]
  %95 = add i64 %94, %92
  %96 = inttoptr i64 %95 to i8*
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %94)
  %98 = bitcast i8* %97 to %Result**
  %99 = add i64 %94, 1
  %100 = icmp sgt i64 %99, %93
  br label %load

load:                                             ; preds = %body__1
  %101 = load %Result*, %Result** %98, align 8
  br label %quantum

quantum:                                          ; preds = %load
  br label %readout

readout:                                          ; preds = %quantum
  %102 = tail call i1 @__quantum__qis__read_result__body(%Result* %101)
  br label %post-classical

post-classical:                                   ; preds = %readout
  %103 = sext i1 %102 to i8
  store i8 %103, i8* %96, align 1
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br i1 %100, label %exit__1, label %body__1

exit__1:                                          ; preds = %exit_quantum_grouping, %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit
  %104 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %105 = bitcast i8* %104 to i64*
  store i64 %90, i64* %105, align 4
  %106 = getelementptr i8, i8* %104, i64 8
  %107 = bitcast i8* %106 to i8**
  store i8* %91, i8** %107, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %108 = phi i64 [ %110, %body__2 ], [ 0, %exit__1 ]
  %109 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %108)
  %110 = add i64 %108, 1
  %.not3 = icmp sgt i64 %110, %93
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %111 = bitcast i8* %104 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i.i, i32 -1)
  ret { i64, i8* }* %111
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
  br label %load

load:                                             ; preds = %entry
  %2 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  %3 = tail call %Result* @__quantum__qis__m__body(%Qubit* %2)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* %3, %Result** %1, align 8
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__H__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
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
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %17, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %18 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %18, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %19 = phi i64 [ %28, %exit_quantum_grouping8 ], [ 0, %else__1.i ]
  %20 = shl nuw i64 %19, 1
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = or i64 %20, 1
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %19)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = add nuw nsw i64 %19, 1
  %29 = icmp slt i64 %28, %numControlPairs.i.i
  br label %load10

load10:                                           ; preds = %body__1.i.i
  %30 = load %Qubit*, %Qubit** %22, align 8
  %31 = load %Qubit*, %Qubit** %25, align 8
  %32 = load %Qubit*, %Qubit** %27, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__body(%Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %30)
  tail call void @__quantum__qis__t__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %31)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %31)
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %29, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %33 = and i64 %numControls.i.i, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = add i64 %numControls.i.i, -1
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %38)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = load %Qubit*, %Qubit** %40, align 8
  store %Qubit* %41, %Qubit** %37, align 8
  %42 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %35)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %42, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %43 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %44 = bitcast %Tuple* %43 to { %Array*, %Qubit* }*
  %45 = bitcast %Tuple* %43 to %Array**
  %46 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %44, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %45, align 8
  store %Qubit* %arg.i.i, %Qubit** %46, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %43, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping13, %body__2.preheader.i.i
  %47 = phi i64 [ %56, %exit_quantum_grouping13 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %48 = shl nuw i64 %47, 1
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %48)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = or i64 %48, 1
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %51)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %47)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = add i64 %47, -1
  %57 = icmp sgt i64 %56, -1
  br label %load15

load15:                                           ; preds = %body__2.i.i
  %58 = load %Qubit*, %Qubit** %50, align 8
  %59 = load %Qubit*, %Qubit** %53, align 8
  %60 = load %Qubit*, %Qubit** %55, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %59)
  tail call void @__quantum__qis__t__body(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %43, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %17, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %18 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %18, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %19 = phi i64 [ %28, %exit_quantum_grouping8 ], [ 0, %else__1.i ]
  %20 = shl nuw i64 %19, 1
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = or i64 %20, 1
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %19)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = add nuw nsw i64 %19, 1
  %29 = icmp slt i64 %28, %numControlPairs.i.i
  br label %load10

load10:                                           ; preds = %body__1.i.i
  %30 = load %Qubit*, %Qubit** %22, align 8
  %31 = load %Qubit*, %Qubit** %25, align 8
  %32 = load %Qubit*, %Qubit** %27, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__body(%Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %30)
  tail call void @__quantum__qis__t__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %31)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %31)
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %29, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %33 = and i64 %numControls.i.i, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = add i64 %numControls.i.i, -1
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %38)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = load %Qubit*, %Qubit** %40, align 8
  store %Qubit* %41, %Qubit** %37, align 8
  %42 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %35)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %42, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %43 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %44 = bitcast %Tuple* %43 to { %Array*, %Qubit* }*
  %45 = bitcast %Tuple* %43 to %Array**
  %46 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %44, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %45, align 8
  store %Qubit* %arg.i.i, %Qubit** %46, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %43, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping13, %body__2.preheader.i.i
  %47 = phi i64 [ %56, %exit_quantum_grouping13 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %48 = shl nuw i64 %47, 1
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %48)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = or i64 %48, 1
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %51)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %47)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = add i64 %47, -1
  %57 = icmp sgt i64 %56, -1
  br label %load15

load15:                                           ; preds = %body__2.i.i
  %58 = load %Qubit*, %Qubit** %50, align 8
  %59 = load %Qubit*, %Qubit** %53, align 8
  %60 = load %Qubit*, %Qubit** %55, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %59)
  tail call void @__quantum__qis__t__body(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %43, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i
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

body__1.i5:                                       ; preds = %body__1.i5, %continue__1.i
  %19 = phi i64 [ %22, %body__1.i5 ], [ 0, %continue__1.i ]
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 %19)
  %21 = bitcast i8* %20 to %Tuple**
  store %Tuple* %13, %Tuple** %21, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 1)
  %22 = add i64 %19, 1
  %.not.i4 = icmp sgt i64 %22, %18
  br i1 %.not.i4, label %body__2.i6, label %body__1.i5

body__2.i6:                                       ; preds = %body__2.i6, %body__1.i5
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

body__4.i10:                                      ; preds = %body__4.i10, %exit__3.i8
  %46 = phi i64 [ %50, %body__4.i10 ], [ 0, %exit__3.i8 ]
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i, i64 %46)
  %48 = bitcast i8* %47 to %Tuple**
  %49 = load %Tuple*, %Tuple** %48, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %49, i32 -1)
  %50 = add i64 %46, 1
  %.not6.i9 = icmp sgt i64 %50, %45
  br i1 %.not6.i9, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit, label %body__4.i10

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit: ; preds = %exit__3.i8, %body__4.i10
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
  br label %load

load:                                             ; preds = %then0__2.i
  %59 = load %Qubit*, %Qubit** %58, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %59)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %exit_quantum_grouping, %body__1.i
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

body__1.i15:                                      ; preds = %body__1.i15, %exit__1.i
  %78 = phi i64 [ %81, %body__1.i15 ], [ 0, %exit__1.i ]
  %79 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 %78)
  %80 = bitcast i8* %79 to %Tuple**
  store %Tuple* %72, %Tuple** %80, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 1)
  %81 = add i64 %78, 1
  %.not.i14 = icmp sgt i64 %81, %77
  br i1 %.not.i14, label %body__2.i17, label %body__1.i15

body__2.i17:                                      ; preds = %body__2.i17, %body__1.i15
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

body__4.i27:                                      ; preds = %body__4.i27, %exit__3.i25
  %105 = phi i64 [ %109, %body__4.i27 ], [ 0, %exit__3.i25 ]
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i23, i64 %105)
  %107 = bitcast i8* %106 to %Tuple**
  %108 = load %Tuple*, %Tuple** %107, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %108, i32 -1)
  %109 = add i64 %105, 1
  %.not6.i26 = icmp sgt i64 %109, %104
  br i1 %.not6.i26, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29, label %body__4.i27

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29: ; preds = %exit__3.i25, %body__4.i27
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

body__1.i33:                                      ; preds = %body__1.i33, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29
  %119 = phi i64 [ %122, %body__1.i33 ], [ 0, %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit29 ]
  %120 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %117, i64 %119)
  %121 = bitcast i8* %120 to %Tuple**
  store %Tuple* %113, %Tuple** %121, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %113, i32 1)
  %122 = add i64 %119, 1
  %.not.i32 = icmp sgt i64 %122, %118
  br i1 %.not.i32, label %body__2.i35, label %body__1.i33

body__2.i35:                                      ; preds = %body__2.i35, %body__1.i33
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

body__4.i45:                                      ; preds = %body__4.i45, %exit__3.i43
  %146 = phi i64 [ %150, %body__4.i45 ], [ 0, %exit__3.i43 ]
  %147 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i41, i64 %146)
  %148 = bitcast i8* %147 to %Tuple**
  %149 = load %Tuple*, %Tuple** %148, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %149, i32 -1)
  %150 = add i64 %146, 1
  %.not6.i44 = icmp sgt i64 %150, %145
  br i1 %.not6.i44, label %Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47, label %body__4.i45

Microsoft__Quantum__Arrays___e07b2363700349a982cf24cba6cbef10_Zipped__body.exit47: ; preds = %exit__3.i43, %body__4.i45
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
  br label %load52

load52:                                           ; preds = %then0__3.i
  %165 = load %Qubit*, %Qubit** %164, align 8
  br label %quantum49

quantum49:                                        ; preds = %load52
  tail call void @__quantum__qis__x__body(%Qubit* %165)
  br label %readout51

readout51:                                        ; preds = %quantum49
  br label %post-classical48

post-classical48:                                 ; preds = %readout51
  br label %exit_quantum_grouping50

exit_quantum_grouping50:                          ; preds = %post-classical48
  br label %exiting__2.i

exiting__2.i:                                     ; preds = %exit_quantum_grouping50, %body__2.i
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
  %idx3.i = phi i64 [ %120, %Microsoft__Quantum__Intrinsic__Z__ctl.exit ], [ 0, %continue__1.i ]
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
  br i1 %24, label %then0__1.i1, label %test1__1.i

then0__1.i1:                                      ; preds = %body__1.i
  br label %load

load:                                             ; preds = %then0__1.i1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %22)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %body__1.i
  %25 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %14)
  %26 = icmp eq i64 %25, 1
  br i1 %26, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 0)
  %28 = bitcast i8* %27 to %Qubit**
  br label %load7

load7:                                            ; preds = %then1__1.i
  %29 = load %Qubit*, %Qubit** %28, align 8
  br label %quantum4

quantum4:                                         ; preds = %load7
  tail call void @__quantum__qis__cz__body(%Qubit* %29, %Qubit* %22)
  br label %readout6

readout6:                                         ; preds = %quantum4
  br label %post-classical3

post-classical3:                                  ; preds = %readout6
  br label %exit_quantum_grouping5

exit_quantum_grouping5:                           ; preds = %post-classical3
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
  br label %load12

load12:                                           ; preds = %then2__1.i
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
  br label %quantum9

quantum9:                                         ; preds = %load12
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
  br label %readout11

readout11:                                        ; preds = %quantum9
  br label %post-classical8

post-classical8:                                  ; preds = %readout11
  br label %exit_quantum_grouping10

exit_quantum_grouping10:                          ; preds = %post-classical8
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
  %76 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %73, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %76, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %73, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %77, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping15, %else__1.i
  %78 = phi i64 [ %87, %exit_quantum_grouping15 ], [ 0, %else__1.i ]
  %79 = shl nuw i64 %78, 1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = or i64 %79, 1
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %82)
  %84 = bitcast i8* %83 to %Qubit**
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %78)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = add nuw nsw i64 %78, 1
  %88 = icmp slt i64 %87, %numControlPairs.i.i
  br label %load17

load17:                                           ; preds = %body__1.i.i
  %89 = load %Qubit*, %Qubit** %81, align 8
  %90 = load %Qubit*, %Qubit** %84, align 8
  %91 = load %Qubit*, %Qubit** %86, align 8
  br label %quantum14

quantum14:                                        ; preds = %load17
  tail call void @__quantum__qis__h__body(%Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %89)
  tail call void @__quantum__qis__cnot__body(%Qubit* %89, %Qubit* %90)
  tail call void @__quantum__qis__t__body(%Qubit* %90)
  tail call void @__quantum__qis__t__adj(%Qubit* %89)
  tail call void @__quantum__qis__t__body(%Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %89)
  tail call void @__quantum__qis__cnot__body(%Qubit* %89, %Qubit* %90)
  tail call void @__quantum__qis__t__adj(%Qubit* %90)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %90)
  tail call void @__quantum__qis__h__body(%Qubit* %91)
  br label %readout16

readout16:                                        ; preds = %quantum14
  br label %post-classical13

post-classical13:                                 ; preds = %readout16
  br label %exit_quantum_grouping15

exit_quantum_grouping15:                          ; preds = %post-classical13
  br i1 %88, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping15, %else__1.i
  %92 = and i64 %numControls.i.i, 1
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %94 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %94, i64 0)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %numControls.i.i, -1
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %97)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = load %Qubit*, %Qubit** %99, align 8
  store %Qubit* %100, %Qubit** %96, align 8
  %101 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %94)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %94, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %101, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %102 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %103 = bitcast %Tuple* %102 to { %Array*, %Qubit* }*
  %104 = bitcast %Tuple* %102 to %Array**
  %105 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %103, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %104, align 8
  store %Qubit* %arg.i.i, %Qubit** %105, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %71, %Tuple* %102, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping20, %body__2.preheader.i.i
  %106 = phi i64 [ %115, %exit_quantum_grouping20 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %107 = shl nuw i64 %106, 1
  %108 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %107)
  %109 = bitcast i8* %108 to %Qubit**
  %110 = or i64 %107, 1
  %111 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %110)
  %112 = bitcast i8* %111 to %Qubit**
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %106)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = add i64 %106, -1
  %116 = icmp sgt i64 %115, -1
  br label %load22

load22:                                           ; preds = %body__2.i.i
  %117 = load %Qubit*, %Qubit** %109, align 8
  %118 = load %Qubit*, %Qubit** %112, align 8
  %119 = load %Qubit*, %Qubit** %114, align 8
  br label %quantum19

quantum19:                                        ; preds = %load22
  tail call void @__quantum__qis__h__body(%Qubit* %119)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %118)
  tail call void @__quantum__qis__t__body(%Qubit* %118)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %118)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %117)
  tail call void @__quantum__qis__t__adj(%Qubit* %119)
  tail call void @__quantum__qis__t__body(%Qubit* %117)
  tail call void @__quantum__qis__t__adj(%Qubit* %118)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %118)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %117)
  tail call void @__quantum__qis__h__body(%Qubit* %119)
  br label %readout21

readout21:                                        ; preds = %quantum19
  br label %post-classical18

post-classical18:                                 ; preds = %readout21
  br label %exit_quantum_grouping20

exit_quantum_grouping20:                          ; preds = %post-classical18
  br i1 %116, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping20, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %102, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping5, %exit_quantum_grouping10, %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 -1)
  %120 = add i64 %idx3.i, 1
  %.not1.i = icmp sgt i64 %120, %8
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
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
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
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  br label %load10

load10:                                           ; preds = %then2__1.i
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
  br label %quantum7

quantum7:                                         ; preds = %load10
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
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
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
  %58 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %58, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %59 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %59, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %60 = phi i64 [ %69, %exit_quantum_grouping13 ], [ 0, %else__1.i ]
  %61 = shl nuw i64 %60, 1
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %61)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = or i64 %61, 1
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %64)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %60)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = add nuw nsw i64 %60, 1
  %70 = icmp slt i64 %69, %numControlPairs.i.i
  br label %load15

load15:                                           ; preds = %body__1.i.i
  %71 = load %Qubit*, %Qubit** %63, align 8
  %72 = load %Qubit*, %Qubit** %66, align 8
  %73 = load %Qubit*, %Qubit** %68, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__body(%Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %71)
  tail call void @__quantum__qis__t__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %72)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %72)
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %70, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %74 = and i64 %numControls.i.i, 1
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %76 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 0)
  %78 = bitcast i8* %77 to %Qubit**
  %79 = add i64 %numControls.i.i, -1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = load %Qubit*, %Qubit** %81, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  %83 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %76)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %76, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %83, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %84 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %85 = bitcast %Tuple* %84 to { %Array*, %Qubit* }*
  %86 = bitcast %Tuple* %84 to %Array**
  %87 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %85, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %86, align 8
  store %Qubit* %arg.i.i, %Qubit** %87, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %84, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping18, %body__2.preheader.i.i
  %88 = phi i64 [ %97, %exit_quantum_grouping18 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %89 = shl nuw i64 %88, 1
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %89)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = or i64 %89, 1
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %92)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %88)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %88, -1
  %98 = icmp sgt i64 %97, -1
  br label %load20

load20:                                           ; preds = %body__2.i.i
  %99 = load %Qubit*, %Qubit** %91, align 8
  %100 = load %Qubit*, %Qubit** %94, align 8
  %101 = load %Qubit*, %Qubit** %96, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %100)
  tail call void @__quantum__qis__t__body(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %101)
  tail call void @__quantum__qis__t__body(%Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %84, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  br label %load10

load10:                                           ; preds = %then2__1.i
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
  br label %quantum7

quantum7:                                         ; preds = %load10
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
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
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
  %58 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %58, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %59 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %59, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %60 = phi i64 [ %69, %exit_quantum_grouping13 ], [ 0, %else__1.i ]
  %61 = shl nuw i64 %60, 1
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %61)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = or i64 %61, 1
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %64)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %60)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = add nuw nsw i64 %60, 1
  %70 = icmp slt i64 %69, %numControlPairs.i.i
  br label %load15

load15:                                           ; preds = %body__1.i.i
  %71 = load %Qubit*, %Qubit** %63, align 8
  %72 = load %Qubit*, %Qubit** %66, align 8
  %73 = load %Qubit*, %Qubit** %68, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__body(%Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %71)
  tail call void @__quantum__qis__t__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %72)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %72)
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %70, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %74 = and i64 %numControls.i.i, 1
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %76 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 0)
  %78 = bitcast i8* %77 to %Qubit**
  %79 = add i64 %numControls.i.i, -1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = load %Qubit*, %Qubit** %81, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  %83 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %76)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %76, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %83, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %84 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %85 = bitcast %Tuple* %84 to { %Array*, %Qubit* }*
  %86 = bitcast %Tuple* %84 to %Array**
  %87 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %85, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %86, align 8
  store %Qubit* %arg.i.i, %Qubit** %87, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %84, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping18, %body__2.preheader.i.i
  %88 = phi i64 [ %97, %exit_quantum_grouping18 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %89 = shl nuw i64 %88, 1
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %89)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = or i64 %89, 1
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %92)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %88)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %88, -1
  %98 = icmp sgt i64 %97, -1
  br label %load20

load20:                                           ; preds = %body__2.i.i
  %99 = load %Qubit*, %Qubit** %91, align 8
  %100 = load %Qubit*, %Qubit** %94, align 8
  %101 = load %Qubit*, %Qubit** %96, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %100)
  tail call void @__quantum__qis__t__body(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %101)
  tail call void @__quantum__qis__t__body(%Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %84, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___679897c0d5ea461fbf562e36c6fc9634___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare double @llvm.powi.f64(double, i32)

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

attributes #0 = { "InteropFriendly" "requiredQubits"="0" "requiredResults"="0" }
attributes #1 = { nounwind willreturn }

