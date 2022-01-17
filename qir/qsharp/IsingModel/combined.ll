; ModuleID = 'qat-link'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Result = type opaque

@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Intrinsic__CNOT__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__ctladj__wrapper]
@PartialApplication__1__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__1__ctladj__wrapper]
@MemoryManagement__1__FunctionTable = internal constant [2 x void (%Tuple*, i32)*] [void (%Tuple*, i32)* @MemoryManagement__1__RefCount, void (%Tuple*, i32)* @MemoryManagement__1__AliasCount]
@Microsoft__Quantum__Intrinsic__Rz__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__ctladj__wrapper]
@PartialApplication__2__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__2__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__2__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__2__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Lifted__PartialApplication__2__ctladj__wrapper]
@MemoryManagement__2__FunctionTable = internal constant [2 x void (%Tuple*, i32)*] [void (%Tuple*, i32)* @MemoryManagement__2__RefCount, void (%Tuple*, i32)* @MemoryManagement__2__AliasCount]
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]

define { i64, i8* }* @Microsoft__Quantum__Samples__SimulateIsingEvolution__Interop(i64 %nSites, double %time, double %dt) local_unnamed_addr #0 {
entry:
  %qs.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nSites)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 1)
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qs.i)
  %2 = add i64 %1, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 -1)
  %.not1.i.i = icmp slt i64 %2, 0
  br i1 %.not1.i.i, label %Microsoft__Quantum__Canon___87be4c75af094246aa2d7da158f79355_ApplyToEach__body.exit.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %idxQubit2.i.i = phi i64 [ %8, %body__1.i.i ], [ 0, %entry ]
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %idxQubit2.i.i)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  %6 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %7 = bitcast %Tuple* %6 to %Qubit**
  store %Qubit* %5, %Qubit** %7, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %0, %Tuple* %6, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  %8 = add i64 %idxQubit2.i.i, 1
  %.not.i.i = icmp sgt i64 %8, %2
  br i1 %.not.i.i, label %Microsoft__Quantum__Canon___87be4c75af094246aa2d7da158f79355_ApplyToEach__body.exit.i, label %body__1.i.i

Microsoft__Quantum__Canon___87be4c75af094246aa2d7da158f79355_ApplyToEach__body.exit.i: ; preds = %body__1.i.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 -1)
  %9 = fdiv double %time, %dt
  %truncated.i.i.i = fptosi double %9 to i64
  %10 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %11 = bitcast %Tuple* %10 to { i64, double, i1 }*
  %12 = bitcast %Tuple* %10 to i64*
  %13 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %11, i64 0, i32 1
  %14 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %11, i64 0, i32 2
  %15 = sitofp i64 %truncated.i.i.i to double
  %16 = fsub double %15, %9
  %17 = fcmp oge double %9, 0.000000e+00
  store i64 %truncated.i.i.i, i64* %12, align 4
  store double %16, double* %13, align 8
  store i1 %17, i1* %14, align 1
  %truncated.i.i = load i64, i64* %12, align 4
  %remainder.i.i = load double, double* %13, align 8
  %18 = fcmp olt double %remainder.i.i, 0.000000e+00
  %19 = fneg double %remainder.i.i
  %20 = select i1 %18, double %19, double %remainder.i.i
  %21 = fcmp ugt double %20, 1.000000e-15
  %not.isPositive.i.i = xor i1 %17, true
  %narrow.i = and i1 %21, %not.isPositive.i.i
  %22 = sext i1 %narrow.i to i64
  %nSteps2.i = add i64 %truncated.i.i, %22
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %10, i32 -1)
  %.not9.i = icmp slt i64 %nSteps2.i, 1
  br i1 %.not9.i, label %exit__1.i, label %body__1.lr.ph.i

body__1.lr.ph.i:                                  ; preds = %Microsoft__Quantum__Canon___87be4c75af094246aa2d7da158f79355_ApplyToEach__body.exit.i
  %23 = sitofp i64 %nSteps2.i to double
  %24 = add i64 %nSites, -1
  %.not16.i = icmp slt i64 %24, 0
  %25 = add i64 %nSites, -2
  br label %body__1.i

body__1.i:                                        ; preds = %exit__2.i, %body__1.lr.ph.i
  %idxIter10.i = phi i64 [ 1, %body__1.lr.ph.i ], [ %93, %exit__2.i ]
  %26 = sitofp i64 %idxIter10.i to double
  %sweepParameter.i = fdiv double %26, %23
  br i1 %.not16.i, label %exit__2.i, label %body__2.lr.ph.i

body__2.lr.ph.i:                                  ; preds = %body__1.i
  %27 = fsub double 1.000000e+00, %sweepParameter.i
  %28 = fmul double %27, -2.000000e+00
  %29 = fmul double %28, %dt
  %30 = fmul double %sweepParameter.i, -2.000000e+00
  %31 = fmul double %30, 5.000000e-01
  %32 = fmul double %31, %dt
  %33 = fmul double %sweepParameter.i, %dt
  %34 = fmul double %33, -2.000000e+00
  br label %body__2.i

exit__1.i:                                        ; preds = %exit__2.i, %Microsoft__Quantum__Canon___87be4c75af094246aa2d7da158f79355_ApplyToEach__body.exit.i
  %35 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %35, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %35, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 1)
  %36 = tail call %Result* @__quantum__rt__result_get_zero()
  %37 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qs.i)
  %38 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %37)
  %39 = add i64 %37, -1
  %.not2.i.i = icmp slt i64 %39, 0
  br i1 %.not2.i.i, label %exit__1.i.i, label %body__1.i4.i

body__1.i4.i:                                     ; preds = %exit__1.i, %body__1.i4.i
  %40 = phi i64 [ %43, %body__1.i4.i ], [ 0, %exit__1.i ]
  %41 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %38, i64 %40)
  %42 = bitcast i8* %41 to %Result**
  store %Result* %36, %Result** %42, align 8
  %43 = add i64 %40, 1
  %.not.i3.i = icmp sgt i64 %43, %39
  br i1 %.not.i3.i, label %exit__1.i.i, label %body__1.i4.i

exit__1.i.i:                                      ; preds = %body__1.i4.i, %exit__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %38, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 1)
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qs.i)
  %45 = add i64 %44, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 -1)
  %.not13.i.i = icmp slt i64 %45, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit, label %body__2.i.i

body__2.i.i:                                      ; preds = %exit__1.i.i, %body__2.i.i
  %46 = phi %Array* [ %47, %body__2.i.i ], [ %38, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %58, %body__2.i.i ], [ 0, %exit__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %46, i32 -1)
  %47 = tail call %Array* @__quantum__rt__array_copy(%Array* %46, i1 false)
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %idxElement4.i.i)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = load %Qubit*, %Qubit** %49, align 8
  %51 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %52 = bitcast %Tuple* %51 to %Qubit**
  store %Qubit* %50, %Qubit** %52, align 8
  %53 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %35, %Tuple* %51, %Tuple* %53)
  %54 = bitcast %Tuple* %53 to %Result**
  %55 = load %Result*, %Result** %54, align 8
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %47, i64 %idxElement4.i.i)
  %57 = bitcast i8* %56 to %Result**
  store %Result* %55, %Result** %57, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %47, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %46, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %51, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %53, i32 -1)
  %58 = add i64 %idxElement4.i.i, 1
  %.not1.i5.i = icmp sgt i64 %58, %45
  br i1 %.not1.i5.i, label %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit, label %body__2.i.i

