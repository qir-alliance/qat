; ModuleID = 'qat-link'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Result = type opaque

@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Tets__Samples__BernVaz__ParityOperationImpl__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Tets__Samples__BernVaz__ParityOperationImpl__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@PartialApplication__1__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@MemoryManagement__1__FunctionTable = internal constant [2 x void (%Tuple*, i32)*] [void (%Tuple*, i32)* @MemoryManagement__1__RefCount, void (%Tuple*, i32)* @MemoryManagement__1__AliasCount]
@Microsoft__Quantum__Intrinsic__X__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]

define { i64, i8* }* @Tets__Samples__BernVaz__BernsteinVaziraniTestCase__Interop(i64 %nQubits, i64 %patternInt) local_unnamed_addr #0 {
entry:
  %0 = icmp ult i64 %nQubits, 64
  %1 = trunc i64 %nQubits to i32
  %2 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  tail call void @llvm.assume(i1 %0)
  %3 = icmp sgt i64 %patternInt, -1
  tail call void @llvm.assume(i1 %3)
  %4 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  %5 = fptosi double %4 to i64
  %6 = icmp sgt i64 %5, %patternInt
  tail call void @llvm.assume(i1 %6)
  %7 = tail call %Array* @__quantum__rt__array_create_1d(i32 1, i64 %nQubits)
  %.not.not6.not.i.i = icmp eq i64 %nQubits, 0
  br i1 %.not.not6.not.i.i, label %exit__2.critedge.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %8 = phi i64 [ %11, %body__1.i.i ], [ 0, %entry ]
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %7, i64 %8)
  %10 = bitcast i8* %9 to i1*
  store i1 false, i1* %10, align 1
  %11 = add nuw nsw i64 %8, 1
  %.not.not.i.i = icmp ult i64 %11, %nQubits
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
  %.not3.not.i.i = icmp ult i64 %20, %nQubits
  tail call void @__quantum__rt__array_update_alias_count(%Array* %14, i32 -1)
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

exit__2.critedge.i.i:                             ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %7, i32 -1)
  br label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %exit__2.critedge.i.i
  %21 = phi %Array* [ %7, %exit__2.critedge.i.i ], [ %14, %body__2.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 1)
  %22 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %23 = bitcast %Tuple* %22 to { %Callable*, %Array* }*
  %24 = bitcast %Tuple* %22 to %Callable**
  %25 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %23, i64 0, i32 1
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Tets__Samples__BernVaz__ParityOperationImpl__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 1)
  store %Callable* %26, %Callable** %24, align 8
  store %Array* %21, %Array** %25, align 8
  %27 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %22)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %27, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %27, i32 1)
  %28 = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  %29 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %29, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %29, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  %30 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %31 = add i64 %30, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %32 = icmp slt i64 %31, 0
  br label %load

load:                                             ; preds = %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br i1 %32, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping, %body__1.i.i.i
  %idxQubit2.i.i.i = phi i64 [ %38, %body__1.i.i.i ], [ 0, %exit_quantum_grouping ]
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %28, i64 %idxQubit2.i.i.i)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = load %Qubit*, %Qubit** %34, align 8
  %36 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %37 = bitcast %Tuple* %36 to %Qubit**
  store %Qubit* %35, %Qubit** %37, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %29, %Tuple* %36, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %36, i32 -1)
  %38 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %38, %31
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i.i.i, %exit_quantum_grouping
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %39 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %40 = bitcast %Tuple* %39 to { %Array*, %Qubit* }*
  %41 = bitcast %Tuple* %39 to %Array**
  %42 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %40, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 1)
  store %Array* %28, %Array** %41, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %27, %Tuple* %39, %Tuple* null)
  %43 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %43, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %43, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %45 = add i64 %44, -1
  %46 = icmp sgt i64 %45, -1
  br label %load22

load22:                                           ; preds = %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i
  br label %quantum19

quantum19:                                        ; preds = %load22
  tail call void @__quantum__qis__h__body(%Qubit* null)
  store %Qubit* null, %Qubit** %42, align 8
  br label %readout21

readout21:                                        ; preds = %quantum19
  br label %post-classical18

post-classical18:                                 ; preds = %readout21
  br label %exit_quantum_grouping20

exit_quantum_grouping20:                          ; preds = %post-classical18
  br i1 %46, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i

body__1.i1.i.i:                                   ; preds = %exit_quantum_grouping20, %body__1.i1.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i1.i.i ], [ %45, %exit_quantum_grouping20 ]
  %47 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %43, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %47, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %47)
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %28, i64 %__qsVar0__idxQubit__2.i.i.i)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = load %Qubit*, %Qubit** %49, align 8
  %51 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %52 = bitcast %Tuple* %51 to %Qubit**
  store %Qubit* %50, %Qubit** %52, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %47, %Tuple* %51, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %47, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %47, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %51, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %53 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %53, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i1.i.i, %exit_quantum_grouping20
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %54 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %54, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %54, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  %55 = tail call %Result* @__quantum__rt__result_get_zero()
  %56 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %57 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %56)
  %58 = add i64 %56, -1
  %.not2.i.i.i = icmp slt i64 %58, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

body__1.i3.i.i:                                   ; preds = %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i, %body__1.i3.i.i
  %59 = phi i64 [ %62, %body__1.i3.i.i ], [ 0, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i ]
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %57, i64 %59)
  %61 = bitcast i8* %60 to %Result**
  store %Result* %55, %Result** %61, align 8
  %62 = add i64 %59, 1
  %.not.i2.i.i = icmp sgt i64 %62, %58
  br i1 %.not.i2.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i3.i.i, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %57, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  %63 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %64 = add i64 %63, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  %.not13.i.i.i = icmp slt i64 %64, 0
  br i1 %.not13.i.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %65 = phi %Array* [ %66, %body__2.i.i.i ], [ %57, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %77, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %65, i32 -1)
  %66 = tail call %Array* @__quantum__rt__array_copy(%Array* %65, i1 false)
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %28, i64 %idxElement4.i.i.i)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = load %Qubit*, %Qubit** %68, align 8
  %70 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %71 = bitcast %Tuple* %70 to %Qubit**
  store %Qubit* %69, %Qubit** %71, align 8
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %54, %Tuple* %70, %Tuple* %72)
  %73 = bitcast %Tuple* %72 to %Result**
  %74 = load %Result*, %Result** %73, align 8
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 %idxElement4.i.i.i)
  %76 = bitcast i8* %75 to %Result**
  store %Result* %74, %Result** %76, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %66, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %65, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %70, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  %77 = add i64 %idxElement4.i.i.i, 1
  %.not1.i4.i.i = icmp sgt i64 %77, %64
  br i1 %.not1.i4.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %57, %exit__1.i.i.i ], [ %66, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %27, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %27, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %39, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %28)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %27, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %27, i32 -1)
  %78 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %79 = tail call i8* @__quantum__rt__memory_allocate(i64 %78)
  %80 = ptrtoint i8* %79 to i64
  %81 = add i64 %78, -1
  %.not4 = icmp slt i64 %81, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, %exit_quantum_grouping25
  %82 = phi i64 [ %87, %exit_quantum_grouping25 ], [ 0, %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit ]
  %83 = add i64 %82, %80
  %84 = inttoptr i64 %83 to i8*
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %82)
  %86 = bitcast i8* %85 to %Result**
  %87 = add i64 %82, 1
  %88 = icmp sgt i64 %87, %81
  br label %load27

