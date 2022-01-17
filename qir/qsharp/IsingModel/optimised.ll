; ModuleID = 'combined.ll'
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
  %18 = fcmp olt double %16, 0.000000e+00
  %19 = fneg double %16
  %20 = select i1 %18, double %19, double %16
  %21 = fcmp ugt double %20, 1.000000e-15
  %not.isPositive.i.i = xor i1 %17, true
  %narrow.i = and i1 %21, %not.isPositive.i.i
  %22 = sext i1 %narrow.i to i64
  %nSteps2.i = add i64 %22, %truncated.i.i.i
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
  %65 = load %Qubit*, %Qubit** %61, align 8
  %66 = load %Qubit*, %Qubit** %63, align 8
  tail call void @__quantum__qis__rx__body(double %29, %Qubit* %65)
  tail call void @__quantum__qis__rz__body(double %32, %Qubit* %66)
  br i1 %64, label %then0__1.i, label %body__2.exiting__2_crit_edge.i

body__2.exiting__2_crit_edge.i:                   ; preds = %body__2.i
  %.pre.i = add i64 %59, 1
  br label %exiting__2.i

then0__1.i:                                       ; preds = %body__2.i
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

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit, %body__1
  %98 = phi i64 [ %103, %body__1 ], [ 0, %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit ]
  %99 = add i64 %98, %96
  %100 = inttoptr i64 %99 to i8*
  %101 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %98)
  %102 = bitcast i8* %101 to %Result**
  %103 = add i64 %98, 1
  %104 = icmp sgt i64 %103, %97
  %105 = load %Result*, %Result** %102, align 8
  %106 = tail call i1 @__quantum__qis__read_result__body(%Result* %105)
  %107 = sext i1 %106 to i8
  store i8 %107, i8* %100, align 1
  br i1 %104, label %exit__1, label %body__1

exit__1:                                          ; preds = %body__1, %Microsoft__Quantum__Samples__SimulateIsingEvolution__body.1.exit
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
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__qis__rz__body(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to double*
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = fneg double %3
  %5 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__qis__rz__body(double %4, %Qubit* %5)
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
  br i1 %8, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__rz__body(double %theta.i, %Qubit* %qubit.i)
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
  %17 = load %Qubit*, %Qubit** %13, align 8
  %18 = load %Qubit*, %Qubit** %16, align 8
  tail call void @__quantum__qis__rz__body(double %11, %Qubit* %qubit.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %17, %Qubit* %qubit.i)
  tail call void @__quantum__qis__rz__body(double %14, %Qubit* %qubit.i)
  tail call void @__quantum__qis__cnot__body(%Qubit* %18, %Qubit* %qubit.i)
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

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %30 = phi i64 [ %39, %body__1.i.i ], [ 0, %else__1.i ]
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
  %41 = load %Qubit*, %Qubit** %33, align 8
  %42 = load %Qubit*, %Qubit** %36, align 8
  %43 = load %Qubit*, %Qubit** %38, align 8
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
  br i1 %40, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
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

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %58 = phi i64 [ %67, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
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
  %69 = load %Qubit*, %Qubit** %61, align 8
  %70 = load %Qubit*, %Qubit** %64, align 8
  %71 = load %Qubit*, %Qubit** %66, align 8
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
  br i1 %68, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Rz__ctl.exit:      ; preds = %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  %theta.i1 = load double, double* %9, align 8
  %qubit.i2 = load %Qubit*, %Qubit** %10, align 8
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__rz__body(double %theta.i1, %Qubit* %qubit.i2)
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

test1__1.i:                                       ; preds = %entry
  %14 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %15 = icmp eq i64 %14, 1
  br i1 %15, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %16 = fmul double %theta.i1, 5.000000e-01
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = fmul double %theta.i1, -5.000000e-01
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = load %Qubit*, %Qubit** %18, align 8
  %23 = load %Qubit*, %Qubit** %21, align 8
  tail call void @__quantum__qis__rz__body(double %16, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %22, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__rz__body(double %19, %Qubit* %qubit.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %23, %Qubit* %qubit.i2)
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %24 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %24)
  %25 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %26 = bitcast %Tuple* %25 to { %Array*, { double, %Qubit* }* }*
  %27 = bitcast %Tuple* %25 to %Array**
  %28 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %26, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %29 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %30 = bitcast %Tuple* %29 to { double, %Qubit* }*
  %31 = bitcast %Tuple* %29 to double*
  %32 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %30, i64 0, i32 1
  store double %theta.i1, double* %31, align 8
  store %Qubit* %qubit.i2, %Qubit** %32, align 8
  store %Array* %3, %Array** %27, align 8
  %33 = bitcast { double, %Qubit* }** %28 to %Tuple**
  store %Tuple* %29, %Tuple** %33, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %24, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %24, i32 1)
  %controls.i.i = load %Array*, %Array** %27, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { double, %Qubit* }*, { double, %Qubit* }** %28, align 8
  %34 = bitcast { double, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %34, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %35 = phi i64 [ %44, %body__1.i.i ], [ 0, %else__1.i ]
  %36 = shl nuw i64 %35, 1
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %36)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = or i64 %36, 1
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %39)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %35)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = add nuw nsw i64 %35, 1
  %45 = icmp slt i64 %44, %numControlPairs.i.i
  %46 = load %Qubit*, %Qubit** %38, align 8
  %47 = load %Qubit*, %Qubit** %41, align 8
  %48 = load %Qubit*, %Qubit** %43, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %48)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %46)
  tail call void @__quantum__qis__cnot__body(%Qubit* %46, %Qubit* %47)
  tail call void @__quantum__qis__t__body(%Qubit* %47)
  tail call void @__quantum__qis__t__adj(%Qubit* %46)
  tail call void @__quantum__qis__t__body(%Qubit* %48)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %46)
  tail call void @__quantum__qis__cnot__body(%Qubit* %46, %Qubit* %47)
  tail call void @__quantum__qis__t__adj(%Qubit* %47)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %47)
  tail call void @__quantum__qis__h__body(%Qubit* %48)
  br i1 %45, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %49 = and i64 %numControls.i.i, 1
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %51 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %51, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = add i64 %numControls.i.i, -1
  %55 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %54)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = load %Qubit*, %Qubit** %56, align 8
  store %Qubit* %57, %Qubit** %53, align 8
  %58 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %51)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %51, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %58, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %59 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %60 = bitcast %Tuple* %59 to { %Array*, { double, %Qubit* }* }*
  %61 = bitcast %Tuple* %59 to %Array**
  %62 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %60, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %34, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %61, align 8
  store { double, %Qubit* }* %arg.i.i, { double, %Qubit* }** %62, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %24, %Tuple* %59, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %63 = phi i64 [ %72, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %64 = shl nuw i64 %63, 1
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %64)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = or i64 %64, 1
  %68 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %67)
  %69 = bitcast i8* %68 to %Qubit**
  %70 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %63)
  %71 = bitcast i8* %70 to %Qubit**
  %72 = add i64 %63, -1
  %73 = icmp sgt i64 %72, -1
  %74 = load %Qubit*, %Qubit** %66, align 8
  %75 = load %Qubit*, %Qubit** %69, align 8
  %76 = load %Qubit*, %Qubit** %71, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %76)
  tail call void @__quantum__qis__cnot__body(%Qubit* %76, %Qubit* %75)
  tail call void @__quantum__qis__t__body(%Qubit* %75)
  tail call void @__quantum__qis__cnot__body(%Qubit* %74, %Qubit* %75)
  tail call void @__quantum__qis__cnot__body(%Qubit* %76, %Qubit* %74)
  tail call void @__quantum__qis__t__adj(%Qubit* %76)
  tail call void @__quantum__qis__t__body(%Qubit* %74)
  tail call void @__quantum__qis__t__adj(%Qubit* %75)
  tail call void @__quantum__qis__cnot__body(%Qubit* %74, %Qubit* %75)
  tail call void @__quantum__qis__cnot__body(%Qubit* %76, %Qubit* %74)
  tail call void @__quantum__qis__h__body(%Qubit* %76)
  br i1 %73, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %34, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %59, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %24, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %24, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %34, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %24, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %24, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Rz__ctl.exit

