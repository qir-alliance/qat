%Qubit = type opaque
%Result = type opaque
%Array = type opaque
define void @QATSample__Main() #0 {
entry:
  %q0 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q0)
  call void @__quantum__qis__cnot__body(%Qubit* %q0, %Qubit* %q1)
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  %0 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %result__2)
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__2, i32 -1)
  br i1 %0, label %then0__1, label %continue__1
then0__1:                                         ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* %q0)
  call void @__quantum__qis__x__body(%Qubit* %q1)
  br label %continue__1
continue__1:                                      ; preds = %then0__1, %entry
  %result__4 = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q0)
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 1)
  call void @__quantum__rt__result_record_output(%Result* %result__4)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  ret void
}
declare %Qubit* @__quantum__rt__qubit_allocate()
declare %Array* @__quantum__rt__qubit_allocate_array(i64)
declare void @__quantum__rt__qubit_release(%Qubit*)
declare void @__quantum__qis__h__body(%Qubit*)
declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)
declare %Result* @__quantum__qis__m__body(%Qubit*)
declare i1 @__quantum__rt__result_equal(%Result*, %Result*)
declare void @__quantum__rt__result_update_reference_count(%Result*, i32)
declare void @__quantum__qis__x__body(%Qubit*)
declare void @__quantum__rt__result_record_output(%Result*)
attributes #0 = { "EntryPoint" }