load27:                                           ; preds = %body__1
  %89 = load %Result*, %Result** %86, align 8
  br label %quantum24

quantum24:                                        ; preds = %load27
  br label %readout26

readout26:                                        ; preds = %quantum24
  %90 = tail call i1 @__quantum__qis__read_result__body(%Result* %89)
  br label %post-classical23

post-classical23:                                 ; preds = %readout26
  %91 = sext i1 %90 to i8
  store i8 %91, i8* %84, align 1
  br label %exit_quantum_grouping25

exit_quantum_grouping25:                          ; preds = %post-classical23
  br i1 %88, label %exit__1, label %body__1

exit__1:                                          ; preds = %exit_quantum_grouping25, %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit
  %92 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %93 = bitcast i8* %92 to i64*
  store i64 %78, i64* %93, align 4
  %94 = getelementptr i8, i8* %92, i64 8
  %95 = bitcast i8* %94 to i8**
  store i8* %79, i8** %95, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %96 = phi i64 [ %98, %body__2 ], [ 0, %exit__1 ]
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %96)
  %98 = add i64 %96, 1
  %.not3 = icmp sgt i64 %98, %81
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %99 = bitcast i8* %92 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i.i, i32 -1)
  ret { i64, i8* }* %99
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
  tail call void @__quantum__qis__mz__body(%Qubit* %2, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* null, %Result** %1, align 8
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

define internal void @MemoryManagement__1__RefCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array* }*
  %1 = bitcast %Tuple* %capture-tuple to %Callable**
  %2 = load %Callable*, %Callable** %1, align 8
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %2, i32 %count-change)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %2, i32 %count-change)
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i64 0, i32 1
  %4 = load %Array*, %Array** %3, align 8
  tail call void @__quantum__rt__array_update_reference_count(%Array* %4, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

define internal void @MemoryManagement__1__AliasCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array* }*
  %1 = bitcast %Tuple* %capture-tuple to %Callable**
  %2 = load %Callable*, %Callable** %1, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %2, i32 %count-change)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %2, i32 %count-change)
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i64 0, i32 1
  %4 = load %Array*, %Array** %3, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

declare void @__quantum__rt__tuple_update_alias_count(%Tuple*, i32) local_unnamed_addr

define internal void @Lifted__PartialApplication__1__body__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Array* }*
  %1 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i64 0, i32 1
  %2 = load %Array*, %Array** %1, align 8
  %3 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %4 = bitcast %Tuple* %arg-tuple to %Array**
  %5 = load %Array*, %Array** %4, align 8
  %6 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3, i64 0, i32 1
  %7 = load %Qubit*, %Qubit** %6, align 8
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %9 = bitcast %Tuple* %8 to { %Array*, %Array*, %Qubit* }*
  %10 = bitcast %Tuple* %8 to %Array**
  %11 = getelementptr inbounds { %Array*, %Array*, %Qubit* }, { %Array*, %Array*, %Qubit* }* %9, i64 0, i32 1
  %12 = getelementptr inbounds { %Array*, %Array*, %Qubit* }, { %Array*, %Array*, %Qubit* }* %9, i64 0, i32 2
  store %Array* %2, %Array** %10, align 8
  store %Array* %5, %Array** %11, align 8
  store %Qubit* %7, %Qubit** %12, align 8
  %13 = bitcast %Tuple* %capture-tuple to %Callable**
  %14 = load %Callable*, %Callable** %13, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %14, %Tuple* %8, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  ret void
}

define internal void @Tets__Samples__BernVaz__ParityOperationImpl__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Array*, %Qubit* }, { %Array*, %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = getelementptr inbounds { %Array*, %Array*, %Qubit* }, { %Array*, %Array*, %Qubit* }* %0, i64 0, i32 2
  %4 = load %Array*, %Array** %1, align 8
  %5 = load %Array*, %Array** %2, align 8
  %6 = load %Qubit*, %Qubit** %3, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 1)
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %5)
  %8 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %.not.i = icmp eq i64 %7, %8
  br i1 %.not.i, label %continue__1.i, label %then0__1.i

then0__1.i:                                       ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  unreachable

continue__1.i:                                    ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 1)
  %9 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %10 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %5)
  %11 = icmp slt i64 %9, %10
  %..i.i.i = select i1 %11, i64 %9, i64 %10
  %12 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %13 = bitcast %Tuple* %12 to { i1, %Qubit* }*
  %14 = bitcast %Tuple* %12 to i1*
  %15 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %13, i64 0, i32 1
  store i1 false, i1* %14, align 1
  store %Qubit* null, %Qubit** %15, align 8
  %16 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %..i.i.i)
  %17 = add i64 %..i.i.i, -1
  %.not7.i.i.i = icmp slt i64 %17, 0
  br i1 %.not7.i.i.i, label %exit__2.thread.i.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %continue__1.i, %body__1.i.i.i
  %18 = phi i64 [ %21, %body__1.i.i.i ], [ 0, %continue__1.i ]
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %16, i64 %18)
  %20 = bitcast i8* %19 to %Tuple**
  store %Tuple* %12, %Tuple** %20, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 1)
  %21 = add i64 %18, 1
  %.not.i.i.i = icmp sgt i64 %21, %17
  br i1 %.not.i.i.i, label %body__2.i.i.i, label %body__1.i.i.i

