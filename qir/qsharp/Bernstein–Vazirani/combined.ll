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
  br i1 %.not.not6.not.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %8 = phi i64 [ %11, %body__1.i.i ], [ 0, %entry ]
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %7, i64 %8)
  %10 = bitcast i8* %9 to i1*
  store i1 false, i1* %10, align 1
  %11 = add nuw nsw i64 %8, 1
  %.not.not.i.i = icmp ult i64 %11, %nQubits
  br i1 %.not.not.i.i, label %body__1.i.i, label %body__2.i.i

body__2.i.i:                                      ; preds = %body__1.i.i, %body__2.i.i
  %12 = phi i64 [ %19, %body__2.i.i ], [ %patternInt, %body__1.i.i ]
  %13 = phi %Array* [ %14, %body__2.i.i ], [ %7, %body__1.i.i ]
  %idxBit8.i.i = phi i64 [ %20, %body__2.i.i ], [ 0, %body__1.i.i ]
  %14 = tail call %Array* @__quantum__rt__array_copy(%Array* %13, i1 false)
  %15 = and i64 %12, 1
  %16 = icmp ne i64 %15, 0
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %14, i64 %idxBit8.i.i)
  %18 = bitcast i8* %17 to i1*
  store i1 %16, i1* %18, align 1
  %19 = sdiv i64 %12, 2
  %20 = add nuw nsw i64 %idxBit8.i.i, 1
  %.not3.not.i.i = icmp ult i64 %20, %nQubits
  br i1 %.not3.not.i.i, label %body__2.i.i, label %Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i

Microsoft__Quantum__Convert__IntAsBoolArray__body.2.exit.i: ; preds = %body__2.i.i, %entry
  %21 = phi %Array* [ %7, %entry ], [ %14, %body__2.i.i ]
  %22 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %23 = bitcast %Tuple* %22 to { %Callable*, %Array* }*
  %24 = bitcast %Tuple* %22 to %Callable**
  %25 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %23, i64 0, i32 1
  %26 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Tets__Samples__BernVaz__ParityOperationImpl__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  store %Callable* %26, %Callable** %24, align 8
  store %Array* %21, %Array** %25, align 8
  %27 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @PartialApplication__1__FunctionTable, [2 x void (%Tuple*, i32)*]* nonnull @MemoryManagement__1__FunctionTable, %Tuple* %22)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %27, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %27, i32 1)
  %28 = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  %29 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %29, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %29, i32 1)
  %30 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %31 = add i64 %30, -1
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
  br i1 %32, label %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

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
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i.i.i, %exit_quantum_grouping
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %29, i32 -1)
  %39 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %40 = bitcast %Tuple* %39 to { %Array*, %Qubit* }*
  %41 = bitcast %Tuple* %39 to %Array**
  %42 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %40, i64 0, i32 1
  store %Array* %28, %Array** %41, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %27, %Tuple* %39, %Tuple* null)
  %43 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %43, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %43, i32 1)
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %45 = add i64 %44, -1
  %46 = icmp sgt i64 %45, -1
  br label %load22

load22:                                           ; preds = %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__body.exit.i.i
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
  br i1 %46, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i

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
  br i1 %53, label %body__1.i1.i.i, label %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i

Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i: ; preds = %body__1.i1.i.i, %exit_quantum_grouping20
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %43, i32 -1)
  %54 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %54, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %54, i32 1)
  %55 = tail call %Result* @__quantum__rt__result_get_zero()
  %56 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %57 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %56)
  %58 = add i64 %56, -1
  %.not2.i.i.i = icmp slt i64 %58, 0
  br i1 %.not2.i.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

body__1.i3.i.i:                                   ; preds = %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i, %body__1.i3.i.i
  %59 = phi i64 [ %62, %body__1.i3.i.i ], [ 0, %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i ]
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %57, i64 %59)
  %61 = bitcast i8* %60 to %Result**
  store %Result* %55, %Result** %61, align 8
  %62 = add i64 %59, 1
  %.not.i2.i.i = icmp sgt i64 %62, %58
  br i1 %.not.i2.i.i, label %exit__1.i.i.i, label %body__1.i3.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i3.i.i, %Microsoft__Quantum__Canon___91833c8c69b441f299752cc16222238a_ApplyToEachA__adj.exit.i.i
  %63 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %28)
  %64 = add i64 %63, -1
  %.not13.i.i.i = icmp slt i64 %64, 0
  br i1 %.not13.i.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit__1.i.i.i, %body__2.i.i.i
  %65 = phi %Array* [ %66, %body__2.i.i.i ], [ %57, %exit__1.i.i.i ]
  %idxElement4.i.i.i = phi i64 [ %77, %body__2.i.i.i ], [ 0, %exit__1.i.i.i ]
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
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %70, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %72, i32 -1)
  %77 = add i64 %idxElement4.i.i.i, 1
  %.not1.i4.i.i = icmp sgt i64 %77, %64
  br i1 %.not1.i4.i.i, label %Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit, label %body__2.i.i.i

