; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque

define void @soft_z(%Qubit* %q) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__x__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}

declare void @__quantum__qis__x__body(%Qubit*)
declare void @__quantum__qis__h__body(%Qubit*)