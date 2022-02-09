; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Qubit = type opaque
%Result = type opaque

define i64 @LoopCase__Main__Interop(i64 %nrIter) local_unnamed_addr #0 {
entry:
  %.not1.i = icmp slt i64 %nrIter, 1
  br i1 %.not1.i, label %LoopCase__Main__body.1.exit, label %body__1.i

body__1.i:                                        ; preds = %entry, %body__1.i
  %0 = phi i64 [ %2, %body__1.i ], [ 2, %entry ]
  %1 = icmp sgt i64 %0, %nrIter
  %2 = add i64 %0, 1
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br i1 %1, label %header__1.exit__1_crit_edge.i, label %body__1.i

header__1.exit__1_crit_edge.i:                    ; preds = %body__1.i
  %4 = select i1 %3, i64 1337, i64 122
  br label %LoopCase__Main__body.1.exit

LoopCase__Main__body.1.exit:                      ; preds = %header__1.exit__1_crit_edge.i, %entry
  %ret.0.lcssa.i = phi i64 [ %4, %header__1.exit__1_crit_edge.i ], [ 1, %entry ]
  ret i64 %ret.0.lcssa.i
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="1" "requiredResults"="1" }
