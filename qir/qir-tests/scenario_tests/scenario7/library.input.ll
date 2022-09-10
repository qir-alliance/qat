; ModuleID = 'library'
source_filename = "library"

%Qubit = type opaque

define void @__hello_qubit(%Qubit* %control) {
entry:
  ret void
}