body__2.i.i.i:                                    ; preds = %body__1.i.i.i, %body__2.i.i.i
  %22 = phi i64 [ %26, %body__2.i.i.i ], [ 0, %body__1.i.i.i ]
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %16, i64 %22)
  %24 = bitcast i8* %23 to %Tuple**
  %25 = load %Tuple*, %Tuple** %24, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %25, i32 1)
  %26 = add i64 %22, 1
  %.not4.i.i.i = icmp sgt i64 %26, %17
  br i1 %.not4.i.i.i, label %body__3.i.preheader.i.i, label %body__2.i.i.i

exit__2.thread.i.i.i:                             ; preds = %continue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %16, i32 1)
  br label %exit__3.i.i.i

body__3.i.preheader.i.i:                          ; preds = %body__2.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %16, i32 1)
  br label %body__3.i.i.i

body__3.i.i.i:                                    ; preds = %body__3.i.i.i, %body__3.i.preheader.i.i
  %27 = phi %Array* [ %28, %body__3.i.i.i ], [ %16, %body__3.i.preheader.i.i ]
  %idxElement10.i.i.i = phi i64 [ %42, %body__3.i.i.i ], [ 0, %body__3.i.preheader.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %28 = tail call %Array* @__quantum__rt__array_copy(%Array* %27, i1 false)
  %29 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %30 = bitcast %Tuple* %29 to { i1, %Qubit* }*
  %31 = bitcast %Tuple* %29 to i1*
  %32 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %30, i64 0, i32 1
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 %idxElement10.i.i.i)
  %34 = bitcast i8* %33 to i1*
  %35 = load i1, i1* %34, align 1
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 %idxElement10.i.i.i)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = load %Qubit*, %Qubit** %37, align 8
  store i1 %35, i1* %31, align 1
  store %Qubit* %38, %Qubit** %32, align 8
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %28, i64 %idxElement10.i.i.i)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %29, i32 1)
  %40 = bitcast i8* %39 to %Tuple**
  %41 = load %Tuple*, %Tuple** %40, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %41, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %41, i32 -1)
  store %Tuple* %29, %Tuple** %40, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %28, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 -1)
  %42 = add i64 %idxElement10.i.i.i, 1
  %.not5.i.i.i = icmp sgt i64 %42, %17
  br i1 %.not5.i.i.i, label %exit__3.i.i.i, label %body__3.i.i.i

exit__3.i.i.i:                                    ; preds = %body__3.i.i.i, %exit__2.thread.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %16, %exit__2.thread.i.i.i ], [ %28, %body__3.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  %43 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %44 = add i64 %43, -1
  %.not611.i.i.i = icmp slt i64 %44, 0
  br i1 %.not611.i.i.i, label %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i, label %body__4.i.i.i

body__4.i.i.i:                                    ; preds = %exit__3.i.i.i, %body__4.i.i.i
  %45 = phi i64 [ %49, %body__4.i.i.i ], [ 0, %exit__3.i.i.i ]
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %45)
  %47 = bitcast i8* %46 to %Tuple**
  %48 = load %Tuple*, %Tuple** %47, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %48, i32 -1)
  %49 = add i64 %45, 1
  %.not6.i.i.i = icmp sgt i64 %49, %44
  br i1 %.not6.i.i.i, label %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i, label %body__4.i.i.i

Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i: ; preds = %body__4.i.i.i, %exit__3.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  %50 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %51 = add i64 %50, -1
  %.not35.i = icmp slt i64 %51, 0
  br i1 %.not35.i, label %exit__2.critedge.i, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i, %exiting__1.i
  %52 = phi i64 [ %227, %exiting__1.i ], [ 0, %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i ]
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %52)
  %54 = bitcast i8* %53 to { i1, %Qubit* }**
  %55 = load { i1, %Qubit* }*, { i1, %Qubit* }** %54, align 8
  %56 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %55, i64 0, i32 0
  %patternBit.i = load i1, i1* %56, align 1
  br i1 %patternBit.i, label %then0__2.i, label %exiting__1.i

then0__2.i:                                       ; preds = %body__1.i
  %57 = getelementptr inbounds { i1, %Qubit* }, { i1, %Qubit* }* %55, i64 0, i32 1
  %controlQubit.i = load %Qubit*, %Qubit** %57, align 8
  %58 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %59 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %58, i64 0)
  %60 = bitcast i8* %59 to %Qubit**
  store %Qubit* %controlQubit.i, %Qubit** %60, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %58, i32 1)
  %61 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %58)
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %then0__1.i5, label %test1__1.i

then0__1.i5:                                      ; preds = %then0__2.i
  br label %load

load:                                             ; preds = %then0__1.i5
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %6)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %then0__2.i
  %63 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %58)
  %64 = icmp eq i64 %63, 1
  br i1 %64, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %58, i64 0)
  %66 = bitcast i8* %65 to %Qubit**
  br label %load13

load13:                                           ; preds = %then1__1.i
  %67 = load %Qubit*, %Qubit** %66, align 8
  br label %quantum10

quantum10:                                        ; preds = %load13
  tail call void @__quantum__qis__cnot__body(%Qubit* %67, %Qubit* %6)
  br label %readout12

readout12:                                        ; preds = %quantum10
  br label %post-classical9

post-classical9:                                  ; preds = %readout12
  br label %exit_quantum_grouping11

exit_quantum_grouping11:                          ; preds = %post-classical9
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %68 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %58)
  %69 = icmp eq i64 %68, 2
  br i1 %69, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %70 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %58, i64 0)
  %71 = bitcast i8* %70 to %Qubit**
  %72 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %58, i64 1)
  %73 = bitcast i8* %72 to %Qubit**
  %74 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %76 = bitcast i8* %75 to %Qubit**
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %78 = bitcast i8* %77 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %74, i32 1)
  %79 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %74)
  %80 = icmp eq i64 %79, 0
  br label %load18

load18:                                           ; preds = %then2__1.i
  %81 = load %Qubit*, %Qubit** %71, align 8
  %82 = load %Qubit*, %Qubit** %73, align 8
  br label %quantum15

