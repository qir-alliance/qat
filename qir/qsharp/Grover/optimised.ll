; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Range = type { i64, i64, i64 }
%Result = type opaque

@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Intrinsic__X__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]

define { i64, i8* }* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__Interop(i64 %nQubits) local_unnamed_addr #0 {
entry:
  %qubits.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %2 = add i64 %1, -1
  %.not1.i1.i = icmp slt i64 %2, 0
  br i1 %.not1.i1.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i, label %body__1.i3.i

body__1.i3.i:                                     ; preds = %entry, %body__1.i3.i
  %idxQubit2.i.i = phi i64 [ %8, %body__1.i3.i ], [ 0, %entry ]
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i.i)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  %6 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %7 = bitcast %Tuple* %6 to %Qubit**
  store %Qubit* %5, %Qubit** %7, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %0, %Tuple* %6, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  %8 = add i64 %idxQubit2.i.i, 1
  %.not.i2.i = icmp sgt i64 %8, %2
  br i1 %.not.i2.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i, label %body__1.i3.i

Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i: ; preds = %body__1.i3.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  %9 = shl nuw i64 1, %nQubits
  %10 = sitofp i64 %9 to double
  %11 = tail call double @__quantum__qis__sqrt__body(double %10)
  %12 = fdiv double 1.000000e+00, %11
  %13 = tail call double @__quantum__qis__arcsin__body(double %12)
  %14 = fdiv double 0x3FE921FB54442D18, %13
  %15 = fadd double %14, -5.000000e-01
  %16 = fptosi double %15 to i64
  %17 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %18 = bitcast %Tuple* %17 to { i64, double, i1 }*
  %19 = bitcast %Tuple* %17 to i64*
  %20 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %18, i64 0, i32 1
  %21 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %18, i64 0, i32 2
  %22 = sitofp i64 %16 to double
  %23 = fsub double %22, %15
  %24 = fcmp oge double %15, 0.000000e+00
  store i64 %16, i64* %19, align 4
  store double %23, double* %20, align 8
  store i1 %24, i1* %21, align 1
  %25 = fcmp olt double %23, 0.000000e+00
  %26 = fneg double %23
  %27 = select i1 %25, double %26, double %23
  %28 = fcmp ugt double %27, 1.000000e-15
  %29 = fcmp ole double %27, 5.000000e-01
  %30 = select i1 %24, i64 1, i64 -1
  %31 = select i1 %29, i64 0, i64 %30
  %32 = select i1 %28, i64 %31, i64 0
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %17, i32 -1)
  %33 = add i64 %16, -1
  %34 = add i64 %33, %32
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %exit__1.i, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i
  %36 = phi i64 [ %371, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i ], [ 0, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i ]
  %37 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %38 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %39 = add i64 %38, -1
  %40 = insertvalue %Range { i64 0, i64 2, i64 -1 }, i64 %39, 2
  %41 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %40, i1 true)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %37, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %37, i32 1)
  %42 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %41)
  %43 = add i64 %42, -1
  %44 = icmp slt i64 %43, 0
  tail call void @__quantum__qis__x__body(%Qubit* null)
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br i1 %44, label %Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %body__1.i, %body__1.i.i.i
  %idxQubit2.i.i.i = phi i64 [ %50, %body__1.i.i.i ], [ 0, %body__1.i ]
  %45 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %41, i64 %idxQubit2.i.i.i)
  %46 = bitcast i8* %45 to %Qubit**
  %47 = load %Qubit*, %Qubit** %46, align 8
  %48 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %49 = bitcast %Tuple* %48 to %Qubit**
  store %Qubit* %47, %Qubit** %49, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %37, %Tuple* %48, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  %50 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %50, %43
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i.i.i, %body__1.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %37, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %37, i32 -1)
  %51 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %quantum12, label %test1__1.i.i

quantum12:                                        ; preds = %Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body.exit.i.i
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

test1__1.i.i:                                     ; preds = %Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body.exit.i.i
  %53 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %54 = icmp eq i64 %53, 1
  br i1 %54, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %55 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 0)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = load %Qubit*, %Qubit** %56, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %57, %Qubit* null)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %58 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %59 = icmp eq i64 %58, 2
  br i1 %59, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %60 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 0)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 1)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %64)
  %70 = icmp eq i64 %69, 0
  %71 = load %Qubit*, %Qubit** %61, align 8
  %72 = load %Qubit*, %Qubit** %63, align 8
  tail call void @__quantum__qis__h__body(%Qubit* null)
  store %Qubit* %71, %Qubit** %66, align 8
  store %Qubit* %72, %Qubit** %68, align 8
  br i1 %70, label %quantum27, label %test1__1.i.i.i

quantum27:                                        ; preds = %then2__1.i.i
  tail call void @__quantum__qis__z__body(%Qubit* null)
  br label %quantum52

test1__1.i.i.i:                                   ; preds = %then2__1.i.i
  %73 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %64)
  %74 = icmp eq i64 %73, 1
  br i1 %74, label %then1__1.i.i.i, label %test2__1.i.i.i

then1__1.i.i.i:                                   ; preds = %test1__1.i.i.i
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %76 = bitcast i8* %75 to %Qubit**
  %77 = load %Qubit*, %Qubit** %76, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %77, %Qubit* null)
  br label %quantum52

