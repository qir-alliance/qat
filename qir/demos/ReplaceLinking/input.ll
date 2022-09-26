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
	%q = call %Qubit* @__quantum__rt__qubit_allocate()
	%c = call %Qubit* @__quantum__rt__qubit_allocate()
	call void @__quantum__qis__z__body(%Qubit* %q)
	call void @__quantum__qis__cnot__body(%Qubit* %q, %Qubit* %c)
	call void @__quantum__rt__qubit_release(%Qubit* %c)	
	call void @__quantum__rt__qubit_release(%Qubit* %q)
	ret void
}

attributes #0 = { "EntryPoint" }
attributes #1 = { "replaceWith"="soft_z" }