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
  br i1 %.not.not6.not.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %7 = phi i64 [ %10, %body__1.i.i ], [ 0, %entry ]
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %7)
  %9 = bitcast i8* %8 to i1*
  store i1 false, i1* %9, align 1
  %10 = add nuw nsw i64 %7, 1
  %.not.not.i.i = icmp ult i64 %10, %nQubits.i
  br i1 %.not.not.i.i, label %body__1.i.i, label %body__2.i.i

body__2.i.i:                                      ; preds = %body__1.i.i, %body__2.i.i
  %11 = phi i64 [ %18, %body__2.i.i ], [ %patternInt, %body__1.i.i ]
  %12 = phi %Array* [ %13, %body__2.i.i ], [ %6, %body__1.i.i ]
  %idxBit8.i.i = phi i64 [ %19, %body__2.i.i ], [ 0, %body__1.i.i ]
  %13 = tail call %Array* @__quantum__rt__array_copy(%Array* %12, i1 false)
  %14 = and i64 %11, 1
  %15 = icmp ne i64 %14, 0
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 %idxBit8.i.i)
  %17 = bitcast i8* %16 to i1*
  store i1 %15, i1* %17, align 1
  %18 = sdiv i64 %11, 2
  %19 = add nuw nsw i64 %idxBit8.i.i, 1
  %.not3.not.i.i = icmp ult i64 %19, %nQubits.i
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %entry
  %.lcssa.i.i = phi %Array* [ %6, %entry ], [ %13, %body__2.i.i ]
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { %Callable*, i64 }*
  %22 = bitcast %Tuple* %20 to %Callable**
  %23 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %21, i64 0, i32 1
  %24 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %24, %Callable** %22, align 8
  store i64 %registerSize, i64* %23, align 4
  %25 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %20)
  %26 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %27 = bitcast %Tuple* %26 to { %Callable*, %Array*, i64 }*
  %28 = bitcast %Tuple* %26 to %Callable**
  %29 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %27, i64 0, i32 1
  %30 = getelementptr inbounds { %Callable*, %Array*, i64 }, { %Callable*, %Array*, i64 }* %27, i64 0, i32 2
  %31 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %31, %Callable** %28, align 8
  store %Array* %.lcssa.i.i, %Array** %29, align 8
  store i64 %registerSize, i64* %30, align 4
  %32 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__2__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__2__FunctionTable, %Tuple* %26)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %25, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %25, i32 1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 1)
  %qubits.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits.i)
  %33 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 1)
  %34 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %35 = add i64 %34, -1
  %.not1.i.i.i = icmp slt i64 %35, 0
  br i1 %.not1.i.i.i, label %Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

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
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i: ; preds = %body__1.i.i.i, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %33, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %33, i32 -1)
  %42 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %43 = bitcast %Tuple* %42 to %Array**
  store %Array* %qubits.i.i, %Array** %43, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %32, %Tuple* %42, %Tuple* null)
  %44 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %44, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %44, i32 1)
  %45 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %46 = add i64 %45, -1
  %.not1.i1.i.i = icmp slt i64 %46, 0
  br i1 %.not1.i1.i.i, label %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

body__1.i4.i.i:                                   ; preds = %Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i, %body__1.i4.i.i
  %idxQubit2.i2.i.i = phi i64 [ %52, %body__1.i4.i.i ], [ 0, %Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i ]
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
  br i1 %.not.i3.i.i, label %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i, label %body__1.i4.i.i

Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i4.i.i, %Microsoft__Quantum__Canon___dafb372ae6a743ac852cff9b08f5033f_ApplyToEach__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %44, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %44, i32 -1)
  %53 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %54 = bitcast %Tuple* %53 to %Array**
  store %Array* %qubits.i.i, %Array** %54, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %25, %Tuple* %53, %Tuple* null)
  %55 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %55, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %55, i32 1)
  %56 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %__qsVar0__idxQubit__1.i.i.i = add i64 %56, -1
  %57 = icmp sgt i64 %__qsVar0__idxQubit__1.i.i.i, -1
  br i1 %57, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i

