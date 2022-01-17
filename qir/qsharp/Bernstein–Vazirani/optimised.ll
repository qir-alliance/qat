; ModuleID = 'combined.ll'
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
  tail call void @llvm.assume(i1 %0)
  %2 = icmp sgt i64 %patternInt, -1
  tail call void @llvm.assume(i1 %2)
  %3 = tail call double @llvm.powi.f64(double 2.000000e+00, i32 %1)
  %4 = fptosi double %3 to i64
  %5 = icmp sgt i64 %4, %patternInt
  tail call void @llvm.assume(i1 %5)
  %6 = tail call %Array* @__quantum__rt__array_create_1d(i32 1, i64 %nQubits)
  %.not.not6.not.i.i = icmp eq i64 %nQubits, 0
  br i1 %.not.not6.not.i.i, label %exit__2.critedge.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %7 = phi i64 [ %10, %body__1.i.i ], [ 0, %entry ]
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 %7)
  %9 = bitcast i8* %8 to i1*
  store i1 false, i1* %9, align 1
  %10 = add nuw nsw i64 %7, 1
  %.not.not.i.i = icmp ult i64 %10, %nQubits
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
  %.not3.not.i.i = icmp ult i64 %19, %nQubits
  tail call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 -1)
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

exit__2.critedge.i.i:                             ; preds = %entry
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %6, i32 -1)
  br label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %exit__2.critedge.i.i
  %20 = phi %Array* [ %6, %exit__2.critedge.i.i ], [ %13, %body__2.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 1)
  %21 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %22 = bitcast %Tuple* %21 to { %Callable*, %Array* }*
  %23 = bitcast %Tuple* %21 to %Callable**
  %24 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %22, i64 0, i32 1
  %25 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Tets__Samples__BernVaz__ParityOperationImpl__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %20, i32 1)
  store %Callable* %25, %Callable** %23, align 8
  store %Array* %20, %Array** %24, align 8
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %21)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 1)
  %27 = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  %28 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %28, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %28, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  %29 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %27)
  %30 = add i64 %29, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %31 = icmp slt i64 %30, 0
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br i1 %31, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i, %body__1.i.i.i
  %idxQubit2.i.i.i = phi i64 [ %37, %body__1.i.i.i ], [ 0, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i ]
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %27, i64 %idxQubit2.i.i.i)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  %35 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %36 = bitcast %Tuple* %35 to %Qubit**
  store %Qubit* %34, %Qubit** %36, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %28, %Tuple* %35, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %35, i32 -1)
  %37 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %37, %30
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i.i.i, %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %28, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %28, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %38 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %39 = bitcast %Tuple* %38 to { %Array*, %Qubit* }*
  %40 = bitcast %Tuple* %38 to %Array**
  %41 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %39, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 1)
  store %Array* %27, %Array** %40, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %26, %Tuple* %38, %Tuple* null)
  %42 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %42, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %42, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  %43 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %27)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %44 = add i64 %43, -1
  %45 = icmp sgt i64 %44, -1
  tail call void @__quantum__qis__h__body(%Qubit* null)
  store %Qubit* null, %Qubit** %41, align 8
  br i1 %45, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i

body__1.i1.i.i:                                   ; preds = %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i, %body__1.i1.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i1.i.i ], [ %44, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i ]
  %46 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %42, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %46, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %46)
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %27, i64 %__qsVar0__idxQubit__2.i.i.i)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = load %Qubit*, %Qubit** %48, align 8
  %50 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %51 = bitcast %Tuple* %50 to %Qubit**
  store %Qubit* %49, %Qubit** %51, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %46, %Tuple* %50, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %46, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %46, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %52 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %52, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i1.i.i, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__body.exit.i.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %42, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %42, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %53 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  %54 = tail call %Result* @__quantum__rt__result_get_zero()
  %55 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %27)
  %56 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %55)
  %57 = add i64 %55, -1
  %.not2.i.i.i = icmp slt i64 %57, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

