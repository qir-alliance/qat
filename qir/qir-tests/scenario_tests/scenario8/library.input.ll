; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque
declare void @__hello_qubit(%Qubit* %control)

define void @dummy(%Qubit* %control) {
entry:
  ; Prevents __hello_qubit from being optimised away.
  call void @__hello_qubit(%Qubit* %control)
  ret void
}

