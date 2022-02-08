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
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qs.i)
  %2 = add i64 %1, -1
  %.not1.i.i = icmp slt i64 %2, 0
  br i1 %.not1.i.i, label %Microsoft__Quantum__Canon___38ce689f5c84457e96edff37f309161d_ApplyToEach__body.exit.i, label %body__1.i.i

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
  br i1 %.not.i.i, label %Microsoft__Quantum__Canon___38ce689f5c84457e96edff37f309161d_ApplyToEach__body.exit.i, label %body__1.i.i

Microsoft__Quantum__Canon___38ce689f5c84457e96edff37f309161d_ApplyToEach__body.exit.i: ; preds = %body__1.i.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
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

body__1.lr.ph.i:                                  ; preds = %Microsoft__Quantum__Canon___38ce689f5c84457e96edff37f309161d_ApplyToEach__body.exit.i
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

exit__1.i:                                        ; preds = %exit__2.i, %Microsoft__Quantum__Canon___38ce689f5c84457e96edff37f309161d_ApplyToEach__body.exit.i
  %35 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %35, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %35, i32 1)
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
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qs.i)
  %45 = add i64 %44, -1
  %.not13.i.i = icmp slt i64 %45, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit, label %body__2.i.i

body__2.i.i:                                      ; preds = %exit__1.i.i, %body__2.i.i
  %46 = phi %Array* [ %47, %body__2.i.i ], [ %38, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %58, %body__2.i.i ], [ 0, %exit__1.i.i ]
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %3, { double, %Qubit* }* %4)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %3, { double, %Qubit* }* %8)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %ctls, { double, %Qubit* }* nocapture readonly %0) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__rz__body(double %theta, %Qubit* %qubit)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = fmul double %theta, 5.000000e-01
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = fmul double %theta, -5.000000e-01
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %12 = bitcast i8* %11 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1
  %13 = load %Qubit*, %Qubit** %9, align 8
  %14 = load %Qubit*, %Qubit** %12, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__rz__body(double %7, %Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %13, %Qubit* %qubit)
  tail call void @__quantum__qis__rz__body(double %10, %Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %14, %Qubit* %qubit)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %15 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %15)
  %16 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %17 = bitcast %Tuple* %16 to { %Array*, { double, %Qubit* }* }*
  %18 = bitcast %Tuple* %16 to %Array**
  %19 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %17, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { double, %Qubit* }*
  %22 = bitcast %Tuple* %20 to double*
  %23 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %21, i64 0, i32 1
  store double %theta, double* %22, align 8
  store %Qubit* %qubit, %Qubit** %23, align 8
  store %Array* %ctls, %Array** %18, align 8
  %24 = bitcast { double, %Qubit* }** %19 to %Tuple**
  store %Tuple* %20, %Tuple** %24, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %15, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %15, i32 1)
  %controls.i = load %Array*, %Array** %18, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 1)
  %arg.i = load { double, %Qubit* }*, { double, %Qubit* }** %19, align 8
  %25 = bitcast { double, %Qubit* }* %arg.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %25, i32 1)
  %numControls.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i)
  %numControlPairs.i = sdiv i64 %numControls.i, 2
  %temps.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 1)
  %.not.not1.i = icmp sgt i64 %numControls.i, 1
  br i1 %.not.not1.i, label %body__1.i, label %exit__1.i

body__1.i:                                        ; preds = %else__1, %body__1.i
  %__qsVar0__numPair__2.i = phi i64 [ %37, %body__1.i ], [ 0, %else__1 ]
  %26 = shl nuw i64 %__qsVar0__numPair__2.i, 1
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %26)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  %30 = or i64 %26, 1
  %31 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %30)
  %32 = bitcast i8* %31 to %Qubit**
  %33 = load %Qubit*, %Qubit** %32, align 8
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %__qsVar0__numPair__2.i)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %29, %Qubit* %33, %Qubit* %36)
  %37 = add nuw nsw i64 %__qsVar0__numPair__2.i, 1
  %.not.not.i = icmp slt i64 %37, %numControlPairs.i
  br i1 %.not.not.i, label %body__1.i, label %exit__1.i

exit__1.i:                                        ; preds = %body__1.i, %else__1
  %38 = and i64 %numControls.i, 1
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %condTrue__1.i, label %condFalse__1.i

condTrue__1.i:                                    ; preds = %exit__1.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i, i32 1)
  br label %condContinue__1.i

condFalse__1.i:                                   ; preds = %exit__1.i
  %40 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %41 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %40, i64 0)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = add i64 %numControls.i, -1
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %43)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  store %Qubit* %46, %Qubit** %42, align 8
  %47 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i, %Array* %40)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 -1)
  br label %condContinue__1.i