test2__1.i.i.i:                                   ; preds = %test1__1.i.i.i
  %78 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %64)
  %79 = icmp eq i64 %78, 2
  br i1 %79, label %then2__1.i.i.i, label %else__1.i.i.i

then2__1.i.i.i:                                   ; preds = %test2__1.i.i.i
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %85 = bitcast i8* %84 to %Qubit**
  %86 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %87 = bitcast i8* %86 to %Qubit**
  %88 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %89 = bitcast i8* %88 to %Qubit**
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %93 = bitcast i8* %92 to %Qubit**
  %94 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %95 = bitcast i8* %94 to %Qubit**
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 1)
  %103 = bitcast i8* %102 to %Qubit**
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %64, i64 0)
  %105 = bitcast i8* %104 to %Qubit**
  %106 = load %Qubit*, %Qubit** %81, align 8
  %107 = load %Qubit*, %Qubit** %83, align 8
  %108 = load %Qubit*, %Qubit** %85, align 8
  %109 = load %Qubit*, %Qubit** %87, align 8
  %110 = load %Qubit*, %Qubit** %89, align 8
  %111 = load %Qubit*, %Qubit** %91, align 8
  %112 = load %Qubit*, %Qubit** %93, align 8
  %113 = load %Qubit*, %Qubit** %95, align 8
  %114 = load %Qubit*, %Qubit** %97, align 8
  %115 = load %Qubit*, %Qubit** %99, align 8
  %116 = load %Qubit*, %Qubit** %101, align 8
  %117 = load %Qubit*, %Qubit** %103, align 8
  %118 = load %Qubit*, %Qubit** %105, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %106)
  tail call void @__quantum__qis__t__adj(%Qubit* %107)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* %108)
  tail call void @__quantum__qis__t__body(%Qubit* %109)
  tail call void @__quantum__qis__cnot__body(%Qubit* %110, %Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %111, %Qubit* %112)
  tail call void @__quantum__qis__t__body(%Qubit* null)
  tail call void @__quantum__qis__t__adj(%Qubit* %113)
  tail call void @__quantum__qis__cnot__body(%Qubit* %114, %Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* %115)
  tail call void @__quantum__qis__t__adj(%Qubit* null)
  tail call void @__quantum__qis__t__body(%Qubit* %116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %117, %Qubit* %118)
  br label %quantum52

else__1.i.i.i:                                    ; preds = %test2__1.i.i.i
  %119 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %119)
  %120 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %121 = bitcast %Tuple* %120 to { %Array*, %Qubit* }*
  %122 = bitcast %Tuple* %120 to %Array**
  %123 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %121, i64 0, i32 1
  store %Array* %64, %Array** %122, align 8
  store %Qubit* null, %Qubit** %123, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %119, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %119, i32 1)
  %controls.i.i.i.i = load %Array*, %Array** %122, align 8
  %arg.i.i.i.i = load %Qubit*, %Qubit** %123, align 8
  %numControls.i.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i.i)
  %numControlPairs.i.i.i.i = sdiv i64 %numControls.i.i.i.i, 2
  %temps.i.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i.i)
  %.not.not1.i.i.i.i = icmp sgt i64 %numControls.i.i.i.i, 1
  br i1 %.not.not1.i.i.i.i, label %body__1.i.i.i.i, label %exit__1.i.i.i.i

body__1.i.i.i.i:                                  ; preds = %else__1.i.i.i, %body__1.i.i.i.i
  %124 = phi i64 [ %133, %body__1.i.i.i.i ], [ 0, %else__1.i.i.i ]
  %125 = shl nuw i64 %124, 1
  %126 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %125)
  %127 = bitcast i8* %126 to %Qubit**
  %128 = or i64 %125, 1
  %129 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %128)
  %130 = bitcast i8* %129 to %Qubit**
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i.i, i64 %124)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = add nuw nsw i64 %124, 1
  %134 = icmp slt i64 %133, %numControlPairs.i.i.i.i
  %135 = load %Qubit*, %Qubit** %127, align 8
  %136 = load %Qubit*, %Qubit** %130, align 8
  %137 = load %Qubit*, %Qubit** %132, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %137)
  tail call void @__quantum__qis__cnot__body(%Qubit* %137, %Qubit* %135)
  tail call void @__quantum__qis__cnot__body(%Qubit* %135, %Qubit* %136)
  tail call void @__quantum__qis__t__body(%Qubit* %136)
  tail call void @__quantum__qis__t__adj(%Qubit* %135)
  tail call void @__quantum__qis__t__body(%Qubit* %137)
  tail call void @__quantum__qis__cnot__body(%Qubit* %137, %Qubit* %135)
  tail call void @__quantum__qis__cnot__body(%Qubit* %135, %Qubit* %136)
  tail call void @__quantum__qis__t__adj(%Qubit* %136)
  tail call void @__quantum__qis__cnot__body(%Qubit* %137, %Qubit* %136)
  tail call void @__quantum__qis__h__body(%Qubit* %137)
  br i1 %134, label %body__1.i.i.i.i, label %exit__1.i.i.i.i

