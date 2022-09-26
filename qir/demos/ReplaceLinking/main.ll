; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%String = type opaque

declare %Qubit* @__quantum__rt__qubit_allocate()
declare void @__quantum__rt__qubit_release(%Qubit*)
declare void @__quantum__qis__z__body(%Qubit*) #1
declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

define void @example() #0 {
entry:
	%a = call %Qubit* @__quantum__rt__qubit_allocate()
	%b = call %Qubit* @__quantum__rt__qubit_allocate()
	call void @__quantum__qis__z__body(%Qubit* %a)
	call void @__quantum__qis__cnot__body(%Qubit* %a, %Qubit* %b)
	call void @__quantum__rt__qubit_release(%Qubit* %b)
	call void @__quantum__rt__qubit_release(%Qubit* %a)
	ret void
}

attributes #0 = { "EntryPoint" }
attributes #1 = { "replaceWith"="soft_z" }