condContinue__1.i:                                ; preds = %condFalse__1.i, %condTrue__1.i
  %__qsVar1__newControls__.i = phi %Array* [ %temps.i, %condTrue__1.i ], [ %47, %condFalse__1.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 1)
  %48 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %49 = bitcast %Tuple* %48 to { %Array*, { double, %Qubit* }* }*
  %50 = bitcast %Tuple* %48 to %Array**
  %51 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %49, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 1)
  store %Array* %__qsVar1__newControls__.i, %Array** %50, align 8
  store { double, %Qubit* }* %arg.i, { double, %Qubit* }** %51, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %15, %Tuple* %48, %Tuple* null)
  br i1 %.not.not1.i, label %body__2.preheader.i, label %Microsoft__Quantum__Intrinsic___10ab1f395dec445aa3a9324db394884d___QsRef23__ApplyWithLessControlsA____body.exit

body__2.preheader.i:                              ; preds = %condContinue__1.i
  %__qsVar0____qsVar0__numPair____3.i = add nsw i64 %numControlPairs.i, -1
  br label %body__2.i

body__2.i:                                        ; preds = %body__2.i, %body__2.preheader.i
  %__qsVar0____qsVar0__numPair____4.i = phi i64 [ %__qsVar0____qsVar0__numPair____.i, %body__2.i ], [ %__qsVar0____qsVar0__numPair____3.i, %body__2.preheader.i ]
  %52 = shl nuw i64 %__qsVar0____qsVar0__numPair____4.i, 1
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %52)
  %54 = bitcast i8* %53 to %Qubit**
  %55 = load %Qubit*, %Qubit** %54, align 8
  %56 = or i64 %52, 1
  %57 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %56)
  %58 = bitcast i8* %57 to %Qubit**
  %59 = load %Qubit*, %Qubit** %58, align 8
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %__qsVar0____qsVar0__numPair____4.i)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = load %Qubit*, %Qubit** %61, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %55, %Qubit* %59, %Qubit* %62)
  %__qsVar0____qsVar0__numPair____.i = add i64 %__qsVar0____qsVar0__numPair____4.i, -1
  %63 = icmp sgt i64 %__qsVar0____qsVar0__numPair____.i, -1
  br i1 %63, label %body__2.i, label %Microsoft__Quantum__Intrinsic___10ab1f395dec445aa3a9324db394884d___QsRef23__ApplyWithLessControlsA____body.exit

Microsoft__Quantum__Intrinsic___10ab1f395dec445aa3a9324db394884d___QsRef23__ApplyWithLessControlsA____body.exit: ; preds = %body__2.i, %condContinue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %25, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %20, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %16, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %Microsoft__Quantum__Intrinsic___10ab1f395dec445aa3a9324db394884d___QsRef23__ApplyWithLessControlsA____body.exit, %exit_quantum_grouping3, %exit_quantum_grouping
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) unnamed_addr {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control1)
  tail call void @__quantum__qis__cnot__body(%Qubit* %control1, %Qubit* %control2)
  tail call void @__quantum__qis__t__body(%Qubit* %control2)
  tail call void @__quantum__qis__t__adj(%Qubit* %control1)
  tail call void @__quantum__qis__t__body(%Qubit* %target)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control1)
  tail call void @__quantum__qis__cnot__body(%Qubit* %control1, %Qubit* %control2)
  tail call void @__quantum__qis__t__adj(%Qubit* %control2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control2)
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

define internal fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) unnamed_addr {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control2)
  tail call void @__quantum__qis__t__body(%Qubit* %control2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %control1, %Qubit* %control2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control1)
  tail call void @__quantum__qis__t__adj(%Qubit* %target)
  tail call void @__quantum__qis__t__body(%Qubit* %control1)
  tail call void @__quantum__qis__t__adj(%Qubit* %control2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %control1, %Qubit* %control2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target, %Qubit* %control1)
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %3, { %Qubit*, %Qubit* }* %4)
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %3, { %Qubit*, %Qubit* }* %8)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %ctls, { %Qubit*, %Qubit* }* nocapture readonly %0) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %10 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %9, i64 0)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %9, i64 1)
  %13 = bitcast i8* %12 to %Qubit**
  tail call void @__quantum__rt__array_update_reference_count(%Array* %9, i32 -1)
  br label %load5