exit__1.i.i.i.i:                                  ; preds = %body__1.i.i.i.i, %else__1.i.i.i
  %138 = and i64 %numControls.i.i.i.i, 1
  %139 = icmp eq i64 %138, 0
  br i1 %139, label %condContinue__1.i.i.i.i, label %condFalse__1.i.i.i.i

condFalse__1.i.i.i.i:                             ; preds = %exit__1.i.i.i.i
  %140 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %141 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %140, i64 0)
  %142 = bitcast i8* %141 to %Qubit**
  %143 = add i64 %numControls.i.i.i.i, -1
  %144 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %143)
  %145 = bitcast i8* %144 to %Qubit**
  %146 = load %Qubit*, %Qubit** %145, align 8
  store %Qubit* %146, %Qubit** %142, align 8
  %147 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i.i, %Array* %140)
  br label %condContinue__1.i.i.i.i

condContinue__1.i.i.i.i:                          ; preds = %condFalse__1.i.i.i.i, %exit__1.i.i.i.i
  %__qsVar1__newControls__.i.i.i.i = phi %Array* [ %147, %condFalse__1.i.i.i.i ], [ %temps.i.i.i.i, %exit__1.i.i.i.i ]
  %148 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %149 = bitcast %Tuple* %148 to { %Array*, %Qubit* }*
  %150 = bitcast %Tuple* %148 to %Array**
  %151 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %149, i64 0, i32 1
  store %Array* %__qsVar1__newControls__.i.i.i.i, %Array** %150, align 8
  store %Qubit* %arg.i.i.i.i, %Qubit** %151, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %119, %Tuple* %148, %Tuple* null)
  br i1 %.not.not1.i.i.i.i, label %body__2.preheader.i.i.i.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i

body__2.preheader.i.i.i.i:                        ; preds = %condContinue__1.i.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i.i = add nsw i64 %numControlPairs.i.i.i.i, -1
  br label %body__2.i.i.i.i

body__2.i.i.i.i:                                  ; preds = %body__2.i.i.i.i, %body__2.preheader.i.i.i.i
  %152 = phi i64 [ %161, %body__2.i.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i.i, %body__2.preheader.i.i.i.i ]
  %153 = shl nuw i64 %152, 1
  %154 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %153)
  %155 = bitcast i8* %154 to %Qubit**
  %156 = or i64 %153, 1
  %157 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %156)
  %158 = bitcast i8* %157 to %Qubit**
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i.i, i64 %152)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = add i64 %152, -1
  %162 = icmp sgt i64 %161, -1
  %163 = load %Qubit*, %Qubit** %155, align 8
  %164 = load %Qubit*, %Qubit** %158, align 8
  %165 = load %Qubit*, %Qubit** %160, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %165)
  tail call void @__quantum__qis__cnot__body(%Qubit* %165, %Qubit* %164)
  tail call void @__quantum__qis__t__body(%Qubit* %164)
  tail call void @__quantum__qis__cnot__body(%Qubit* %163, %Qubit* %164)
  tail call void @__quantum__qis__cnot__body(%Qubit* %165, %Qubit* %163)
  tail call void @__quantum__qis__t__adj(%Qubit* %165)
  tail call void @__quantum__qis__t__body(%Qubit* %163)
  tail call void @__quantum__qis__t__adj(%Qubit* %164)
  tail call void @__quantum__qis__cnot__body(%Qubit* %163, %Qubit* %164)
  tail call void @__quantum__qis__cnot__body(%Qubit* %165, %Qubit* %163)
  tail call void @__quantum__qis__h__body(%Qubit* %165)
  br i1 %162, label %body__2.i.i.i.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i

Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i: ; preds = %body__2.i.i.i.i, %condContinue__1.i.i.i.i
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %148, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %119, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %119, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %119, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %119, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %120, i32 -1)
  br label %quantum52

quantum52:                                        ; preds = %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i, %then2__1.i.i.i, %then1__1.i.i.i, %quantum27
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %166 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %166)
  %167 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %168 = bitcast %Tuple* %167 to { %Array*, %Qubit* }*
  %169 = bitcast %Tuple* %167 to %Array**
  %170 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %168, i64 0, i32 1
  store %Array* %qubits.i, %Array** %169, align 8
  store %Qubit* null, %Qubit** %170, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %166, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %166, i32 1)
  %controls.i.i.i = load %Array*, %Array** %169, align 8
  %arg.i.i.i = load %Qubit*, %Qubit** %170, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i5.i, label %exit__1.i.i.i

body__1.i.i5.i:                                   ; preds = %else__1.i.i, %body__1.i.i5.i
  %171 = phi i64 [ %180, %body__1.i.i5.i ], [ 0, %else__1.i.i ]
  %172 = shl nuw i64 %171, 1
  %173 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %172)
  %174 = bitcast i8* %173 to %Qubit**
  %175 = or i64 %172, 1
  %176 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %175)
  %177 = bitcast i8* %176 to %Qubit**
  %178 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %171)
  %179 = bitcast i8* %178 to %Qubit**
  %180 = add nuw nsw i64 %171, 1
  %181 = icmp slt i64 %180, %numControlPairs.i.i.i
  %182 = load %Qubit*, %Qubit** %174, align 8
  %183 = load %Qubit*, %Qubit** %177, align 8
  %184 = load %Qubit*, %Qubit** %179, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %184)
  tail call void @__quantum__qis__cnot__body(%Qubit* %184, %Qubit* %182)
  tail call void @__quantum__qis__cnot__body(%Qubit* %182, %Qubit* %183)
  tail call void @__quantum__qis__t__body(%Qubit* %183)
  tail call void @__quantum__qis__t__adj(%Qubit* %182)
  tail call void @__quantum__qis__t__body(%Qubit* %184)
  tail call void @__quantum__qis__cnot__body(%Qubit* %184, %Qubit* %182)
  tail call void @__quantum__qis__cnot__body(%Qubit* %182, %Qubit* %183)
  tail call void @__quantum__qis__t__adj(%Qubit* %183)
  tail call void @__quantum__qis__cnot__body(%Qubit* %184, %Qubit* %183)
  tail call void @__quantum__qis__h__body(%Qubit* %184)
  br i1 %181, label %body__1.i.i5.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %body__1.i.i5.i, %else__1.i.i
  %185 = and i64 %numControls.i.i.i, 1
  %186 = icmp eq i64 %185, 0
  br i1 %186, label %condContinue__1.i.i.i, label %condFalse__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %187 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %188 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %187, i64 0)
  %189 = bitcast i8* %188 to %Qubit**
  %190 = add i64 %numControls.i.i.i, -1
  %191 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %190)
  %192 = bitcast i8* %191 to %Qubit**
  %193 = load %Qubit*, %Qubit** %192, align 8
  store %Qubit* %193, %Qubit** %189, align 8
  %194 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %187)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %exit__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %194, %condFalse__1.i.i.i ], [ %temps.i.i.i, %exit__1.i.i.i ]
  %195 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %196 = bitcast %Tuple* %195 to { %Array*, %Qubit* }*
  %197 = bitcast %Tuple* %195 to %Array**
  %198 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %196, i64 0, i32 1
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %197, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %198, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %166, %Tuple* %195, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.i.i.i, %body__2.preheader.i.i.i
  %199 = phi i64 [ %208, %body__2.i.i.i ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %200 = shl nuw i64 %199, 1
  %201 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %200)
  %202 = bitcast i8* %201 to %Qubit**
  %203 = or i64 %200, 1
  %204 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %203)
  %205 = bitcast i8* %204 to %Qubit**
  %206 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %199)
  %207 = bitcast i8* %206 to %Qubit**
  %208 = add i64 %199, -1
  %209 = icmp sgt i64 %208, -1
  %210 = load %Qubit*, %Qubit** %202, align 8
  %211 = load %Qubit*, %Qubit** %205, align 8
  %212 = load %Qubit*, %Qubit** %207, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %212)
  tail call void @__quantum__qis__cnot__body(%Qubit* %212, %Qubit* %211)
  tail call void @__quantum__qis__t__body(%Qubit* %211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %210, %Qubit* %211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %212, %Qubit* %210)
  tail call void @__quantum__qis__t__adj(%Qubit* %212)
  tail call void @__quantum__qis__t__body(%Qubit* %210)
  tail call void @__quantum__qis__t__adj(%Qubit* %211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %210, %Qubit* %211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %212, %Qubit* %210)
  tail call void @__quantum__qis__h__body(%Qubit* %212)
  br i1 %209, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i

Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i: ; preds = %body__2.i.i.i, %condContinue__1.i.i.i
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %195, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %166, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %166, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %166, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %166, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %167, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i:   ; preds = %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i, %quantum52, %then1__1.i.i, %quantum12
  %213 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %214 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %215 = add i64 %214, -1
  %216 = insertvalue %Range { i64 0, i64 2, i64 -1 }, i64 %215, 2
  %217 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %216, i1 true)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %213, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %213, i32 1)
  %218 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %217)
  %__qsVar0__idxQubit__1.i.i.i = add i64 %218, -1
  %219 = icmp sgt i64 %__qsVar0__idxQubit__1.i.i.i, -1
  br i1 %219, label %body__1.i1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i

body__1.i1.i.i:                                   ; preds = %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i, %body__1.i1.i.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i1.i.i ], [ %__qsVar0__idxQubit__1.i.i.i, %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i ]
  %220 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %213, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %220, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %220)
  %221 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %217, i64 %__qsVar0__idxQubit__2.i.i.i)
  %222 = bitcast i8* %221 to %Qubit**
  %223 = load %Qubit*, %Qubit** %222, align 8
  %224 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %225 = bitcast %Tuple* %224 to %Qubit**
  store %Qubit* %223, %Qubit** %225, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %220, %Tuple* %224, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %220, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %220, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %224, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %226 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %226, label %body__1.i1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i

Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i: ; preds = %body__1.i1.i.i, %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %213, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %213, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %37, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %37, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %213, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %213, i32 -1)
  %227 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %227, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %227, i32 1)
  %228 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %229 = add i64 %228, -1
  %230 = icmp sgt i64 %229, -1
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br i1 %230, label %body__1.i6.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i