body__2.i:                                        ; preds = %exiting__2.i, %body__2.lr.ph.i
  %59 = phi i64 [ 0, %body__2.lr.ph.i ], [ %.pre-phi.i, %exiting__2.i ]
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %59)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %59)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = icmp slt i64 %59, %25
  br label %load

load:                                             ; preds = %body__2.i
  %65 = load %Qubit*, %Qubit** %61, align 8
  %66 = load %Qubit*, %Qubit** %63, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rx__body(double %29, %Qubit* %65)
  tail call void @__quantum__qis__rz__body(double %32, %Qubit* %66)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br i1 %64, label %then0__1.i, label %body__2.exiting__2_crit_edge.i

body__2.exiting__2_crit_edge.i:                   ; preds = %exit_quantum_grouping
  %.pre.i = add i64 %59, 1
  br label %exiting__2.i

then0__1.i:                                       ; preds = %exit_quantum_grouping
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %59)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = load %Qubit*, %Qubit** %68, align 8
  %70 = add nsw i64 %59, 1
  %71 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs.i, i64 %70)
  %72 = bitcast i8* %71 to %Qubit**
  %73 = load %Qubit*, %Qubit** %72, align 8
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Callable*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Callable**
  %77 = getelementptr inbounds { %Callable*, %Qubit* }, { %Callable*, %Qubit* }* %75, i64 0, i32 1
  %78 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %78, %Callable** %76, align 8
  store %Qubit* %69, %Qubit** %77, align 8
  %79 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %74)
  %80 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %81 = bitcast %Tuple* %80 to { %Callable*, double }*
  %82 = bitcast %Tuple* %80 to %Callable**
  %83 = getelementptr inbounds { %Callable*, double }, { %Callable*, double }* %81, i64 0, i32 1
  %84 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %84, %Callable** %82, align 8
  store double %34, double* %83, align 8
  %85 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__2__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__2__FunctionTable, %Tuple* %80)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %79, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %79, i32 1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %85, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %85, i32 1)
  %86 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %87 = bitcast %Tuple* %86 to %Qubit**
  store %Qubit* %73, %Qubit** %87, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %79, %Tuple* %86, %Tuple* null)
  %88 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %89 = bitcast %Tuple* %88 to %Qubit**
  store %Qubit* %73, %Qubit** %89, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %85, %Tuple* %88, %Tuple* null)
  %90 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %79, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %90, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %90)
  %91 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %92 = bitcast %Tuple* %91 to %Qubit**
  store %Qubit* %73, %Qubit** %92, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %90, %Tuple* %91, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %79, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %79, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %85, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %85, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %86, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %88, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %90, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %90, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %91, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %79, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %79, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %85, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %85, i32 -1)
  br label %exiting__2.i

exiting__2.i:                                     ; preds = %then0__1.i, %body__2.exiting__2_crit_edge.i
  %.pre-phi.i = phi i64 [ %.pre.i, %body__2.exiting__2_crit_edge.i ], [ %70, %then0__1.i ]
  %.not1.i = icmp sgt i64 %.pre-phi.i, %24
  br i1 %.not1.i, label %exit__2.i, label %body__2.i

exit__2.i:                                        ; preds = %exiting__2.i, %body__1.i
  %93 = add i64 %idxIter10.i, 1
  %.not.i = icmp sgt i64 %93, %nSteps2.i
  br i1 %.not.i, label %exit__1.i, label %body__1.i

Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit: ; preds = %body__2.i.i, %exit__1.i.i
  %.lcssa.i.i = phi %Array* [ %38, %exit__1.i.i ], [ %47, %body__2.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %35, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %35, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qs.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %35, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %35, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %qs.i)
  %94 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i)
  %95 = tail call i8* @__quantum__rt__memory_allocate(i64 %94)
  %96 = ptrtoint i8* %95 to i64
  %97 = add i64 %94, -1
  %.not4 = icmp slt i64 %97, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit, %exit_quantum_grouping9
  %98 = phi i64 [ %103, %exit_quantum_grouping9 ], [ 0, %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit ]
  %99 = add i64 %98, %96
  %100 = inttoptr i64 %99 to i8*
  %101 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %98)
  %102 = bitcast i8* %101 to %Result**
  %103 = add i64 %98, 1
  %104 = icmp sgt i64 %103, %97
  br label %load11

load11:                                           ; preds = %body__1
  %105 = load %Result*, %Result** %102, align 8
  br label %quantum8

quantum8:                                         ; preds = %load11
  br label %readout10

readout10:                                        ; preds = %quantum8
  %106 = tail call i1 @__quantum__qis__read_result__body(%Result* %105)
  br label %post-classical7

post-classical7:                                  ; preds = %readout10
  %107 = sext i1 %106 to i8
  store i8 %107, i8* %100, align 1
  br label %exit_quantum_grouping9

exit_quantum_grouping9:                           ; preds = %post-classical7
  br i1 %104, label %exit__1, label %body__1

exit__1:                                          ; preds = %exit_quantum_grouping9, %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit
  %108 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %109 = bitcast i8* %108 to i64*
  store i64 %94, i64* %109, align 4
  %110 = getelementptr i8, i8* %108, i64 8
  %111 = bitcast i8* %110 to i8**
  store i8* %95, i8** %111, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %112 = phi i64 [ %114, %body__2 ], [ 0, %exit__1 ]
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %112)
  %114 = add i64 %112, 1
  %.not3 = icmp sgt i64 %114, %97
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %115 = bitcast i8* %108 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 -1)
  ret { i64, i8* }* %115
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*) local_unnamed_addr

declare i8* @__quantum__rt__memory_allocate(i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare %Result* @__quantum__rt__result_get_zero() local_unnamed_addr

declare void @__quantum__rt__array_update_reference_count(%Array*, i32) local_unnamed_addr

declare %Array* @__quantum__rt__qubit_allocate_array(i64) local_unnamed_addr

declare void @__quantum__rt__array_update_alias_count(%Array*, i32) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__qubit_release_array(%Array*) local_unnamed_addr

declare %Tuple* @__quantum__rt__tuple_create(i64) local_unnamed_addr

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32) local_unnamed_addr

define internal void @MemoryManagement__2__RefCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to %Callable**
  %1 = load %Callable*, %Callable** %0, align 8
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

define internal void @MemoryManagement__2__AliasCount(%Tuple* %capture-tuple, i32 %count-change) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to %Callable**
  %1 = load %Callable*, %Callable** %0, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %1, i32 %count-change)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %capture-tuple, i32 %count-change)
  ret void
}

declare void @__quantum__rt__tuple_update_alias_count(%Tuple*, i32) local_unnamed_addr