load5:                                            ; preds = %then1__1
  %14 = load %Qubit*, %Qubit** %8, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  store %Qubit* %14, %Qubit** %11, align 8
  store %Qubit* %control, %Qubit** %13, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %9, %Qubit* %target)
  tail call void @__quantum__qis__h__body(%Qubit* %target)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %15 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %15)
  %16 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %17 = bitcast %Tuple* %16 to { %Array*, { %Qubit*, %Qubit* }* }*
  %18 = bitcast %Tuple* %16 to %Array**
  %19 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %17, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %20 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %21 = bitcast %Tuple* %20 to { %Qubit*, %Qubit* }*
  %22 = bitcast %Tuple* %20 to %Qubit**
  %23 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %21, i64 0, i32 1
  store %Qubit* %control, %Qubit** %22, align 8
  store %Qubit* %target, %Qubit** %23, align 8
  store %Array* %ctls, %Array** %18, align 8
  %24 = bitcast { %Qubit*, %Qubit* }** %19 to %Tuple**
  store %Tuple* %20, %Tuple** %24, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %15, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %15, i32 1)
  %controls.i = load %Array*, %Array** %18, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 1)
  %arg.i = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %19, align 8
  %25 = bitcast { %Qubit*, %Qubit* }* %arg.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %25, i32 1)
  %numControls.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i)
  %numControlPairs.i = sdiv i64 %numControls.i, 2
  %temps.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 1)
  %.not.not1.i = icmp sgt i64 %numControls.i, 1
  br i1 %.not.not1.i, label %body__1.i, label %exit__1.i

body__1.i:                                        ; preds = %else__1, %body__1.i
  %__qsVar0__numPair__2.i = phi i64 [ %37, %body__1.i ], [ 0, %else__1 ]
  %26 = shl nuw i64 %__qsVar0__numPair__2.i, 1
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %26)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  %30 = or i64 %26, 1
  %31 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %30)
  %32 = bitcast i8* %31 to %Qubit**
  %33 = load %Qubit*, %Qubit** %32, align 8
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %__qsVar0__numPair__2.i)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %29, %Qubit* %33, %Qubit* %36)
  %37 = add nuw nsw i64 %__qsVar0__numPair__2.i, 1
  %.not.not.i = icmp slt i64 %37, %numControlPairs.i
  br i1 %.not.not.i, label %body__1.i, label %exit__1.i

exit__1.i:                                        ; preds = %body__1.i, %else__1
  %38 = and i64 %numControls.i, 1
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %condTrue__1.i, label %condFalse__1.i

condTrue__1.i:                                    ; preds = %exit__1.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i, i32 1)
  br label %condContinue__1.i

condFalse__1.i:                                   ; preds = %exit__1.i
  %40 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %41 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %40, i64 0)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = add i64 %numControls.i, -1
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %43)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  store %Qubit* %46, %Qubit** %42, align 8
  %47 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i, %Array* %40)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %40, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 -1)
  br label %condContinue__1.i

condContinue__1.i:                                ; preds = %condFalse__1.i, %condTrue__1.i
  %__qsVar1__newControls__.i = phi %Array* [ %temps.i, %condTrue__1.i ], [ %47, %condFalse__1.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 1)
  %48 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %49 = bitcast %Tuple* %48 to { %Array*, { %Qubit*, %Qubit* }* }*
  %50 = bitcast %Tuple* %48 to %Array**
  %51 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %49, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 1)
  store %Array* %__qsVar1__newControls__.i, %Array** %50, align 8
  store { %Qubit*, %Qubit* }* %arg.i, { %Qubit*, %Qubit* }** %51, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %15, %Tuple* %48, %Tuple* null)
  br i1 %.not.not1.i, label %body__2.preheader.i, label %Microsoft__Quantum__Intrinsic___85ba2cf1f4c24fa88ade23d096a277df___QsRef23__ApplyWithLessControlsA____body.exit

body__2.preheader.i:                              ; preds = %condContinue__1.i
  %__qsVar0____qsVar0__numPair____3.i = add nsw i64 %numControlPairs.i, -1
  br label %body__2.i

body__2.i:                                        ; preds = %body__2.i, %body__2.preheader.i
  %__qsVar0____qsVar0__numPair____4.i = phi i64 [ %__qsVar0____qsVar0__numPair____.i, %body__2.i ], [ %__qsVar0____qsVar0__numPair____3.i, %body__2.preheader.i ]
  %52 = shl nuw i64 %__qsVar0____qsVar0__numPair____4.i, 1
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %52)
  %54 = bitcast i8* %53 to %Qubit**
  %55 = load %Qubit*, %Qubit** %54, align 8
  %56 = or i64 %52, 1
  %57 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %56)
  %58 = bitcast i8* %57 to %Qubit**
  %59 = load %Qubit*, %Qubit** %58, align 8
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %__qsVar0____qsVar0__numPair____4.i)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = load %Qubit*, %Qubit** %61, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %55, %Qubit* %59, %Qubit* %62)
  %__qsVar0____qsVar0__numPair____.i = add i64 %__qsVar0____qsVar0__numPair____4.i, -1
  %63 = icmp sgt i64 %__qsVar0____qsVar0__numPair____.i, -1
  br i1 %63, label %body__2.i, label %Microsoft__Quantum__Intrinsic___85ba2cf1f4c24fa88ade23d096a277df___QsRef23__ApplyWithLessControlsA____body.exit