body__1.i3.i.i:                                   ; preds = %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i, %body__1.i3.i.i
  %58 = phi i64 [ %61, %body__1.i3.i.i ], [ 0, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i ]
  %59 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %56, i64 %58)
  %60 = bitcast i8* %59 to %Result**
  store %Result* %54, %Result** %60, align 8
  %61 = add i64 %58, 1
  %.not.i2.i.i = icmp sgt i64 %61, %57
  br i1 %.not.i2.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i3.i.i, %Microsoft__Quantum__Canon___95f05b9df7ab409981bcaee38787a22c_ApplyToEachA__adj.exit.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %56, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 1)
  %62 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %27)
  %63 = add i64 %62, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  %.not13.i.i.i = icmp slt i64 %63, 0
  br i1 %.not13.i.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %64 = phi %Array* [ %65, %body__2.i.i.i ], [ %56, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %76, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %64, i32 -1)
  %65 = tail call %Array* @__quantum__rt__array_copy(%Array* %64, i1 false)
  %66 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %27, i64 %idxElement4.i.i.i)
  %67 = bitcast i8* %66 to %Qubit**
  %68 = load %Qubit*, %Qubit** %67, align 8
  %69 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %70 = bitcast %Tuple* %69 to %Qubit**
  store %Qubit* %68, %Qubit** %70, align 8
  %71 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %69, %Tuple* %71)
  %72 = bitcast %Tuple* %71 to %Result**
  %73 = load %Result*, %Result** %72, align 8
  %74 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %65, i64 %idxElement4.i.i.i)
  %75 = bitcast i8* %74 to %Result**
  store %Result* %73, %Result** %75, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %65, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %64, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %69, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %71, i32 -1)
  %76 = add i64 %idxElement4.i.i.i, 1
  %.not1.i4.i.i = icmp sgt i64 %76, %63
  br i1 %.not1.i4.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %56, %exit__1.i.i.i ], [ %65, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %27, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %28, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %28, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %38, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %42, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %42, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %27)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %20, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %26, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %26, i32 -1)
  %77 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %78 = tail call i8* @__quantum__rt__memory_allocate(i64 %77)
  %79 = ptrtoint i8* %78 to i64
  %80 = add i64 %77, -1
  %.not4 = icmp slt i64 %80, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, %body__1
  %81 = phi i64 [ %86, %body__1 ], [ 0, %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit ]
  %82 = add i64 %81, %79
  %83 = inttoptr i64 %82 to i8*
  %84 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %81)
  %85 = bitcast i8* %84 to %Result**
  %86 = add i64 %81, 1
  %87 = icmp sgt i64 %86, %80
  %88 = load %Result*, %Result** %85, align 8
  %89 = tail call i1 @__quantum__qis__read_result__body(%Result* %88)
  %90 = sext i1 %89 to i8
  store i8 %90, i8* %83, align 1
  br i1 %87, label %exit__1, label %body__1

exit__1:                                          ; preds = %body__1, %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit
  %91 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %92 = bitcast i8* %91 to i64*
  store i64 %77, i64* %92, align 4
  %93 = getelementptr i8, i8* %91, i64 8
  %94 = bitcast i8* %93 to i8**
  store i8* %78, i8** %94, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %95 = phi i64 [ %97, %body__2 ], [ 0, %exit__1 ]
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %95)
  %97 = add i64 %95, 1
  %.not3 = icmp sgt i64 %97, %80
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %98 = bitcast i8* %91 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i.i, i32 -1)
  ret { i64, i8* }* %98
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
  tail call void @__quantum__qis__mz__body(%Qubit* %2, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* null, %Result** %1, align 8
  ret void
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %55, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %then1__1.i, %quantum
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
  %52 = phi i64 [ %223, %exiting__1.i ], [ 0, %Microsoft__Quantum__Arrays___5152295299a747e8b17ea27e2189c69a_Zip__body.exit.i ]
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
  br i1 %62, label %quantum, label %test1__1.i

quantum:                                          ; preds = %then0__2.i
  tail call void @__quantum__qis__x__body(%Qubit* %6)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %then0__2.i
  %63 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %58)
  %64 = icmp eq i64 %63, 1
  br i1 %64, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %58, i64 0)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = load %Qubit*, %Qubit** %66, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %67, %Qubit* %6)
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
  %81 = load %Qubit*, %Qubit** %71, align 8
  %82 = load %Qubit*, %Qubit** %73, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %6)
  store %Qubit* %81, %Qubit** %76, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  br i1 %80, label %quantum20, label %test1__1.i.i

