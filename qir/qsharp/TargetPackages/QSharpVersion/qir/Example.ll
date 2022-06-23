
%Qubit = type opaque
%Result = type opaque
%Array = type opaque

define void @QATSample__Main() #0 {
entry:
  %i = alloca i64, align 8
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q)
  store i64 0, i64* %i, align 4
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q)
  %0 = call %Result* @__quantum__rt__result_get_one()
  %1 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %0)
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  br i1 %1, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  store i64 1, i64* %i, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %__rtrnVal0__ = load i64, i64* %i, align 4
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  call void @__quantum__rt__int_record_output(i64 %__rtrnVal0__)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__int_record_output(i64)

attributes #0 = { "EntryPoint" }
