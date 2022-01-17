; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Result = type opaque

@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Samples__T__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Samples__T__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]

define { i64, i8* }* @Microsoft__Quantum__Samples__SampleRandomNumber__Interop() local_unnamed_addr #0 {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %2 = add i64 %1, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  %.not1.i.i = icmp slt i64 %2, 0
  br i1 %.not1.i.i, label %Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %idxQubit2.i.i = phi i64 [ %8, %body__1.i.i ], [ 0, %entry ]
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* null, i64 %idxQubit2.i.i)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  %6 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %7 = bitcast %Tuple* %6 to %Qubit**
  store %Qubit* %5, %Qubit** %7, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %0, %Tuple* %6, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  %8 = add i64 %idxQubit2.i.i, 1
  %.not.i.i = icmp sgt i64 %8, %2
  br i1 %.not.i.i, label %Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i, label %body__1.i.i

Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i: ; preds = %body__1.i.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  %9 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__T__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %9, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %9, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %10 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %11 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %10)
  %12 = add i64 %10, -1
  %.not2.i.i = icmp slt i64 %12, 0
  br i1 %.not2.i.i, label %exit__1.i.i, label %body__1.i2.i

body__1.i2.i:                                     ; preds = %Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i, %body__1.i2.i
  %13 = phi i64 [ %16, %body__1.i2.i ], [ 0, %Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i ]
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %11, i64 %13)
  %15 = bitcast i8* %14 to i64*
  store i64 0, i64* %15, align 4
  %16 = add i64 %13, 1
  %.not.i1.i = icmp sgt i64 %16, %12
  br i1 %.not.i1.i, label %exit__1.i.i, label %body__1.i2.i

exit__1.i.i:                                      ; preds = %body__1.i2.i, %Microsoft__Quantum__Canon___0a8bf928e69a4981838a504f7d348636_ApplyToEachA__body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %11, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %17 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %18 = add i64 %17, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  %.not13.i.i = icmp slt i64 %18, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i, label %body__2.i.i

body__2.i.i:                                      ; preds = %exit__1.i.i, %body__2.i.i
  %19 = phi %Array* [ %20, %body__2.i.i ], [ %11, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %31, %body__2.i.i ], [ 0, %exit__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %19, i32 -1)
  %20 = tail call %Array* @__quantum__rt__array_copy(%Array* %19, i1 false)
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* null, i64 %idxElement4.i.i)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = load %Qubit*, %Qubit** %22, align 8
  %24 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %25 = bitcast %Tuple* %24 to %Qubit**
  store %Qubit* %23, %Qubit** %25, align 8
  %26 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %9, %Tuple* %24, %Tuple* %26)
  %27 = bitcast %Tuple* %26 to i64*
  %28 = load i64, i64* %27, align 4
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %20, i64 %idxElement4.i.i)
  %30 = bitcast i8* %29 to i64*
  store i64 %28, i64* %30, align 4
  tail call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %19, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %26, i32 -1)
  %31 = add i64 %idxElement4.i.i, 1
  %.not1.i3.i = icmp sgt i64 %31, %18
  br i1 %.not1.i3.i, label %Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i, label %body__2.i.i

Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i: ; preds = %body__2.i.i, %exit__1.i.i
  %.lcssa.i.i = phi %Array* [ %11, %exit__1.i.i ], [ %20, %body__2.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 1)
  %32 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %33 = tail call %Result* @__quantum__rt__result_get_zero()
  %34 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %34)
  %36 = add i64 %34, -1
  %.not2.i1.i = icmp slt i64 %36, 0
  br i1 %.not2.i1.i, label %exit__1.i5.i, label %body__1.i3.i

body__1.i3.i:                                     ; preds = %Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i, %body__1.i3.i
  %37 = phi i64 [ %40, %body__1.i3.i ], [ 0, %Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i ]
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 %37)
  %39 = bitcast i8* %38 to %Result**
  store %Result* %33, %Result** %39, align 8
  %40 = add i64 %37, 1
  %.not.i2.i = icmp sgt i64 %40, %36
  br i1 %.not.i2.i, label %exit__1.i5.i, label %body__1.i3.i

