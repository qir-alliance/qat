; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define i64 @IfCase__Main__Interop(i64 %nrIter) local_unnamed_addr #0 {
entry:
  %0 = icmp eq i64 %nrIter, 1
  br i1 %0, label %then0__1.i, label %IfCase__Main__body.exit

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %IfCase__Main__body.exit

IfCase__Main__body.exit:                          ; preds = %entry, %exit_quantum_grouping
  %ret.0.i = phi i64 [ 9, %exit_quantum_grouping ], [ 1, %entry ]
  ret i64 %ret.0.i
}

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="1" "requiredResults"="0" }