quantum15:                                        ; preds = %load18
  tail call void @__quantum__qis__h__body(%Qubit* %6)
  store %Qubit* %81, %Qubit** %76, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  br label %readout17

readout17:                                        ; preds = %quantum15
  br label %post-classical14

post-classical14:                                 ; preds = %readout17
  br label %exit_quantum_grouping16

exit_quantum_grouping16:                          ; preds = %post-classical14
  br i1 %80, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping16
  br label %load23

load23:                                           ; preds = %then0__1.i.i
  br label %quantum20

quantum20:                                        ; preds = %load23
  tail call void @__quantum__qis__z__body(%Qubit* %6)
  br label %readout22

readout22:                                        ; preds = %quantum20
  br label %post-classical19

post-classical19:                                 ; preds = %readout22
  br label %exit_quantum_grouping21

exit_quantum_grouping21:                          ; preds = %post-classical19
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping16
  %83 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %74)
  %84 = icmp eq i64 %83, 1
  br i1 %84, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %86 = bitcast i8* %85 to %Qubit**
  br label %load28

load28:                                           ; preds = %then1__1.i.i
  %87 = load %Qubit*, %Qubit** %86, align 8
  br label %quantum25

quantum25:                                        ; preds = %load28
  tail call void @__quantum__qis__cz__body(%Qubit* %87, %Qubit* %6)
  br label %readout27

readout27:                                        ; preds = %quantum25
  br label %post-classical24

post-classical24:                                 ; preds = %readout27
  br label %exit_quantum_grouping26

exit_quantum_grouping26:                          ; preds = %post-classical24
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %88 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %74)
  %89 = icmp eq i64 %88, 2
  br i1 %89, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %93 = bitcast i8* %92 to %Qubit**
  %94 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %95 = bitcast i8* %94 to %Qubit**
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %103 = bitcast i8* %102 to %Qubit**
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %105 = bitcast i8* %104 to %Qubit**
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %107 = bitcast i8* %106 to %Qubit**
  %108 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %109 = bitcast i8* %108 to %Qubit**
  %110 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %111 = bitcast i8* %110 to %Qubit**
  %112 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 1)
  %113 = bitcast i8* %112 to %Qubit**
  %114 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %115 = bitcast i8* %114 to %Qubit**
  br label %load33

load33:                                           ; preds = %then2__1.i.i
  %116 = load %Qubit*, %Qubit** %91, align 8
  %117 = load %Qubit*, %Qubit** %93, align 8
  %118 = load %Qubit*, %Qubit** %95, align 8
  %119 = load %Qubit*, %Qubit** %97, align 8
  %120 = load %Qubit*, %Qubit** %99, align 8
  %121 = load %Qubit*, %Qubit** %101, align 8
  %122 = load %Qubit*, %Qubit** %103, align 8
  %123 = load %Qubit*, %Qubit** %105, align 8
  %124 = load %Qubit*, %Qubit** %107, align 8
  %125 = load %Qubit*, %Qubit** %109, align 8
  %126 = load %Qubit*, %Qubit** %111, align 8
  %127 = load %Qubit*, %Qubit** %113, align 8
  %128 = load %Qubit*, %Qubit** %115, align 8
  br label %quantum30

quantum30:                                        ; preds = %load33
  tail call void @__quantum__qis__t__adj(%Qubit* %116)
  tail call void @__quantum__qis__t__adj(%Qubit* %117)
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %118)
  tail call void @__quantum__qis__t__body(%Qubit* %119)
  tail call void @__quantum__qis__cnot__body(%Qubit* %120, %Qubit* %6)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %122)
  tail call void @__quantum__qis__t__body(%Qubit* %6)
  tail call void @__quantum__qis__t__adj(%Qubit* %123)
  tail call void @__quantum__qis__cnot__body(%Qubit* %124, %Qubit* %6)
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %125)
  tail call void @__quantum__qis__t__adj(%Qubit* %6)
  tail call void @__quantum__qis__t__body(%Qubit* %126)
  tail call void @__quantum__qis__cnot__body(%Qubit* %127, %Qubit* %128)
  br label %readout32

readout32:                                        ; preds = %quantum30
  br label %post-classical29

post-classical29:                                 ; preds = %readout32
  br label %exit_quantum_grouping31

exit_quantum_grouping31:                          ; preds = %post-classical29
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %129 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %129)
  %130 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %131 = bitcast %Tuple* %130 to { %Array*, %Qubit* }*
  %132 = bitcast %Tuple* %130 to %Array**
  %133 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %131, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 1)
  store %Array* %74, %Array** %132, align 8
  store %Qubit* %6, %Qubit** %133, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %129, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %129, i32 1)
  %134 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %131, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %134, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %135 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %131, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %135, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i6, label %exit__1.i.i.i

body__1.i.i.i6:                                   ; preds = %exit_quantum_grouping36, %else__1.i.i
  %136 = phi i64 [ %145, %exit_quantum_grouping36 ], [ 0, %else__1.i.i ]
  %137 = shl nuw i64 %136, 1
  %138 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %137)
  %139 = bitcast i8* %138 to %Qubit**
  %140 = or i64 %137, 1
  %141 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %140)
  %142 = bitcast i8* %141 to %Qubit**
  %143 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %136)
  %144 = bitcast i8* %143 to %Qubit**
  %145 = add nuw nsw i64 %136, 1
  %146 = icmp slt i64 %145, %numControlPairs.i.i.i
  br label %load38

load38:                                           ; preds = %body__1.i.i.i6
  %147 = load %Qubit*, %Qubit** %139, align 8
  %148 = load %Qubit*, %Qubit** %142, align 8
  %149 = load %Qubit*, %Qubit** %144, align 8
  br label %quantum35

quantum35:                                        ; preds = %load38
  tail call void @__quantum__qis__h__body(%Qubit* %149)
  tail call void @__quantum__qis__cnot__body(%Qubit* %149, %Qubit* %147)
  tail call void @__quantum__qis__cnot__body(%Qubit* %147, %Qubit* %148)
  tail call void @__quantum__qis__t__body(%Qubit* %148)
  tail call void @__quantum__qis__t__adj(%Qubit* %147)
  tail call void @__quantum__qis__t__body(%Qubit* %149)
  tail call void @__quantum__qis__cnot__body(%Qubit* %149, %Qubit* %147)
  tail call void @__quantum__qis__cnot__body(%Qubit* %147, %Qubit* %148)
  tail call void @__quantum__qis__t__adj(%Qubit* %148)
  tail call void @__quantum__qis__cnot__body(%Qubit* %149, %Qubit* %148)
  tail call void @__quantum__qis__h__body(%Qubit* %149)
  br label %readout37

