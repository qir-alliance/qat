; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Array = type opaque
%Qubit = type opaque
%Result = type opaque

define void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__Interop() local_unnamed_addr #0 {
entry:
  tail call fastcc void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body()
  ret void
}

define internal fastcc void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body() unnamed_addr {
entry:
  %0 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 0)
  %1 = bitcast i8* %0 to %Qubit**
  %2 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %7 = bitcast i8* %6 to %Qubit**
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 1)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 4 to %Array*), i64 1)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %1, align 8
  %15 = load %Qubit*, %Qubit** %3, align 8
  %16 = load %Qubit*, %Qubit** %5, align 8
  %17 = load %Qubit*, %Qubit** %7, align 8
  %18 = load %Qubit*, %Qubit** %9, align 8
  %19 = load %Qubit*, %Qubit** %11, align 8
  %20 = load %Qubit*, %Qubit** %13, align 8
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* %14)
  tail call void @__quantum__qis__cnot__body(%Qubit* %14, %Qubit* %15)
  tail call void @__quantum__qis__h__body(%Qubit* %16)
  tail call void @__quantum__qis__cnot__body(%Qubit* %16, %Qubit* %17)
  tail call fastcc void @TeleportChain__TeleportQubitUsingPresharedEntanglement__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call fastcc void @TeleportChain__TeleportQubitUsingPresharedEntanglement__body(%Qubit* %18, %Qubit* %19, %Qubit* %20)
  tail call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  ret void
}

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

define internal fastcc void @TeleportChain__TeleportQubitUsingPresharedEntanglement__body(%Qubit* %src, %Qubit* %intermediary, %Qubit* %dest) unnamed_addr {
entry:
  tail call void @__quantum__qis__cnot__body(%Qubit* %src, %Qubit* %intermediary)
  tail call void @__quantum__qis__h__body(%Qubit* %src)
  tail call void @__quantum__qis__mz__body(%Qubit* %src, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %src)
  %0 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br i1 %0, label %quantum, label %quantum12

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__z__body(%Qubit* %dest)
  br label %quantum12

quantum12:                                        ; preds = %quantum, %entry
  tail call void @__quantum__qis__mz__body(%Qubit* %intermediary, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %intermediary)
  %1 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br i1 %1, label %quantum2, label %TeleportChain__ApplyCorrection__body.exit

quantum2:                                         ; preds = %quantum12
  tail call void @__quantum__qis__x__body(%Qubit* %dest)
  br label %TeleportChain__ApplyCorrection__body.exit

TeleportChain__ApplyCorrection__body.exit:        ; preds = %quantum2, %quantum12
  ret void
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

define void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement() local_unnamed_addr #1 {
entry:
  tail call fastcc void @TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body()
  ret void
}

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