define internal void @Lifted__PartialApplication__2__body__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, double }*
  %1 = getelementptr inbounds { %Callable*, double }, { %Callable*, double }* %0, i64 0, i32 1
  %2 = load double, double* %1, align 8
  %3 = bitcast %Tuple* %arg-tuple to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %6 = bitcast %Tuple* %5 to { double, %Qubit* }*
  %7 = bitcast %Tuple* %5 to double*
  %8 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %6, i64 0, i32 1
  store double %2, double* %7, align 8
  store %Qubit* %4, %Qubit** %8, align 8
  %9 = bitcast %Tuple* %capture-tuple to %Callable**
  %10 = load %Callable*, %Callable** %9, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %10, %Tuple* %5, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__2__adj__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, double }*
  %1 = getelementptr inbounds { %Callable*, double }, { %Callable*, double }* %0, i64 0, i32 1
  %2 = load double, double* %1, align 8
  %3 = bitcast %Tuple* %arg-tuple to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %6 = bitcast %Tuple* %5 to { double, %Qubit* }*
  %7 = bitcast %Tuple* %5 to double*
  %8 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %6, i64 0, i32 1
  store double %2, double* %7, align 8
  store %Qubit* %4, %Qubit** %8, align 8
  %9 = bitcast %Tuple* %capture-tuple to %Callable**
  %10 = load %Callable*, %Callable** %9, align 8
  %11 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %10, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %11)
  tail call void @__quantum__rt__callable_invoke(%Callable* %11, %Tuple* %5, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %11, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__2__ctl__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  %5 = bitcast %Tuple* %capture-tuple to { %Callable*, double }*
  %6 = getelementptr inbounds { %Callable*, double }, { %Callable*, double }* %5, i64 0, i32 1
  %7 = load double, double* %6, align 8
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %9 = bitcast %Tuple* %8 to { double, %Qubit* }*
  %10 = bitcast %Tuple* %8 to double*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %9, i64 0, i32 1
  store double %7, double* %10, align 8
  store %Qubit* %4, %Qubit** %11, align 8
  %12 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %13 = bitcast %Tuple* %12 to { %Array*, { double, %Qubit* }* }*
  %14 = bitcast %Tuple* %12 to %Array**
  %15 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %13, i64 0, i32 1
  store %Array* %3, %Array** %14, align 8
  %16 = bitcast { double, %Qubit* }** %15 to %Tuple**
  store %Tuple* %8, %Tuple** %16, align 8
  %17 = bitcast %Tuple* %capture-tuple to %Callable**
  %18 = load %Callable*, %Callable** %17, align 8
  %19 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %18, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 1)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %19)
  tail call void @__quantum__rt__callable_invoke(%Callable* %19, %Tuple* %12, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %19, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__2__ctladj__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  %5 = bitcast %Tuple* %capture-tuple to { %Callable*, double }*
  %6 = getelementptr inbounds { %Callable*, double }, { %Callable*, double }* %5, i64 0, i32 1
  %7 = load double, double* %6, align 8
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %9 = bitcast %Tuple* %8 to { double, %Qubit* }*
  %10 = bitcast %Tuple* %8 to double*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %9, i64 0, i32 1
  store double %7, double* %10, align 8
  store %Qubit* %4, %Qubit** %11, align 8
  %12 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %13 = bitcast %Tuple* %12 to { %Array*, { double, %Qubit* }* }*
  %14 = bitcast %Tuple* %12 to %Array**
  %15 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %13, i64 0, i32 1
  store %Array* %3, %Array** %14, align 8
  %16 = bitcast { double, %Qubit* }** %15 to %Tuple**
  store %Tuple* %8, %Tuple** %16, align 8
  %17 = bitcast %Tuple* %capture-tuple to %Callable**
  %18 = load %Callable*, %Callable** %17, align 8
  %19 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %18, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %19)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %19)
  tail call void @__quantum__rt__callable_invoke(%Callable* %19, %Tuple* %12, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %19, i32 -1)
  ret void
}

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__Rz__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to double*
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %3 = load double, double* %1, align 8
  br label %load

load:                                             ; preds = %entry
  %4 = load %Qubit*, %Qubit** %2, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rz__body(double %3, %Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to double*
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = fneg double %3
  br label %load

load:                                             ; preds = %entry
  %5 = load %Qubit*, %Qubit** %2, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rz__body(double %4, %Qubit* %5)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i64 0, i32 0
  %theta.i = load double, double* %5, align 8
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i64 0, i32 1
  %qubit.i = load %Qubit*, %Qubit** %6, align 8
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rz__body(double %theta.i, %Qubit* %qubit.i)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

test1__1.i:                                       ; preds = %entry
  %9 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %11 = fmul double %theta.i, 5.000000e-01
  %12 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = fmul double %theta.i, -5.000000e-01
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %16 = bitcast i8* %15 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %17 = load %Qubit*, %Qubit** %13, align 8
  %18 = load %Qubit*, %Qubit** %16, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__rz__body(double %11, %Qubit* %qubit.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %17, %Qubit* %qubit.i)
  tail call void @__quantum__qis__rz__body(double %14, %Qubit* %qubit.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %18, %Qubit* %qubit.i)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %19 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %19)
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { %Array*, { double, %Qubit* }* }*
  %22 = bitcast %Tuple* %20 to %Array**
  %23 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %21, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %24 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %25 = bitcast %Tuple* %24 to { double, %Qubit* }*
  %26 = bitcast %Tuple* %24 to double*
  %27 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %25, i64 0, i32 1
  store double %theta.i, double* %26, align 8
  store %Qubit* %qubit.i, %Qubit** %27, align 8
  store %Array* %3, %Array** %22, align 8
  %28 = bitcast { double, %Qubit* }** %23 to %Tuple**
  store %Tuple* %24, %Tuple** %28, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %19, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %19, i32 1)
  %controls.i.i = load %Array*, %Array** %22, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { double, %Qubit* }*, { double, %Qubit* }** %23, align 8
  %29 = bitcast { double, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %29, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %30 = phi i64 [ %39, %exit_quantum_grouping8 ], [ 0, %else__1.i ]
  %31 = shl nuw i64 %30, 1
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %31)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = or i64 %31, 1
  %35 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %34)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %30)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = add nuw nsw i64 %30, 1
  %40 = icmp slt i64 %39, %numControlPairs.i.i
  br label %load10

load10:                                           ; preds = %body__1.i.i
  %41 = load %Qubit*, %Qubit** %33, align 8
  %42 = load %Qubit*, %Qubit** %36, align 8
  %43 = load %Qubit*, %Qubit** %38, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %43, %Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %41, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %42)
  tail call void @__quantum__qis__t__adj(%Qubit* %41)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %43, %Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %41, %Qubit* %42)
  tail call void @__quantum__qis__t__adj(%Qubit* %42)
  tail call void @__quantum__qis__cnot__body(%Qubit* %43, %Qubit* %42)
  tail call void @__quantum__qis__h__body(%Qubit* %43)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %40, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %44 = and i64 %numControls.i.i, 1
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %46 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %46, i64 0)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = add i64 %numControls.i.i, -1
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = load %Qubit*, %Qubit** %51, align 8
  store %Qubit* %52, %Qubit** %48, align 8
  %53 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %46)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %53, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %46, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %53, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %53, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %55 = bitcast %Tuple* %54 to { %Array*, { double, %Qubit* }* }*
  %56 = bitcast %Tuple* %54 to %Array**
  %57 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %55, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %56, align 8
  store { double, %Qubit* }* %arg.i.i, { double, %Qubit* }** %57, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %19, %Tuple* %54, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping13, %body__2.preheader.i.i
  %58 = phi i64 [ %67, %exit_quantum_grouping13 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %59 = shl nuw i64 %58, 1
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %59)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = or i64 %59, 1
  %63 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %62)
  %64 = bitcast i8* %63 to %Qubit**
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %58)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = add i64 %58, -1
  %68 = icmp sgt i64 %67, -1
  br label %load15

