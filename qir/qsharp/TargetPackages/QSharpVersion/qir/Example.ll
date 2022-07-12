
%Qubit = type opaque
%Result = type opaque
%Array = type opaque

define void @QATSample__Main() #0 {
entry:
  %r0 = call %Qubit* @__quantum__rt__qubit_allocate()
  %r1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %r2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %r3 = call %Qubit* @__quantum__rt__qubit_allocate()
  %r4 = call %Qubit* @__quantum__rt__qubit_allocate()
  %auxiliary = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %r0)
  call void @__quantum__qis__h__body(%Qubit* %r1)
  call void @__quantum__qis__h__body(%Qubit* %r2)
  call void @__quantum__qis__h__body(%Qubit* %r3)
  call void @__quantum__qis__h__body(%Qubit* %r4)
  call void @__quantum__qis__h__body(%Qubit* %auxiliary)
  call void @__quantum__qis__z__body(%Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %r0, %Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %r2, %Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %r4, %Qubit* %auxiliary)
  call void @__quantum__qis__h__body(%Qubit* %r0)
  call void @__quantum__qis__h__body(%Qubit* %r1)
  call void @__quantum__qis__h__body(%Qubit* %r2)
  call void @__quantum__qis__h__body(%Qubit* %r3)
  call void @__quantum__qis__h__body(%Qubit* %r4)
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %r0)
  call void @__quantum__qis__reset__body(%Qubit* %r0)
  %result__1 = call %Result* @__quantum__qis__m__body(%Qubit* %r1)
  call void @__quantum__qis__reset__body(%Qubit* %r1)
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %r2)
  call void @__quantum__qis__reset__body(%Qubit* %r2)
  %result__3 = call %Result* @__quantum__qis__m__body(%Qubit* %r3)
  call void @__quantum__qis__reset__body(%Qubit* %r3)
  %result__4 = call %Result* @__quantum__qis__m__body(%Qubit* %r4)
  call void @__quantum__qis__reset__body(%Qubit* %r4)
  %0 = insertvalue [5 x %Result*] zeroinitializer, %Result* %result, 0
  %1 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %0, 0
  %2 = insertvalue { [5 x %Result*], i64 } %1, i64 5, 1
  %3 = extractvalue { [5 x %Result*], i64 } %2, 0
  %4 = extractvalue { [5 x %Result*], i64 } %2, 1
  %5 = insertvalue [5 x %Result*] %3, %Result* %result__1, 1
  %6 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %5, 0
  %7 = insertvalue { [5 x %Result*], i64 } %6, i64 5, 1
  %8 = extractvalue { [5 x %Result*], i64 } %7, 0
  %9 = extractvalue { [5 x %Result*], i64 } %7, 1
  %10 = insertvalue [5 x %Result*] %8, %Result* %result__2, 2
  %11 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %10, 0
  %12 = insertvalue { [5 x %Result*], i64 } %11, i64 5, 1
  %13 = extractvalue { [5 x %Result*], i64 } %12, 0
  %14 = extractvalue { [5 x %Result*], i64 } %12, 1
  %15 = insertvalue [5 x %Result*] %13, %Result* %result__3, 3
  %16 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %15, 0
  %17 = insertvalue { [5 x %Result*], i64 } %16, i64 5, 1
  %18 = extractvalue { [5 x %Result*], i64 } %17, 0
  %19 = extractvalue { [5 x %Result*], i64 } %17, 1
  %20 = insertvalue [5 x %Result*] %18, %Result* %result__4, 4
  %21 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %20, 0
  %__rtrnVal0__ = insertvalue { [5 x %Result*], i64 } %21, i64 5, 1
  call void @__quantum__rt__qubit_release(%Qubit* %auxiliary)
  call void @__quantum__rt__qubit_release(%Qubit* %r4)
  call void @__quantum__rt__qubit_release(%Qubit* %r3)
  call void @__quantum__rt__qubit_release(%Qubit* %r2)
  call void @__quantum__rt__qubit_release(%Qubit* %r1)
  call void @__quantum__rt__qubit_release(%Qubit* %r0)
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__result_record_output(%Result* %result)
  call void @__quantum__rt__result_record_output(%Result* %result__1)
  call void @__quantum__rt__result_record_output(%Result* %result__2)
  call void @__quantum__rt__result_record_output(%Result* %result__3)
  call void @__quantum__rt__result_record_output(%Result* %result__4)
  call void @__quantum__rt__array_end_record_output()


  %q0 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q3 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q4 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q0)
  call void @__quantum__qis__h__body(%Qubit* %q1)
  call void @__quantum__qis__h__body(%Qubit* %q2)
  call void @__quantum__qis__h__body(%Qubit* %q3)
  call void @__quantum__qis__h__body(%Qubit* %q4)  
  %extra = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
  call void @__quantum__qis__reset__body(%Qubit* %q0)
  %extra__1 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  call void @__quantum__qis__reset__body(%Qubit* %q1)
  %extra__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q2)
  call void @__quantum__qis__reset__body(%Qubit* %q2)
  %extra__3 = call %Result* @__quantum__qis__m__body(%Qubit* %q3)
  call void @__quantum__qis__reset__body(%Qubit* %q3)
  %extra__4 = call %Result* @__quantum__qis__m__body(%Qubit* %q4)
  call void @__quantum__qis__reset__body(%Qubit* %q4)

  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__result_record_output(%Result* %extra)
  call void @__quantum__rt__result_record_output(%Result* %extra__1)
  call void @__quantum__rt__result_record_output(%Result* %extra__2)
  call void @__quantum__rt__result_record_output(%Result* %extra__3)
  call void @__quantum__rt__result_record_output(%Result* %extra__4)
  call void @__quantum__rt__array_end_record_output()
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__z__body(%Qubit*)

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

declare void @__quantum__rt__array_start_record_output()

declare void @__quantum__rt__result_record_output(%Result*)

declare void @__quantum__rt__array_end_record_output()

attributes #0 = { "EntryPoint" }
