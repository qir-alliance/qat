
%Qubit = type opaque
%Result = type opaque
%Array = type opaque

define void @QATSample__Main() #0 {
entry:
  %qubit = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__rz__body(double 0xBFED49394DF2CC18, %Qubit* %qubit)
  %__rtrnVal0__ = call %Result* @__quantum__rt__result_get_zero()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 1)
  call void @__quantum__rt__result_record_output(%Result* %__rtrnVal0__)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 -1)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__result_record_output(%Result*)

attributes #0 = { "EntryPoint" }