load15:                                           ; preds = %body__2.i.i
  %69 = load %Qubit*, %Qubit** %61, align 8
  %70 = load %Qubit*, %Qubit** %64, align 8
  %71 = load %Qubit*, %Qubit** %66, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %70)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %71)
  tail call void @__quantum__qis__t__body(%Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %69)
  tail call void @__quantum__qis__h__body(%Qubit* %71)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %68, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %29, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %20, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

Microsoft__Quantum__Intrinsic__Rz__ctl.exit:      ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i64 0, i32 0
  %theta.i = load double, double* %5, align 8
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i64 0, i32 1
  %qubit.i = load %Qubit*, %Qubit** %6, align 8
  %7 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %8 = bitcast %Tuple* %7 to { double, %Qubit* }*
  %9 = bitcast %Tuple* %7 to double*
  %10 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %8, i64 0, i32 1
  %11 = fneg double %theta.i
  store double %11, double* %9, align 8
  store %Qubit* %qubit.i, %Qubit** %10, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %12 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %8, i64 0, i32 0
  %theta.i1 = load double, double* %12, align 8
  %13 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %8, i64 0, i32 1
  %qubit.i2 = load %Qubit*, %Qubit** %13, align 8
  %14 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rz__body(double %theta.i1, %Qubit* %qubit.i2)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

test1__1.i:                                       ; preds = %entry
  %16 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %17 = icmp eq i64 %16, 1
  br i1 %17, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %18 = fmul double %theta.i1, 5.000000e-01
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = fmul double %theta.i1, -5.000000e-01
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  br label %load7

load7:                                            ; preds = %then1__1.i
  %24 = load %Qubit*, %Qubit** %20, align 8
  %25 = load %Qubit*, %Qubit** %23, align 8
  br label %quantum4

quantum4:                                         ; preds = %load7
  tail call void @__quantum__qis__rz__body(double %18, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %24, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__rz__body(double %21, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %25, %Qubit* %qubit.i2)
  br label %readout6

readout6:                                         ; preds = %quantum4
  br label %post-classical3

post-classical3:                                  ; preds = %readout6
  br label %exit_quantum_grouping5

exit_quantum_grouping5:                           ; preds = %post-classical3
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %26)
  %27 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %28 = bitcast %Tuple* %27 to { %Array*, { double, %Qubit* }* }*
  %29 = bitcast %Tuple* %27 to %Array**
  %30 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %28, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %31 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %32 = bitcast %Tuple* %31 to { double, %Qubit* }*
  %33 = bitcast %Tuple* %31 to double*
  %34 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %32, i64 0, i32 1
  store double %theta.i1, double* %33, align 8
  store %Qubit* %qubit.i2, %Qubit** %34, align 8
  store %Array* %3, %Array** %29, align 8
  %35 = bitcast { double, %Qubit* }** %30 to %Tuple**
  store %Tuple* %31, %Tuple** %35, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 1)
  %controls.i.i = load %Array*, %Array** %29, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { double, %Qubit* }*, { double, %Qubit* }** %30, align 8
  %36 = bitcast { double, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %36, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping10, %else__1.i
  %37 = phi i64 [ %46, %exit_quantum_grouping10 ], [ 0, %else__1.i ]
  %38 = shl nuw i64 %37, 1
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %38)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = or i64 %38, 1
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %41)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %37)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = add nuw nsw i64 %37, 1
  %47 = icmp slt i64 %46, %numControlPairs.i.i
  br label %load12

load12:                                           ; preds = %body__1.i.i
  %48 = load %Qubit*, %Qubit** %40, align 8
  %49 = load %Qubit*, %Qubit** %43, align 8
  %50 = load %Qubit*, %Qubit** %45, align 8
  br label %quantum9

quantum9:                                         ; preds = %load12
  tail call void @__quantum__qis__h__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %50, %Qubit* %48)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %49)
  tail call void @__quantum__qis__t__body(%Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %48)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %50, %Qubit* %48)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %49)
  tail call void @__quantum__qis__cnot__body(%Qubit* %50, %Qubit* %49)
  tail call void @__quantum__qis__h__body(%Qubit* %50)
  br label %readout11

readout11:                                        ; preds = %quantum9
  br label %post-classical8

post-classical8:                                  ; preds = %readout11
  br label %exit_quantum_grouping10

exit_quantum_grouping10:                          ; preds = %post-classical8
  br i1 %47, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping10, %else__1.i
  %51 = and i64 %numControls.i.i, 1
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %53 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %53, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = add i64 %numControls.i.i, -1
  %57 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %56)
  %58 = bitcast i8* %57 to %Qubit**
  %59 = load %Qubit*, %Qubit** %58, align 8
  store %Qubit* %59, %Qubit** %55, align 8
  %60 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %53)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %60, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %60, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %60, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %61 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %62 = bitcast %Tuple* %61 to { %Array*, { double, %Qubit* }* }*
  %63 = bitcast %Tuple* %61 to %Array**
  %64 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %62, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %36, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %63, align 8
  store { double, %Qubit* }* %arg.i.i, { double, %Qubit* }** %64, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %26, %Tuple* %61, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping15, %body__2.preheader.i.i
  %65 = phi i64 [ %74, %exit_quantum_grouping15 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %66 = shl nuw i64 %65, 1
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %66)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = or i64 %66, 1
  %70 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %69)
  %71 = bitcast i8* %70 to %Qubit**
  %72 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %65)
  %73 = bitcast i8* %72 to %Qubit**
  %74 = add i64 %65, -1
  %75 = icmp sgt i64 %74, -1
  br label %load17

load17:                                           ; preds = %body__2.i.i
  %76 = load %Qubit*, %Qubit** %68, align 8
  %77 = load %Qubit*, %Qubit** %71, align 8
  %78 = load %Qubit*, %Qubit** %73, align 8
  br label %quantum14

quantum14:                                        ; preds = %load17
  tail call void @__quantum__qis__h__body(%Qubit* %78)
  tail call void @__quantum__qis__cnot__body(%Qubit* %78, %Qubit* %77)
  tail call void @__quantum__qis__t__body(%Qubit* %77)
  tail call void @__quantum__qis__cnot__body(%Qubit* %76, %Qubit* %77)
  tail call void @__quantum__qis__cnot__body(%Qubit* %78, %Qubit* %76)
  tail call void @__quantum__qis__t__adj(%Qubit* %78)
  tail call void @__quantum__qis__t__body(%Qubit* %76)
  tail call void @__quantum__qis__t__adj(%Qubit* %77)
  tail call void @__quantum__qis__cnot__body(%Qubit* %76, %Qubit* %77)
  tail call void @__quantum__qis__cnot__body(%Qubit* %78, %Qubit* %76)
  tail call void @__quantum__qis__h__body(%Qubit* %78)
  br label %readout16

readout16:                                        ; preds = %quantum14
  br label %post-classical13

post-classical13:                                 ; preds = %readout16
  br label %exit_quantum_grouping15

exit_quantum_grouping15:                          ; preds = %post-classical13
  br i1 %75, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping15, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %36, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %61, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %36, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %31, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %27, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

