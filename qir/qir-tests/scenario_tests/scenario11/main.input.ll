; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%String = type opaque

@0 = internal constant [3 x i8] c"()\00"

declare %Qubit* @__quantum__rt__qubit_allocate()
declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)
declare void @__quantum__qis__h__body(%Qubit*)
declare %String* @__quantum__rt__string_create(i8*)
declare void @__quantum__rt__message(%String*)
declare void @__quantum__rt__string_update_reference_count(%String*, i32)
declare void @__quantum__rt__qubit_release(%Qubit*)

define internal void @SimpleLoop__Main__body() {
entry:
  call void @SimpleLoop__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @SimpleLoop__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  ret void
}

define internal void @SimpleLoop__MiniCircuit__body(%Qubit* %q1, %Qubit* %q2) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q1)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q2)
  call void @foo(%Qubit* %q1, i32 2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @foo(%Qubit* %control, i32 %t) #1 {
entry:
  call void @__quantum__qis__h__body(%Qubit* %control)
  ret void
}

define void @SimpleLoop__Main() #0 {
entry:
  call void @SimpleLoop__Main__body()
  ret void
}


attributes #0 = { "EntryPoint" }
attributes #1 = { "replaceWith"="bar" }
