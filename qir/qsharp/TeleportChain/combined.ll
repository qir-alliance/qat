; ModuleID = 'qat-link'
source_filename = "qat-link"

%Array = type opaque
%Qubit = type opaque
%Result = type opaque

define void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__Interop() local_unnamed_addr #0 {
entry:
  %0 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 0)
  %1 = bitcast i8* %0 to %Qubit**
  %2 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %7 = bitcast i8* %6 to %Qubit**
  br label %load25

load25:                                           ; preds = %entry
  %8 = load %Qubit*, %Qubit** %1, align 8
  %9 = load %Qubit*, %Qubit** %3, align 8
  %10 = load %Qubit*, %Qubit** %5, align 8
  %11 = load %Qubit*, %Qubit** %7, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* %8)
  tail call void @__quantum__qis__cnot__body(%Qubit* %8, %Qubit* %9)
  tail call void @__quantum__qis__h__body(%Qubit* %10)
  tail call void @__quantum__qis__cnot__body(%Qubit* %10, %Qubit* %11)
  tail call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  br label %readout24

readout24:                                        ; preds = %quantum22
  %12 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br i1 %12, label %then0__1.i.i.i, label %continue__1.i.i.i

then0__1.i.i.i:                                   ; preds = %exit_quantum_grouping23
  br label %load

load:                                             ; preds = %then0__1.i.i.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* inttoptr (i64 4 to %Qubit*))
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1.i.i.i

continue__1.i.i.i:                                ; preds = %exit_quantum_grouping, %exit_quantum_grouping23
  br label %load30

load30:                                           ; preds = %continue__1.i.i.i
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__mz__body(%Qubit* inttoptr (i64 2 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* inttoptr (i64 2 to %Qubit*))
  br label %readout29

readout29:                                        ; preds = %quantum27
  %13 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %13, label %then0__2.i.i.i, label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i

then0__2.i.i.i:                                   ; preds = %exit_quantum_grouping28
  br label %load5

load5:                                            ; preds = %then0__2.i.i.i
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__x__body(%Qubit* inttoptr (i64 4 to %Qubit*))
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i

TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i: ; preds = %exit_quantum_grouping3, %exit_quantum_grouping28
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %19 = bitcast i8* %18 to %Qubit**
  br label %load35

load35:                                           ; preds = %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i
  %20 = load %Qubit*, %Qubit** %15, align 8
  %21 = load %Qubit*, %Qubit** %17, align 8
  %22 = load %Qubit*, %Qubit** %19, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__cnot__body(%Qubit* %20, %Qubit* %21)
  tail call void @__quantum__qis__h__body(%Qubit* %20)
  tail call void @__quantum__qis__mz__body(%Qubit* %20, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %20)
  br label %readout34

readout34:                                        ; preds = %quantum32
  %23 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %23, label %then0__1.i.i2.i, label %continue__1.i.i3.i

then0__1.i.i2.i:                                  ; preds = %exit_quantum_grouping33
  br label %load10

load10:                                           ; preds = %then0__1.i.i2.i
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__z__body(%Qubit* %22)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %continue__1.i.i3.i

continue__1.i.i3.i:                               ; preds = %exit_quantum_grouping8, %exit_quantum_grouping33
  br label %load40

load40:                                           ; preds = %continue__1.i.i3.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__mz__body(%Qubit* %21, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %21)
  br label %readout39

readout39:                                        ; preds = %quantum37
  %24 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br i1 %24, label %then0__2.i.i4.i, label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit

then0__2.i.i4.i:                                  ; preds = %exit_quantum_grouping38
  br label %load15

load15:                                           ; preds = %then0__2.i.i4.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__x__body(%Qubit* %22)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit

TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit: ; preds = %exit_quantum_grouping38, %exit_quantum_grouping13
  br label %load20

load20:                                           ; preds = %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  ret void
}

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

define void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement() local_unnamed_addr #1 {
entry:
  %0 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 0)
  %1 = bitcast i8* %0 to %Qubit**
  %2 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %7 = bitcast i8* %6 to %Qubit**
  br label %load25

load25:                                           ; preds = %entry
  %8 = load %Qubit*, %Qubit** %1, align 8
  %9 = load %Qubit*, %Qubit** %3, align 8
  %10 = load %Qubit*, %Qubit** %5, align 8
  %11 = load %Qubit*, %Qubit** %7, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* %8)
  tail call void @__quantum__qis__cnot__body(%Qubit* %8, %Qubit* %9)
  tail call void @__quantum__qis__h__body(%Qubit* %10)
  tail call void @__quantum__qis__cnot__body(%Qubit* %10, %Qubit* %11)
  tail call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  br label %readout24

readout24:                                        ; preds = %quantum22
  %12 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br i1 %12, label %then0__1.i.i.i, label %continue__1.i.i.i

then0__1.i.i.i:                                   ; preds = %exit_quantum_grouping23
  br label %load

load:                                             ; preds = %then0__1.i.i.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* inttoptr (i64 4 to %Qubit*))
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %continue__1.i.i.i

continue__1.i.i.i:                                ; preds = %exit_quantum_grouping, %exit_quantum_grouping23
  br label %load30

load30:                                           ; preds = %continue__1.i.i.i
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__mz__body(%Qubit* inttoptr (i64 2 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* inttoptr (i64 2 to %Qubit*))
  br label %readout29

readout29:                                        ; preds = %quantum27
  %13 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %13, label %then0__2.i.i.i, label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i

then0__2.i.i.i:                                   ; preds = %exit_quantum_grouping28
  br label %load5

load5:                                            ; preds = %then0__2.i.i.i
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__x__body(%Qubit* inttoptr (i64 4 to %Qubit*))
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i

TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i: ; preds = %exit_quantum_grouping3, %exit_quantum_grouping28
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %19 = bitcast i8* %18 to %Qubit**
  br label %load35

load35:                                           ; preds = %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.exit.i
  %20 = load %Qubit*, %Qubit** %15, align 8
  %21 = load %Qubit*, %Qubit** %17, align 8
  %22 = load %Qubit*, %Qubit** %19, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__cnot__body(%Qubit* %20, %Qubit* %21)
  tail call void @__quantum__qis__h__body(%Qubit* %20)
  tail call void @__quantum__qis__mz__body(%Qubit* %20, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %20)
  br label %readout34

readout34:                                        ; preds = %quantum32
  %23 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %23, label %then0__1.i.i2.i, label %continue__1.i.i3.i

then0__1.i.i2.i:                                  ; preds = %exit_quantum_grouping33
  br label %load10

load10:                                           ; preds = %then0__1.i.i2.i
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__z__body(%Qubit* %22)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %continue__1.i.i3.i

continue__1.i.i3.i:                               ; preds = %exit_quantum_grouping8, %exit_quantum_grouping33
  br label %load40

load40:                                           ; preds = %continue__1.i.i3.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__mz__body(%Qubit* %21, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %21)
  br label %readout39

readout39:                                        ; preds = %quantum37
  %24 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br i1 %24, label %then0__2.i.i4.i, label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit

then0__2.i.i4.i:                                  ; preds = %exit_quantum_grouping38
  br label %load15

load15:                                           ; preds = %then0__2.i.i4.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__x__body(%Qubit* %22)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit

TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit: ; preds = %exit_quantum_grouping38, %exit_quantum_grouping13
  br label %load20

load20:                                           ; preds = %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.exit
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  ret void
}

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }

