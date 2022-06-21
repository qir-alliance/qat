
%Result = type opaque
%Qubit = type opaque
%Array = type opaque

define void @QATSample__Main() #0 {
entry:
  %results = alloca { [2 x %Result*], i64 }, align 8
  %rand = alloca i64, align 8
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  %q__1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %0 = insertvalue [2 x %Qubit*] zeroinitializer, %Qubit* %q, 0
  %1 = insertvalue { [2 x %Qubit*], i64 } zeroinitializer, [2 x %Qubit*] %0, 0
  %2 = insertvalue { [2 x %Qubit*], i64 } %1, i64 2, 1
  %3 = extractvalue { [2 x %Qubit*], i64 } %2, 0
  %4 = extractvalue { [2 x %Qubit*], i64 } %2, 1
  %5 = insertvalue [2 x %Qubit*] %3, %Qubit* %q__1, 1
  %6 = insertvalue { [2 x %Qubit*], i64 } zeroinitializer, [2 x %Qubit*] %5, 0
  %qs = insertvalue { [2 x %Qubit*], i64 } %6, i64 2, 1
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q__1)
  store i64 0, i64* %rand, align 4
  %7 = call %Result* @__quantum__rt__result_get_zero()
  %8 = insertvalue [2 x %Result*] zeroinitializer, %Result* %7, 0
  %9 = insertvalue { [2 x %Result*], i64 } zeroinitializer, [2 x %Result*] %8, 0
  %10 = insertvalue { [2 x %Result*], i64 } %9, i64 2, 1
  %11 = extractvalue { [2 x %Result*], i64 } %10, 0
  %12 = extractvalue { [2 x %Result*], i64 } %10, 1
  %13 = insertvalue [2 x %Result*] %11, %Result* %7, 1
  %14 = insertvalue { [2 x %Result*], i64 } zeroinitializer, [2 x %Result*] %13, 0
  %15 = insertvalue { [2 x %Result*], i64 } %14, i64 2, 1
  call void @__quantum__rt__result_update_reference_count(%Result* %7, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %7, i32 1)
  store { [2 x %Result*], i64 } %15, { [2 x %Result*], i64 }* %results, align 8
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q)
  call void @__quantum__rt__result_update_reference_count(%Result* %7, i32 -1)
  %16 = extractvalue { [2 x %Result*], i64 } %15, 0
  %17 = extractvalue { [2 x %Result*], i64 } %15, 1
  %18 = insertvalue [2 x %Result*] %16, %Result* %result, 0
  %19 = insertvalue { [2 x %Result*], i64 } zeroinitializer, [2 x %Result*] %18, 0
  %20 = insertvalue { [2 x %Result*], i64 } %19, i64 2, 1
  store { [2 x %Result*], i64 } %20, { [2 x %Result*], i64 }* %results, align 8
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q__1)
  call void @__quantum__rt__result_update_reference_count(%Result* %7, i32 -1)
  %21 = extractvalue { [2 x %Result*], i64 } %20, 0
  %22 = extractvalue { [2 x %Result*], i64 } %20, 1
  %23 = insertvalue [2 x %Result*] %21, %Result* %result__2, 1
  %24 = insertvalue { [2 x %Result*], i64 } zeroinitializer, [2 x %Result*] %23, 0
  %25 = insertvalue { [2 x %Result*], i64 } %24, i64 2, 1
  store { [2 x %Result*], i64 } %25, { [2 x %Result*], i64 }* %results, align 8
  store i64 0, i64* %rand, align 4
  %26 = call %Result* @__quantum__rt__result_get_one()
  %27 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %26)
  br i1 %27, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  store i64 1, i64* %rand, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %28 = load i64, i64* %rand, align 4
  %29 = shl i64 %28, 1
  store i64 %29, i64* %rand, align 4
  %30 = call %Result* @__quantum__rt__result_get_one()
  %31 = call i1 @__quantum__rt__result_equal(%Result* %result__2, %Result* %30)
  br i1 %31, label %then0__2, label %continue__2

then0__2:                                         ; preds = %continue__1
  %32 = add i64 %29, 1
  store i64 %32, i64* %rand, align 4
  br label %continue__2

continue__2:                                      ; preds = %then0__2, %continue__1
  %q__2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %33 = load i64, i64* %rand, align 4
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %then0__3, label %test1__1

then0__3:                                         ; preds = %continue__2
  br label %continue__4

continue__4:                                      ; preds = %then0__3
  br label %continue__3

test1__1:                                         ; preds = %continue__2
  %35 = load i64, i64* %rand, align 4
  %36 = icmp eq i64 %35, 1
  br i1 %36, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  br i1 true, label %then0__4, label %continue__5

then0__4:                                         ; preds = %then1__1
  call void @__quantum__qis__rx__body(double 3.140000e+00, %Qubit* %q__2)
  br label %continue__5

continue__5:                                      ; preds = %then0__4, %then1__1
  br label %continue__3

test2__1:                                         ; preds = %test1__1
  %37 = load i64, i64* %rand, align 4
  %38 = icmp eq i64 %37, 2
  br i1 %38, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  br i1 true, label %then2__2, label %continue__6

then2__2:                                         ; preds = %then2__1
  call void @__quantum__qis__rz__body(double 3.140000e+00, %Qubit* %q__2)
  br label %continue__6

continue__6:                                      ; preds = %then2__2, %then2__1
  br label %continue__3

else__1:                                          ; preds = %test2__1
  br i1 true, label %then1__2, label %continue__7

then1__2:                                         ; preds = %else__1
  call void @__quantum__qis__ry__body(double 3.140000e+00, %Qubit* %q__2)
  br label %continue__7

continue__7:                                      ; preds = %then1__2, %else__1
  br label %continue__3

continue__3:                                      ; preds = %continue__7, %continue__6, %continue__5, %continue__4
  %result__4 = call %Result* @__quantum__qis__m__body(%Qubit* %q__2)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q__2)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  call void @__quantum__rt__qubit_release(%Qubit* %q__1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 1)
  call void @__quantum__rt__result_record_output(%Result* %result__4)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__qis__rx__body(double, %Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare void @__quantum__qis__ry__body(double, %Qubit*)

declare void @__quantum__rt__result_record_output(%Result*)

attributes #0 = { "EntryPoint" }