exit__1.i5.i:                                     ; preds = %body__1.i3.i, %Microsoft__Quantum__Arrays___c8ec7162809243358e7c013c92fb00fd_ForEach__body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %35, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %41 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %42 = add i64 %41, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  %.not13.i4.i = icmp slt i64 %42, 0
  br i1 %.not13.i4.i, label %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i, label %body__2.i8.i

body__2.i8.i:                                     ; preds = %exit__1.i5.i, %body__2.i8.i
  %43 = phi %Array* [ %44, %body__2.i8.i ], [ %35, %exit__1.i5.i ]
  %idxElement4.i6.i = phi i64 [ %55, %body__2.i8.i ], [ 0, %exit__1.i5.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %43, i32 -1)
  %44 = tail call %Array* @__quantum__rt__array_copy(%Array* %43, i1 false)
  %45 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* null, i64 %idxElement4.i6.i)
  %46 = bitcast i8* %45 to %Qubit**
  %47 = load %Qubit*, %Qubit** %46, align 8
  %48 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %49 = bitcast %Tuple* %48 to %Qubit**
  store %Qubit* %47, %Qubit** %49, align 8
  %50 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %32, %Tuple* %48, %Tuple* %50)
  %51 = bitcast %Tuple* %50 to %Result**
  %52 = load %Result*, %Result** %51, align 8
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %44, i64 %idxElement4.i6.i)
  %54 = bitcast i8* %53 to %Result**
  store %Result* %52, %Result** %54, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %44, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %43, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %55 = add i64 %idxElement4.i6.i, 1
  %.not1.i7.i = icmp sgt i64 %55, %42
  br i1 %.not1.i7.i, label %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i, label %body__2.i8.i

Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i: ; preds = %body__2.i8.i, %exit__1.i5.i
  %.lcssa.i9.i = phi %Array* [ %35, %exit__1.i5.i ], [ %44, %body__2.i8.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i9.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i9.i, i32 1)
  %56 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %57 = tail call %Result* @__quantum__rt__result_get_zero()
  %58 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %59 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %58)
  %60 = add i64 %58, -1
  %.not2.i10.i = icmp slt i64 %60, 0
  br i1 %.not2.i10.i, label %exit__1.i14.i, label %body__1.i12.i

body__1.i12.i:                                    ; preds = %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i, %body__1.i12.i
  %61 = phi i64 [ %64, %body__1.i12.i ], [ 0, %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i ]
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %59, i64 %61)
  %63 = bitcast i8* %62 to %Result**
  store %Result* %57, %Result** %63, align 8
  %64 = add i64 %61, 1
  %.not.i11.i = icmp sgt i64 %64, %60
  br i1 %.not.i11.i, label %exit__1.i14.i, label %body__1.i12.i

exit__1.i14.i:                                    ; preds = %body__1.i12.i, %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.2.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %59, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 1)
  %65 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %66 = add i64 %65, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  %.not13.i13.i = icmp slt i64 %66, 0
  br i1 %.not13.i13.i, label %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i, label %body__2.i17.i

