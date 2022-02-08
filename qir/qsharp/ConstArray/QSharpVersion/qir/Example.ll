
%Range = type { i64, i64, i64 }
%Array = type opaque
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal i64 @ConstArrayReduction__Main__body() {
entry:
  %0 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 10)
  %1 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to i64*
  %3 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %4 = bitcast i8* %3 to i64*
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %6 = bitcast i8* %5 to i64*
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %8 = bitcast i8* %7 to i64*
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %10 = bitcast i8* %9 to i64*
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %12 = bitcast i8* %11 to i64*
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %14 = bitcast i8* %13 to i64*
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 7)
  %16 = bitcast i8* %15 to i64*
  %17 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 9)
  %20 = bitcast i8* %19 to i64*
  store i64 1, i64* %2, align 4
  store i64 2, i64* %4, align 4
  store i64 3, i64* %6, align 4
  store i64 4, i64* %8, align 4
  store i64 5, i64* %10, align 4
  store i64 6, i64* %12, align 4
  store i64 7, i64* %14, align 4
  store i64 8, i64* %16, align 4
  store i64 9, i64* %18, align 4
  store i64 10, i64* %20, align 4
  %arr = alloca %Array*, align 8
  store %Array* %0, %Array** %arr, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %0, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %0, i32 -1)
  %21 = call %Array* @__quantum__rt__array_copy(%Array* %0, i1 false)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 7)
  %23 = bitcast i8* %22 to i64*
  store i64 1337, i64* %23, align 4
  call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 1)
  store %Array* %21, %Array** %arr, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 -1)
  %24 = call %Array* @__quantum__rt__array_copy(%Array* %21, i1 false)
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 7)
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 4
  %28 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %24, i64 3)
  %29 = bitcast i8* %28 to i64*
  %30 = load i64, i64* %29, align 4
  store i64 %27, i64* %29, align 4
  call void @__quantum__rt__array_update_alias_count(%Array* %24, i32 1)
  store %Array* %24, %Array** %arr, align 8
  %31 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %24, i64 3)
  %32 = bitcast i8* %31 to i64*
  %33 = load i64, i64* %32, align 4
  call void @__quantum__rt__array_update_alias_count(%Array* %24, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %24, i32 -1)
  ret i64 %33
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

declare void @__quantum__rt__array_update_alias_count(%Array*, i32)

declare %Array* @__quantum__rt__array_copy(%Array*, i1)

declare void @__quantum__rt__array_update_reference_count(%Array*, i32)

define i64 @ConstArrayReduction__Main__Interop() #0 {
entry:
  %0 = call i64 @ConstArrayReduction__Main__body()
  ret i64 %0
}

define void @ConstArrayReduction__Main() #1 {
entry:
  %0 = call i64 @ConstArrayReduction__Main__body()
  %1 = call %String* @__quantum__rt__int_to_string(i64 %0)
  call void @__quantum__rt__message(%String* %1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__int_to_string(i64)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