Microsoft__Quantum__Intrinsic__Rz__ctl.exit:      ; preds = %Microsoft__Quantum__Intrinsic___fa53eabec5ee419a9f43e6773090ac38___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Qubit**
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %3, %Qubit* %4)
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
  br i1 %8, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__cnot__body(%Qubit* %control.i, %Qubit* %target.i)
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
  %20 = load %Qubit*, %Qubit** %12, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %target.i)
  store %Qubit* %20, %Qubit** %15, align 8
  store %Qubit* %control.i, %Qubit** %17, align 8
  br i1 %19, label %quantum7, label %test1__1.i.i

quantum7:                                         ; preds = %then1__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %target.i)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %then1__1.i
  %21 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %13)
  %22 = icmp eq i64 %21, 1
  br i1 %22, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = load %Qubit*, %Qubit** %24, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %25, %Qubit* %target.i)
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
  %controls.i.i.i = load %Array*, %Array** %70, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %71, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %else__1.i.i, %body__1.i.i.i
  %72 = phi i64 [ %81, %body__1.i.i.i ], [ 0, %else__1.i.i ]
  %73 = shl nuw i64 %72, 1
  %74 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %73)
  %75 = bitcast i8* %74 to %Qubit**
  %76 = or i64 %73, 1
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %76)
  %78 = bitcast i8* %77 to %Qubit**
  %79 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %72)
  %80 = bitcast i8* %79 to %Qubit**
  %81 = add nuw nsw i64 %72, 1
  %82 = icmp slt i64 %81, %numControlPairs.i.i.i
  %83 = load %Qubit*, %Qubit** %75, align 8
  %84 = load %Qubit*, %Qubit** %78, align 8
  %85 = load %Qubit*, %Qubit** %80, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %85)
  tail call void @__quantum__qis__cnot__body(%Qubit* %85, %Qubit* %83)
  tail call void @__quantum__qis__cnot__body(%Qubit* %83, %Qubit* %84)
  tail call void @__quantum__qis__t__body(%Qubit* %84)
  tail call void @__quantum__qis__t__adj(%Qubit* %83)
  tail call void @__quantum__qis__t__body(%Qubit* %85)
  tail call void @__quantum__qis__cnot__body(%Qubit* %85, %Qubit* %83)
  tail call void @__quantum__qis__cnot__body(%Qubit* %83, %Qubit* %84)
  tail call void @__quantum__qis__t__adj(%Qubit* %84)
  tail call void @__quantum__qis__cnot__body(%Qubit* %85, %Qubit* %84)
  tail call void @__quantum__qis__h__body(%Qubit* %85)
  br i1 %82, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i.i, %else__1.i.i
  %86 = and i64 %numControls.i.i.i, 1
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %88 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %89 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %88, i64 0)
  %90 = bitcast i8* %89 to %Qubit**
  %91 = add i64 %numControls.i.i.i, -1
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %91)
  %93 = bitcast i8* %92 to %Qubit**
  %94 = load %Qubit*, %Qubit** %93, align 8
  store %Qubit* %94, %Qubit** %90, align 8
  %95 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %88)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %95, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %88, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %95, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %95, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %96 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %97 = bitcast %Tuple* %96 to { %Array*, %Qubit* }*
  %98 = bitcast %Tuple* %96 to %Array**
  %99 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %97, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %98, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %99, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %67, %Tuple* %96, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.i.i.i, %body__2.preheader.i.i.i
  %100 = phi i64 [ %109, %body__2.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %101 = shl nuw i64 %100, 1
  %102 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %101)
  %103 = bitcast i8* %102 to %Qubit**
  %104 = or i64 %101, 1
  %105 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %104)
  %106 = bitcast i8* %105 to %Qubit**
  %107 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %100)
  %108 = bitcast i8* %107 to %Qubit**
  %109 = add i64 %100, -1
  %110 = icmp sgt i64 %109, -1
  %111 = load %Qubit*, %Qubit** %103, align 8
  %112 = load %Qubit*, %Qubit** %106, align 8
  %113 = load %Qubit*, %Qubit** %108, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %113)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %112)
  tail call void @__quantum__qis__t__body(%Qubit* %112)
  tail call void @__quantum__qis__cnot__body(%Qubit* %111, %Qubit* %112)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %111)
  tail call void @__quantum__qis__t__adj(%Qubit* %113)
  tail call void @__quantum__qis__t__body(%Qubit* %111)
  tail call void @__quantum__qis__t__adj(%Qubit* %112)
  tail call void @__quantum__qis__cnot__body(%Qubit* %111, %Qubit* %112)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %111)
  tail call void @__quantum__qis__h__body(%Qubit* %113)
  br i1 %110, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %body__2.i.i.i, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %96, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %67, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %68, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %then2__1.i.i, %then1__1.i.i, %quantum7
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  tail call void @__quantum__qis__h__body(%Qubit* %target.i)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %114 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %114)
  %115 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %116 = bitcast %Tuple* %115 to { %Array*, { %Qubit*, %Qubit* }* }*
  %117 = bitcast %Tuple* %115 to %Array**
  %118 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %116, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %119 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %120 = bitcast %Tuple* %119 to { %Qubit*, %Qubit* }*
  %121 = bitcast %Tuple* %119 to %Qubit**
  %122 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %120, i64 0, i32 1
  store %Qubit* %control.i, %Qubit** %121, align 8
  store %Qubit* %target.i, %Qubit** %122, align 8
  store %Array* %3, %Array** %117, align 8
  %123 = bitcast { %Qubit*, %Qubit* }** %118 to %Tuple**
  store %Tuple* %119, %Tuple** %123, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %114, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %114, i32 1)
  %controls.i.i = load %Array*, %Array** %117, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %118, align 8
  %124 = bitcast { %Qubit*, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %124, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %125 = phi i64 [ %134, %body__1.i.i ], [ 0, %else__1.i ]
  %126 = shl nuw i64 %125, 1
  %127 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %126)
  %128 = bitcast i8* %127 to %Qubit**
  %129 = or i64 %126, 1
  %130 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %129)
  %131 = bitcast i8* %130 to %Qubit**
  %132 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %125)
  %133 = bitcast i8* %132 to %Qubit**
  %134 = add nuw nsw i64 %125, 1
  %135 = icmp slt i64 %134, %numControlPairs.i.i
  %136 = load %Qubit*, %Qubit** %128, align 8
  %137 = load %Qubit*, %Qubit** %131, align 8
  %138 = load %Qubit*, %Qubit** %133, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %138)
  tail call void @__quantum__qis__cnot__body(%Qubit* %138, %Qubit* %136)
  tail call void @__quantum__qis__cnot__body(%Qubit* %136, %Qubit* %137)
  tail call void @__quantum__qis__t__body(%Qubit* %137)
  tail call void @__quantum__qis__t__adj(%Qubit* %136)
  tail call void @__quantum__qis__t__body(%Qubit* %138)
  tail call void @__quantum__qis__cnot__body(%Qubit* %138, %Qubit* %136)
  tail call void @__quantum__qis__cnot__body(%Qubit* %136, %Qubit* %137)
  tail call void @__quantum__qis__t__adj(%Qubit* %137)
  tail call void @__quantum__qis__cnot__body(%Qubit* %138, %Qubit* %137)
  tail call void @__quantum__qis__h__body(%Qubit* %138)
  br i1 %135, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %139 = and i64 %numControls.i.i, 1
  %140 = icmp eq i64 %139, 0
  br i1 %140, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %141 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %142 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %141, i64 0)
  %143 = bitcast i8* %142 to %Qubit**
  %144 = add i64 %numControls.i.i, -1
  %145 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %144)
  %146 = bitcast i8* %145 to %Qubit**
  %147 = load %Qubit*, %Qubit** %146, align 8
  store %Qubit* %147, %Qubit** %143, align 8
  %148 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %141)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %148, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %141, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %148, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %148, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %149 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %150 = bitcast %Tuple* %149 to { %Array*, { %Qubit*, %Qubit* }* }*
  %151 = bitcast %Tuple* %149 to %Array**
  %152 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %150, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %124, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %151, align 8
  store { %Qubit*, %Qubit* }* %arg.i.i, { %Qubit*, %Qubit* }** %152, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %114, %Tuple* %149, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %153 = phi i64 [ %162, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %154 = shl nuw i64 %153, 1
  %155 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %154)
  %156 = bitcast i8* %155 to %Qubit**
  %157 = or i64 %154, 1
  %158 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %157)
  %159 = bitcast i8* %158 to %Qubit**
  %160 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %153)
  %161 = bitcast i8* %160 to %Qubit**
  %162 = add i64 %153, -1
  %163 = icmp sgt i64 %162, -1
  %164 = load %Qubit*, %Qubit** %156, align 8
  %165 = load %Qubit*, %Qubit** %159, align 8
  %166 = load %Qubit*, %Qubit** %161, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %166, %Qubit* %165)
  tail call void @__quantum__qis__t__body(%Qubit* %165)
  tail call void @__quantum__qis__cnot__body(%Qubit* %164, %Qubit* %165)
  tail call void @__quantum__qis__cnot__body(%Qubit* %166, %Qubit* %164)
  tail call void @__quantum__qis__t__adj(%Qubit* %166)
  tail call void @__quantum__qis__t__body(%Qubit* %164)
  tail call void @__quantum__qis__t__adj(%Qubit* %165)
  tail call void @__quantum__qis__cnot__body(%Qubit* %164, %Qubit* %165)
  tail call void @__quantum__qis__cnot__body(%Qubit* %166, %Qubit* %164)
  tail call void @__quantum__qis__h__body(%Qubit* %166)
  br i1 %163, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %124, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %149, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %114, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %114, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %124, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %114, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %114, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %119, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %115, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