body__1.i6.i:                                     ; preds = %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i, %body__1.i6.i
  %__qsVar0__idxQubit__2.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i, %body__1.i6.i ], [ %229, %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i ]
  %231 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %227, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %231, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %231)
  %232 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %__qsVar0__idxQubit__2.i.i)
  %233 = bitcast i8* %232 to %Qubit**
  %234 = load %Qubit*, %Qubit** %233, align 8
  %235 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %236 = bitcast %Tuple* %235 to %Qubit**
  store %Qubit* %234, %Qubit** %236, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %231, %Tuple* %235, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %231, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %231, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %235, i32 -1)
  %__qsVar0__idxQubit__.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i, -1
  %237 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i, 0
  br i1 %237, label %body__1.i6.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i

Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i: ; preds = %body__1.i6.i, %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %227, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %227, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %227, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %227, i32 -1)
  %238 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %238, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %238, i32 1)
  %239 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %240 = add i64 %239, -1
  %.not1.i8.i = icmp slt i64 %240, 0
  br i1 %.not1.i8.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.8.exit.i, label %body__1.i11.i

body__1.i11.i:                                    ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i, %body__1.i11.i
  %idxQubit2.i9.i = phi i64 [ %246, %body__1.i11.i ], [ 0, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i ]
  %241 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i9.i)
  %242 = bitcast i8* %241 to %Qubit**
  %243 = load %Qubit*, %Qubit** %242, align 8
  %244 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %245 = bitcast %Tuple* %244 to %Qubit**
  store %Qubit* %243, %Qubit** %245, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %238, %Tuple* %244, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %244, i32 -1)
  %246 = add i64 %idxQubit2.i9.i, 1
  %.not.i10.i = icmp sgt i64 %246, %240
  br i1 %.not.i10.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.8.exit.i, label %body__1.i11.i

Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.8.exit.i: ; preds = %body__1.i11.i, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.7.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %238, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %238, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %238, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %238, i32 -1)
  %247 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %248 = add i64 %247, -2
  %249 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %248, 2
  %250 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %249, i1 true)
  %251 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %252 = icmp sgt i64 %251, 0
  tail call void @llvm.assume(i1 %252)
  %253 = add nsw i64 %251, -1
  %254 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %253)
  %255 = bitcast i8* %254 to %Qubit**
  %256 = load %Qubit*, %Qubit** %255, align 8
  %257 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %250)
  %258 = icmp eq i64 %257, 0
  br i1 %258, label %quantum72, label %test1__1.i14.i

quantum72:                                        ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.8.exit.i
  tail call void @__quantum__qis__z__body(%Qubit* %256)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

test1__1.i14.i:                                   ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.8.exit.i
  %259 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %250)
  %260 = icmp eq i64 %259, 1
  br i1 %260, label %then1__1.i16.i, label %test2__1.i17.i

then1__1.i16.i:                                   ; preds = %test1__1.i14.i
  %261 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %262 = bitcast i8* %261 to %Qubit**
  %263 = load %Qubit*, %Qubit** %262, align 8
  tail call void @__quantum__qis__cz__body(%Qubit* %263, %Qubit* %256)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

test2__1.i17.i:                                   ; preds = %test1__1.i14.i
  %264 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %250)
  %265 = icmp eq i64 %264, 2
  br i1 %265, label %then2__1.i18.i, label %else__1.i25.i

then2__1.i18.i:                                   ; preds = %test2__1.i17.i
  %266 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %267 = bitcast i8* %266 to %Qubit**
  %268 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 1)
  %269 = bitcast i8* %268 to %Qubit**
  %270 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %271 = bitcast i8* %270 to %Qubit**
  %272 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %273 = bitcast i8* %272 to %Qubit**
  %274 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 1)
  %275 = bitcast i8* %274 to %Qubit**
  %276 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 1)
  %277 = bitcast i8* %276 to %Qubit**
  %278 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %279 = bitcast i8* %278 to %Qubit**
  %280 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %281 = bitcast i8* %280 to %Qubit**
  %282 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 1)
  %283 = bitcast i8* %282 to %Qubit**
  %284 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %285 = bitcast i8* %284 to %Qubit**
  %286 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %287 = bitcast i8* %286 to %Qubit**
  %288 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 1)
  %289 = bitcast i8* %288 to %Qubit**
  %290 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %250, i64 0)
  %291 = bitcast i8* %290 to %Qubit**
  %292 = load %Qubit*, %Qubit** %267, align 8
  %293 = load %Qubit*, %Qubit** %269, align 8
  %294 = load %Qubit*, %Qubit** %271, align 8
  %295 = load %Qubit*, %Qubit** %273, align 8
  %296 = load %Qubit*, %Qubit** %275, align 8
  %297 = load %Qubit*, %Qubit** %277, align 8
  %298 = load %Qubit*, %Qubit** %279, align 8
  %299 = load %Qubit*, %Qubit** %281, align 8
  %300 = load %Qubit*, %Qubit** %283, align 8
  %301 = load %Qubit*, %Qubit** %285, align 8
  %302 = load %Qubit*, %Qubit** %287, align 8
  %303 = load %Qubit*, %Qubit** %289, align 8
  %304 = load %Qubit*, %Qubit** %291, align 8
  tail call void @__quantum__qis__t__adj(%Qubit* %292)
  tail call void @__quantum__qis__t__adj(%Qubit* %293)
  tail call void @__quantum__qis__cnot__body(%Qubit* %256, %Qubit* %294)
  tail call void @__quantum__qis__t__body(%Qubit* %295)
  tail call void @__quantum__qis__cnot__body(%Qubit* %296, %Qubit* %256)
  tail call void @__quantum__qis__cnot__body(%Qubit* %297, %Qubit* %298)
  tail call void @__quantum__qis__t__body(%Qubit* %256)
  tail call void @__quantum__qis__t__adj(%Qubit* %299)
  tail call void @__quantum__qis__cnot__body(%Qubit* %300, %Qubit* %256)
  tail call void @__quantum__qis__cnot__body(%Qubit* %256, %Qubit* %301)
  tail call void @__quantum__qis__t__adj(%Qubit* %256)
  tail call void @__quantum__qis__t__body(%Qubit* %302)
  tail call void @__quantum__qis__cnot__body(%Qubit* %303, %Qubit* %304)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