Microsoft__Quantum__Intrinsic__Rz__ctl.exit:      ; preds = %exit_quantum_grouping, %exit_quantum_grouping5, %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

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
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Qubit* }*
  %1 = getelementptr inbounds { %Callable*, %Qubit* }, { %Callable*, %Qubit* }* %0, i64 0, i32 1
  %2 = load %Qubit*, %Qubit** %1, align 8
  %3 = bitcast %Tuple* %arg-tuple to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %6 = bitcast %Tuple* %5 to { %Qubit*, %Qubit* }*
  %7 = bitcast %Tuple* %5 to %Qubit**
  %8 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %6, i64 0, i32 1
  store %Qubit* %2, %Qubit** %7, align 8
  store %Qubit* %4, %Qubit** %8, align 8
  %9 = bitcast %Tuple* %capture-tuple to %Callable**
  %10 = load %Callable*, %Callable** %9, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %10, %Tuple* %5, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__1__adj__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %capture-tuple to { %Callable*, %Qubit* }*
  %1 = getelementptr inbounds { %Callable*, %Qubit* }, { %Callable*, %Qubit* }* %0, i64 0, i32 1
  %2 = load %Qubit*, %Qubit** %1, align 8
  %3 = bitcast %Tuple* %arg-tuple to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %6 = bitcast %Tuple* %5 to { %Qubit*, %Qubit* }*
  %7 = bitcast %Tuple* %5 to %Qubit**
  %8 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %6, i64 0, i32 1
  store %Qubit* %2, %Qubit** %7, align 8
  store %Qubit* %4, %Qubit** %8, align 8
  %9 = bitcast %Tuple* %capture-tuple to %Callable**
  %10 = load %Callable*, %Callable** %9, align 8
  %11 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %10, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %11)
  tail call void @__quantum__rt__callable_invoke(%Callable* %11, %Tuple* %5, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %11, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__1__ctl__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  %5 = bitcast %Tuple* %capture-tuple to { %Callable*, %Qubit* }*
  %6 = getelementptr inbounds { %Callable*, %Qubit* }, { %Callable*, %Qubit* }* %5, i64 0, i32 1
  %7 = load %Qubit*, %Qubit** %6, align 8
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %9 = bitcast %Tuple* %8 to { %Qubit*, %Qubit* }*
  %10 = bitcast %Tuple* %8 to %Qubit**
  %11 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %9, i64 0, i32 1
  store %Qubit* %7, %Qubit** %10, align 8
  store %Qubit* %4, %Qubit** %11, align 8
  %12 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %13 = bitcast %Tuple* %12 to { %Array*, { %Qubit*, %Qubit* }* }*
  %14 = bitcast %Tuple* %12 to %Array**
  %15 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %13, i64 0, i32 1
  store %Array* %3, %Array** %14, align 8
  %16 = bitcast { %Qubit*, %Qubit* }** %15 to %Tuple**
  store %Tuple* %8, %Tuple** %16, align 8
  %17 = bitcast %Tuple* %capture-tuple to %Callable**
  %18 = load %Callable*, %Callable** %17, align 8
  %19 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %18, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 1)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %19)
  tail call void @__quantum__rt__callable_invoke(%Callable* %19, %Tuple* %12, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %19, i32 -1)
  ret void
}

define internal void @Lifted__PartialApplication__1__ctladj__wrapper(%Tuple* nocapture readonly %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  %5 = bitcast %Tuple* %capture-tuple to { %Callable*, %Qubit* }*
  %6 = getelementptr inbounds { %Callable*, %Qubit* }, { %Callable*, %Qubit* }* %5, i64 0, i32 1
  %7 = load %Qubit*, %Qubit** %6, align 8
  %8 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %9 = bitcast %Tuple* %8 to { %Qubit*, %Qubit* }*
  %10 = bitcast %Tuple* %8 to %Qubit**
  %11 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %9, i64 0, i32 1
  store %Qubit* %7, %Qubit** %10, align 8
  store %Qubit* %4, %Qubit** %11, align 8
  %12 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %13 = bitcast %Tuple* %12 to { %Array*, { %Qubit*, %Qubit* }* }*
  %14 = bitcast %Tuple* %12 to %Array**
  %15 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %13, i64 0, i32 1
  store %Array* %3, %Array** %14, align 8
  %16 = bitcast { %Qubit*, %Qubit* }** %15 to %Tuple**
  store %Tuple* %8, %Tuple** %16, align 8
  %17 = bitcast %Tuple* %capture-tuple to %Callable**
  %18 = load %Callable*, %Callable** %17, align 8
  %19 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %18, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %19)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %19)
  tail call void @__quantum__rt__callable_invoke(%Callable* %19, %Tuple* %12, %Tuple* %result-tuple)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %19, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %19, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Qubit**
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 1
  br label %load

load:                                             ; preds = %entry
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__cnot__body(%Qubit* %3, %Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Qubit**
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 1
  br label %load

load:                                             ; preds = %entry
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__cnot__body(%Qubit* %3, %Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { %Qubit*, %Qubit* }* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i64 0, i32 0
  %control.i = load %Qubit*, %Qubit** %5, align 8
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i64 0, i32 1
  %target.i = load %Qubit*, %Qubit** %6, align 8
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__cnot__body(%Qubit* %control.i, %Qubit* %target.i)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

test1__1.i:                                       ; preds = %entry
  %9 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 1)
  %18 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %13)
  %19 = icmp eq i64 %18, 0
  br label %load5

load5:                                            ; preds = %then1__1.i
  %20 = load %Qubit*, %Qubit** %12, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__h__body(%Qubit* %target.i)
  store %Qubit* %20, %Qubit** %15, align 8
  store %Qubit* %control.i, %Qubit** %17, align 8
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br i1 %19, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping3
  br label %load10

load10:                                           ; preds = %then0__1.i.i
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__z__body(%Qubit* %target.i)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping3
  %21 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %13)
  %22 = icmp eq i64 %21, 1
  br i1 %22, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %24 = bitcast i8* %23 to %Qubit**
  br label %load15

load15:                                           ; preds = %then1__1.i.i
  %25 = load %Qubit*, %Qubit** %24, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__cz__body(%Qubit* %25, %Qubit* %target.i)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %26 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %13)
  %27 = icmp eq i64 %26, 2
  br i1 %27, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  br label %load20

