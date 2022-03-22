; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define void @SimpleLoop__Main() #0 {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

attributes #0 = { "EntryPoint" }