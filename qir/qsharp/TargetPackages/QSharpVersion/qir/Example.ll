
%Qubit = type opaque
%String = type opaque
%Result = type opaque
%Array = type opaque

@0 = internal constant [18 x i8] c"Unsupported input\00"

define void @QATSample__Main() #0 {
entry:
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  br i1 true, label %condTrue__1, label %condContinue__1

condTrue__1:                                      ; preds = %entry
  br label %condContinue__1

condContinue__1:                                  ; preds = %condTrue__1, %entry
  %0 = phi i1 [ true, %condTrue__1 ], [ true, %entry ]
  %1 = xor i1 %0, true
  br i1 %1, label %condTrue__2, label %condContinue__2

condTrue__2:                                      ; preds = %condContinue__1
  br i1 false, label %condTrue__3, label %condContinue__3

condTrue__3:                                      ; preds = %condTrue__2
  br label %condContinue__3

condContinue__3:                                  ; preds = %condTrue__3, %condTrue__2
  %2 = phi i1 [ false, %condTrue__3 ], [ false, %condTrue__2 ]
  br label %condContinue__2

condContinue__2:                                  ; preds = %condContinue__3, %condContinue__1
  %3 = phi i1 [ %2, %condContinue__3 ], [ %0, %condContinue__1 ]
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %condContinue__2
  call void @__quantum__qis__h__body(%Qubit* %q)
  br label %continue__1

test2__1:                                         ; preds = %condContinue__2
  br i1 true, label %condTrue__4, label %condContinue__4

condTrue__4:                                      ; preds = %test2__1
  br label %condContinue__4

condContinue__4:                                  ; preds = %condTrue__4, %test2__1
  %4 = phi i1 [ false, %condTrue__4 ], [ true, %test2__1 ]
  br i1 %4, label %then2__1, label %test3__1

then2__1:                                         ; preds = %condContinue__4
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__s__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  br label %continue__1

test3__1:                                         ; preds = %condContinue__4
  br i1 false, label %condTrue__5, label %condContinue__5

condTrue__5:                                      ; preds = %test3__1
  br label %condContinue__5

condContinue__5:                                  ; preds = %condTrue__5, %test3__1
  %5 = phi i1 [ false, %condTrue__5 ], [ false, %test3__1 ]
  br i1 %5, label %then3__1, label %test4__1

then3__1:                                         ; preds = %condContinue__5
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__s__adj(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  br label %continue__1

test4__1:                                         ; preds = %condContinue__5
  br i1 false, label %condTrue__6, label %condContinue__6

condTrue__6:                                      ; preds = %test4__1
  br label %condContinue__6

condContinue__6:                                  ; preds = %condTrue__6, %test4__1
  %6 = phi i1 [ true, %condTrue__6 ], [ false, %test4__1 ]
  br i1 %6, label %then4__1, label %test5__1

then4__1:                                         ; preds = %condContinue__6
  call void @__quantum__qis__s__body(%Qubit* %q)
  br label %continue__1

test5__1:                                         ; preds = %condContinue__6
  br i1 false, label %condTrue__7, label %condContinue__7

condTrue__7:                                      ; preds = %test5__1
  br label %condContinue__7

condContinue__7:                                  ; preds = %condTrue__7, %test5__1
  %7 = phi i1 [ false, %condTrue__7 ], [ false, %test5__1 ]
  br i1 %7, label %then5__1, label %else__1

then5__1:                                         ; preds = %condContinue__7
  call void @__quantum__qis__s__adj(%Qubit* %q)
  br label %continue__1

else__1:                                          ; preds = %condContinue__7
  %8 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0))
  unreachable

continue__1:                                      ; preds = %then5__1, %then4__1, %then3__1, %then2__1, %then1__1
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q)
  call void @__quantum__qis__reset__body(%Qubit* %q)
  %__rtrnVal0__ = call %Result* @__quantum__rt__result_get_zero()
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 1)
  call void @__quantum__rt__result_record_output(%Result* %__rtrnVal0__)
  call void @__quantum__rt__result_update_reference_count(%Result* %__rtrnVal0__, i32 -1)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__s__body(%Qubit*)

declare void @__quantum__qis__s__adj(%Qubit*)

declare %String* @__quantum__rt__string_create(i8*)

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__result_record_output(%Result*)

attributes #0 = { "EntryPoint" }
