; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Qubit = type opaque

define i64 @IfCase__Main__Interop(i64 %nrIter) local_unnamed_addr #0 {
entry:
  %0 = icmp eq i64 %nrIter, 1
  br i1 %0, label %quantum, label %IfCase__Main__body.exit

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %IfCase__Main__body.exit

IfCase__Main__body.exit:                          ; preds = %quantum, %entry
  %ret.0.i = phi i64 [ 9, %quantum ], [ 1, %entry ]
  ret i64 %ret.0.i
}

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="1" "requiredResults"="0" }