body__1.i5.i.i:                                   ; preds = %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i, %body__1.i5.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i5.i.i ], [ %__qsVar0__idxQubit__1.i.i.i, %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i ]
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
  br i1 %64, label %body__1.i5.i.i, label %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i5.i.i, %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %55, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %55, i32 -1)
  %65 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %65, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %65, i32 1)
  %66 = tail call %Result* @__quantum__rt__result_get_zero()
  %67 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %68 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %67)
  %69 = add i64 %67, -1
  %.not2.i.i.i = icmp slt i64 %69, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

body__1.i7.i.i:                                   ; preds = %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i, %body__1.i7.i.i
  %70 = phi i64 [ %73, %body__1.i7.i.i ], [ 0, %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i ]
  %71 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %68, i64 %70)
  %72 = bitcast i8* %71 to %Result**
  store %Result* %66, %Result** %72, align 8
  %73 = add i64 %70, 1
  %.not.i6.i.i = icmp sgt i64 %73, %69
  br i1 %.not.i6.i.i, label %exit__1.i.i.i, label %body__1.i7.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i7.i.i, %Microsoft__Quantum__Canon___98766e0a6c0a4df193bf96e01956161b_ApplyToEachA__adj.exit.i.i
  %74 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i.i)
  %75 = add i64 %74, -1
  %.not13.i.i.i = icmp slt i64 %75, 0
  br i1 %.not13.i.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %76 = phi %Array* [ %77, %body__2.i.i.i ], [ %68, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %88, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
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
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %81, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %83, i32 -1)
  %88 = add i64 %idxElement4.i.i.i, 1
  %.not1.i8.i.i = icmp sgt i64 %88, %75
  br i1 %.not1.i8.i.i, label %Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit, label %body__2.i.i.i

Microsoft__Quantum__Samples__RunHiddenShift__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %68, %exit__1.i.i.i ], [ %77, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %65, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %65, i32 -1)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %3, %Qubit* %4)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %3, %Qubit* %4)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %quantum, label %test1__1

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  tail call void @__quantum__qis__s__body(%Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  tail call void @__quantum__qis__t__body(%Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %qubit)
  tail call void @__quantum__qis__t__adj(%Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  tail call void @__quantum__qis__s__adj(%Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %7 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %7)
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %9 = bitcast %Tuple* %8 to { %Array*, %Qubit* }*
  %10 = bitcast %Tuple* %8 to %Array**
  %11 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %9, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %10, align 8
  store %Qubit* %qubit, %Qubit** %11, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___23f28be263614411aa2c895c74b426bd___QsRef23__ApplyWithLessControlsA____body(%Callable* %7, { %Array*, %Qubit* }* %9)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

define internal fastcc void @Microsoft__Quantum__Intrinsic___23f28be263614411aa2c895c74b426bd___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, %Qubit* }* nocapture readonly %0) unnamed_addr {
entry:
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %arg = load %Qubit*, %Qubit** %2, align 8
  %numControls = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %numControlPairs = sdiv i64 %numControls, 2
  %temps = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 1)
  %.not.not1 = icmp sgt i64 %numControls, 1
  br i1 %.not.not1, label %body__1, label %exit__1

body__1:                                          ; preds = %entry, %body__1
  %3 = phi i64 [ %12, %body__1 ], [ 0, %entry ]
  %4 = shl nuw i64 %3, 1
  %5 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %4)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = or i64 %4, 1
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %7)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %3)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = add nuw nsw i64 %3, 1
  %13 = icmp slt i64 %12, %numControlPairs
  %14 = load %Qubit*, %Qubit** %6, align 8
  %15 = load %Qubit*, %Qubit** %9, align 8
  %16 = load %Qubit*, %Qubit** %11, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %16)
  tail call void @__quantum__qis__cnot__body(%Qubit* %16, %Qubit* %14)
  tail call void @__quantum__qis__cnot__body(%Qubit* %14, %Qubit* %15)
  tail call void @__quantum__qis__t__body(%Qubit* %15)
  tail call void @__quantum__qis__t__adj(%Qubit* %14)
  tail call void @__quantum__qis__t__body(%Qubit* %16)
  tail call void @__quantum__qis__cnot__body(%Qubit* %16, %Qubit* %14)
  tail call void @__quantum__qis__cnot__body(%Qubit* %14, %Qubit* %15)
  tail call void @__quantum__qis__t__adj(%Qubit* %15)
  tail call void @__quantum__qis__cnot__body(%Qubit* %16, %Qubit* %15)
  tail call void @__quantum__qis__h__body(%Qubit* %16)
  br i1 %13, label %body__1, label %exit__1

