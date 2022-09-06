; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque
declare void @bar(%Qubit* %control)
declare void @baz(%Qubit* %control)

define void @dummy(%Qubit* %control) {
entry:
  ; Prevents bar from being optimised away.
  call void @bar(%Qubit* %control)
  call void @baz(%Qubit* %control)

  ret void
}

