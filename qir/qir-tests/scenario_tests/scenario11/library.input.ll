; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque
declare void @bar(%Qubit* %control, i32 %x)

define void @dummy(%Qubit* %control) {
entry:
  ; Prevents __quantum__qis__h__body from being optimised away.
  call void @bar(%Qubit* %control, i32 1)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)
