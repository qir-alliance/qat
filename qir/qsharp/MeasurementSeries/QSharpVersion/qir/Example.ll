
%Range = type { i64, i64, i64 }
%Qubit = type opaque
%Result = type opaque
%Array = type opaque
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }
@0 = internal constant [3 x i8] c"()\00"

define internal void @QATSample__Main__body() {
entry:
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %0 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %1 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %2 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %3 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %4 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %5 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  %6 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %q1)
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %1, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %2, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %3, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %4, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %5, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %6, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

define internal %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %target) {
entry:
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %target)
  call void @__quantum__qis__reset__body(%Qubit* %target)
  ret %Result* %result
}

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

define internal void @Microsoft__Quantum__Intrinsic__Reset__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__reset__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__reset__body(%Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

define void @QATSample__Main__Interop() #0 {
entry:
  call void @QATSample__Main__body()
  ret void
}

define void @QATSample__Main() #1 {
entry:
  call void @QATSample__Main__body()
  %0 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0))
  call void @__quantum__rt__message(%String* %0)
  call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__string_create(i8*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
