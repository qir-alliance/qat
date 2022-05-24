; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define void @open_qasm_body() #0 {
entry:
  br label %header__1.i

header__1.i:                                      ; preds = %body__1.i, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1.i ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1.i, label %open_qasm_body.exit

body__1.i:                                        ; preds = %header__1.i
  call void @__quantum__qis__h__body(%Qubit* null)
  %2 = add i64 %0, 1
  br label %header__1.i

open_qasm_body.exit:                      ; preds = %header__1.i
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

attributes #0 = { "EntryPoint" }