load20:                                           ; preds = %then2__1.i.i
  %54 = load %Qubit*, %Qubit** %29, align 8
  %55 = load %Qubit*, %Qubit** %31, align 8
  %56 = load %Qubit*, %Qubit** %33, align 8
  %57 = load %Qubit*, %Qubit** %35, align 8
  %58 = load %Qubit*, %Qubit** %37, align 8
  %59 = load %Qubit*, %Qubit** %39, align 8
  %60 = load %Qubit*, %Qubit** %41, align 8
  %61 = load %Qubit*, %Qubit** %43, align 8
  %62 = load %Qubit*, %Qubit** %45, align 8
  %63 = load %Qubit*, %Qubit** %47, align 8
  %64 = load %Qubit*, %Qubit** %49, align 8
  %65 = load %Qubit*, %Qubit** %51, align 8
  %66 = load %Qubit*, %Qubit** %53, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__t__adj(%Qubit* %54)
  tail call void @__quantum__qis__t__adj(%Qubit* %55)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i, %Qubit* %56)
  tail call void @__quantum__qis__t__body(%Qubit* %57)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %target.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %59, %Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %target.i)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %62, %Qubit* %target.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i, %Qubit* %63)
  tail call void @__quantum__qis__t__adj(%Qubit* %target.i)
  tail call void @__quantum__qis__t__body(%Qubit* %64)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %67 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %67)
  %68 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %69 = bitcast %Tuple* %68 to { %Array*, %Qubit* }*
  %70 = bitcast %Tuple* %68 to %Array**
  %71 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %69, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 1)
  store %Array* %13, %Array** %70, align 8
  store %Qubit* %target.i, %Qubit** %71, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %67, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %67, i32 1)
  %72 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %69, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %72, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %73 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %69, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %73, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping23, %else__1.i.i
  %74 = phi i64 [ %83, %exit_quantum_grouping23 ], [ 0, %else__1.i.i ]
  %75 = shl nuw i64 %74, 1
  %76 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %75)
  %77 = bitcast i8* %76 to %Qubit**
  %78 = or i64 %75, 1
  %79 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %78)
  %80 = bitcast i8* %79 to %Qubit**
  %81 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %74)
  %82 = bitcast i8* %81 to %Qubit**
  %83 = add nuw nsw i64 %74, 1
  %84 = icmp slt i64 %83, %numControlPairs.i.i.i
  br label %load25

load25:                                           ; preds = %body__1.i.i.i
  %85 = load %Qubit*, %Qubit** %77, align 8
  %86 = load %Qubit*, %Qubit** %80, align 8
  %87 = load %Qubit*, %Qubit** %82, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__h__body(%Qubit* %87)
  tail call void @__quantum__qis__cnot__body(%Qubit* %87, %Qubit* %85)
  tail call void @__quantum__qis__cnot__body(%Qubit* %85, %Qubit* %86)
  tail call void @__quantum__qis__t__body(%Qubit* %86)
  tail call void @__quantum__qis__t__adj(%Qubit* %85)
  tail call void @__quantum__qis__t__body(%Qubit* %87)
  tail call void @__quantum__qis__cnot__body(%Qubit* %87, %Qubit* %85)
  tail call void @__quantum__qis__cnot__body(%Qubit* %85, %Qubit* %86)
  tail call void @__quantum__qis__t__adj(%Qubit* %86)
  tail call void @__quantum__qis__cnot__body(%Qubit* %87, %Qubit* %86)
  tail call void @__quantum__qis__h__body(%Qubit* %87)
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br i1 %84, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping23, %else__1.i.i
  %88 = and i64 %numControls.i.i.i, 1
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %90 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %91 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %90, i64 0)
  %92 = bitcast i8* %91 to %Qubit**
  %93 = add i64 %numControls.i.i.i, -1
  %94 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %93)
  %95 = bitcast i8* %94 to %Qubit**
  %96 = load %Qubit*, %Qubit** %95, align 8
  store %Qubit* %96, %Qubit** %92, align 8
  %97 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %90)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %97, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %90, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %97, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %97, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %98 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %99 = bitcast %Tuple* %98 to { %Array*, %Qubit* }*
  %100 = bitcast %Tuple* %98 to %Array**
  %101 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %99, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %100, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %101, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %67, %Tuple* %98, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping28, %body__2.preheader.i.i.i
  %102 = phi i64 [ %111, %exit_quantum_grouping28 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %103 = shl nuw i64 %102, 1
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %103)
  %105 = bitcast i8* %104 to %Qubit**
  %106 = or i64 %103, 1
  %107 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %106)
  %108 = bitcast i8* %107 to %Qubit**
  %109 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %102)
  %110 = bitcast i8* %109 to %Qubit**
  %111 = add i64 %102, -1
  %112 = icmp sgt i64 %111, -1
  br label %load30

load30:                                           ; preds = %body__2.i.i.i
  %113 = load %Qubit*, %Qubit** %105, align 8
  %114 = load %Qubit*, %Qubit** %108, align 8
  %115 = load %Qubit*, %Qubit** %110, align 8
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__h__body(%Qubit* %115)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %114)
  tail call void @__quantum__qis__t__body(%Qubit* %114)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %114)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %113)
  tail call void @__quantum__qis__t__adj(%Qubit* %115)
  tail call void @__quantum__qis__t__body(%Qubit* %113)
  tail call void @__quantum__qis__t__adj(%Qubit* %114)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %114)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %113)
  tail call void @__quantum__qis__h__body(%Qubit* %115)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %112, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping28, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %98, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %68, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping18, %exit_quantum_grouping13, %exit_quantum_grouping8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  br label %load35

load35:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__h__body(%Qubit* %target.i)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %116 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %116)
  %117 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %118 = bitcast %Tuple* %117 to { %Array*, { %Qubit*, %Qubit* }* }*
  %119 = bitcast %Tuple* %117 to %Array**
  %120 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %118, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %121 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %122 = bitcast %Tuple* %121 to { %Qubit*, %Qubit* }*
  %123 = bitcast %Tuple* %121 to %Qubit**
  %124 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %122, i64 0, i32 1
  store %Qubit* %control.i, %Qubit** %123, align 8
  store %Qubit* %target.i, %Qubit** %124, align 8
  store %Array* %3, %Array** %119, align 8
  %125 = bitcast { %Qubit*, %Qubit* }** %120 to %Tuple**
  store %Tuple* %121, %Tuple** %125, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %116, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %116, i32 1)
  %controls.i.i = load %Array*, %Array** %119, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %120, align 8
  %126 = bitcast { %Qubit*, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %126, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping38, %else__1.i
  %127 = phi i64 [ %136, %exit_quantum_grouping38 ], [ 0, %else__1.i ]
  %128 = shl nuw i64 %127, 1
  %129 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %128)
  %130 = bitcast i8* %129 to %Qubit**
  %131 = or i64 %128, 1
  %132 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %131)
  %133 = bitcast i8* %132 to %Qubit**
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %127)
  %135 = bitcast i8* %134 to %Qubit**
  %136 = add nuw nsw i64 %127, 1
  %137 = icmp slt i64 %136, %numControlPairs.i.i
  br label %load40

load40:                                           ; preds = %body__1.i.i
  %138 = load %Qubit*, %Qubit** %130, align 8
  %139 = load %Qubit*, %Qubit** %133, align 8
  %140 = load %Qubit*, %Qubit** %135, align 8
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__h__body(%Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %138)
  tail call void @__quantum__qis__cnot__body(%Qubit* %138, %Qubit* %139)
  tail call void @__quantum__qis__t__body(%Qubit* %139)
  tail call void @__quantum__qis__t__adj(%Qubit* %138)
  tail call void @__quantum__qis__t__body(%Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %138)
  tail call void @__quantum__qis__cnot__body(%Qubit* %138, %Qubit* %139)
  tail call void @__quantum__qis__t__adj(%Qubit* %139)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %139)
  tail call void @__quantum__qis__h__body(%Qubit* %140)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br i1 %137, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping38, %else__1.i
  %141 = and i64 %numControls.i.i, 1
  %142 = icmp eq i64 %141, 0
  br i1 %142, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %143 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %144 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %143, i64 0)
  %145 = bitcast i8* %144 to %Qubit**
  %146 = add i64 %numControls.i.i, -1
  %147 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %146)
  %148 = bitcast i8* %147 to %Qubit**
  %149 = load %Qubit*, %Qubit** %148, align 8
  store %Qubit* %149, %Qubit** %145, align 8
  %150 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %143)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %150, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %143, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %150, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %150, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %151 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %152 = bitcast %Tuple* %151 to { %Array*, { %Qubit*, %Qubit* }* }*
  %153 = bitcast %Tuple* %151 to %Array**
  %154 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %152, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %126, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %153, align 8
  store { %Qubit*, %Qubit* }* %arg.i.i, { %Qubit*, %Qubit* }** %154, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %116, %Tuple* %151, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping43, %body__2.preheader.i.i
  %155 = phi i64 [ %164, %exit_quantum_grouping43 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %156 = shl nuw i64 %155, 1
  %157 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %156)
  %158 = bitcast i8* %157 to %Qubit**
  %159 = or i64 %156, 1
  %160 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %159)
  %161 = bitcast i8* %160 to %Qubit**
  %162 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %155)
  %163 = bitcast i8* %162 to %Qubit**
  %164 = add i64 %155, -1
  %165 = icmp sgt i64 %164, -1
  br label %load45