readout37:                                        ; preds = %quantum35
  br label %post-classical34

post-classical34:                                 ; preds = %readout37
  br label %exit_quantum_grouping36

exit_quantum_grouping36:                          ; preds = %post-classical34
  br i1 %146, label %body__1.i.i.i6, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping36, %else__1.i.i
  %150 = and i64 %numControls.i.i.i, 1
  %151 = icmp eq i64 %150, 0
  br i1 %151, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %152 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %153 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %152, i64 0)
  %154 = bitcast i8* %153 to %Qubit**
  %155 = add i64 %numControls.i.i.i, -1
  %156 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %155)
  %157 = bitcast i8* %156 to %Qubit**
  %158 = load %Qubit*, %Qubit** %157, align 8
  store %Qubit* %158, %Qubit** %154, align 8
  %159 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %152)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %159, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %159, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %159, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %160 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %161 = bitcast %Tuple* %160 to { %Array*, %Qubit* }*
  %162 = bitcast %Tuple* %160 to %Array**
  %163 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %161, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %162, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %163, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %129, %Tuple* %160, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i7

body__2.i.i.i7:                                   ; preds = %exit_quantum_grouping41, %body__2.preheader.i.i.i
  %164 = phi i64 [ %173, %exit_quantum_grouping41 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %165 = shl nuw i64 %164, 1
  %166 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %165)
  %167 = bitcast i8* %166 to %Qubit**
  %168 = or i64 %165, 1
  %169 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %168)
  %170 = bitcast i8* %169 to %Qubit**
  %171 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %164)
  %172 = bitcast i8* %171 to %Qubit**
  %173 = add i64 %164, -1
  %174 = icmp sgt i64 %173, -1
  br label %load43

load43:                                           ; preds = %body__2.i.i.i7
  %175 = load %Qubit*, %Qubit** %167, align 8
  %176 = load %Qubit*, %Qubit** %170, align 8
  %177 = load %Qubit*, %Qubit** %172, align 8
  br label %quantum40

quantum40:                                        ; preds = %load43
  tail call void @__quantum__qis__h__body(%Qubit* %177)
  tail call void @__quantum__qis__cnot__body(%Qubit* %177, %Qubit* %176)
  tail call void @__quantum__qis__t__body(%Qubit* %176)
  tail call void @__quantum__qis__cnot__body(%Qubit* %175, %Qubit* %176)
  tail call void @__quantum__qis__cnot__body(%Qubit* %177, %Qubit* %175)
  tail call void @__quantum__qis__t__adj(%Qubit* %177)
  tail call void @__quantum__qis__t__body(%Qubit* %175)
  tail call void @__quantum__qis__t__adj(%Qubit* %176)
  tail call void @__quantum__qis__cnot__body(%Qubit* %175, %Qubit* %176)
  tail call void @__quantum__qis__cnot__body(%Qubit* %177, %Qubit* %175)
  tail call void @__quantum__qis__h__body(%Qubit* %177)
  br label %readout42

readout42:                                        ; preds = %quantum40
  br label %post-classical39

post-classical39:                                 ; preds = %readout42
  br label %exit_quantum_grouping41

exit_quantum_grouping41:                          ; preds = %post-classical39
  br i1 %174, label %body__2.i.i.i7, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping41, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %160, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %130, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping31, %exit_quantum_grouping26, %exit_quantum_grouping21
  tail call void @__quantum__rt__array_update_alias_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  br label %load48

load48:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum45

quantum45:                                        ; preds = %load48
  tail call void @__quantum__qis__h__body(%Qubit* %6)
  br label %readout47

readout47:                                        ; preds = %quantum45
  br label %post-classical44

post-classical44:                                 ; preds = %readout47
  br label %exit_quantum_grouping46

exit_quantum_grouping46:                          ; preds = %post-classical44
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %178 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %178)
  %179 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %180 = bitcast %Tuple* %179 to { %Array*, %Qubit* }*
  %181 = bitcast %Tuple* %179 to %Array**
  %182 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %180, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 1)
  store %Array* %58, %Array** %181, align 8
  store %Qubit* %6, %Qubit** %182, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %178, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %178, i32 1)
  %183 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %180, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %183, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %184 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %180, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %184, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping51, %else__1.i
  %185 = phi i64 [ %194, %exit_quantum_grouping51 ], [ 0, %else__1.i ]
  %186 = shl nuw i64 %185, 1
  %187 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %186)
  %188 = bitcast i8* %187 to %Qubit**
  %189 = or i64 %186, 1
  %190 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %189)
  %191 = bitcast i8* %190 to %Qubit**
  %192 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %185)
  %193 = bitcast i8* %192 to %Qubit**
  %194 = add nuw nsw i64 %185, 1
  %195 = icmp slt i64 %194, %numControlPairs.i.i
  br label %load53

load53:                                           ; preds = %body__1.i.i
  %196 = load %Qubit*, %Qubit** %188, align 8
  %197 = load %Qubit*, %Qubit** %191, align 8
  %198 = load %Qubit*, %Qubit** %193, align 8
  br label %quantum50

quantum50:                                        ; preds = %load53
  tail call void @__quantum__qis__h__body(%Qubit* %198)
  tail call void @__quantum__qis__cnot__body(%Qubit* %198, %Qubit* %196)
  tail call void @__quantum__qis__cnot__body(%Qubit* %196, %Qubit* %197)
  tail call void @__quantum__qis__t__body(%Qubit* %197)
  tail call void @__quantum__qis__t__adj(%Qubit* %196)
  tail call void @__quantum__qis__t__body(%Qubit* %198)
  tail call void @__quantum__qis__cnot__body(%Qubit* %198, %Qubit* %196)
  tail call void @__quantum__qis__cnot__body(%Qubit* %196, %Qubit* %197)
  tail call void @__quantum__qis__t__adj(%Qubit* %197)
  tail call void @__quantum__qis__cnot__body(%Qubit* %198, %Qubit* %197)
  tail call void @__quantum__qis__h__body(%Qubit* %198)
  br label %readout52

