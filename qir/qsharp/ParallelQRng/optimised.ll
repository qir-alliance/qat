; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Tuple = type opaque
%Callable = type opaque
%Array = type opaque
%Qubit = type opaque
%Result = type opaque

@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Samples__T__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Samples__T__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]

define { i64, i8* }* @Microsoft__Quantum__Samples__SampleRandomNumber__Interop() local_unnamed_addr #0 {
entry:
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %2 = add i64 %1, -1
  %.not1.i.i = icmp slt i64 %2, 0
  br i1 %.not1.i.i, label %Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i, label %body__1.i.i

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
  br i1 %.not.i.i, label %Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i, label %body__1.i.i

Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i: ; preds = %body__1.i.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
  %9 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__T__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %9, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %9, i32 1)
  %10 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %11 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %10)
  %12 = add i64 %10, -1
  %.not2.i.i = icmp slt i64 %12, 0
  br i1 %.not2.i.i, label %exit__1.i.i, label %body__1.i2.i

body__1.i2.i:                                     ; preds = %Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i, %body__1.i2.i
  %13 = phi i64 [ %16, %body__1.i2.i ], [ 0, %Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i ]
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %11, i64 %13)
  %15 = bitcast i8* %14 to i64*
  store i64 0, i64* %15, align 4
  %16 = add i64 %13, 1
  %.not.i1.i = icmp sgt i64 %16, %12
  br i1 %.not.i1.i, label %exit__1.i.i, label %body__1.i2.i

exit__1.i.i:                                      ; preds = %body__1.i2.i, %Microsoft__Quantum__Canon___9ab6574cc947415c85233726e97899a8_ApplyToEachA__body.exit.i
  %17 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %18 = add i64 %17, -1
  %.not13.i.i = icmp slt i64 %18, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i, label %body__2.i.i

body__2.i.i:                                      ; preds = %exit__1.i.i, %body__2.i.i
  %19 = phi %Array* [ %20, %body__2.i.i ], [ %11, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %31, %body__2.i.i ], [ 0, %exit__1.i.i ]
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
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %26, i32 -1)
  %31 = add i64 %idxElement4.i.i, 1
  %.not1.i3.i = icmp sgt i64 %31, %18
  br i1 %.not1.i3.i, label %Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i, label %body__2.i.i

Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i: ; preds = %body__2.i.i, %exit__1.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %9, i32 -1)
  %32 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 1)
  %33 = tail call %Result* @__quantum__rt__result_get_zero()
  %34 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %34)
  %36 = add i64 %34, -1
  %.not2.i1.i = icmp slt i64 %36, 0
  br i1 %.not2.i1.i, label %exit__1.i5.i, label %body__1.i3.i

body__1.i3.i:                                     ; preds = %Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i, %body__1.i3.i
  %37 = phi i64 [ %40, %body__1.i3.i ], [ 0, %Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i ]
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 %37)
  %39 = bitcast i8* %38 to %Result**
  store %Result* %33, %Result** %39, align 8
  %40 = add i64 %37, 1
  %.not.i2.i = icmp sgt i64 %40, %36
  br i1 %.not.i2.i, label %exit__1.i5.i, label %body__1.i3.i

exit__1.i5.i:                                     ; preds = %body__1.i3.i, %Microsoft__Quantum__Arrays___8aa921325fee4d6c90d1f2e862e57a2c_ForEach__body.exit.i
  %41 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %42 = add i64 %41, -1
  %.not13.i4.i = icmp slt i64 %42, 0
  br i1 %.not13.i4.i, label %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i, label %body__2.i8.i

body__2.i8.i:                                     ; preds = %exit__1.i5.i, %body__2.i8.i
  %43 = phi %Array* [ %44, %body__2.i8.i ], [ %35, %exit__1.i5.i ]
  %idxElement4.i6.i = phi i64 [ %55, %body__2.i8.i ], [ 0, %exit__1.i5.i ]
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
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %55 = add i64 %idxElement4.i6.i, 1
  %.not1.i7.i = icmp sgt i64 %55, %42
  br i1 %.not1.i7.i, label %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i, label %body__2.i8.i

Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i: ; preds = %body__2.i8.i, %exit__1.i5.i
  %.lcssa.i.i = phi %Array* [ %35, %exit__1.i5.i ], [ %44, %body__2.i8.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %32, i32 -1)
  %56 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 1)
  %57 = tail call %Result* @__quantum__rt__result_get_zero()
  %58 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %59 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %58)
  %60 = add i64 %58, -1
  %.not2.i9.i = icmp slt i64 %60, 0
  br i1 %.not2.i9.i, label %exit__1.i13.i, label %body__1.i11.i

