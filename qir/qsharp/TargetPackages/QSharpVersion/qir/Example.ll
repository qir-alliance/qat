
%Result = type opaque
%Qubit = type opaque
%Array = type opaque

define void @QATSample__Main() #0 {
entry:
  %desired = call %Result* @__quantum__rt__result_get_zero()
  %target = call %Qubit* @__quantum__rt__qubit_allocate()
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %target)
  call void @__quantum__qis__reset__body(%Qubit* %target)
  %0 = call %Result* @__quantum__rt__result_get_one()
  %1 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %0)
  br i1 %1, label %then0__1, label %continue__2

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* %target)
  br label %continue__2

continue__2:                                      ; preds = %then0__1, %entry
  %2 = call i1 @__quantum__rt__result_equal(%Result* %desired, %Result* %result)
  %3 = xor i1 %2, true
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  br i1 %3, label %then0__2, label %continue__1

then0__2:                                         ; preds = %continue__2
  call void @__quantum__qis__x__body(%Qubit* %target)
  br label %continue__1

continue__1:                                      ; preds = %then0__2, %continue__2
  %__rtrnVal0__ = call %Result* @__quantum__rt__result_get_zero()
  call void @__quantum__rt__qubit_release(%Qubit* %target)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 1)
  call void @__quantum__rt__result_record_output(%Result* %__rtrnVal0__)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 -1)
  ret void
}

declare %Result* @__quantum__rt__result_get_zero()

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__qis__x__body(%Qubit*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__result_record_output(%Result*)

attributes #0 = { "EntryPoint" }
