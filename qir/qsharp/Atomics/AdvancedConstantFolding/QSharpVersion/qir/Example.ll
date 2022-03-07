
%Range = type { i64, i64, i64 }
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal i64 @SimpleLoop__Main__body(i64 %z) {
entry:
  %0 = call i64 @SimpleLoop__Noop__body(i64 3)
  %y = alloca i64, align 8
  store i64 %0, i64* %y, align 4
  %1 = call i64 @SimpleLoop__Noop__body(i64 2)
  %2 = mul i64 %1, %0
  %3 = call i64 @SimpleLoop__No__body(i64 2)
  %4 = add i64 %2, %3
  %5 = call i64 @SimpleLoop__Noop__body(i64 %4)
  %6 = call i64 @SimpleLoop__No__body(i64 %5)
  store i64 %6, i64* %y, align 4
  %7 = call i64 @SimpleLoop__No__body(i64 %6)
  %8 = mul i64 %6, %7
  %9 = call i64 @SimpleLoop__Noop__body(i64 %z)
  %10 = call i64 @SimpleLoop__Noop__body(i64 %9)
  %11 = sub i64 %8, %10
  %12 = call i64 @SimpleLoop__Noop__body(i64 %11)
  store i64 %12, i64* %y, align 4
  %13 = call i64 @SimpleLoop__Noop__body(i64 %z)
  %14 = add i64 %12, %13
  ret i64 %14
}

define internal i64 @SimpleLoop__Noop__body(i64 %x) {
entry:
  %ret = alloca i64, align 8
  store i64 %x, i64* %ret, align 4
  %0 = icmp eq i64 %x, 2
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  store i64 2, i64* %ret, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %1 = load i64, i64* %ret, align 4
  ret i64 %1
}

define internal i64 @SimpleLoop__No__body(i64 %x) {
entry:
  %0 = mul i64 %x, %x
  %ret = alloca i64, align 8
  store i64 %0, i64* %ret, align 4
  %1 = icmp eq i64 %x, 1
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  store i64 1, i64* %ret, align 4
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = icmp eq i64 %x, 2
  br i1 %2, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  store i64 4, i64* %ret, align 4
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %3 = icmp eq i64 %x, 3
  br i1 %3, label %then2__1, label %continue__1

then2__1:                                         ; preds = %test2__1
  store i64 9, i64* %ret, align 4
  br label %continue__1

continue__1:                                      ; preds = %then2__1, %test2__1, %then1__1, %then0__1
  %4 = load i64, i64* %ret, align 4
  %5 = sdiv i64 %4, %x
  ret i64 %5
}

define i64 @SimpleLoop__Main__Interop(i64 %z) #0 {
entry:
  %0 = call i64 @SimpleLoop__Main__body(i64 %z)
  ret i64 %0
}

define void @SimpleLoop__Main(i64 %z) #1 {
entry:
  %0 = call i64 @SimpleLoop__Main__body(i64 %z)
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