load45:                                           ; preds = %body__2.i.i
  %166 = load %Qubit*, %Qubit** %158, align 8
  %167 = load %Qubit*, %Qubit** %161, align 8
  %168 = load %Qubit*, %Qubit** %163, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %168)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %167)
  tail call void @__quantum__qis__t__body(%Qubit* %167)
  tail call void @__quantum__qis__cnot__body(%Qubit* %166, %Qubit* %167)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %166)
  tail call void @__quantum__qis__t__adj(%Qubit* %168)
  tail call void @__quantum__qis__t__body(%Qubit* %166)
  tail call void @__quantum__qis__t__adj(%Qubit* %167)
  tail call void @__quantum__qis__cnot__body(%Qubit* %166, %Qubit* %167)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %166)
  tail call void @__quantum__qis__h__body(%Qubit* %168)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %165, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping43, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %126, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %151, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %116, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %116, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %126, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %116, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %116, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %121, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %117, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

Microsoft__Quantum__Intrinsic__CNOT__ctl.exit:    ; preds = %exit_quantum_grouping, %exit_quantum_grouping33, %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { %Qubit*, %Qubit* }* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i64 0, i32 0
  %control.i = load %Qubit*, %Qubit** %5, align 8
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i64 0, i32 1
  %target.i = load %Qubit*, %Qubit** %6, align 8
  %7 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %8 = bitcast %Tuple* %7 to { %Qubit*, %Qubit* }*
  %9 = bitcast %Tuple* %7 to %Qubit**
  %10 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i64 0, i32 1
  store %Qubit* %control.i, %Qubit** %9, align 8
  store %Qubit* %target.i, %Qubit** %10, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %11 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i64 0, i32 0
  %control.i1 = load %Qubit*, %Qubit** %11, align 8
  %12 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i64 0, i32 1
  %target.i2 = load %Qubit*, %Qubit** %12, align 8
  %13 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__cnot__body(%Qubit* %control.i1, %Qubit* %target.i2)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

test1__1.i:                                       ; preds = %entry
  %15 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %16 = icmp eq i64 %15, 1
  br i1 %16, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %23 = bitcast i8* %22 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %19, i32 1)
  %24 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %19)
  %25 = icmp eq i64 %24, 0
  br label %load7

load7:                                            ; preds = %then1__1.i
  %26 = load %Qubit*, %Qubit** %18, align 8
  br label %quantum4

quantum4:                                         ; preds = %load7
  tail call void @__quantum__qis__h__body(%Qubit* %target.i2)
  store %Qubit* %26, %Qubit** %21, align 8
  store %Qubit* %control.i1, %Qubit** %23, align 8
  br label %readout6

readout6:                                         ; preds = %quantum4
  br label %post-classical3

post-classical3:                                  ; preds = %readout6
  br label %exit_quantum_grouping5

exit_quantum_grouping5:                           ; preds = %post-classical3
  br i1 %25, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping5
  br label %load12

load12:                                           ; preds = %then0__1.i.i
  br label %quantum9

quantum9:                                         ; preds = %load12
  tail call void @__quantum__qis__z__body(%Qubit* %target.i2)
  br label %readout11

readout11:                                        ; preds = %quantum9
  br label %post-classical8

post-classical8:                                  ; preds = %readout11
  br label %exit_quantum_grouping10

exit_quantum_grouping10:                          ; preds = %post-classical8
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping5
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %19)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  br label %load17

load17:                                           ; preds = %then1__1.i.i
  %31 = load %Qubit*, %Qubit** %30, align 8
  br label %quantum14

quantum14:                                        ; preds = %load17
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %target.i2)
  br label %readout16

readout16:                                        ; preds = %quantum14
  br label %post-classical13

post-classical13:                                 ; preds = %readout16
  br label %exit_quantum_grouping15

exit_quantum_grouping15:                          ; preds = %post-classical13
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %32 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %19)
  %33 = icmp eq i64 %32, 2
  br i1 %33, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 1)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %19, i64 0)
  %59 = bitcast i8* %58 to %Qubit**
  br label %load22

load22:                                           ; preds = %then2__1.i.i
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
  br label %quantum19

quantum19:                                        ; preds = %load22
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i2, %Qubit* %62)
  tail call void @__quantum__qis__t__body(%Qubit* %63)
  tail call void @__quantum__qis__cnot__body(%Qubit* %64, %Qubit* %target.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  tail call void @__quantum__qis__t__body(%Qubit* %target.i2)
  tail call void @__quantum__qis__t__adj(%Qubit* %67)
  tail call void @__quantum__qis__cnot__body(%Qubit* %68, %Qubit* %target.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i2, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %target.i2)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  br label %readout21

readout21:                                        ; preds = %quantum19
  br label %post-classical18

post-classical18:                                 ; preds = %readout21
  br label %exit_quantum_grouping20

exit_quantum_grouping20:                          ; preds = %post-classical18
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %73 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %73)
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Array**
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %19, i32 1)
  store %Array* %19, %Array** %76, align 8
  store %Qubit* %target.i2, %Qubit** %77, align 8
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

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping25, %else__1.i.i
  %80 = phi i64 [ %89, %exit_quantum_grouping25 ], [ 0, %else__1.i.i ]
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
  br label %load27

load27:                                           ; preds = %body__1.i.i.i
  %91 = load %Qubit*, %Qubit** %83, align 8
  %92 = load %Qubit*, %Qubit** %86, align 8
  %93 = load %Qubit*, %Qubit** %88, align 8
  br label %quantum24

quantum24:                                        ; preds = %load27
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
  br label %readout26

readout26:                                        ; preds = %quantum24
  br label %post-classical23

post-classical23:                                 ; preds = %readout26
  br label %exit_quantum_grouping25

