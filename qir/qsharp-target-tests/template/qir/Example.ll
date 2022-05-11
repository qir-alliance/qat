
%Range = type { i64, i64, i64 }
%Result = type opaque
%Qubit = type opaque
%Array = type opaque
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal %Result* @QATSample__Main__body() {
entry:
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q3 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q3)
  call void @__quantum__qis__t__adj(%Qubit* %q1)
  call void @__quantum__qis__t__adj(%Qubit* %q2)
  call void @__quantum__qis__cnot__body(%Qubit* %q3, %Qubit* %q1)
  call void @__quantum__qis__t__body(%Qubit* %q1)
  call void @__quantum__qis__cnot__body(%Qubit* %q2, %Qubit* %q3)
  call void @__quantum__qis__cnot__body(%Qubit* %q2, %Qubit* %q1)
  call void @__quantum__qis__t__body(%Qubit* %q3)
  call void @__quantum__qis__t__adj(%Qubit* %q1)
  call void @__quantum__qis__cnot__body(%Qubit* %q2, %Qubit* %q3)
  call void @__quantum__qis__cnot__body(%Qubit* %q3, %Qubit* %q1)
  call void @__quantum__qis__t__adj(%Qubit* %q3)
  call void @__quantum__qis__t__body(%Qubit* %q1)
  call void @__quantum__qis__cnot__body(%Qubit* %q2, %Qubit* %q1)
  call void @__quantum__qis__h__body(%Qubit* %q3)
  %0 = call %Result* @__quantum__rt__result_get_zero()
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 1)
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  call void @__quantum__rt__qubit_release(%Qubit* %q2)
  call void @__quantum__rt__qubit_release(%Qubit* %q3)
  ret %Result* %0
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__t__adj(%Qubit*)

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare void @__quantum__qis__t__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

define i8 @QATSample__Main__Interop() #0 {
entry:
  %0 = call %Result* @QATSample__Main__body()
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
  %3 = select i1 %2, i8 0, i8 -1
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  ret i8 %3
}

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

define void @QATSample__Main() #1 {
entry:
  %0 = call %Result* @QATSample__Main__body()
  %1 = call %String* @__quantum__rt__result_to_string(%Result* %0)
  call void @__quantum__rt__message(%String* %1)
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__result_to_string(%Result*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