Tets__Samples__BernVaz__BernsteinVaziraniTestCase__body.1.exit: ; preds = %body__2.i.i.i, %exit__1.i.i.i
  %.lcssa.i.i.i = phi %Array* [ %57, %exit__1.i.i.i ], [ %66, %body__2.i.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %27, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %27, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %29, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %39, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %43, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %54, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %28)
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
  ret { i64, i8* }* %99
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*) local_unnamed_addr

declare i8* @__quantum__rt__memory_allocate(i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare %Result* @__quantum__rt__result_get_zero() local_unnamed_addr

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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
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
  store %Array* %ctls, %Array** %10, align 8
  store %Qubit* %qubit, %Qubit** %11, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___8f4c5dc0bc444a4db47b66f5b8a12625___QsRef23__ApplyWithLessControlsA____body(%Callable* %7, { %Array*, %Qubit* }* %9)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %exit_quantum_grouping3, %exit_quantum_grouping
  ret void
}

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

define internal fastcc void @Microsoft__Quantum__Intrinsic___8f4c5dc0bc444a4db47b66f5b8a12625___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, %Qubit* }* nocapture readonly %0) unnamed_addr {
entry:
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %arg = load %Qubit*, %Qubit** %2, align 8
  %numControls = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %numControlPairs = sdiv i64 %numControls, 2
  %temps = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs)
  %.not.not1 = icmp sgt i64 %numControls, 1
  br i1 %.not.not1, label %body__1, label %exit__1

body__1:                                          ; preds = %entry, %exit_quantum_grouping
  %3 = phi i64 [ %12, %exit_quantum_grouping ], [ 0, %entry ]
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
  br label %load

load:                                             ; preds = %body__1
  %14 = load %Qubit*, %Qubit** %6, align 8
  %15 = load %Qubit*, %Qubit** %9, align 8
  %16 = load %Qubit*, %Qubit** %11, align 8
  br label %quantum

quantum:                                          ; preds = %load
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
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br i1 %13, label %body__1, label %exit__1

exit__1:                                          ; preds = %exit_quantum_grouping, %entry
  %17 = and i64 %numControls, 1
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %condContinue__1, label %condFalse__1

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
  br label %condContinue__1

condContinue__1:                                  ; preds = %exit__1, %condFalse__1
  %__qsVar1__newControls__ = phi %Array* [ %26, %condFalse__1 ], [ %temps, %exit__1 ]
  %27 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %28 = bitcast %Tuple* %27 to { %Array*, %Qubit* }*
  %29 = bitcast %Tuple* %27 to %Array**
  %30 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %28, i64 0, i32 1
  store %Array* %__qsVar1__newControls__, %Array** %29, align 8
  store %Qubit* %arg, %Qubit** %30, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %27, %Tuple* null)
  br i1 %.not.not1, label %body__2.preheader, label %exit__2

body__2.preheader:                                ; preds = %condContinue__1
  %__qsVar0____qsVar0__numPair____3 = add nsw i64 %numControlPairs, -1
  br label %body__2

body__2:                                          ; preds = %body__2.preheader, %exit_quantum_grouping7
  %31 = phi i64 [ %40, %exit_quantum_grouping7 ], [ %__qsVar0____qsVar0__numPair____3, %body__2.preheader ]
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
  br label %load9

load9:                                            ; preds = %body__2
  %42 = load %Qubit*, %Qubit** %34, align 8
  %43 = load %Qubit*, %Qubit** %37, align 8
  %44 = load %Qubit*, %Qubit** %39, align 8
  br label %quantum6

quantum6:                                         ; preds = %load9
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
  br label %readout8

readout8:                                         ; preds = %quantum6
  br label %post-classical5

post-classical5:                                  ; preds = %readout8
  br label %exit_quantum_grouping7

exit_quantum_grouping7:                           ; preds = %post-classical5
  br i1 %41, label %body__2, label %exit__2

exit__2:                                          ; preds = %exit_quantum_grouping7, %condContinue__1
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %27, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

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
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %5)
  %8 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %4)
  %.not.i = icmp eq i64 %7, %8
  tail call void @llvm.assume(i1 %.not.i)
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
  br i1 %.not7.i.i.i, label %exit__3.i.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %entry, %body__1.i.i.i
  %18 = phi i64 [ %21, %body__1.i.i.i ], [ 0, %entry ]
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
  br i1 %.not4.i.i.i, label %body__3.i.i.i, label %body__2.i.i.i