exit__1:                                          ; preds = %body__1, %entry
  %17 = and i64 %numControls, 1
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %19 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = add i64 %numControls, -1
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %22)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = load %Qubit*, %Qubit** %24, align 8
  store %Qubit* %25, %Qubit** %21, align 8
  %26 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps, %Array* %19)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %26, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %19, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %26, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1__newControls__ = phi %Array* [ %temps, %condTrue__1 ], [ %26, %condFalse__1 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 1)
  %27 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %28 = bitcast %Tuple* %27 to { %Array*, %Qubit* }*
  %29 = bitcast %Tuple* %27 to %Array**
  %30 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %28, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 1)
  store %Array* %__qsVar1__newControls__, %Array** %29, align 8
  store %Qubit* %arg, %Qubit** %30, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %27, %Tuple* null)
  br i1 %.not.not1, label %body__2.preheader, label %exit__2

body__2.preheader:                                ; preds = %condContinue__1
  %__qsVar0____qsVar0__numPair____3 = add nsw i64 %numControlPairs, -1
  br label %body__2

body__2:                                          ; preds = %body__2, %body__2.preheader
  %31 = phi i64 [ %40, %body__2 ], [ %__qsVar0____qsVar0__numPair____3, %body__2.preheader ]
  %32 = shl nuw i64 %31, 1
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %32)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = or i64 %32, 1
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %35)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %31)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = add i64 %31, -1
  %41 = icmp sgt i64 %40, -1
  %42 = load %Qubit*, %Qubit** %34, align 8
  %43 = load %Qubit*, %Qubit** %37, align 8
  %44 = load %Qubit*, %Qubit** %39, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %44)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %43)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %42, %Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %42)
  tail call void @__quantum__qis__t__adj(%Qubit* %44)
  tail call void @__quantum__qis__t__body(%Qubit* %42)
  tail call void @__quantum__qis__t__adj(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %42, %Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %42)
  tail call void @__quantum__qis__h__body(%Qubit* %44)
  br i1 %41, label %body__2, label %exit__2

exit__2:                                          ; preds = %body__2, %condContinue__1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %27, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

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
  %10 = tail call fastcc %Array* @Microsoft__Quantum__Arrays___2f59a2cfe3ff4cfeacb0211820fe9610_Zipped__body(%Array* %4, %Array* %6)
  %11 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %10)
  %12 = add i64 %11, -1
  %.not12.i = icmp slt i64 %12, 0
  br i1 %.not12.i, label %exit__1.i, label %body__1.i

body__1.i:                                        ; preds = %continue__1.i, %exiting__1.i
  %13 = phi i64 [ %20, %exiting__1.i ], [ 0, %continue__1.i ]
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %10, i64 %13)
  %15 = bitcast i8* %14 to { i1, %Qubit* }**
  %16 = load { i1, %Qubit* }*, { i1, %Qubit* }** %15, align 8
  %17 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %16, i64 0, i32 0
  %__qsVar0__shiftBit__.i = load i1, i1* %17, align 1
  br i1 %__qsVar0__shiftBit__.i, label %then0__2.i, label %exiting__1.i

then0__2.i:                                       ; preds = %body__1.i
  %18 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %16, i64 0, i32 1
  %19 = load %Qubit*, %Qubit** %18, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %19)
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %then0__2.i, %body__1.i
  %20 = add i64 %13, 1
  %.not.i = icmp sgt i64 %20, %12
  br i1 %.not.i, label %exit__1.i, label %body__1.i