readout52:                                        ; preds = %quantum50
  br label %post-classical49

post-classical49:                                 ; preds = %readout52
  br label %exit_quantum_grouping51

exit_quantum_grouping51:                          ; preds = %post-classical49
  br i1 %195, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping51, %else__1.i
  %199 = and i64 %numControls.i.i, 1
  %200 = icmp eq i64 %199, 0
  br i1 %200, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %201 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %202 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %201, i64 0)
  %203 = bitcast i8* %202 to %Qubit**
  %204 = add i64 %numControls.i.i, -1
  %205 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %204)
  %206 = bitcast i8* %205 to %Qubit**
  %207 = load %Qubit*, %Qubit** %206, align 8
  store %Qubit* %207, %Qubit** %203, align 8
  %208 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %201)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %208, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %201, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %208, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %208, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %209 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %210 = bitcast %Tuple* %209 to { %Array*, %Qubit* }*
  %211 = bitcast %Tuple* %209 to %Array**
  %212 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %210, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %211, align 8
  store %Qubit* %arg.i.i, %Qubit** %212, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %178, %Tuple* %209, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping56, %body__2.preheader.i.i
  %213 = phi i64 [ %222, %exit_quantum_grouping56 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %214 = shl nuw i64 %213, 1
  %215 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %214)
  %216 = bitcast i8* %215 to %Qubit**
  %217 = or i64 %214, 1
  %218 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %217)
  %219 = bitcast i8* %218 to %Qubit**
  %220 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %213)
  %221 = bitcast i8* %220 to %Qubit**
  %222 = add i64 %213, -1
  %223 = icmp sgt i64 %222, -1
  br label %load58

load58:                                           ; preds = %body__2.i.i
  %224 = load %Qubit*, %Qubit** %216, align 8
  %225 = load %Qubit*, %Qubit** %219, align 8
  %226 = load %Qubit*, %Qubit** %221, align 8
  br label %quantum55

quantum55:                                        ; preds = %load58
  tail call void @__quantum__qis__h__body(%Qubit* %226)
  tail call void @__quantum__qis__cnot__body(%Qubit* %226, %Qubit* %225)
  tail call void @__quantum__qis__t__body(%Qubit* %225)
  tail call void @__quantum__qis__cnot__body(%Qubit* %224, %Qubit* %225)
  tail call void @__quantum__qis__cnot__body(%Qubit* %226, %Qubit* %224)
  tail call void @__quantum__qis__t__adj(%Qubit* %226)
  tail call void @__quantum__qis__t__body(%Qubit* %224)
  tail call void @__quantum__qis__t__adj(%Qubit* %225)
  tail call void @__quantum__qis__cnot__body(%Qubit* %224, %Qubit* %225)
  tail call void @__quantum__qis__cnot__body(%Qubit* %226, %Qubit* %224)
  tail call void @__quantum__qis__h__body(%Qubit* %226)
  br label %readout57

readout57:                                        ; preds = %quantum55
  br label %post-classical54

post-classical54:                                 ; preds = %readout57
  br label %exit_quantum_grouping56

exit_quantum_grouping56:                          ; preds = %post-classical54
  br i1 %223, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping56, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %209, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %178, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %178, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %178, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %178, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %179, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping11, %exit_quantum_grouping46, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %58, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 -1)
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %Microsoft__Quantum__Intrinsic__X__ctl.exit, %body__1.i
  %227 = add i64 %52, 1
  %.not3.i = icmp sgt i64 %227, %51
  br i1 %.not3.i, label %body__2.i.preheader, label %body__1.i

body__2.i.preheader:                              ; preds = %exiting__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  br label %body__2.i

body__2.i:                                        ; preds = %body__2.i.preheader, %body__2.i
  %228 = phi i64 [ %232, %body__2.i ], [ 0, %body__2.i.preheader ]
  %229 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %228)
  %230 = bitcast i8* %229 to %Tuple**
  %231 = load %Tuple*, %Tuple** %230, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %231, i32 -1)
  %232 = add i64 %228, 1
  %.not4.i = icmp sgt i64 %232, %51
  br i1 %.not4.i, label %Tets__Samples__BernVaz__ParityOperationImpl__body.exit, label %body__2.i

exit__2.critedge.i:                               ; preds = %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  br label %Tets__Samples__BernVaz__ParityOperationImpl__body.exit

Tets__Samples__BernVaz__ParityOperationImpl__body.exit: ; preds = %body__2.i, %exit__2.critedge.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i.i, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
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
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

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
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %22 = bitcast i8* %21 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 1)
  %23 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %24 = icmp eq i64 %23, 0
  br label %load10

load10:                                           ; preds = %then2__1.i
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %24, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping8
  br label %load15

load15:                                           ; preds = %then0__1.i.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping8
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  br label %load20

load20:                                           ; preds = %then1__1.i.i
  %31 = load %Qubit*, %Qubit** %30, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %32 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %33 = icmp eq i64 %32, 2
  br i1 %33, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %59 = bitcast i8* %58 to %Qubit**
  br label %load25

load25:                                           ; preds = %then2__1.i.i
  %60 = load %Qubit*, %Qubit** %35, align 8
  %61 = load %Qubit*, %Qubit** %37, align 8
  %62 = load %Qubit*, %Qubit** %39, align 8
  %63 = load %Qubit*, %Qubit** %41, align 8
  %64 = load %Qubit*, %Qubit** %43, align 8
  %65 = load %Qubit*, %Qubit** %45, align 8
  %66 = load %Qubit*, %Qubit** %47, align 8
  %67 = load %Qubit*, %Qubit** %49, align 8
  %68 = load %Qubit*, %Qubit** %51, align 8
  %69 = load %Qubit*, %Qubit** %53, align 8
  %70 = load %Qubit*, %Qubit** %55, align 8
  %71 = load %Qubit*, %Qubit** %57, align 8
  %72 = load %Qubit*, %Qubit** %59, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %62)
  tail call void @__quantum__qis__t__body(%Qubit* %63)
  tail call void @__quantum__qis__cnot__body(%Qubit* %64, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %67)
  tail call void @__quantum__qis__cnot__body(%Qubit* %68, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %73 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %73)
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Array**
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 1)
  store %Array* %18, %Array** %76, align 8
  store %Qubit* %4, %Qubit** %77, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 1)
  %78 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %78, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %79 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %79, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %80 = phi i64 [ %89, %exit_quantum_grouping28 ], [ 0, %else__1.i.i ]
  %81 = shl nuw i64 %80, 1
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %81)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = or i64 %81, 1
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %84)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %80)
  %88 = bitcast i8* %87 to %Qubit**
  %89 = add nuw nsw i64 %80, 1
  %90 = icmp slt i64 %89, %numControlPairs.i.i.i
  br label %load30

