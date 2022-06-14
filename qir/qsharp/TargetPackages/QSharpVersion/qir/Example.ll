
%Qubit = type opaque
%Result = type opaque
%Array = type opaque

define void @QATSample__Main(i64 %x) #0 {
entry:
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %0 = call %Result* @__quantum__rt__result_get_one()
  %__rtrnVal2__ = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %0)
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  %result__1 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %__rtrnVal2__1 = call i1 @__quantum__rt__result_equal(%Result* %result__1, %Result* %1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__1, i32 -1)
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %2 = call %Result* @__quantum__rt__result_get_one()
  %__rtrnVal2__2 = call i1 @__quantum__rt__result_equal(%Result* %result__2, %Result* %2)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__2, i32 -1)
  %result__3 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %3 = call %Result* @__quantum__rt__result_get_zero()
  %__rtrnVal2__3 = call i1 @__quantum__rt__result_equal(%Result* %result__3, %Result* %3)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__3, i32 -1)
  %4 = insertvalue [4 x i1] zeroinitializer, i1 %__rtrnVal2__, 0
  %5 = insertvalue { [4 x i1], i64 } zeroinitializer, [4 x i1] %4, 0
  %6 = insertvalue { [4 x i1], i64 } %5, i64 4, 1
  %7 = extractvalue { [4 x i1], i64 } %6, 0
  %8 = extractvalue { [4 x i1], i64 } %6, 1
  %9 = insertvalue [4 x i1] %7, i1 %__rtrnVal2__1, 1
  %10 = insertvalue { [4 x i1], i64 } zeroinitializer, [4 x i1] %9, 0
  %11 = insertvalue { [4 x i1], i64 } %10, i64 4, 1
  %12 = extractvalue { [4 x i1], i64 } %11, 0
  %13 = extractvalue { [4 x i1], i64 } %11, 1
  %14 = insertvalue [4 x i1] %12, i1 %__rtrnVal2__2, 2
  %15 = insertvalue { [4 x i1], i64 } zeroinitializer, [4 x i1] %14, 0
  %16 = insertvalue { [4 x i1], i64 } %15, i64 4, 1
  %17 = extractvalue { [4 x i1], i64 } %16, 0
  %18 = extractvalue { [4 x i1], i64 } %16, 1
  %19 = insertvalue [4 x i1] %17, i1 %__rtrnVal2__3, 3
  %20 = insertvalue { [4 x i1], i64 } zeroinitializer, [4 x i1] %19, 0
  %r1 = insertvalue { [4 x i1], i64 } %20, i64 4, 1
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__bool_record_output(i1 %__rtrnVal2__)
  call void @__quantum__rt__bool_record_output(i1 %__rtrnVal2__1)
  call void @__quantum__rt__bool_record_output(i1 %__rtrnVal2__2)
  call void @__quantum__rt__bool_record_output(i1 %__rtrnVal2__3)
  call void @__quantum__rt__array_end_record_output()
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__array_start_record_output()

declare void @__quantum__rt__bool_record_output(i1)

declare void @__quantum__rt__array_end_record_output()

attributes #0 = { "EntryPoint" }
