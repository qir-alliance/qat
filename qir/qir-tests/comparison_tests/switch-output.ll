; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%Result = type opaque

define void @QATSample__Main() #0 {
entry:
  br label %load22

load22:                                           ; preds = %entry
  br label %quantum19

quantum19:                                        ; preds = %load22
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  br label %readout21

readout21:                                        ; preds = %quantum19
  %0 = call i1 @__quantum__qis__read_result__body(%Result* null)
  %1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  br label %post-classical18

post-classical18:                                 ; preds = %readout21
  %2 = select i1 %0, i2 -2, i2 0
  %3 = select i1 %1, i2 1, i2 0
  %4 = or i2 %2, %3
  br label %exit_quantum_grouping20

exit_quantum_grouping20:                          ; preds = %post-classical18
  br label %NodeBlock1

NodeBlock1:                                       ; preds = %exit_quantum_grouping20
  %Pivot2 = icmp slt i2 %4, 0
  br i1 %Pivot2, label %LeafBlock, label %NodeBlock

NodeBlock:                                        ; preds = %NodeBlock1
  %Pivot = icmp slt i2 %4, 1
  br i1 %Pivot, label %continue__3, label %then0__4

LeafBlock:                                        ; preds = %NodeBlock1
  %SwitchLeaf = icmp eq i2 %4, -2
  br i1 %SwitchLeaf, label %then2__2, label %NewDefault

then0__4:                                         ; preds = %NodeBlock
  br label %load

load:                                             ; preds = %then0__4
  br label %quantum

quantum:                                          ; preds = %load
  call void @__quantum__qis__rx__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__3

then2__2:                                         ; preds = %LeafBlock
  br label %load7

load7:                                            ; preds = %then2__2
  br label %quantum4

quantum4:                                         ; preds = %load7
  call void @__quantum__qis__rz__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout6

readout6:                                         ; preds = %quantum4
  br label %post-classical3

post-classical3:                                  ; preds = %readout6
  br label %exit_quantum_grouping5

exit_quantum_grouping5:                           ; preds = %post-classical3
  br label %continue__3

NewDefault:                                       ; preds = %LeafBlock
  br label %then1__2

then1__2:                                         ; preds = %NewDefault
  br label %load12

load12:                                           ; preds = %then1__2
  br label %quantum9

quantum9:                                         ; preds = %load12
  call void @__quantum__qis__ry__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout11

readout11:                                        ; preds = %quantum9
  br label %post-classical8

post-classical8:                                  ; preds = %readout11
  br label %exit_quantum_grouping10

exit_quantum_grouping10:                          ; preds = %post-classical8
  br label %continue__3

continue__3:                                      ; preds = %NodeBlock, %exit_quantum_grouping10, %exit_quantum_grouping5, %exit_quantum_grouping
  br label %load17

load17:                                           ; preds = %continue__3
  br label %quantum14

quantum14:                                        ; preds = %load17
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  br label %readout16

readout16:                                        ; preds = %quantum14
  br label %post-classical13

post-classical13:                                 ; preds = %readout16
  br label %exit_quantum_grouping15

exit_quantum_grouping15:                          ; preds = %post-classical13
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__mz__body(%Qubit*, %Result*)

declare i1 @__quantum__qis__read_result__body(%Result*)

declare void @__quantum__qis__rx__body(double, %Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare void @__quantum__qis__ry__body(double, %Qubit*)

attributes #0 = { "EntryPoint" "maxQubitIndex"="2" "maxResultIndex"="2" "requiredQubits"="3" "requiredResults"="3" }