quantum20:                                        ; preds = %then2__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %6)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %then2__1.i
  %83 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %74)
  %84 = icmp eq i64 %83, 1
  br i1 %84, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %74, i64 0)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = load %Qubit*, %Qubit** %86, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %87, %Qubit* %6)
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
  %controls.i.i.i = load %Array*, %Array** %132, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %133, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i6, label %exit__1.i.i.i

body__1.i.i.i6:                                   ; preds = %else__1.i.i, %body__1.i.i.i6
  %134 = phi i64 [ %143, %body__1.i.i.i6 ], [ 0, %else__1.i.i ]
  %135 = shl nuw i64 %134, 1
  %136 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %135)
  %137 = bitcast i8* %136 to %Qubit**
  %138 = or i64 %135, 1
  %139 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %138)
  %140 = bitcast i8* %139 to %Qubit**
  %141 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %134)
  %142 = bitcast i8* %141 to %Qubit**
  %143 = add nuw nsw i64 %134, 1
  %144 = icmp slt i64 %143, %numControlPairs.i.i.i
  %145 = load %Qubit*, %Qubit** %137, align 8
  %146 = load %Qubit*, %Qubit** %140, align 8
  %147 = load %Qubit*, %Qubit** %142, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %147)
  tail call void @__quantum__qis__cnot__body(%Qubit* %147, %Qubit* %145)
  tail call void @__quantum__qis__cnot__body(%Qubit* %145, %Qubit* %146)
  tail call void @__quantum__qis__t__body(%Qubit* %146)
  tail call void @__quantum__qis__t__adj(%Qubit* %145)
  tail call void @__quantum__qis__t__body(%Qubit* %147)
  tail call void @__quantum__qis__cnot__body(%Qubit* %147, %Qubit* %145)
  tail call void @__quantum__qis__cnot__body(%Qubit* %145, %Qubit* %146)
  tail call void @__quantum__qis__t__adj(%Qubit* %146)
  tail call void @__quantum__qis__cnot__body(%Qubit* %147, %Qubit* %146)
  tail call void @__quantum__qis__h__body(%Qubit* %147)
  br i1 %144, label %body__1.i.i.i6, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i.i6, %else__1.i.i
  %148 = and i64 %numControls.i.i.i, 1
  %149 = icmp eq i64 %148, 0
  br i1 %149, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %150 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %151 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %150, i64 0)
  %152 = bitcast i8* %151 to %Qubit**
  %153 = add i64 %numControls.i.i.i, -1
  %154 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %153)
  %155 = bitcast i8* %154 to %Qubit**
  %156 = load %Qubit*, %Qubit** %155, align 8
  store %Qubit* %156, %Qubit** %152, align 8
  %157 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %150)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %157, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %150, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %157, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %157, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %158 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %159 = bitcast %Tuple* %158 to { %Array*, %Qubit* }*
  %160 = bitcast %Tuple* %158 to %Array**
  %161 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %159, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %160, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %161, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %129, %Tuple* %158, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i7