else__1.i25.i:                                    ; preds = %test2__1.i17.i
  %305 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %305)
  %306 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %307 = bitcast %Tuple* %306 to { %Array*, %Qubit* }*
  %308 = bitcast %Tuple* %306 to %Array**
  %309 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %307, i64 0, i32 1
  store %Array* %250, %Array** %308, align 8
  store %Qubit* %256, %Qubit** %309, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %305, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %305, i32 1)
  %controls.i.i19.i = load %Array*, %Array** %308, align 8
  %arg.i.i20.i = load %Qubit*, %Qubit** %309, align 8
  %numControls.i.i21.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i19.i)
  %numControlPairs.i.i22.i = sdiv i64 %numControls.i.i21.i, 2
  %temps.i.i23.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i22.i)
  %.not.not1.i.i24.i = icmp sgt i64 %numControls.i.i21.i, 1
  br i1 %.not.not1.i.i24.i, label %body__1.i.i28.i, label %exit__1.i.i29.i

body__1.i.i28.i:                                  ; preds = %else__1.i25.i, %body__1.i.i28.i
  %310 = phi i64 [ %319, %body__1.i.i28.i ], [ 0, %else__1.i25.i ]
  %311 = shl nuw i64 %310, 1
  %312 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %311)
  %313 = bitcast i8* %312 to %Qubit**
  %314 = or i64 %311, 1
  %315 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %314)
  %316 = bitcast i8* %315 to %Qubit**
  %317 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i23.i, i64 %310)
  %318 = bitcast i8* %317 to %Qubit**
  %319 = add nuw nsw i64 %310, 1
  %320 = icmp slt i64 %319, %numControlPairs.i.i22.i
  %321 = load %Qubit*, %Qubit** %313, align 8
  %322 = load %Qubit*, %Qubit** %316, align 8
  %323 = load %Qubit*, %Qubit** %318, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %323)
  tail call void @__quantum__qis__cnot__body(%Qubit* %323, %Qubit* %321)
  tail call void @__quantum__qis__cnot__body(%Qubit* %321, %Qubit* %322)
  tail call void @__quantum__qis__t__body(%Qubit* %322)
  tail call void @__quantum__qis__t__adj(%Qubit* %321)
  tail call void @__quantum__qis__t__body(%Qubit* %323)
  tail call void @__quantum__qis__cnot__body(%Qubit* %323, %Qubit* %321)
  tail call void @__quantum__qis__cnot__body(%Qubit* %321, %Qubit* %322)
  tail call void @__quantum__qis__t__adj(%Qubit* %322)
  tail call void @__quantum__qis__cnot__body(%Qubit* %323, %Qubit* %322)
  tail call void @__quantum__qis__h__body(%Qubit* %323)
  br i1 %320, label %body__1.i.i28.i, label %exit__1.i.i29.i

exit__1.i.i29.i:                                  ; preds = %body__1.i.i28.i, %else__1.i25.i
  %324 = and i64 %numControls.i.i21.i, 1
  %325 = icmp eq i64 %324, 0
  br i1 %325, label %condContinue__1.i.i32.i, label %condFalse__1.i.i30.i

condFalse__1.i.i30.i:                             ; preds = %exit__1.i.i29.i
  %326 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %327 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %326, i64 0)
  %328 = bitcast i8* %327 to %Qubit**
  %329 = add i64 %numControls.i.i21.i, -1
  %330 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %329)
  %331 = bitcast i8* %330 to %Qubit**
  %332 = load %Qubit*, %Qubit** %331, align 8
  store %Qubit* %332, %Qubit** %328, align 8
  %333 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i23.i, %Array* %326)
  br label %condContinue__1.i.i32.i

condContinue__1.i.i32.i:                          ; preds = %condFalse__1.i.i30.i, %exit__1.i.i29.i
  %__qsVar1__newControls__.i.i31.i = phi %Array* [ %333, %condFalse__1.i.i30.i ], [ %temps.i.i23.i, %exit__1.i.i29.i ]
  %334 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %335 = bitcast %Tuple* %334 to { %Array*, %Qubit* }*
  %336 = bitcast %Tuple* %334 to %Array**
  %337 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %335, i64 0, i32 1
  store %Array* %__qsVar1__newControls__.i.i31.i, %Array** %336, align 8
  store %Qubit* %arg.i.i20.i, %Qubit** %337, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %305, %Tuple* %334, %Tuple* null)
  br i1 %.not.not1.i.i24.i, label %body__2.preheader.i.i34.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i