Microsoft__Quantum__Intrinsic___85ba2cf1f4c24fa88ade23d096a277df___QsRef23__ApplyWithLessControlsA____body.exit: ; preds = %body__2.i, %condContinue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %25, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %15, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %20, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %16, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %Microsoft__Quantum__Intrinsic___85ba2cf1f4c24fa88ade23d096a277df___QsRef23__ApplyWithLessControlsA____body.exit, %exit_quantum_grouping3, %exit_quantum_grouping
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %qubit)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1
  %6 = load %Qubit*, %Qubit** %5, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cz__body(%Qubit* %6, %Qubit* %qubit)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  br label %load10

load10:                                           ; preds = %then2__1
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
  br label %quantum7

quantum7:                                         ; preds = %load10
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
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic___cec6821853ab4801896825d36eaec618___QsRef23__ApplyWithLessControlsA____body(%Callable* %48, { %Array*, %Qubit* }* %50)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %49, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %exit_quantum_grouping8, %exit_quantum_grouping3, %exit_quantum_grouping
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*) local_unnamed_addr

define internal fastcc void @Microsoft__Quantum__Intrinsic___cec6821853ab4801896825d36eaec618___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, %Qubit* }* nocapture readonly %0) unnamed_addr {
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
  %__qsVar0__numPair__2 = phi i64 [ %14, %body__1 ], [ 0, %entry ]
  %3 = shl nuw i64 %__qsVar0__numPair__2, 1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %3)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  %7 = or i64 %3, 1
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %7)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0__numPair__2)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %6, %Qubit* %10, %Qubit* %13)
  %14 = add nuw nsw i64 %__qsVar0__numPair__2, 1
  %.not.not = icmp slt i64 %14, %numControlPairs
  br i1 %.not.not, label %body__1, label %exit__1

exit__1:                                          ; preds = %body__1, %entry
  %15 = and i64 %numControls, 1
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %17 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = add i64 %numControls, -1
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = load %Qubit*, %Qubit** %22, align 8
  store %Qubit* %23, %Qubit** %19, align 8
  %24 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps, %Array* %17)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %24, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %24, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1__newControls__ = phi %Array* [ %temps, %condTrue__1 ], [ %24, %condFalse__1 ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 1)
  %25 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %26 = bitcast %Tuple* %25 to { %Array*, %Qubit* }*
  %27 = bitcast %Tuple* %25 to %Array**
  %28 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %26, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 1)
  store %Array* %__qsVar1__newControls__, %Array** %27, align 8
  store %Qubit* %arg, %Qubit** %28, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %25, %Tuple* null)
  br i1 %.not.not1, label %body__2.preheader, label %exit__2

body__2.preheader:                                ; preds = %condContinue__1
  %__qsVar0____qsVar0__numPair____3 = add nsw i64 %numControlPairs, -1
  br label %body__2

body__2:                                          ; preds = %body__2.preheader, %body__2
  %__qsVar0____qsVar0__numPair____4 = phi i64 [ %__qsVar0____qsVar0__numPair____, %body__2 ], [ %__qsVar0____qsVar0__numPair____3, %body__2.preheader ]
  %29 = shl nuw i64 %__qsVar0____qsVar0__numPair____4, 1
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %29)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = load %Qubit*, %Qubit** %31, align 8
  %33 = or i64 %29, 1
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %33)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0____qsVar0__numPair____4)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %32, %Qubit* %36, %Qubit* %39)
  %__qsVar0____qsVar0__numPair____ = add i64 %__qsVar0____qsVar0__numPair____4, -1
  %40 = icmp sgt i64 %__qsVar0____qsVar0__numPair____, -1
  br i1 %40, label %body__2, label %exit__2

exit__2:                                          ; preds = %body__2, %condContinue__1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

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
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1
  %6 = load %Qubit*, %Qubit** %5, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__s__body(%Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  tail call void @__quantum__qis__t__body(%Qubit* %qubit)
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %qubit)
  tail call void @__quantum__qis__t__adj(%Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  tail call void @__quantum__qis__s__adj(%Qubit* %qubit)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic___cec6821853ab4801896825d36eaec618___QsRef23__ApplyWithLessControlsA____body(%Callable* %7, { %Array*, %Qubit* }* %9)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %exit_quantum_grouping3, %exit_quantum_grouping
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="0" "requiredResults"="0" }

