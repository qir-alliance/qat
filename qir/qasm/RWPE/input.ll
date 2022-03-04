
%Range = type { i64, i64, i64 }
%Qubit = type opaque
%Result = type opaque
%Array = type opaque
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal void @rwpe__cnot__body(%Qubit* %ctl, %Qubit* %tgt) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %ctl, %Qubit* %tgt)
  ret void
}

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

define internal void @rwpe__CRz__body(double %angle, %Qubit* %ctl, %Qubit* %tgt) {
entry:
  call void @rwpe__Rz__body(double %angle, %Qubit* %tgt)
  call void @__quantum__qis__cnot__body(%Qubit* %ctl, %Qubit* %tgt)
  call void @rwpe__Rz__adj(double %angle, %Qubit* %tgt)
  call void @__quantum__qis__cnot__body(%Qubit* %ctl, %Qubit* %tgt)
  ret void
}

define internal void @rwpe__Rz__body(double %angle, %Qubit* %q) {
entry:
  call void @__quantum__qis__rz__body(double %angle, %Qubit* %q)
  ret void
}

define internal void @rwpe__Rz__adj(double %angle, %Qubit* %q) {
entry:
  %angle__1 = fneg double %angle
  call void @__quantum__qis__rz__body(double %angle__1, %Qubit* %q)
  ret void
}

define internal double @rwpe__EstimatePhase__body() {
entry:
  %mu = alloca double, align 8
  store double 7.951000e-01, double* %mu, align 8
  %sigma = alloca double, align 8
  store double 6.065000e-01, double* %sigma, align 8
  %target = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__x__body(%Qubit* %target)
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %i = phi i64 [ 0, %entry ], [ %12, %exiting__1 ]
  %0 = icmp sle i64 %i, 23
  br i1 %0, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %aux = call %Qubit* @__quantum__rt__qubit_allocate()
  %1 = load double, double* %mu, align 8
  %2 = load double, double* %sigma, align 8
  call void @rwpe__Iterate__body(double %1, double %2, %Qubit* %aux, %Qubit* %target)
  %3 = call %Result* @__quantum__qis__m__body(%Qubit* %aux)
  %4 = call %Result* @__quantum__rt__result_get_one()
  %5 = call i1 @__quantum__rt__result_equal(%Result* %3, %Result* %4)
  call void @__quantum__rt__result_update_reference_count(%Result* %3, i32 -1)
  br i1 %5, label %then0__1, label %else__1

then0__1:                                         ; preds = %body__1
  call void @__quantum__qis__x__body(%Qubit* %aux)
  %6 = fmul double 6.065000e-01, %2
  %7 = fadd double %1, %6
  store double %7, double* %mu, align 8
  br label %continue__1

else__1:                                          ; preds = %body__1
  %8 = load double, double* %mu, align 8
  %9 = fmul double 6.065000e-01, %2
  %10 = fsub double %8, %9
  store double %10, double* %mu, align 8
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then0__1
  %11 = fmul double %2, 7.951000e-01
  store double %11, double* %sigma, align 8
  call void @__quantum__rt__qubit_release(%Qubit* %aux)
  br label %exiting__1

exiting__1:                                       ; preds = %continue__1
  %12 = add i64 %i, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %13 = load double, double* %mu, align 8
  %14 = fmul double %13, 2.000000e+00
  call void @__quantum__rt__qubit_release(%Qubit* %target)
  ret double %14
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__x__body(%Qubit*)

define internal void @rwpe__Iterate__body(double %mu, double %sigma, %Qubit* %aux, %Qubit* %target) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %aux)
  %0 = fdiv double %mu, %sigma
  %angle = fsub double 1.000000e+00, %0
  call void @__quantum__qis__rz__body(double %angle, %Qubit* %aux)
  %1 = fdiv double 2.500000e-01, %sigma
  call void @rwpe__CRz__body(double %1, %Qubit* %aux, %Qubit* %target)
  call void @__quantum__qis__h__body(%Qubit* %aux)
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

define internal void @rwpe__h__body(%Qubit* %q) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

define internal void @rwpe__h__adj(%Qubit* %q) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}

declare void @__quantum__qis__rz__body(double, %Qubit*)

define internal %Result* @rwpe__m__body(%Qubit* %q) {
entry:
  %0 = call %Result* @__quantum__qis__m__body(%Qubit* %q)
  ret %Result* %0
}

define internal void @rwpe__rz__body(double %angle, %Qubit* %q) {
entry:
  call void @__quantum__qis__rz__body(double %angle, %Qubit* %q)
  ret void
}

define internal void @rwpe__x__body(%Qubit* %q) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %q)
  ret void
}

define double @rwpe__main() #0 {
entry:
  %0 = call double @rwpe__EstimatePhase__body()
  ret double %0
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__double_to_string(double)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
