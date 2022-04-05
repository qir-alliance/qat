; ModuleID = 'QSharpVersion/qir/Example.ll'
source_filename = "QSharpVersion/qir/Example.ll"

%Qubit = type opaque
%Result = type opaque
%String = type opaque

declare %Qubit* @__quantum__rt__qubit_allocate() local_unnamed_addr

declare void @__quantum__rt__qubit_release(%Qubit*) local_unnamed_addr

declare void @__quantum__rt__result_update_reference_count(%Result*, i32) local_unnamed_addr

declare %Result* @__quantum__qis__m__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

define i64 @QATSample__Main__Interop() local_unnamed_addr #0 {
entry:
  %q.i = tail call %Qubit* @__quantum__rt__qubit_allocate()
  tail call void @__quantum__qis__h__body(%Qubit* %q.i)
  %result.i.i = tail call %Result* @__quantum__qis__m__body(%Qubit* %q.i)
  tail call void @__quantum__qis__reset__body(%Qubit* %q.i)
  tail call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i, i32 -1)
  tail call void @__quantum__rt__qubit_release(%Qubit* %q.i)
  ret i64 9
}

define void @QATSample__Main() local_unnamed_addr #1 {
entry:
  %q.i = tail call %Qubit* @__quantum__rt__qubit_allocate()
  tail call void @__quantum__qis__h__body(%Qubit* %q.i)
  %result.i.i = tail call %Result* @__quantum__qis__m__body(%Qubit* %q.i)
  tail call void @__quantum__qis__reset__body(%Qubit* %q.i)
  tail call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i, i32 -1)
  tail call void @__quantum__rt__qubit_release(%Qubit* %q.i)
  %0 = tail call %String* @__quantum__rt__int_to_string(i64 9)
  tail call void @__quantum__rt__message(%String* %0)
  tail call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*) local_unnamed_addr

declare %String* @__quantum__rt__int_to_string(i64) local_unnamed_addr

declare void @__quantum__rt__string_update_reference_count(%String*, i32) local_unnamed_addr

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
