; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque

define void @__hello_qubit(%Qubit* %control, i32 %x) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %control)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)