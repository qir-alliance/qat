; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%Result = type opaque

define void @QATSample__Main() #0 {
entry:
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  %0 = call i1 @__quantum__qis__read_result__body(%Result* null)
  %spec.select = select i1 %0, i2 -2, i2 0
  %1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  %2 = select i1 %1, i2 1, i2 0
  %rand.1 = or i2 %spec.select, %2
  br label %NodeBlock1

NodeBlock1:                                       ; preds = %entry
  %Pivot2 = icmp slt i2 %rand.1, 0
  br i1 %Pivot2, label %LeafBlock, label %NodeBlock

NodeBlock:                                        ; preds = %NodeBlock1
  %Pivot = icmp slt i2 %rand.1, 1
  br i1 %Pivot, label %continue__3, label %then0__4

LeafBlock:                                        ; preds = %NodeBlock1
  %SwitchLeaf = icmp eq i2 %rand.1, -2
  br i1 %SwitchLeaf, label %then2__2, label %NewDefault

then0__4:                                         ; preds = %NodeBlock
  call void @__quantum__qis__rx__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

then2__2:                                         ; preds = %LeafBlock
  call void @__quantum__qis__rz__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

NewDefault:                                       ; preds = %LeafBlock
  br label %then1__2

then1__2:                                         ; preds = %NewDefault
  call void @__quantum__qis__ry__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

continue__3:                                      ; preds = %NodeBlock, %then1__2, %then2__2, %then0__4
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__mz__body(%Qubit*, %Result*)

declare i1 @__quantum__qis__read_result__body(%Result*)

declare void @__quantum__qis__rx__body(double, %Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare void @__quantum__qis__ry__body(double, %Qubit*)

attributes #0 = { "EntryPoint" "maxQubitIndex"="2" "maxResultIndex"="2" "requiredQubits"="3" "requiredResults"="3" }