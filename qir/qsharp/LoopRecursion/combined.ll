; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%String = type opaque

define i64 @TeleportChain__QuantumProgram__Interop() #0 {
entry:
  %0 = call i64 @TeleportChain__QuantumProgram__body()
  ret i64 %0
}

define internal i64 @TeleportChain__QuantumProgram__body() {
entry:
  %ret = alloca i64, align 8
  store i64 1, i64* %ret, align 4
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %i = phi i64 [ 0, %entry ], [ %4, %exiting__1 ]
  %0 = icmp sle i64 %i, 5
  br i1 %0, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %1 = load i64, i64* %ret, align 4
  %2 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)
  %3 = add i64 %1, %2
  store i64 %3, i64* %ret, align 4
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %4 = add i64 %i, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %5 = load i64, i64* %ret, align 4
  ret i64 %5
}

declare %Qubit* @__quantum__rt__qubit_allocate()

define internal i64 @TeleportChain__Calculate__body(i64 %n, %Qubit* %c) {
entry:
  %ret = alloca i64, align 8
  store i64 2, i64* %ret, align 4
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %c, %Qubit* inttoptr (i64 1 to %Qubit*))
  %0 = icmp ne i64 %n, 0
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %1 = sub i64 %n, 1
  %2 = call i64 @TeleportChain__Calculate__body(i64 %1, %Qubit* inttoptr (i64 1 to %Qubit*))
  %3 = add i64 %2, 2
  store i64 %3, i64* %ret, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %4 = load i64, i64* %ret, align 4
  ret i64 %4
}

declare void @__quantum__rt__qubit_release(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target) {
entry:
  br label %load

load:                                             ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %load
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
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

define void @TeleportChain__QuantumProgram() #1 {
entry:
  %0 = call i64 @TeleportChain__QuantumProgram__body()
  ret void
}

declare %String* @__quantum__rt__int_to_string(i64)

declare void @__quantum__rt__message(%String*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }

