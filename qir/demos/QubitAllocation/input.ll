; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%String = type opaque

declare %Qubit* @__quantum__rt__qubit_allocate()
declare void @__quantum__rt__qubit_release(%Qubit*)
declare void @__quantum__qis__h__body(%Qubit*)

define void @example() #0 {
entry:
	%q = call %Qubit* @__quantum__rt__qubit_allocate()
	call void @__quantum__qis__h__body(%Qubit* %q)
	call void @__quantum__rt__qubit_release(%Qubit* %q)
	ret void
}

attributes #0 = { "EntryPoint" }