body__2.preheader.i.i34.i:                        ; preds = %condContinue__1.i.i32.i
  %__qsVar0____qsVar0__numPair____3.i.i33.i = add nsw i64 %numControlPairs.i.i22.i, -1
  br label %body__2.i.i37.i

body__2.i.i37.i:                                  ; preds = %body__2.i.i37.i, %body__2.preheader.i.i34.i
  %338 = phi i64 [ %347, %body__2.i.i37.i ], [ %__qsVar0____qsVar0__numPair____3.i.i33.i, %body__2.preheader.i.i34.i ]
  %339 = shl nuw i64 %338, 1
  %340 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %339)
  %341 = bitcast i8* %340 to %Qubit**
  %342 = or i64 %339, 1
  %343 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %342)
  %344 = bitcast i8* %343 to %Qubit**
  %345 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i23.i, i64 %338)
  %346 = bitcast i8* %345 to %Qubit**
  %347 = add i64 %338, -1
  %348 = icmp sgt i64 %347, -1
  %349 = load %Qubit*, %Qubit** %341, align 8
  %350 = load %Qubit*, %Qubit** %344, align 8
  %351 = load %Qubit*, %Qubit** %346, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %351)
  tail call void @__quantum__qis__cnot__body(%Qubit* %351, %Qubit* %350)
  tail call void @__quantum__qis__t__body(%Qubit* %350)
  tail call void @__quantum__qis__cnot__body(%Qubit* %349, %Qubit* %350)
  tail call void @__quantum__qis__cnot__body(%Qubit* %351, %Qubit* %349)
  tail call void @__quantum__qis__t__adj(%Qubit* %351)
  tail call void @__quantum__qis__t__body(%Qubit* %349)
  tail call void @__quantum__qis__t__adj(%Qubit* %350)
  tail call void @__quantum__qis__cnot__body(%Qubit* %349, %Qubit* %350)
  tail call void @__quantum__qis__cnot__body(%Qubit* %351, %Qubit* %349)
  tail call void @__quantum__qis__h__body(%Qubit* %351)
  br i1 %348, label %body__2.i.i37.i, label %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i

Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i: ; preds = %body__2.i.i37.i, %condContinue__1.i.i32.i
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %334, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i23.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %305, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %305, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %305, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %305, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %306, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i:   ; preds = %Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i, %then2__1.i18.i, %then1__1.i16.i, %quantum72
  %352 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %352, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %352, i32 1)
  %353 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %__qsVar0__idxQubit__1.i38.i = add i64 %353, -1
  %354 = icmp sgt i64 %__qsVar0__idxQubit__1.i38.i, -1
  br i1 %354, label %body__1.i41.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i

body__1.i41.i:                                    ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i, %body__1.i41.i
  %__qsVar0__idxQubit__2.i39.i = phi i64 [ %__qsVar0__idxQubit__.i40.i, %body__1.i41.i ], [ %__qsVar0__idxQubit__1.i38.i, %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i ]
  %355 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %352, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %355, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %355)
  %356 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %__qsVar0__idxQubit__2.i39.i)
  %357 = bitcast i8* %356 to %Qubit**
  %358 = load %Qubit*, %Qubit** %357, align 8
  %359 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %360 = bitcast %Tuple* %359 to %Qubit**
  store %Qubit* %358, %Qubit** %360, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %355, %Tuple* %359, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %355, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %355, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %359, i32 -1)
  %__qsVar0__idxQubit__.i40.i = add nsw i64 %__qsVar0__idxQubit__2.i39.i, -1
  %361 = icmp sgt i64 %__qsVar0__idxQubit__2.i39.i, 0
  br i1 %361, label %body__1.i41.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i

Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i: ; preds = %body__1.i41.i, %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %352, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %352, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %352, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %352, i32 -1)
  %362 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %362, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %362, i32 1)
  %363 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %364 = add i64 %363, -1
  %.not1.i43.i = icmp slt i64 %364, 0
  br i1 %.not1.i43.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i, label %body__1.i46.i

body__1.i46.i:                                    ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i, %body__1.i46.i
  %idxQubit2.i44.i = phi i64 [ %370, %body__1.i46.i ], [ 0, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i ]
  %365 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i44.i)
  %366 = bitcast i8* %365 to %Qubit**
  %367 = load %Qubit*, %Qubit** %366, align 8
  %368 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %369 = bitcast %Tuple* %368 to %Qubit**
  store %Qubit* %367, %Qubit** %369, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %362, %Tuple* %368, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %368, i32 -1)
  %370 = add i64 %idxQubit2.i44.i, 1
  %.not.i45.i = icmp sgt i64 %370, %364
  br i1 %.not.i45.i, label %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i, label %body__1.i46.i

Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i: ; preds = %body__1.i46.i, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj.11.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %362, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %362, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %362, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %362, i32 -1)
  %371 = add i64 %36, 1
  %.not.i = icmp sgt i64 %371, %34
  br i1 %.not.i, label %exit__1.i, label %body__1.i