exit__1.i:                                        ; preds = %exiting__1.i, %continue__1.i
  %21 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %22 = bitcast %Tuple* %21 to { %Callable*, i64 }*
  %23 = bitcast %Tuple* %21 to %Callable**
  %24 = getelementptr inbounds { %Callable*, i64 }, { %Callable*, i64 }* %22, i64 0, i32 1
  %25 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %25, %Callable** %23, align 8
  store i64 %5, i64* %24, align 4
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %21)
  %27 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %28 = bitcast %Tuple* %27 to %Array**
  store %Array* %6, %Array** %28, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %26, %Tuple* %27, %Tuple* null)
  %29 = tail call fastcc %Array* @Microsoft__Quantum__Arrays___2f59a2cfe3ff4cfeacb0211820fe9610_Zipped__body(%Array* %4, %Array* %6)
  %30 = tail call fastcc %Array* @Microsoft__Quantum__Arrays___2f59a2cfe3ff4cfeacb0211820fe9610_Zipped__body(%Array* %4, %Array* %6)
  %31 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %30)
  %32 = add i64 %31, -1
  %33 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %32, 0
  %34 = insertvalue %Range %33, i64 -1, 1
  %35 = insertvalue %Range %34, i64 0, 2
  %36 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %29, %Range %35, i1 true)
  %37 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %36)
  %38 = add i64 %37, -1
  %.not613.i = icmp slt i64 %38, 0
  br i1 %.not613.i, label %exit__2.i, label %body__2.i

body__2.i:                                        ; preds = %exit__1.i, %exiting__2.i
  %39 = phi i64 [ %46, %exiting__2.i ], [ 0, %exit__1.i ]
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %36, i64 %39)
  %41 = bitcast i8* %40 to { i1, %Qubit* }**
  %42 = load { i1, %Qubit* }*, { i1, %Qubit* }** %41, align 8
  %43 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %42, i64 0, i32 0
  %__qsVar0____qsVar0__shiftBit____.i = load i1, i1* %43, align 1
  br i1 %__qsVar0____qsVar0__shiftBit____.i, label %then0__3.i, label %exiting__2.i

then0__3.i:                                       ; preds = %body__2.i
  %44 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %42, i64 0, i32 1
  %45 = load %Qubit*, %Qubit** %44, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %45)
  br label %exiting__2.i

exiting__2.i:                                     ; preds = %then0__3.i, %body__2.i
  %46 = add i64 %39, 1
  %.not6.i = icmp sgt i64 %46, %38
  br i1 %.not6.i, label %exit__2.i, label %body__2.i

exit__2.i:                                        ; preds = %exiting__2.i, %exit__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  br i1 %.not12.i, label %exit__3.i, label %body__3.i

body__3.i:                                        ; preds = %exit__2.i, %body__3.i
  %47 = phi i64 [ %51, %body__3.i ], [ 0, %exit__2.i ]
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %10, i64 %47)
  %49 = bitcast i8* %48 to %Tuple**
  %50 = load %Tuple*, %Tuple** %49, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %51 = add i64 %47, 1
  %.not7.i = icmp sgt i64 %51, %12
  br i1 %.not7.i, label %exit__3.i, label %body__3.i

exit__3.i:                                        ; preds = %body__3.i, %exit__2.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %10, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %27, i32 -1)
  %52 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %29)
  %53 = add i64 %52, -1
  %.not815.i = icmp slt i64 %53, 0
  br i1 %.not815.i, label %exit__4.i, label %body__4.i

body__4.i:                                        ; preds = %exit__3.i, %body__4.i
  %54 = phi i64 [ %58, %body__4.i ], [ 0, %exit__3.i ]
  %55 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %29, i64 %54)
  %56 = bitcast i8* %55 to %Tuple**
  %57 = load %Tuple*, %Tuple** %56, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %57, i32 -1)
  %58 = add i64 %54, 1
  %.not8.i = icmp sgt i64 %58, %53
  br i1 %.not8.i, label %exit__4.i, label %body__4.i

