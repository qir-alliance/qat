
%Qubit = type opaque
%Result = type opaque
%Array = type opaque

define void @QATSample__Main(i64 %x) #0 {
entry:
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q1)
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %0 = call %Result* @__quantum__rt__result_get_one()
  %r1 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %0)
  %q2 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q2)
  %result__1 = call %Result* @__quantum__qis__m__body(%Qubit* %q2)
  call void @__quantum__qis__reset__body(%Qubit* %q2)
  %1 = call %Result* @__quantum__rt__result_get_one()
  %r2 = call i1 @__quantum__rt__result_equal(%Result* %result__1, %Result* %1)
  %q3 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q3)
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q3)
  call void @__quantum__qis__reset__body(%Qubit* %q3)
  %2 = call %Result* @__quantum__rt__result_get_one()
  %r3 = call i1 @__quantum__rt__result_equal(%Result* %result__2, %Result* %2)
  %3 = insertvalue [3 x i1] zeroinitializer, i1 %r1, 0
  %4 = insertvalue { [3 x i1], i64 } zeroinitializer, [3 x i1] %3, 0
  %5 = insertvalue { [3 x i1], i64 } %4, i64 3, 1
  %6 = extractvalue { [3 x i1], i64 } %5, 0
  %7 = extractvalue { [3 x i1], i64 } %5, 1
  %8 = insertvalue [3 x i1] %6, i1 %r2, 1
  %9 = insertvalue { [3 x i1], i64 } zeroinitializer, [3 x i1] %8, 0
  %10 = insertvalue { [3 x i1], i64 } %9, i64 3, 1
  %11 = extractvalue { [3 x i1], i64 } %10, 0
  %12 = extractvalue { [3 x i1], i64 } %10, 1
  %13 = insertvalue [3 x i1] %11, i1 %r3, 2
  %14 = insertvalue { [3 x i1], i64 } zeroinitializer, [3 x i1] %13, 0
  %__rtrnVal0__ = insertvalue { [3 x i1], i64 } %14, i64 3, 1
  call void @__quantum__rt__result_update_reference_count(%Result* %result__2, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q3)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__1, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q2)
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__bool_record_output(i1 %r1)
  call void @__quantum__rt__bool_record_output(i1 %r2)
  call void @__quantum__rt__bool_record_output(i1 %r3)
  call void @__quantum__rt__array_end_record_output()
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__array_start_record_output()

declare void @__quantum__rt__bool_record_output(i1)

declare void @__quantum__rt__array_end_record_output()

attributes #0 = { "EntryPoint" }