exit__1.i:                                        ; preds = %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.12.exit.i, %Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body.2.exit.i
  %372 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %372, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %372, i32 1)
  %373 = tail call %Result* @__quantum__rt__result_get_zero()
  %374 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %375 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %374)
  %376 = add i64 %374, -1
  %.not2.i.i = icmp slt i64 %376, 0
  br i1 %.not2.i.i, label %exit__1.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %exit__1.i, %body__1.i.i
  %377 = phi i64 [ %380, %body__1.i.i ], [ 0, %exit__1.i ]
  %378 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %375, i64 %377)
  %379 = bitcast i8* %378 to %Result**
  store %Result* %373, %Result** %379, align 8
  %380 = add i64 %377, 1
  %.not.i.i = icmp sgt i64 %380, %376
  br i1 %.not.i.i, label %exit__1.i.i, label %body__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %exit__1.i
  %381 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %382 = add i64 %381, -1
  %.not13.i.i = icmp slt i64 %382, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, label %body__2.i.i

body__2.i.i:                                      ; preds = %exit__1.i.i, %body__2.i.i
  %383 = phi %Array* [ %384, %body__2.i.i ], [ %375, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %395, %body__2.i.i ], [ 0, %exit__1.i.i ]
  %384 = tail call %Array* @__quantum__rt__array_copy(%Array* %383, i1 false)
  %385 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxElement4.i.i)
  %386 = bitcast i8* %385 to %Qubit**
  %387 = load %Qubit*, %Qubit** %386, align 8
  %388 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %389 = bitcast %Tuple* %388 to %Qubit**
  store %Qubit* %387, %Qubit** %389, align 8
  %390 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %372, %Tuple* %388, %Tuple* %390)
  %391 = bitcast %Tuple* %390 to %Result**
  %392 = load %Result*, %Result** %391, align 8
  %393 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %384, i64 %idxElement4.i.i)
  %394 = bitcast i8* %393 to %Result**
  store %Result* %392, %Result** %394, align 8
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %388, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %390, i32 -1)
  %395 = add i64 %idxElement4.i.i, 1
  %.not1.i.i = icmp sgt i64 %395, %382
  br i1 %.not1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, label %body__2.i.i

Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit: ; preds = %body__2.i.i, %exit__1.i.i
  %.lcssa.i.i = phi %Array* [ %375, %exit__1.i.i ], [ %384, %body__2.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %372, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %372, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %372, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %372, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %qubits.i)
  %396 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i)
  %397 = tail call i8* @__quantum__rt__memory_allocate(i64 %396)
  %398 = ptrtoint i8* %397 to i64
  %399 = add i64 %396, -1
  %.not4 = icmp slt i64 %399, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, %body__1
  %400 = phi i64 [ %405, %body__1 ], [ 0, %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit ]
  %401 = add i64 %400, %398
  %402 = inttoptr i64 %401 to i8*
  %403 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %400)
  %404 = bitcast i8* %403 to %Result**
  %405 = add i64 %400, 1
  %406 = icmp sgt i64 %405, %399
  %407 = load %Result*, %Result** %404, align 8
  %408 = tail call i1 @__quantum__qis__read_result__body(%Result* %407)
  %409 = sext i1 %408 to i8
  store i8 %409, i8* %402, align 1
  br i1 %406, label %exit__1, label %body__1

exit__1:                                          ; preds = %body__1, %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit
  %410 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %411 = bitcast i8* %410 to i64*
  store i64 %396, i64* %411, align 4
  %412 = getelementptr i8, i8* %410, i64 8
  %413 = bitcast i8* %412 to i8**
  store i8* %397, i8** %413, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %414 = phi i64 [ %416, %body__2 ], [ 0, %exit__1 ]
  %415 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %414)
  %416 = add i64 %414, 1
  %.not3 = icmp sgt i64 %416, %399
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %417 = bitcast i8* %410 to { i64, i8* }*
  ret { i64, i8* }* %417
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

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

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
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %3, %Qubit* %4)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal fastcc void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %ctls, %Qubit* %qubit) unnamed_addr {
entry:
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %quantum, label %test1__1

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__x__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  tail call void @__quantum__qis__cnot__body(%Qubit* %6, %Qubit* %qubit)
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
  tail call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  %18 = load %Qubit*, %Qubit** %10, align 8
  %19 = load %Qubit*, %Qubit** %12, align 8
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  store %Qubit* %18, %Qubit** %15, align 8
  store %Qubit* %19, %Qubit** %17, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %13, %Qubit* %qubit)
  tail call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %20 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %20)
  %21 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %22 = bitcast %Tuple* %21 to { %Array*, %Qubit* }*
  %23 = bitcast %Tuple* %21 to %Array**
  %24 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %22, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %23, align 8
  store %Qubit* %qubit, %Qubit** %24, align 8
  tail call fastcc void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %20, { %Array*, %Qubit* }* %22)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %21, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

define internal fastcc void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, %Qubit* }* nocapture readonly %0) unnamed_addr {
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

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

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
  tail call fastcc void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %48, { %Array*, %Qubit* }* %50)
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

declare %Array* @__quantum__rt__array_slice_1d(%Array*, %Range, i1) local_unnamed_addr

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
  tail call fastcc void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %7, { %Array*, %Qubit* }* %9)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %quantum
  tail call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare double @__quantum__qis__sqrt__body(double) local_unnamed_addr

declare double @__quantum__qis__arcsin__body(double) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

attributes #0 = { "InteropFriendly" "requiredQubits"="1" "requiredResults"="0" }
attributes #1 = { nounwind willreturn }