exit__4.i:                                        ; preds = %body__4.i, %exit__3.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %29, i32 -1)
  %.not916.i = icmp slt i64 %32, 0
  br i1 %.not916.i, label %Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit, label %body__5.i

body__5.i:                                        ; preds = %exit__4.i, %body__5.i
  %59 = phi i64 [ %63, %body__5.i ], [ 0, %exit__4.i ]
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %30, i64 %59)
  %61 = bitcast i8* %60 to %Tuple**
  %62 = load %Tuple*, %Tuple** %61, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %62, i32 -1)
  %63 = add i64 %59, 1
  %.not9.i = icmp sgt i64 %63, %32
  br i1 %.not9.i, label %Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit, label %body__5.i

Microsoft__Quantum__Samples__ApplyShiftedInnerProductBentFunction__body.exit: ; preds = %body__5.i, %exit__4.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %30, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %36, i32 -1)
  ret void
}

declare %String* @__quantum__rt__string_create(i8*) local_unnamed_addr

declare void @__quantum__rt__fail(%String*) local_unnamed_addr

define internal fastcc %Array* @Microsoft__Quantum__Arrays___2f59a2cfe3ff4cfeacb0211820fe9610_Zipped__body(%Array* %left, %Array* %right) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %left, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %right, i32 1)
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %left)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %right)
  %2 = icmp slt i64 %0, %1
  %. = select i1 %2, i64 %0, i64 %1
  %3 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %4 = bitcast %Tuple* %3 to { i1, %Qubit* }*
  %5 = bitcast %Tuple* %3 to i1*
  %6 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %4, i64 0, i32 1
  store i1 false, i1* %5, align 1
  store %Qubit* null, %Qubit** %6, align 8
  %7 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %.)
  %8 = add i64 %., -1
  %.not7 = icmp slt i64 %8, 0
  br i1 %.not7, label %exit__2.thread, label %body__1

body__1:                                          ; preds = %entry, %body__1
  %9 = phi i64 [ %12, %body__1 ], [ 0, %entry ]
  %10 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %7, i64 %9)
  %11 = bitcast i8* %10 to %Tuple**
  store %Tuple* %3, %Tuple** %11, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 1)
  %12 = add i64 %9, 1
  %.not = icmp sgt i64 %12, %8
  br i1 %.not, label %body__2, label %body__1

body__2:                                          ; preds = %body__1, %body__2
  %13 = phi i64 [ %17, %body__2 ], [ 0, %body__1 ]
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %7, i64 %13)
  %15 = bitcast i8* %14 to %Tuple**
  %16 = load %Tuple*, %Tuple** %15, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %16, i32 1)
  %17 = add i64 %13, 1
  %.not4 = icmp sgt i64 %17, %8
  br i1 %.not4, label %body__3.preheader, label %body__2

exit__2.thread:                                   ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 1)
  br label %exit__3

body__3.preheader:                                ; preds = %body__2
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 1)
  br label %body__3

body__3:                                          ; preds = %body__3, %body__3.preheader
  %18 = phi %Array* [ %19, %body__3 ], [ %7, %body__3.preheader ]
  %idxElement10 = phi i64 [ %33, %body__3 ], [ 0, %body__3.preheader ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  %19 = tail call %Array* @__quantum__rt__array_copy(%Array* %18, i1 false)
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { i1, %Qubit* }*
  %22 = bitcast %Tuple* %20 to i1*
  %23 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %21, i64 0, i32 1
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %left, i64 %idxElement10)
  %25 = bitcast i8* %24 to i1*
  %26 = load i1, i1* %25, align 1
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %right, i64 %idxElement10)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  store i1 %26, i1* %22, align 1
  store %Qubit* %29, %Qubit** %23, align 8
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 %idxElement10)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %20, i32 1)
  %31 = bitcast i8* %30 to %Tuple**
  %32 = load %Tuple*, %Tuple** %31, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %32, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %32, i32 -1)
  store %Tuple* %20, %Tuple** %31, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %19, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  %33 = add i64 %idxElement10, 1
  %.not5 = icmp sgt i64 %33, %8
  br i1 %.not5, label %exit__3, label %body__3