load30:                                           ; preds = %body__1.i.i.i
  %91 = load %Qubit*, %Qubit** %83, align 8
  %92 = load %Qubit*, %Qubit** %86, align 8
  %93 = load %Qubit*, %Qubit** %88, align 8
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__body(%Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %91)
  tail call void @__quantum__qis__t__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %92)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %92)
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %90, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %94 = and i64 %numControls.i.i.i, 1
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %96 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %96, i64 0)
  %98 = bitcast i8* %97 to %Qubit**
  %99 = add i64 %numControls.i.i.i, -1
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %99)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = load %Qubit*, %Qubit** %101, align 8
  store %Qubit* %102, %Qubit** %98, align 8
  %103 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %96)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %96, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %103, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %104 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %105 = bitcast %Tuple* %104 to { %Array*, %Qubit* }*
  %106 = bitcast %Tuple* %104 to %Array**
  %107 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %105, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %106, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %107, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %104, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping33, %body__2.preheader.i.i.i
  %108 = phi i64 [ %117, %exit_quantum_grouping33 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %109 = shl nuw i64 %108, 1
  %110 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %109)
  %111 = bitcast i8* %110 to %Qubit**
  %112 = or i64 %109, 1
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %112)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %108)
  %116 = bitcast i8* %115 to %Qubit**
  %117 = add i64 %108, -1
  %118 = icmp sgt i64 %117, -1
  br label %load35

load35:                                           ; preds = %body__2.i.i.i
  %119 = load %Qubit*, %Qubit** %111, align 8
  %120 = load %Qubit*, %Qubit** %114, align 8
  %121 = load %Qubit*, %Qubit** %116, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %120)
  tail call void @__quantum__qis__t__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %121)
  tail call void @__quantum__qis__t__body(%Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %118, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping33, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %104, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping23, %exit_quantum_grouping18, %exit_quantum_grouping13
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  br label %load40

load40:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %122 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %122)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Array*, %Qubit* }*
  %125 = bitcast %Tuple* %123 to %Array**
  %126 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %125, align 8
  store %Qubit* %4, %Qubit** %126, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 1)
  %127 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %127, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %128 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %128, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %129 = phi i64 [ %138, %exit_quantum_grouping43 ], [ 0, %else__1.i ]
  %130 = shl nuw i64 %129, 1
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %130)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = or i64 %130, 1
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %133)
  %135 = bitcast i8* %134 to %Qubit**
  %136 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %129)
  %137 = bitcast i8* %136 to %Qubit**
  %138 = add nuw nsw i64 %129, 1
  %139 = icmp slt i64 %138, %numControlPairs.i.i
  br label %load45

load45:                                           ; preds = %body__1.i.i
  %140 = load %Qubit*, %Qubit** %132, align 8
  %141 = load %Qubit*, %Qubit** %135, align 8
  %142 = load %Qubit*, %Qubit** %137, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__body(%Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %140)
  tail call void @__quantum__qis__t__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %141)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %141)
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %139, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %143 = and i64 %numControls.i.i, 1
  %144 = icmp eq i64 %143, 0
  br i1 %144, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %145 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %146 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %145, i64 0)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = add i64 %numControls.i.i, -1
  %149 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %148)
  %150 = bitcast i8* %149 to %Qubit**
  %151 = load %Qubit*, %Qubit** %150, align 8
  store %Qubit* %151, %Qubit** %147, align 8
  %152 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %145)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %145, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %152, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %153 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %154 = bitcast %Tuple* %153 to { %Array*, %Qubit* }*
  %155 = bitcast %Tuple* %153 to %Array**
  %156 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %154, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %155, align 8
  store %Qubit* %arg.i.i, %Qubit** %156, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %122, %Tuple* %153, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping48, %body__2.preheader.i.i
  %157 = phi i64 [ %166, %exit_quantum_grouping48 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %158 = shl nuw i64 %157, 1
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %158)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = or i64 %158, 1
  %162 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %161)
  %163 = bitcast i8* %162 to %Qubit**
  %164 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %157)
  %165 = bitcast i8* %164 to %Qubit**
  %166 = add i64 %157, -1
  %167 = icmp sgt i64 %166, -1
  br label %load50

load50:                                           ; preds = %body__2.i.i
  %168 = load %Qubit*, %Qubit** %160, align 8
  %169 = load %Qubit*, %Qubit** %163, align 8
  %170 = load %Qubit*, %Qubit** %165, align 8
  br label %quantum47

quantum47:                                        ; preds = %load50
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %169)
  tail call void @__quantum__qis__t__body(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %170)
  tail call void @__quantum__qis__t__body(%Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  br label %readout49

readout49:                                        ; preds = %quantum47
  br label %post-classical46

post-classical46:                                 ; preds = %readout49
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical46
  br i1 %167, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping48, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %153, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping38, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
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
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

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
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %22 = bitcast i8* %21 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 1)
  %23 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %24 = icmp eq i64 %23, 0
  br label %load10

load10:                                           ; preds = %then2__1.i
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %24, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping8
  br label %load15

load15:                                           ; preds = %then0__1.i.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping8
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  br label %load20

load20:                                           ; preds = %then1__1.i.i
  %31 = load %Qubit*, %Qubit** %30, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %32 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %33 = icmp eq i64 %32, 2
  br i1 %33, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %59 = bitcast i8* %58 to %Qubit**
  br label %load25

