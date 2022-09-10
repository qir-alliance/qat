; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque

define void @__hello_qubit(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %control)
  call void @__quantum__qis__h__body(%Qubit* %target)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)