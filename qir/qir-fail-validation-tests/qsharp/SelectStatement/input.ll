
%Range = type { i64, i64, i64 }
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal i64 @SimpleLoop__Main__body(i64 %x) {
entry:
  %ret = alloca i64, align 8
  store i64 %x, i64* %ret, align 4
  %0 = icmp eq i64 %x, 2
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  store i64 9, i64* %ret, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %1 = load i64, i64* %ret, align 4
  ret i64 %1
}

define i64 @SimpleLoop__Main__Interop(i64 %x) #0 {
entry:
  %0 = call i64 @SimpleLoop__Main__body(i64 %x)
  ret i64 %0
}

define void @SimpleLoop__Main(i64 %x) #1 {
entry:
  %0 = call i64 @SimpleLoop__Main__body(i64 %x)
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