load25:                                           ; preds = %then2__1.i.i
  %60 = load %Qubit*, %Qubit** %35, align 8
  %61 = load %Qubit*, %Qubit** %37, align 8
  %62 = load %Qubit*, %Qubit** %39, align 8
  %63 = load %Qubit*, %Qubit** %41, align 8
  %64 = load %Qubit*, %Qubit** %43, align 8
  %65 = load %Qubit*, %Qubit** %45, align 8
  %66 = load %Qubit*, %Qubit** %47, align 8
  %67 = load %Qubit*, %Qubit** %49, align 8
  %68 = load %Qubit*, %Qubit** %51, align 8
  %69 = load %Qubit*, %Qubit** %53, align 8
  %70 = load %Qubit*, %Qubit** %55, align 8
  %71 = load %Qubit*, %Qubit** %57, align 8
  %72 = load %Qubit*, %Qubit** %59, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %62)
  tail call void @__quantum__qis__t__body(%Qubit* %63)
  tail call void @__quantum__qis__cnot__body(%Qubit* %64, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %67)
  tail call void @__quantum__qis__cnot__body(%Qubit* %68, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %73 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %73)
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Array**
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 1)
  store %Array* %18, %Array** %76, align 8
  store %Qubit* %4, %Qubit** %77, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 1)
  %78 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %78, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %79 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %79, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %80 = phi i64 [ %89, %exit_quantum_grouping28 ], [ 0, %else__1.i.i ]
  %81 = shl nuw i64 %80, 1
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %81)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = or i64 %81, 1
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %84)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %80)
  %88 = bitcast i8* %87 to %Qubit**
  %89 = add nuw nsw i64 %80, 1
  %90 = icmp slt i64 %89, %numControlPairs.i.i.i
  br label %load30

load30:                                           ; preds = %body__1.i.i.i
  %91 = load %Qubit*, %Qubit** %83, align 8
  %92 = load %Qubit*, %Qubit** %86, align 8
  %93 = load %Qubit*, %Qubit** %88, align 8
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__body(%Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %91)
  tail call void @__quantum__qis__t__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %92)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %92)
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %90, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %94 = and i64 %numControls.i.i.i, 1
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %96 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %96, i64 0)
  %98 = bitcast i8* %97 to %Qubit**
  %99 = add i64 %numControls.i.i.i, -1
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %99)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = load %Qubit*, %Qubit** %101, align 8
  store %Qubit* %102, %Qubit** %98, align 8
  %103 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %96)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %96, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %103, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %104 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %105 = bitcast %Tuple* %104 to { %Array*, %Qubit* }*
  %106 = bitcast %Tuple* %104 to %Array**
  %107 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %105, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %106, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %107, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %104, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping33, %body__2.preheader.i.i.i
  %108 = phi i64 [ %117, %exit_quantum_grouping33 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %109 = shl nuw i64 %108, 1
  %110 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %109)
  %111 = bitcast i8* %110 to %Qubit**
  %112 = or i64 %109, 1
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %112)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %108)
  %116 = bitcast i8* %115 to %Qubit**
  %117 = add i64 %108, -1
  %118 = icmp sgt i64 %117, -1
  br label %load35

load35:                                           ; preds = %body__2.i.i.i
  %119 = load %Qubit*, %Qubit** %111, align 8
  %120 = load %Qubit*, %Qubit** %114, align 8
  %121 = load %Qubit*, %Qubit** %116, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %120)
  tail call void @__quantum__qis__t__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %121)
  tail call void @__quantum__qis__t__body(%Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %118, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping33, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %104, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping23, %exit_quantum_grouping18, %exit_quantum_grouping13
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  br label %load40

load40:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %122 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %122)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Array*, %Qubit* }*
  %125 = bitcast %Tuple* %123 to %Array**
  %126 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %125, align 8
  store %Qubit* %4, %Qubit** %126, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 1)
  %127 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %127, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %128 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %128, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %129 = phi i64 [ %138, %exit_quantum_grouping43 ], [ 0, %else__1.i ]
  %130 = shl nuw i64 %129, 1
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %130)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = or i64 %130, 1
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %133)
  %135 = bitcast i8* %134 to %Qubit**
  %136 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %129)
  %137 = bitcast i8* %136 to %Qubit**
  %138 = add nuw nsw i64 %129, 1
  %139 = icmp slt i64 %138, %numControlPairs.i.i
  br label %load45

load45:                                           ; preds = %body__1.i.i
  %140 = load %Qubit*, %Qubit** %132, align 8
  %141 = load %Qubit*, %Qubit** %135, align 8
  %142 = load %Qubit*, %Qubit** %137, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__body(%Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %140)
  tail call void @__quantum__qis__t__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %141)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %141)
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %139, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %143 = and i64 %numControls.i.i, 1
  %144 = icmp eq i64 %143, 0
  br i1 %144, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %145 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %146 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %145, i64 0)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = add i64 %numControls.i.i, -1
  %149 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %148)
  %150 = bitcast i8* %149 to %Qubit**
  %151 = load %Qubit*, %Qubit** %150, align 8
  store %Qubit* %151, %Qubit** %147, align 8
  %152 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %145)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %145, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %152, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %153 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %154 = bitcast %Tuple* %153 to { %Array*, %Qubit* }*
  %155 = bitcast %Tuple* %153 to %Array**
  %156 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %154, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %155, align 8
  store %Qubit* %arg.i.i, %Qubit** %156, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %122, %Tuple* %153, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping48, %body__2.preheader.i.i
  %157 = phi i64 [ %166, %exit_quantum_grouping48 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %158 = shl nuw i64 %157, 1
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %158)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = or i64 %158, 1
  %162 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %161)
  %163 = bitcast i8* %162 to %Qubit**
  %164 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %157)
  %165 = bitcast i8* %164 to %Qubit**
  %166 = add i64 %157, -1
  %167 = icmp sgt i64 %166, -1
  br label %load50

load50:                                           ; preds = %body__2.i.i
  %168 = load %Qubit*, %Qubit** %160, align 8
  %169 = load %Qubit*, %Qubit** %163, align 8
  %170 = load %Qubit*, %Qubit** %165, align 8
  br label %quantum47

quantum47:                                        ; preds = %load50
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %169)
  tail call void @__quantum__qis__t__body(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %170)
  tail call void @__quantum__qis__t__body(%Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  br label %readout49

readout49:                                        ; preds = %quantum47
  br label %post-classical46

post-classical46:                                 ; preds = %readout49
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical46
  br i1 %167, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping48, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %153, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping38, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare double @llvm.powi.f64(double, i32)

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

attributes #0 = { "InteropFriendly" }
attributes #1 = { nounwind willreturn }

