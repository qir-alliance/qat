
%Range = type { i64, i64, i64 }
%String = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define internal i64 @InternalFunctions__Main__body() {
entry:
  %ret = call i64 @InternalFunctions__Value__body(i64 2)
  ret i64 %ret
}

define internal i64 @InternalFunctions__Value__body(i64 %q) {
entry:
  %0 = icmp eq i64 %q, 0
  br i1 %0, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  %1 = mul i64 %q, %q
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %2 = phi i64 [ 1337, %condTrue__1 ], [ %1, %condFalse__1 ]
  ret i64 %2
}

define i64 @InternalFunctions__Main__Interop() #0 {
entry:
  %0 = call i64 @InternalFunctions__Main__body()
  ret i64 %0
}

define void @InternalFunctions__Main() #1 {
entry:
  %0 = call i64 @InternalFunctions__Main__body()
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