Microsoft__Quantum__Intrinsic__CNOT__ctl.exit:    ; preds = %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i, %quantum
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
  %control.i1 = load %Qubit*, %Qubit** %9, align 8
  %target.i2 = load %Qubit*, %Qubit** %10, align 8
  %11 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__cnot__body(%Qubit* %control.i1, %Qubit* %target.i2)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

test1__1.i:                                       ; preds = %entry
  %13 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %14 = icmp eq i64 %13, 1
  br i1 %14, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %21 = bitcast i8* %20 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 1)
  %22 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %17)
  %23 = icmp eq i64 %22, 0
  %24 = load %Qubit*, %Qubit** %16, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %target.i2)
  store %Qubit* %24, %Qubit** %19, align 8
  store %Qubit* %control.i1, %Qubit** %21, align 8
  br i1 %23, label %quantum9, label %test1__1.i.i

quantum9:                                         ; preds = %then1__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %target.i2)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %then1__1.i
  %25 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %17)
  %26 = icmp eq i64 %25, 1
  br i1 %26, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %29, %Qubit* %target.i2)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %30 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %17)
  %31 = icmp eq i64 %30, 2
  br i1 %31, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 1)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 0)
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
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i2, %Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %62, %Qubit* %target.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %63, %Qubit* %64)
  tail call void @__quantum__qis__t__body(%Qubit* %target.i2)
  tail call void @__quantum__qis__t__adj(%Qubit* %65)
  tail call void @__quantum__qis__cnot__body(%Qubit* %66, %Qubit* %target.i2)
  tail call void @__quantum__qis__cnot__body(%Qubit* %target.i2, %Qubit* %67)
  tail call void @__quantum__qis__t__adj(%Qubit* %target.i2)
  tail call void @__quantum__qis__t__body(%Qubit* %68)
  tail call void @__quantum__qis__cnot__body(%Qubit* %69, %Qubit* %70)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %71 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %71)
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %73 = bitcast %Tuple* %72 to { %Array*, %Qubit* }*
  %74 = bitcast %Tuple* %72 to %Array**
  %75 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %73, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 1)
  store %Array* %17, %Array** %74, align 8
  store %Qubit* %target.i2, %Qubit** %75, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %71, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %71, i32 1)
  %controls.i.i.i = load %Array*, %Array** %74, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %75, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %else__1.i.i, %body__1.i.i.i
  %76 = phi i64 [ %85, %body__1.i.i.i ], [ 0, %else__1.i.i ]
  %77 = shl nuw i64 %76, 1
  %78 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %77)
  %79 = bitcast i8* %78 to %Qubit**
  %80 = or i64 %77, 1
  %81 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %80)
  %82 = bitcast i8* %81 to %Qubit**
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %76)
  %84 = bitcast i8* %83 to %Qubit**
  %85 = add nuw nsw i64 %76, 1
  %86 = icmp slt i64 %85, %numControlPairs.i.i.i
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
  br i1 %86, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i.i, %else__1.i.i
  %90 = and i64 %numControls.i.i.i, 1
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %92 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %92, i64 0)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = add i64 %numControls.i.i.i, -1
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %95)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = load %Qubit*, %Qubit** %97, align 8
  store %Qubit* %98, %Qubit** %94, align 8
  %99 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %92)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %99, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %92, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %99, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %99, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %100 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %101 = bitcast %Tuple* %100 to { %Array*, %Qubit* }*
  %102 = bitcast %Tuple* %100 to %Array**
  %103 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %101, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %102, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %103, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %71, %Tuple* %100, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.i.i.i, %body__2.preheader.i.i.i
  %104 = phi i64 [ %113, %body__2.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %105 = shl nuw i64 %104, 1
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %105)
  %107 = bitcast i8* %106 to %Qubit**
  %108 = or i64 %105, 1
  %109 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %108)
  %110 = bitcast i8* %109 to %Qubit**
  %111 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %104)
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
  br i1 %114, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %body__2.i.i.i, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %100, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %71, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %then2__1.i.i, %then1__1.i.i, %quantum9
  tail call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  tail call void @__quantum__qis__h__body(%Qubit* %target.i2)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %118 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %118)
  %119 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %120 = bitcast %Tuple* %119 to { %Array*, { %Qubit*, %Qubit* }* }*
  %121 = bitcast %Tuple* %119 to %Array**
  %122 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %120, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Qubit*, %Qubit* }*
  %125 = bitcast %Tuple* %123 to %Qubit**
  %126 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %124, i64 0, i32 1
  store %Qubit* %control.i1, %Qubit** %125, align 8
  store %Qubit* %target.i2, %Qubit** %126, align 8
  store %Array* %3, %Array** %121, align 8
  %127 = bitcast { %Qubit*, %Qubit* }** %122 to %Tuple**
  store %Tuple* %123, %Tuple** %127, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %118, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %118, i32 1)
  %controls.i.i = load %Array*, %Array** %121, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %122, align 8
  %128 = bitcast { %Qubit*, %Qubit* }* %arg.i.i to %Tuple*
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %128, i32 1)
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %129 = phi i64 [ %138, %body__1.i.i ], [ 0, %else__1.i ]
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
  %140 = load %Qubit*, %Qubit** %132, align 8
  %141 = load %Qubit*, %Qubit** %135, align 8
  %142 = load %Qubit*, %Qubit** %137, align 8
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
  br i1 %139, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
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
  %154 = bitcast %Tuple* %153 to { %Array*, { %Qubit*, %Qubit* }* }*
  %155 = bitcast %Tuple* %153 to %Array**
  %156 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %154, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %128, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %155, align 8
  store { %Qubit*, %Qubit* }* %arg.i.i, { %Qubit*, %Qubit* }** %156, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %118, %Tuple* %153, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %157 = phi i64 [ %166, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
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
  %168 = load %Qubit*, %Qubit** %160, align 8
  %169 = load %Qubit*, %Qubit** %163, align 8
  %170 = load %Qubit*, %Qubit** %165, align 8
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
  br i1 %167, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %128, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %153, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %118, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %118, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %128, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %118, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %118, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %119, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__CNOT__ctl.exit

Microsoft__Quantum__Intrinsic__CNOT__ctl.exit:    ; preds = %Microsoft__Quantum__Intrinsic___bed903825ebe4b3383638e7d6b3c31be___QsRef23__ApplyWithLessControlsA____body.exit.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
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
  %2 = load %Qubit*, %Qubit** %0, align 8
  %3 = tail call %Result* @__quantum__qis__m__body(%Qubit* %2)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* %3, %Result** %1, align 8
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___c063b9da7f1f4338ad3ac7f95f893606___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="0" "requiredResults"="0" }