body__2.i.i.i7:                                   ; preds = %body__2.i.i.i7, %body__2.preheader.i.i.i
  %162 = phi i64 [ %171, %body__2.i.i.i7 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %163 = shl nuw i64 %162, 1
  %164 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %163)
  %165 = bitcast i8* %164 to %Qubit**
  %166 = or i64 %163, 1
  %167 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %166)
  %168 = bitcast i8* %167 to %Qubit**
  %169 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %162)
  %170 = bitcast i8* %169 to %Qubit**
  %171 = add i64 %162, -1
  %172 = icmp sgt i64 %171, -1
  %173 = load %Qubit*, %Qubit** %165, align 8
  %174 = load %Qubit*, %Qubit** %168, align 8
  %175 = load %Qubit*, %Qubit** %170, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %175)
  tail call void @__quantum__qis__cnot__body(%Qubit* %175, %Qubit* %174)
  tail call void @__quantum__qis__t__body(%Qubit* %174)
  tail call void @__quantum__qis__cnot__body(%Qubit* %173, %Qubit* %174)
  tail call void @__quantum__qis__cnot__body(%Qubit* %175, %Qubit* %173)
  tail call void @__quantum__qis__t__adj(%Qubit* %175)
  tail call void @__quantum__qis__t__body(%Qubit* %173)
  tail call void @__quantum__qis__t__adj(%Qubit* %174)
  tail call void @__quantum__qis__cnot__body(%Qubit* %173, %Qubit* %174)
  tail call void @__quantum__qis__cnot__body(%Qubit* %175, %Qubit* %173)
  tail call void @__quantum__qis__h__body(%Qubit* %175)
  br i1 %172, label %body__2.i.i.i7, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %body__2.i.i.i7, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %158, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %129, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %130, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %then2__1.i.i, %then1__1.i.i, %quantum20
  tail call void @__quantum__rt__array_update_alias_count(%Array* %74, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %74, i32 -1)
  tail call void @__quantum__qis__h__body(%Qubit* %6)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %176 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %176)
  %177 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %178 = bitcast %Tuple* %177 to { %Array*, %Qubit* }*
  %179 = bitcast %Tuple* %177 to %Array**
  %180 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %178, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 1)
  store %Array* %58, %Array** %179, align 8
  store %Qubit* %6, %Qubit** %180, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %176, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %176, i32 1)
  %controls.i.i = load %Array*, %Array** %179, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %180, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %else__1.i, %body__1.i.i
  %181 = phi i64 [ %190, %body__1.i.i ], [ 0, %else__1.i ]
  %182 = shl nuw i64 %181, 1
  %183 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %182)
  %184 = bitcast i8* %183 to %Qubit**
  %185 = or i64 %182, 1
  %186 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %185)
  %187 = bitcast i8* %186 to %Qubit**
  %188 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %181)
  %189 = bitcast i8* %188 to %Qubit**
  %190 = add nuw nsw i64 %181, 1
  %191 = icmp slt i64 %190, %numControlPairs.i.i
  %192 = load %Qubit*, %Qubit** %184, align 8
  %193 = load %Qubit*, %Qubit** %187, align 8
  %194 = load %Qubit*, %Qubit** %189, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %194)
  tail call void @__quantum__qis__cnot__body(%Qubit* %194, %Qubit* %192)
  tail call void @__quantum__qis__cnot__body(%Qubit* %192, %Qubit* %193)
  tail call void @__quantum__qis__t__body(%Qubit* %193)
  tail call void @__quantum__qis__t__adj(%Qubit* %192)
  tail call void @__quantum__qis__t__body(%Qubit* %194)
  tail call void @__quantum__qis__cnot__body(%Qubit* %194, %Qubit* %192)
  tail call void @__quantum__qis__cnot__body(%Qubit* %192, %Qubit* %193)
  tail call void @__quantum__qis__t__adj(%Qubit* %193)
  tail call void @__quantum__qis__cnot__body(%Qubit* %194, %Qubit* %193)
  tail call void @__quantum__qis__h__body(%Qubit* %194)
  br i1 %191, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %else__1.i
  %195 = and i64 %numControls.i.i, 1
  %196 = icmp eq i64 %195, 0
  br i1 %196, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %197 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %198 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %197, i64 0)
  %199 = bitcast i8* %198 to %Qubit**
  %200 = add i64 %numControls.i.i, -1
  %201 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %200)
  %202 = bitcast i8* %201 to %Qubit**
  %203 = load %Qubit*, %Qubit** %202, align 8
  store %Qubit* %203, %Qubit** %199, align 8
  %204 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %197)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %204, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %197, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %204, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %204, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %205 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %206 = bitcast %Tuple* %205 to { %Array*, %Qubit* }*
  %207 = bitcast %Tuple* %205 to %Array**
  %208 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %206, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %207, align 8
  store %Qubit* %arg.i.i, %Qubit** %208, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %176, %Tuple* %205, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %body__2.preheader.i.i
  %209 = phi i64 [ %218, %body__2.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %210 = shl nuw i64 %209, 1
  %211 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %210)
  %212 = bitcast i8* %211 to %Qubit**
  %213 = or i64 %210, 1
  %214 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %213)
  %215 = bitcast i8* %214 to %Qubit**
  %216 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %209)
  %217 = bitcast i8* %216 to %Qubit**
  %218 = add i64 %209, -1
  %219 = icmp sgt i64 %218, -1
  %220 = load %Qubit*, %Qubit** %212, align 8
  %221 = load %Qubit*, %Qubit** %215, align 8
  %222 = load %Qubit*, %Qubit** %217, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %222)
  tail call void @__quantum__qis__cnot__body(%Qubit* %222, %Qubit* %221)
  tail call void @__quantum__qis__t__body(%Qubit* %221)
  tail call void @__quantum__qis__cnot__body(%Qubit* %220, %Qubit* %221)
  tail call void @__quantum__qis__cnot__body(%Qubit* %222, %Qubit* %220)
  tail call void @__quantum__qis__t__adj(%Qubit* %222)
  tail call void @__quantum__qis__t__body(%Qubit* %220)
  tail call void @__quantum__qis__t__adj(%Qubit* %221)
  tail call void @__quantum__qis__cnot__body(%Qubit* %220, %Qubit* %221)
  tail call void @__quantum__qis__cnot__body(%Qubit* %222, %Qubit* %220)
  tail call void @__quantum__qis__h__body(%Qubit* %222)
  br i1 %219, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %205, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %176, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %176, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %176, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %176, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %177, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %58, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %58, i32 -1)
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %Microsoft__Quantum__Intrinsic__X__ctl.exit, %body__1.i
  %223 = add i64 %52, 1
  %.not3.i = icmp sgt i64 %223, %51
  br i1 %.not3.i, label %body__2.i.preheader, label %body__1.i

body__2.i.preheader:                              ; preds = %exiting__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %4, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %5, i32 -1)
  br label %body__2.i

body__2.i:                                        ; preds = %body__2.i, %body__2.i.preheader
  %224 = phi i64 [ %228, %body__2.i ], [ 0, %body__2.i.preheader ]
  %225 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %224)
  %226 = bitcast i8* %225 to %Tuple**
  %227 = load %Tuple*, %Tuple** %226, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %227, i32 -1)
  %228 = add i64 %224, 1
  %.not4.i = icmp sgt i64 %228, %51
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
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %1)
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
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
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
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br i1 %24, label %quantum12, label %test1__1.i.i

quantum12:                                        ; preds = %then2__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %then2__1.i
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
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
  %controls.i.i.i = load %Array*, %Array** %76, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %77, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %else__1.i.i, %body__1.i.i.i
  %78 = phi i64 [ %87, %body__1.i.i.i ], [ 0, %else__1.i.i ]
  %79 = shl nuw i64 %78, 1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = or i64 %79, 1
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %82)
  %84 = bitcast i8* %83 to %Qubit**
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %78)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = add nuw nsw i64 %78, 1
  %88 = icmp slt i64 %87, %numControlPairs.i.i.i
  %89 = load %Qubit*, %Qubit** %81, align 8
  %90 = load %Qubit*, %Qubit** %84, align 8
  %91 = load %Qubit*, %Qubit** %86, align 8
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
  br i1 %88, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i.i, %else__1.i.i
  %92 = and i64 %numControls.i.i.i, 1
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %94 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %94, i64 0)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %numControls.i.i.i, -1
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %97)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = load %Qubit*, %Qubit** %99, align 8
  store %Qubit* %100, %Qubit** %96, align 8
  %101 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %94)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %94, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %101, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %102 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %103 = bitcast %Tuple* %102 to { %Array*, %Qubit* }*
  %104 = bitcast %Tuple* %102 to %Array**
  %105 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %103, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %104, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %105, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %102, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.i.i.i, %body__2.preheader.i.i.i
  %106 = phi i64 [ %115, %body__2.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %107 = shl nuw i64 %106, 1
  %108 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %107)
  %109 = bitcast i8* %108 to %Qubit**
  %110 = or i64 %107, 1
  %111 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %110)
  %112 = bitcast i8* %111 to %Qubit**
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %106)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = add i64 %106, -1
  %116 = icmp sgt i64 %115, -1
  %117 = load %Qubit*, %Qubit** %109, align 8
  %118 = load %Qubit*, %Qubit** %112, align 8
  %119 = load %Qubit*, %Qubit** %114, align 8
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
  br i1 %116, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %body__2.i.i.i, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %102, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %then2__1.i.i, %then1__1.i.i, %quantum12
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %120 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %120)
  %121 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %122 = bitcast %Tuple* %121 to { %Array*, %Qubit* }*
  %123 = bitcast %Tuple* %121 to %Array**
  %124 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %122, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %123, align 8
  store %Qubit* %4, %Qubit** %124, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %120, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %120, i32 1)
  %controls.i.i = load %Array*, %Array** %123, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %124, align 8
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
  %150 = bitcast %Tuple* %149 to { %Array*, %Qubit* }*
  %151 = bitcast %Tuple* %149 to %Array**
  %152 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %150, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %151, align 8
  store %Qubit* %arg.i.i, %Qubit** %152, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %120, %Tuple* %149, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %163, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %149, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %121, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i, %then1__1.i, %quantum
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
  br i1 %6, label %quantum, label %test1__1.i

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
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
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br i1 %24, label %quantum12, label %test1__1.i.i

quantum12:                                        ; preds = %then2__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %then2__1.i
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
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
  %controls.i.i.i = load %Array*, %Array** %76, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %77, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %else__1.i.i, %body__1.i.i.i
  %78 = phi i64 [ %87, %body__1.i.i.i ], [ 0, %else__1.i.i ]
  %79 = shl nuw i64 %78, 1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = or i64 %79, 1
  %83 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %82)
  %84 = bitcast i8* %83 to %Qubit**
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %78)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = add nuw nsw i64 %78, 1
  %88 = icmp slt i64 %87, %numControlPairs.i.i.i
  %89 = load %Qubit*, %Qubit** %81, align 8
  %90 = load %Qubit*, %Qubit** %84, align 8
  %91 = load %Qubit*, %Qubit** %86, align 8
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
  br i1 %88, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i.i, %else__1.i.i
  %92 = and i64 %numControls.i.i.i, 1
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %94 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %94, i64 0)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %numControls.i.i.i, -1
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %97)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = load %Qubit*, %Qubit** %99, align 8
  store %Qubit* %100, %Qubit** %96, align 8
  %101 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %94)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %94, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %101, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %101, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %102 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %103 = bitcast %Tuple* %102 to { %Array*, %Qubit* }*
  %104 = bitcast %Tuple* %102 to %Array**
  %105 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %103, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %104, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %105, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %102, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.i.i.i, %body__2.preheader.i.i.i
  %106 = phi i64 [ %115, %body__2.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %107 = shl nuw i64 %106, 1
  %108 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %107)
  %109 = bitcast i8* %108 to %Qubit**
  %110 = or i64 %107, 1
  %111 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %110)
  %112 = bitcast i8* %111 to %Qubit**
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %106)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = add i64 %106, -1
  %116 = icmp sgt i64 %115, -1
  %117 = load %Qubit*, %Qubit** %109, align 8
  %118 = load %Qubit*, %Qubit** %112, align 8
  %119 = load %Qubit*, %Qubit** %114, align 8
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
  br i1 %116, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %body__2.i.i.i, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %102, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %then2__1.i.i, %then1__1.i.i, %quantum12
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %120 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %120)
  %121 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %122 = bitcast %Tuple* %121 to { %Array*, %Qubit* }*
  %123 = bitcast %Tuple* %121 to %Array**
  %124 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %122, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %123, align 8
  store %Qubit* %4, %Qubit** %124, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %120, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %120, i32 1)
  %controls.i.i = load %Array*, %Array** %123, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %arg.i.i = load %Qubit*, %Qubit** %124, align 8
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
  %150 = bitcast %Tuple* %149 to { %Array*, %Qubit* }*
  %151 = bitcast %Tuple* %149 to %Array**
  %152 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %150, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %151, align 8
  store %Qubit* %arg.i.i, %Qubit** %152, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %120, %Tuple* %149, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %163, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %149, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %120, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %121, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
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
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

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
  br i1 %96, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %body__2.i.i, %condContinue__1.i.i
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

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %Microsoft__Quantum__Intrinsic___3bd7ef4115f143c18e1e3a9956152519___QsRef23__ApplyWithLessControlsA____body.exit.i, %then2__1.i, %then1__1.i, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.powi.f64(double, i32) #1

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #2

attributes #0 = { "InteropFriendly" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind willreturn }