body__3.i.i.i:                                    ; preds = %body__2.i.i.i, %body__3.i.i.i
  %27 = phi %Array* [ %28, %body__3.i.i.i ], [ %16, %body__2.i.i.i ]
  %idxElement10.i.i.i = phi i64 [ %42, %body__3.i.i.i ], [ 0, %body__2.i.i.i ]
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
  %42 = add i64 %idxElement10.i.i.i, 1
  %.not5.i.i.i = icmp sgt i64 %42, %17
  br i1 %.not5.i.i.i, label %exit__3.i.i.i, label %body__3.i.i.i

exit__3.i.i.i:                                    ; preds = %body__3.i.i.i, %entry
  %.lcssa.i.i.i = phi %Array* [ %16, %entry ], [ %28, %body__3.i.i.i ]
  %43 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %44 = add i64 %43, -1
  %.not611.i.i.i = icmp slt i64 %44, 0
  br i1 %.not611.i.i.i, label %Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i, label %body__4.i.i.i

body__4.i.i.i:                                    ; preds = %exit__3.i.i.i, %body__4.i.i.i
  %45 = phi i64 [ %49, %body__4.i.i.i ], [ 0, %exit__3.i.i.i ]
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %45)
  %47 = bitcast i8* %46 to %Tuple**
  %48 = load %Tuple*, %Tuple** %47, align 8
  tail call void @__quantum__rt__tuple_update_alias_count(%Tuple* %48, i32 -1)
  %49 = add i64 %45, 1
  %.not6.i.i.i = icmp sgt i64 %49, %44
  br i1 %.not6.i.i.i, label %Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i, label %body__4.i.i.i

Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i: ; preds = %body__4.i.i.i, %exit__3.i.i.i
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  %50 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i.i)
  %51 = add i64 %50, -1
  %.not35.i = icmp slt i64 %51, 0
  br i1 %.not35.i, label %Tets__Samples__BernVaz__ParityOperationImpl__body.exit, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i, %exiting__1.i
  %52 = phi i64 [ %61, %exiting__1.i ], [ 0, %Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i ]
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %58, %Qubit* %6)
  br label %exiting__1.i

exiting__1.i:                                     ; preds = %then0__2.i, %body__1.i
  %61 = add i64 %52, 1
  %.not3.i = icmp sgt i64 %61, %51
  br i1 %.not3.i, label %body__2.i, label %body__1.i

body__2.i:                                        ; preds = %exiting__1.i, %body__2.i
  %62 = phi i64 [ %66, %body__2.i ], [ 0, %exiting__1.i ]
  %63 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i.i, i64 %62)
  %64 = bitcast i8* %63 to %Tuple**
  %65 = load %Tuple*, %Tuple** %64, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %65, i32 -1)
  %66 = add i64 %62, 1
  %.not4.i = icmp sgt i64 %66, %51
  br i1 %.not4.i, label %Tets__Samples__BernVaz__ParityOperationImpl__body.exit, label %body__2.i

Tets__Samples__BernVaz__ParityOperationImpl__body.exit: ; preds = %body__2.i, %Microsoft__Quantum__Arrays___428e7e547b3a4c969acdec7622301147_Zip__body.exit.i
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %qubit)
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
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %qubit)
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
  %13 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  br label %load10

load10:                                           ; preds = %then2__1
  %18 = load %Qubit*, %Qubit** %10, align 8
  %19 = load %Qubit*, %Qubit** %12, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  store %Qubit* %18, %Qubit** %15, align 8
  store %Qubit* %19, %Qubit** %17, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %13, %Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %20 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %20)
  %21 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %22 = bitcast %Tuple* %21 to { %Array*, %Qubit* }*
  %23 = bitcast %Tuple* %21 to %Array**
  %24 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %22, i64 0, i32 1
  store %Array* %ctls, %Array** %23, align 8
  store %Qubit* %qubit, %Qubit** %24, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___8f4c5dc0bc444a4db47b66f5b8a12625___QsRef23__ApplyWithLessControlsA____body(%Callable* %20, { %Array*, %Qubit* }* %22)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %21, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %exit_quantum_grouping8, %exit_quantum_grouping3, %exit_quantum_grouping
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
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
  store %Array* %ctls, %Array** %51, align 8
  store %Qubit* %qubit, %Qubit** %52, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___8f4c5dc0bc444a4db47b66f5b8a12625___QsRef23__ApplyWithLessControlsA____body(%Callable* %48, { %Array*, %Qubit* }* %50)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %48, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %49, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %exit_quantum_grouping8, %exit_quantum_grouping3, %exit_quantum_grouping
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
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %3, %Qubit* %4)
  ret void
}

declare double @llvm.powi.f64(double, i32)

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

attributes #0 = { "InteropFriendly" }
attributes #1 = { nounwind willreturn }