exit_quantum_grouping25:                          ; preds = %post-classical23
  br i1 %90, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping25, %else__1.i.i
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
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping30, %body__2.preheader.i.i.i
  %108 = phi i64 [ %117, %exit_quantum_grouping30 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
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
  br label %load32

load32:                                           ; preds = %body__2.i.i.i
  %119 = load %Qubit*, %Qubit** %111, align 8
  %120 = load %Qubit*, %Qubit** %114, align 8
  %121 = load %Qubit*, %Qubit** %116, align 8
  br label %quantum29

quantum29:                                        ; preds = %load32
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
  br label %readout31

readout31:                                        ; preds = %quantum29
  br label %post-classical28

post-classical28:                                 ; preds = %readout31
  br label %exit_quantum_grouping30

exit_quantum_grouping30:                          ; preds = %post-classical28
  br i1 %118, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping30, %condContinue__1.i.i.i
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
  tail call void @__quantum__rt__array_update_reference_count(%Array* %19, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping20, %exit_quantum_grouping15, %exit_quantum_grouping10
  tail call void @__quantum__rt__array_update_alias_count(%Array* %19, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %19, i32 -1)
  br label %load37

load37:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum34

quantum34:                                        ; preds = %load37
  tail call void @__quantum__qis__h__body(%Qubit* %target.i2)
  br label %readout36

readout36:                                        ; preds = %quantum34
  br label %post-classical33

post-classical33:                                 ; preds = %readout36
  br label %exit_quantum_grouping35

exit_quantum_grouping35:                          ; preds = %post-classical33
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %122 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %122)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Array*, { %Qubit*, %Qubit* }* }*
  %125 = bitcast %Tuple* %123 to %Array**
  %126 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %124, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %127 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %128 = bitcast %Tuple* %127 to { %Qubit*, %Qubit* }*
  %129 = bitcast %Tuple* %127 to %Qubit**
  %130 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %128, i64 0, i32 1
  store %Qubit* %control.i1, %Qubit** %129, align 8
  store %Qubit* %target.i2, %Qubit** %130, align 8
  store %Array* %3, %Array** %125, align 8
  %131 = bitcast { %Qubit*, %Qubit* }** %126 to %Tuple**
  store %Tuple* %127, %Tuple** %131, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 1)
  %controls.i.i = load %Array*, %Array** %125, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %126, align 8
  %132 = bitcast { %Qubit*, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %132, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping40, %else__1.i
  %133 = phi i64 [ %142, %exit_quantum_grouping40 ], [ 0, %else__1.i ]
  %134 = shl nuw i64 %133, 1
  %135 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %134)
  %136 = bitcast i8* %135 to %Qubit**
  %137 = or i64 %134, 1
  %138 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %137)
  %139 = bitcast i8* %138 to %Qubit**
  %140 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %133)
  %141 = bitcast i8* %140 to %Qubit**
  %142 = add nuw nsw i64 %133, 1
  %143 = icmp slt i64 %142, %numControlPairs.i.i
  br label %load42

load42:                                           ; preds = %body__1.i.i
  %144 = load %Qubit*, %Qubit** %136, align 8
  %145 = load %Qubit*, %Qubit** %139, align 8
  %146 = load %Qubit*, %Qubit** %141, align 8
  br label %quantum39

quantum39:                                        ; preds = %load42
  tail call void @__quantum__qis__h__body(%Qubit* %146)
  tail call void @__quantum__qis__cnot__body(%Qubit* %146, %Qubit* %144)
  tail call void @__quantum__qis__cnot__body(%Qubit* %144, %Qubit* %145)
  tail call void @__quantum__qis__t__body(%Qubit* %145)
  tail call void @__quantum__qis__t__adj(%Qubit* %144)
  tail call void @__quantum__qis__t__body(%Qubit* %146)
  tail call void @__quantum__qis__cnot__body(%Qubit* %146, %Qubit* %144)
  tail call void @__quantum__qis__cnot__body(%Qubit* %144, %Qubit* %145)
  tail call void @__quantum__qis__t__adj(%Qubit* %145)
  tail call void @__quantum__qis__cnot__body(%Qubit* %146, %Qubit* %145)
  tail call void @__quantum__qis__h__body(%Qubit* %146)
  br label %readout41

readout41:                                        ; preds = %quantum39
  br label %post-classical38

post-classical38:                                 ; preds = %readout41
  br label %exit_quantum_grouping40

exit_quantum_grouping40:                          ; preds = %post-classical38
  br i1 %143, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping40, %else__1.i
  %147 = and i64 %numControls.i.i, 1
  %148 = icmp eq i64 %147, 0
  br i1 %148, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %149 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %150 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %149, i64 0)
  %151 = bitcast i8* %150 to %Qubit**
  %152 = add i64 %numControls.i.i, -1
  %153 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %152)
  %154 = bitcast i8* %153 to %Qubit**
  %155 = load %Qubit*, %Qubit** %154, align 8
  store %Qubit* %155, %Qubit** %151, align 8
  %156 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %149)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %156, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %149, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %156, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %156, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %157 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %158 = bitcast %Tuple* %157 to { %Array*, { %Qubit*, %Qubit* }* }*
  %159 = bitcast %Tuple* %157 to %Array**
  %160 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %158, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %132, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %159, align 8
  store { %Qubit*, %Qubit* }* %arg.i.i, { %Qubit*, %Qubit* }** %160, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %122, %Tuple* %157, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping45, %body__2.preheader.i.i
  %161 = phi i64 [ %170, %exit_quantum_grouping45 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %162 = shl nuw i64 %161, 1
  %163 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %162)
  %164 = bitcast i8* %163 to %Qubit**
  %165 = or i64 %162, 1
  %166 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %165)
  %167 = bitcast i8* %166 to %Qubit**
  %168 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %161)
  %169 = bitcast i8* %168 to %Qubit**
  %170 = add i64 %161, -1
  %171 = icmp sgt i64 %170, -1
  br label %load47

load47:                                           ; preds = %body__2.i.i
  %172 = load %Qubit*, %Qubit** %164, align 8
  %173 = load %Qubit*, %Qubit** %167, align 8
  %174 = load %Qubit*, %Qubit** %169, align 8
  br label %quantum44

quantum44:                                        ; preds = %load47
  tail call void @__quantum__qis__h__body(%Qubit* %174)
  tail call void @__quantum__qis__cnot__body(%Qubit* %174, %Qubit* %173)
  tail call void @__quantum__qis__t__body(%Qubit* %173)
  tail call void @__quantum__qis__cnot__body(%Qubit* %172, %Qubit* %173)
  tail call void @__quantum__qis__cnot__body(%Qubit* %174, %Qubit* %172)
  tail call void @__quantum__qis__t__adj(%Qubit* %174)
  tail call void @__quantum__qis__t__body(%Qubit* %172)
  tail call void @__quantum__qis__t__adj(%Qubit* %173)
  tail call void @__quantum__qis__cnot__body(%Qubit* %172, %Qubit* %173)
  tail call void @__quantum__qis__cnot__body(%Qubit* %174, %Qubit* %172)
  tail call void @__quantum__qis__h__body(%Qubit* %174)
  br label %readout46

readout46:                                        ; preds = %quantum44
  br label %post-classical43

post-classical43:                                 ; preds = %readout46
  br label %exit_quantum_grouping45

exit_quantum_grouping45:                          ; preds = %post-classical43
  br i1 %171, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping45, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %132, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %157, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %132, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %127, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

Microsoft__Quantum__Intrinsic__CNOT__ctl.exit:    ; preds = %exit_quantum_grouping, %exit_quantum_grouping35, %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__rz__body(double, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__rx__body(double, %Qubit*) local_unnamed_addr

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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="0" "requiredResults"="0" }

