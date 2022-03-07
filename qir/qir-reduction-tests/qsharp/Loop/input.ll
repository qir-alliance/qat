; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%String = type opaque

@0 = internal constant [3 x i8] c"()\00"

define internal void @SimpleLoop__Main__body() {
entry:
  br label %header__1

header__1:                                        ; preds = %body__1, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1 ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* null)
  %2 = add i64 %0, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define void @SimpleLoop__Main() #1 {
entry:
  call void @SimpleLoop__Main__body()
  ret void
}


declare void @__quantum__rt__qubit_release(%Qubit*)
declare void @__quantum__qis__h__body(%Qubit*)
declare %String* @__quantum__rt__string_create(i8*)
declare void @__quantum__rt__message(%String*)
declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }

