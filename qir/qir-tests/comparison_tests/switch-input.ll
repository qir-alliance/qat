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
  %spec.select = select i1 %0, i64 2, i64 0
  %1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  %2 = or i64 %spec.select, 1
  %rand.1 = select i1 %1, i64 %2, i64 %spec.select
  switch i64 %rand.1, label %then1__2 [
    i64 0, label %continue__3
    i64 1, label %then0__4
    i64 2, label %then2__2
  ]

then0__4:                                         ; preds = %entry
  call void @__quantum__qis__rx__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

then2__2:                                         ; preds = %entry
  call void @__quantum__qis__rz__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

then1__2:                                         ; preds = %entry
  call void @__quantum__qis__ry__body(double 3.140000e+00, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue__3

continue__3:                                      ; preds = %entry, %then1__2, %then2__2, %then0__4
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare void @__quantum__qis__h__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__qis__rx__body(double, %Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare void @__quantum__qis__ry__body(double, %Qubit*)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__rt__result_record_output(%Result*)

declare void @__quantum__qis__mz__body(%Qubit*, %Result*)

declare i1 @__quantum__qis__read_result__body(%Result*)

attributes #0 = { "EntryPoint" }

