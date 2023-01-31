; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define void @SimpleLoop__Main() #0 {
entry:
  call void @SimpleLoop__Main__body()
  ret void
}

define internal void @SimpleLoop__Main__body() #1 {
entry:
  call void @SimpleLoop__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @SimpleLoop__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  ret void
}

define internal void @SimpleLoop__MiniCircuit__body(%Qubit* %q1, %Qubit* %q2) #2 {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q1)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %q1, %Qubit* %q2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) #2 {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target) #3 {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

attributes #0 = { "EntryPoint" "maxQubitIndex"="0" "maxResultIndex"="0" "requiredQubits"="0" "requiredResults"="0" }
attributes #1 = { "maxQubitIndex"="1" "maxResultIndex"="0" "requiredQubits"="2" "requiredResults"="0" }
attributes #2 = { "maxQubitIndex"="0" "maxResultIndex"="0" "requiredQubits"="0" "requiredResults"="0" }
attributes #3 = { "maxQubitIndex"="0" "maxResultIndex"="0" "replaceWith"="__hello_qubit" "requiredQubits"="0" "requiredResults"="0" }