
%Result = type opaque
%Qubit = type opaque
%Array = type opaque

define void @QATSample__BernsteinVazirani() #0 {
entry:
  %results = alloca { [5 x %Result*], i64 }, align 8
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  %q__1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q__2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q__3 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q__4 = call %Qubit* @__quantum__rt__qubit_allocate()
  %0 = insertvalue [5 x %Qubit*] zeroinitializer, %Qubit* %q, 0
  %1 = insertvalue { [5 x %Qubit*], i64 } zeroinitializer, [5 x %Qubit*] %0, 0
  %2 = insertvalue { [5 x %Qubit*], i64 } %1, i64 5, 1
  %3 = extractvalue { [5 x %Qubit*], i64 } %2, 0
  %4 = extractvalue { [5 x %Qubit*], i64 } %2, 1
  %5 = insertvalue [5 x %Qubit*] %3, %Qubit* %q__1, 1
  %6 = insertvalue { [5 x %Qubit*], i64 } zeroinitializer, [5 x %Qubit*] %5, 0
  %7 = insertvalue { [5 x %Qubit*], i64 } %6, i64 5, 1
  %8 = extractvalue { [5 x %Qubit*], i64 } %7, 0
  %9 = extractvalue { [5 x %Qubit*], i64 } %7, 1
  %10 = insertvalue [5 x %Qubit*] %8, %Qubit* %q__2, 2
  %11 = insertvalue { [5 x %Qubit*], i64 } zeroinitializer, [5 x %Qubit*] %10, 0
  %12 = insertvalue { [5 x %Qubit*], i64 } %11, i64 5, 1
  %13 = extractvalue { [5 x %Qubit*], i64 } %12, 0
  %14 = extractvalue { [5 x %Qubit*], i64 } %12, 1
  %15 = insertvalue [5 x %Qubit*] %13, %Qubit* %q__3, 3
  %16 = insertvalue { [5 x %Qubit*], i64 } zeroinitializer, [5 x %Qubit*] %15, 0
  %17 = insertvalue { [5 x %Qubit*], i64 } %16, i64 5, 1
  %18 = extractvalue { [5 x %Qubit*], i64 } %17, 0
  %19 = extractvalue { [5 x %Qubit*], i64 } %17, 1
  %20 = insertvalue [5 x %Qubit*] %18, %Qubit* %q__4, 4
  %21 = insertvalue { [5 x %Qubit*], i64 } zeroinitializer, [5 x %Qubit*] %20, 0
  %register = insertvalue { [5 x %Qubit*], i64 } %21, i64 5, 1
  %auxiliary = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q__1)
  call void @__quantum__qis__h__body(%Qubit* %q__2)
  call void @__quantum__qis__h__body(%Qubit* %q__3)
  call void @__quantum__qis__h__body(%Qubit* %q__4)
  call void @__quantum__qis__h__body(%Qubit* %auxiliary)
  call void @__quantum__qis__z__body(%Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %q, %Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %q__2, %Qubit* %auxiliary)
  call void @__quantum__qis__cnot__body(%Qubit* %q__4, %Qubit* %auxiliary)
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q__1)
  call void @__quantum__qis__h__body(%Qubit* %q__2)
  call void @__quantum__qis__h__body(%Qubit* %q__3)
  call void @__quantum__qis__h__body(%Qubit* %q__4)
  %22 = call %Result* @__quantum__rt__result_get_zero()
  %23 = insertvalue [5 x %Result*] zeroinitializer, %Result* %22, 0
  %24 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %23, 0
  %25 = insertvalue { [5 x %Result*], i64 } %24, i64 5, 1
  %26 = extractvalue { [5 x %Result*], i64 } %25, 0
  %27 = extractvalue { [5 x %Result*], i64 } %25, 1
  %28 = insertvalue [5 x %Result*] %26, %Result* %22, 1
  %29 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %28, 0
  %30 = insertvalue { [5 x %Result*], i64 } %29, i64 5, 1
  %31 = extractvalue { [5 x %Result*], i64 } %30, 0
  %32 = extractvalue { [5 x %Result*], i64 } %30, 1
  %33 = insertvalue [5 x %Result*] %31, %Result* %22, 2
  %34 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %33, 0
  %35 = insertvalue { [5 x %Result*], i64 } %34, i64 5, 1
  %36 = extractvalue { [5 x %Result*], i64 } %35, 0
  %37 = extractvalue { [5 x %Result*], i64 } %35, 1
  %38 = insertvalue [5 x %Result*] %36, %Result* %22, 3
  %39 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %38, 0
  %40 = insertvalue { [5 x %Result*], i64 } %39, i64 5, 1
  %41 = extractvalue { [5 x %Result*], i64 } %40, 0
  %42 = extractvalue { [5 x %Result*], i64 } %40, 1
  %43 = insertvalue [5 x %Result*] %41, %Result* %22, 4
  %44 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %43, 0
  %45 = insertvalue { [5 x %Result*], i64 } %44, i64 5, 1
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 1)
  store { [5 x %Result*], i64 } %45, { [5 x %Result*], i64 }* %results, align 8
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 -1)
  %46 = extractvalue { [5 x %Result*], i64 } %45, 0
  %47 = extractvalue { [5 x %Result*], i64 } %45, 1
  %48 = insertvalue [5 x %Result*] %46, %Result* %result, 0
  %49 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %48, 0
  %50 = insertvalue { [5 x %Result*], i64 } %49, i64 5, 1
  store { [5 x %Result*], i64 } %50, { [5 x %Result*], i64 }* %results, align 8
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q__1)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 -1)
  %51 = extractvalue { [5 x %Result*], i64 } %50, 0
  %52 = extractvalue { [5 x %Result*], i64 } %50, 1
  %53 = insertvalue [5 x %Result*] %51, %Result* %result__2, 1
  %54 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %53, 0
  %55 = insertvalue { [5 x %Result*], i64 } %54, i64 5, 1
  store { [5 x %Result*], i64 } %55, { [5 x %Result*], i64 }* %results, align 8
  %result__4 = call %Result* @__quantum__qis__m__body(%Qubit* %q__2)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 -1)
  %56 = extractvalue { [5 x %Result*], i64 } %55, 0
  %57 = extractvalue { [5 x %Result*], i64 } %55, 1
  %58 = insertvalue [5 x %Result*] %56, %Result* %result__4, 2
  %59 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %58, 0
  %60 = insertvalue { [5 x %Result*], i64 } %59, i64 5, 1
  store { [5 x %Result*], i64 } %60, { [5 x %Result*], i64 }* %results, align 8
  %result__6 = call %Result* @__quantum__qis__m__body(%Qubit* %q__3)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 -1)
  %61 = extractvalue { [5 x %Result*], i64 } %60, 0
  %62 = extractvalue { [5 x %Result*], i64 } %60, 1
  %63 = insertvalue [5 x %Result*] %61, %Result* %result__6, 3
  %64 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %63, 0
  %65 = insertvalue { [5 x %Result*], i64 } %64, i64 5, 1
  store { [5 x %Result*], i64 } %65, { [5 x %Result*], i64 }* %results, align 8
  %result__8 = call %Result* @__quantum__qis__m__body(%Qubit* %q__4)
  call void @__quantum__rt__result_update_reference_count(%Result* %22, i32 -1)
  %66 = extractvalue { [5 x %Result*], i64 } %65, 0
  %67 = extractvalue { [5 x %Result*], i64 } %65, 1
  %68 = insertvalue [5 x %Result*] %66, %Result* %result__8, 4
  %69 = insertvalue { [5 x %Result*], i64 } zeroinitializer, [5 x %Result*] %68, 0
  %results__1 = insertvalue { [5 x %Result*], i64 } %69, i64 5, 1
  store { [5 x %Result*], i64 } %results__1, { [5 x %Result*], i64 }* %results, align 8
  call void @__quantum__rt__qubit_release(%Qubit* %auxiliary)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  call void @__quantum__rt__qubit_release(%Qubit* %q__1)
  call void @__quantum__rt__qubit_release(%Qubit* %q__2)
  call void @__quantum__rt__qubit_release(%Qubit* %q__3)
  call void @__quantum__rt__qubit_release(%Qubit* %q__4)
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__result_record_output(%Result* %result)
  call void @__quantum__rt__result_record_output(%Result* %result__2)
  call void @__quantum__rt__result_record_output(%Result* %result__4)
  call void @__quantum__rt__result_record_output(%Result* %result__6)
  call void @__quantum__rt__result_record_output(%Result* %result__8)
  call void @__quantum__rt__array_end_record_output()
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__z__body(%Qubit*)

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__rt__array_start_record_output()

declare void @__quantum__rt__result_record_output(%Result*)

declare void @__quantum__rt__array_end_record_output()

attributes #0 = { "EntryPoint" }
