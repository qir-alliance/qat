
%Range = type { i64, i64, i64 }
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal i64 @SimpleLoop__Main__body() {
entry:
  %y = alloca i64, align 8
  store i64 3, i64* %y, align 4
  store i64 8, i64* %y, align 4
  store i64 56, i64* %y, align 4
  ret i64 56
}

define i64 @SimpleLoop__Main__Interop() #0 {
entry:
  %0 = call i64 @SimpleLoop__Main__body()
  ret i64 %0
}

define void @SimpleLoop__Main() #1 {
entry:
  %0 = call i64 @SimpleLoop__Main__body()
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
