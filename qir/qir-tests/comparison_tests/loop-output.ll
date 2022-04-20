; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define void @open_qasm_body() #0 {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

attributes #0 = { "EntryPoint" "maxQubitIndex"="0" "maxResultIndex"="0" "requiredQubits"="1" "requiredResults"="0" }
attributes #1 = { "maxQubitIndex"="0" "maxResultIndex"="0" "requiredQubits"="0" "requiredResults"="0" }