exit__3:                                          ; preds = %body__3, %exit__2.thread
  %.lcssa = phi %Array* [ %7, %exit__2.thread ], [ %19, %body__3 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %left, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %right, i32 -1)
  %34 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa)
  %35 = add i64 %34, -1
  %.not611 = icmp slt i64 %35, 0
  br i1 %.not611, label %exit__4, label %body__4

body__4:                                          ; preds = %exit__3, %body__4
  %36 = phi i64 [ %40, %body__4 ], [ 0, %exit__3 ]
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa, i64 %36)
  %38 = bitcast i8* %37 to %Tuple**
  %39 = load %Tuple*, %Tuple** %38, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %39, i32 -1)
  %40 = add i64 %36, 1
  %.not6 = icmp sgt i64 %40, %35
  br i1 %.not6, label %exit__4, label %body__4

exit__4:                                          ; preds = %body__4, %exit__3
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret %Array* %.lcssa
}

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

body__1.i:                                        ; preds = %continue__1.i, %body__1.i
  %idx3.i = phi i64 [ %23, %body__1.i ], [ 0, %continue__1.i ]
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %14, %Qubit* %22)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %14, i32 -1)
  %23 = add i64 %idx3.i, 1
  %.not1.i = icmp sgt i64 %23, %8
  br i1 %.not1.i, label %Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body.exit, label %body__1.i

Microsoft__Quantum__Samples__ApplyInnerProductBentFunction__body.exit: ; preds = %body__1.i, %continue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %xs.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ys.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %xs.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ys.i, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %quantum, label %test1__1

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__z__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = icmp eq i64 %7, 2
  br i1 %8, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %32 = bitcast i8* %31 to %Qubit**
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = load %Qubit*, %Qubit** %10, align 8
  %36 = load %Qubit*, %Qubit** %12, align 8
  %37 = load %Qubit*, %Qubit** %14, align 8
  %38 = load %Qubit*, %Qubit** %16, align 8
  %39 = load %Qubit*, %Qubit** %18, align 8
  %40 = load %Qubit*, %Qubit** %20, align 8
  %41 = load %Qubit*, %Qubit** %22, align 8
  %42 = load %Qubit*, %Qubit** %24, align 8
  %43 = load %Qubit*, %Qubit** %26, align 8
  %44 = load %Qubit*, %Qubit** %28, align 8
  %45 = load %Qubit*, %Qubit** %30, align 8
  %46 = load %Qubit*, %Qubit** %32, align 8
  %47 = load %Qubit*, %Qubit** %34, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %35)
  tail call void @__quantum__qis__t__adj(%Qubit* %36)
  tail call void @__quantum__qis__cnot__body(%Qubit* %qubit, %Qubit* %37)
  tail call void @__quantum__qis__t__body(%Qubit* %38)
  tail call void @__quantum__qis__cnot__body(%Qubit* %39, %Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %40, %Qubit* %41)
  tail call void @__quantum__qis__t__body(%Qubit* %qubit)
  tail call void @__quantum__qis__t__adj(%Qubit* %42)
  tail call void @__quantum__qis__cnot__body(%Qubit* %43, %Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %qubit, %Qubit* %44)
  tail call void @__quantum__qis__t__adj(%Qubit* %qubit)
  tail call void @__quantum__qis__t__body(%Qubit* %45)
  tail call void @__quantum__qis__cnot__body(%Qubit* %46, %Qubit* %47)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %48 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %48)
  %49 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %50 = bitcast %Tuple* %49 to { %Array*, %Qubit* }*
  %51 = bitcast %Tuple* %49 to %Array**
  %52 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %50, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %51, align 8
  store %Qubit* %qubit, %Qubit** %52, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___23f28be263614411aa2c895c74b426bd___QsRef23__ApplyWithLessControlsA____body(%Callable* %48, { %Array*, %Qubit* }* %50)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %49, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %3, %Qubit* %4)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %3, %Qubit* %4)
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