body__2.i17.i:                                    ; preds = %exit__1.i14.i, %body__2.i17.i
  %67 = phi %Array* [ %68, %body__2.i17.i ], [ %59, %exit__1.i14.i ]
  %idxElement4.i15.i = phi i64 [ %79, %body__2.i17.i ], [ 0, %exit__1.i14.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %67, i32 -1)
  %68 = tail call %Array* @__quantum__rt__array_copy(%Array* %67, i1 false)
  %69 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* null, i64 %idxElement4.i15.i)
  %70 = bitcast i8* %69 to %Qubit**
  %71 = load %Qubit*, %Qubit** %70, align 8
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %73 = bitcast %Tuple* %72 to %Qubit**
  store %Qubit* %71, %Qubit** %73, align 8
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %56, %Tuple* %72, %Tuple* %74)
  %75 = bitcast %Tuple* %74 to %Result**
  %76 = load %Result*, %Result** %75, align 8
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %68, i64 %idxElement4.i15.i)
  %78 = bitcast i8* %77 to %Result**
  store %Result* %76, %Result** %78, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %68, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %67, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  %79 = add i64 %idxElement4.i15.i, 1
  %.not1.i16.i = icmp sgt i64 %79, %66
  br i1 %.not1.i16.i, label %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i, label %body__2.i17.i

Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i: ; preds = %body__2.i17.i, %exit__1.i14.i
  %.lcssa.i18.i = phi %Array* [ %59, %exit__1.i14.i ], [ %68, %body__2.i17.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i18.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* null, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i9.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %32, i32 -1)
  %80 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i9.i)
  %81 = add i64 %80, -1
  %.not4.i = icmp slt i64 %81, 0
  br i1 %.not4.i, label %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i, %body__1.i
  %82 = phi i64 [ %84, %body__1.i ], [ 0, %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i ]
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i9.i, i64 %82)
  %84 = add i64 %82, 1
  %.not.i = icmp sgt i64 %84, %81
  br i1 %.not.i, label %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, label %body__1.i

Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit: ; preds = %body__1.i, %Microsoft__Quantum__Arrays___88526f5f84b4458bac21cec18cd20b1b_ForEach__body.3.exit.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i9.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %56, i32 -1)
  %85 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i18.i)
  %86 = tail call i8* @__quantum__rt__memory_allocate(i64 %85)
  %87 = ptrtoint i8* %86 to i64
  %88 = add i64 %85, -1
  %.not4 = icmp slt i64 %88, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, %body__1
  %89 = phi i64 [ %94, %body__1 ], [ 0, %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit ]
  %90 = add i64 %89, %87
  %91 = inttoptr i64 %90 to i8*
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i18.i, i64 %89)
  %93 = bitcast i8* %92 to %Result**
  %94 = add i64 %89, 1
  %95 = icmp sgt i64 %94, %88
  %96 = load %Result*, %Result** %93, align 8
  %97 = tail call i1 @__quantum__qis__read_result__body(%Result* %96)
  %98 = sext i1 %97 to i8
  store i8 %98, i8* %91, align 1
  br i1 %95, label %exit__1, label %body__1

exit__1:                                          ; preds = %body__1, %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit
  %99 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %100 = bitcast i8* %99 to i64*
  store i64 %85, i64* %100, align 4
  %101 = getelementptr i8, i8* %99, i64 8
  %102 = bitcast i8* %101 to i8**
  store i8* %86, i8** %102, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %103 = phi i64 [ %105, %body__2 ], [ 0, %exit__1 ]
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i18.i, i64 %103)
  %105 = add i64 %103, 1
  %.not3 = icmp sgt i64 %105, %88
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %106 = bitcast i8* %99 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i18.i, i32 -1)
  ret { i64, i8* }* %106
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

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32) local_unnamed_addr

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare %Array* @__quantum__rt__array_copy(%Array*, i1) local_unnamed_addr

declare %Tuple* @__quantum__rt__tuple_create(i64) local_unnamed_addr

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32) local_unnamed_addr

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

; Function Attrs: nofree norecurse nounwind writeonly
define internal void @Microsoft__Quantum__Samples__T__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readnone %arg-tuple, %Tuple* nocapture %result-tuple) #1 {
entry:
  %0 = bitcast %Tuple* %result-tuple to i64*
  store i64 0, i64* %0, align 4
  ret void
}

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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___49316b57a7f7472d8cfc103f19b77b12___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="5" "requiredResults"="0" }
attributes #1 = { nofree norecurse nounwind writeonly }