body__1.i11.i:                                    ; preds = %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i, %body__1.i11.i
  %61 = phi i64 [ %64, %body__1.i11.i ], [ 0, %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i ]
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %59, i64 %61)
  %63 = bitcast i8* %62 to %Result**
  store %Result* %57, %Result** %63, align 8
  %64 = add i64 %61, 1
  %.not.i10.i = icmp sgt i64 %64, %60
  br i1 %.not.i10.i, label %exit__1.i13.i, label %body__1.i11.i

exit__1.i13.i:                                    ; preds = %body__1.i11.i, %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.2.exit.i
  %65 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* null)
  %66 = add i64 %65, -1
  %.not13.i12.i = icmp slt i64 %66, 0
  br i1 %.not13.i12.i, label %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i, label %body__2.i16.i

body__2.i16.i:                                    ; preds = %exit__1.i13.i, %body__2.i16.i
  %67 = phi %Array* [ %68, %body__2.i16.i ], [ %59, %exit__1.i13.i ]
  %idxElement4.i14.i = phi i64 [ %79, %body__2.i16.i ], [ 0, %exit__1.i13.i ]
  %68 = tail call %Array* @__quantum__rt__array_copy(%Array* %67, i1 false)
  %69 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* null, i64 %idxElement4.i14.i)
  %70 = bitcast i8* %69 to %Qubit**
  %71 = load %Qubit*, %Qubit** %70, align 8
  %72 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %73 = bitcast %Tuple* %72 to %Qubit**
  store %Qubit* %71, %Qubit** %73, align 8
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %56, %Tuple* %72, %Tuple* %74)
  %75 = bitcast %Tuple* %74 to %Result**
  %76 = load %Result*, %Result** %75, align 8
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %68, i64 %idxElement4.i14.i)
  %78 = bitcast i8* %77 to %Result**
  store %Result* %76, %Result** %78, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  %79 = add i64 %idxElement4.i14.i, 1
  %.not1.i15.i = icmp sgt i64 %79, %66
  br i1 %.not1.i15.i, label %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i, label %body__2.i16.i

Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i: ; preds = %body__2.i16.i, %exit__1.i13.i
  %.lcssa.i17.i = phi %Array* [ %59, %exit__1.i13.i ], [ %68, %body__2.i16.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %9, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %32, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %32, i32 -1)
  %80 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i)
  %81 = add i64 %80, -1
  %.not4.i = icmp slt i64 %81, 0
  br i1 %.not4.i, label %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i, %body__1.i
  %82 = phi i64 [ %84, %body__1.i ], [ 0, %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i ]
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %82)
  %84 = add i64 %82, 1
  %.not.i = icmp sgt i64 %84, %81
  br i1 %.not.i, label %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, label %body__1.i

Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit: ; preds = %body__1.i, %Microsoft__Quantum__Arrays___df78952fb02542debc194e912a864bed_ForEach__body.3.exit.i
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %56, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %56, i32 -1)
  %85 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i17.i)
  %86 = tail call i8* @__quantum__rt__memory_allocate(i64 %85)
  %87 = ptrtoint i8* %86 to i64
  %88 = add i64 %85, -1
  %.not4 = icmp slt i64 %88, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit, %body__1
  %89 = phi i64 [ %94, %body__1 ], [ 0, %Microsoft__Quantum__Samples__SampleRandomNumber__body.1.exit ]
  %90 = add i64 %89, %87
  %91 = inttoptr i64 %90 to i8*
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i17.i, i64 %89)
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
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i17.i, i64 %103)
  %105 = add i64 %103, 1
  %.not3 = icmp sgt i64 %105, %88
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %106 = bitcast i8* %99 to { i64, i8* }*
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
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %7, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %7, i32 1)
  %controls.i = load %Array*, %Array** %10, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 1)
  %arg.i = load %Qubit*, %Qubit** %11, align 8
  %numControls.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i)
  %numControlPairs.i = sdiv i64 %numControls.i, 2
  %temps.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 1)
  %.not.not1.i = icmp sgt i64 %numControls.i, 1
  br i1 %.not.not1.i, label %body__1.i, label %exit__1.i

