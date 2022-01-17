; ModuleID = 'qat-link'
source_filename = "qat-link"

%Array = type opaque
%Qubit = type opaque

define i64 @ConstArrayReduction__Main__Interop() local_unnamed_addr #0 {
entry:
  %0 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 10)
  %1 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to %Qubit**
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 7)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 8)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 9)
  %20 = bitcast i8* %19 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %0, i32 1)
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %32 = bitcast i8* %31 to %Qubit**
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %34 = bitcast i8* %33 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %0, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  br label %load

load:                                             ; preds = %entry
  %35 = load %Qubit*, %Qubit** %22, align 8
  %36 = load %Qubit*, %Qubit** %24, align 8
  %37 = load %Qubit*, %Qubit** %26, align 8
  %38 = load %Qubit*, %Qubit** %28, align 8
  %39 = load %Qubit*, %Qubit** %30, align 8
  %40 = load %Qubit*, %Qubit** %32, align 8
  %41 = load %Qubit*, %Qubit** %34, align 8
  br label %quantum

quantum:                                          ; preds = %load
  store %Qubit* null, %Qubit** %2, align 8
  store %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit** %4, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %6, align 8
  store %Qubit* inttoptr (i64 3 to %Qubit*), %Qubit** %8, align 8
  store %Qubit* inttoptr (i64 4 to %Qubit*), %Qubit** %10, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %12, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %14, align 8
  store %Qubit* inttoptr (i64 7 to %Qubit*), %Qubit** %16, align 8
  store %Qubit* inttoptr (i64 8 to %Qubit*), %Qubit** %18, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %20, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %35)
  tail call void @__quantum__qis__x__body(%Qubit* %36)
  tail call void @__quantum__qis__x__body(%Qubit* %37)
  tail call void @__quantum__qis__x__body(%Qubit* %38)
  tail call void @__quantum__qis__x__body(%Qubit* %39)
  tail call void @__quantum__qis__x__body(%Qubit* %40)
  tail call void @__quantum__qis__x__body(%Qubit* %41)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret i64 0
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare void @__quantum__rt__array_update_alias_count(%Array*, i32) local_unnamed_addr

declare void @__quantum__rt__array_update_reference_count(%Array*, i32) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="10" "requiredResults"="0" }