body__1.i:                                        ; preds = %else__1, %body__1.i
  %12 = phi i64 [ %21, %body__1.i ], [ 0, %else__1 ]
  %13 = shl nuw i64 %12, 1
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %13)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = or i64 %13, 1
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %16)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %12)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = add nuw nsw i64 %12, 1
  %22 = icmp slt i64 %21, %numControlPairs.i
  %23 = load %Qubit*, %Qubit** %15, align 8
  %24 = load %Qubit*, %Qubit** %18, align 8
  %25 = load %Qubit*, %Qubit** %20, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %25)
  tail call void @__quantum__qis__cnot__body(%Qubit* %25, %Qubit* %23)
  tail call void @__quantum__qis__cnot__body(%Qubit* %23, %Qubit* %24)
  tail call void @__quantum__qis__t__body(%Qubit* %24)
  tail call void @__quantum__qis__t__adj(%Qubit* %23)
  tail call void @__quantum__qis__t__body(%Qubit* %25)
  tail call void @__quantum__qis__cnot__body(%Qubit* %25, %Qubit* %23)
  tail call void @__quantum__qis__cnot__body(%Qubit* %23, %Qubit* %24)
  tail call void @__quantum__qis__t__adj(%Qubit* %24)
  tail call void @__quantum__qis__cnot__body(%Qubit* %25, %Qubit* %24)
  tail call void @__quantum__qis__h__body(%Qubit* %25)
  br i1 %22, label %body__1.i, label %exit__1.i

exit__1.i:                                        ; preds = %body__1.i, %else__1
  %26 = and i64 %numControls.i, 1
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %condTrue__1.i, label %condFalse__1.i

condTrue__1.i:                                    ; preds = %exit__1.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i, i32 1)
  br label %condContinue__1.i

condFalse__1.i:                                   ; preds = %exit__1.i
  %28 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %28, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = add i64 %numControls.i, -1
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %31)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  store %Qubit* %34, %Qubit** %30, align 8
  %35 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i, %Array* %28)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 -1)
  br label %condContinue__1.i

condContinue__1.i:                                ; preds = %condFalse__1.i, %condTrue__1.i
  %__qsVar1__newControls__.i = phi %Array* [ %temps.i, %condTrue__1.i ], [ %35, %condFalse__1.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 1)
  %36 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %37 = bitcast %Tuple* %36 to { %Array*, %Qubit* }*
  %38 = bitcast %Tuple* %36 to %Array**
  %39 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %37, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 1)
  store %Array* %__qsVar1__newControls__.i, %Array** %38, align 8
  store %Qubit* %arg.i, %Qubit** %39, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %7, %Tuple* %36, %Tuple* null)
  br i1 %.not.not1.i, label %body__2.preheader.i, label %Microsoft__Quantum__Intrinsic___39c4c69246f74f58bd1ae3f69e5948c0___QsRef23__ApplyWithLessControlsA____body.exit

body__2.preheader.i:                              ; preds = %condContinue__1.i
  %__qsVar0____qsVar0__numPair____3.i = add nsw i64 %numControlPairs.i, -1
  br label %body__2.i

body__2.i:                                        ; preds = %body__2.i, %body__2.preheader.i
  %40 = phi i64 [ %49, %body__2.i ], [ %__qsVar0____qsVar0__numPair____3.i, %body__2.preheader.i ]
  %41 = shl nuw i64 %40, 1
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %41)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = or i64 %41, 1
  %45 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i, i64 %44)
  %46 = bitcast i8* %45 to %Qubit**
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i, i64 %40)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = add i64 %40, -1
  %50 = icmp sgt i64 %49, -1
  %51 = load %Qubit*, %Qubit** %43, align 8
  %52 = load %Qubit*, %Qubit** %46, align 8
  %53 = load %Qubit*, %Qubit** %48, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %53)
  tail call void @__quantum__qis__cnot__body(%Qubit* %53, %Qubit* %52)
  tail call void @__quantum__qis__t__body(%Qubit* %52)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  tail call void @__quantum__qis__cnot__body(%Qubit* %53, %Qubit* %51)
  tail call void @__quantum__qis__t__adj(%Qubit* %53)
  tail call void @__quantum__qis__t__body(%Qubit* %51)
  tail call void @__quantum__qis__t__adj(%Qubit* %52)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  tail call void @__quantum__qis__cnot__body(%Qubit* %53, %Qubit* %51)
  tail call void @__quantum__qis__h__body(%Qubit* %53)
  br i1 %50, label %body__2.i, label %Microsoft__Quantum__Intrinsic___39c4c69246f74f58bd1ae3f69e5948c0___QsRef23__ApplyWithLessControlsA____body.exit

Microsoft__Quantum__Intrinsic___39c4c69246f74f58bd1ae3f69e5948c0___QsRef23__ApplyWithLessControlsA____body.exit: ; preds = %body__2.i, %condContinue__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %36, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %Microsoft__Quantum__Intrinsic___39c4c69246f74f58bd1ae3f69e5948c0___QsRef23__ApplyWithLessControlsA____body.exit, %then1__1, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
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
