
%Range = type { i64, i64, i64 }
%Tuple = type opaque
%String = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Result = type opaque

@PauliI = internal constant i2 0
@PauliX = internal constant i2 1
@PauliY = internal constant i2 -1
@PauliZ = internal constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }
@Microsoft__Quantum__Intrinsic__X__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]
@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@0 = internal constant [18 x i8] c"Unsupported input\00"
@Microsoft__Quantum__Intrinsic__CNOT__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__CNOT__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Rx__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rx__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rx__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rx__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rx__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Ry__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Ry__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Ry__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Ry__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Ry__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Rz__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Rz__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__S__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__S__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__S__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__S__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__S__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__T__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__T__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__T__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__T__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__T__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]
@1 = internal constant [2 x i8] c"\22\00"
@2 = internal constant [13 x i8] c"\0A\09Expected:\09\00"
@3 = internal constant [5 x i8] c"true\00"
@4 = internal constant [6 x i8] c"false\00"
@5 = internal constant [11 x i8] c"\0A\09Actual:\09\00"
@6 = internal constant [39 x i8] c"Array must be of the length at least 1\00"
@7 = internal constant [28 x i8] c"reached unreachable code...\00"
@8 = internal constant [3 x i8] c", \00"
@9 = internal constant [2 x i8] c"[\00"
@10 = internal constant [2 x i8] c"]\00"

define internal i64 @Microsoft__Quantum__Samples__SimpleGrover__NIterations__body(i64 %nQubits) {
entry:
  %nItems = shl i64 1, %nQubits
  %d = sitofp i64 %nItems to double
  %0 = call double @__quantum__qis__sqrt__body(double %d)
  %y = fdiv double 1.000000e+00, %0
  %angle = call double @__quantum__qis__arcsin__body(double %y)
  %1 = call double @Microsoft__Quantum__Math__PI__body()
  %2 = fmul double 2.500000e-01, %1
  %3 = fdiv double %2, %angle
  %4 = fsub double %3, 5.000000e-01
  %nIterations = call i64 @Microsoft__Quantum__Math__Round__body(double %4)
  ret i64 %nIterations
}

declare double @__quantum__qis__sqrt__body(double)

declare double @__quantum__qis__arcsin__body(double)

define internal i64 @Microsoft__Quantum__Math__Round__body(double %value) {
entry:
  %0 = call { i64, double, i1 }* @Microsoft__Quantum__Math____QsRef3__ExtendedTruncation____body(double %value)
  %1 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %0, i32 0, i32 0
  %truncated = load i64, i64* %1, align 4
  %2 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %0, i32 0, i32 1
  %remainder = load double, double* %2, align 8
  %3 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %0, i32 0, i32 2
  %isPositive = load i1, i1* %3, align 1
  %4 = call double @Microsoft__Quantum__Math__AbsD__body(double %remainder)
  %5 = fcmp ole double %4, 1.000000e-15
  br i1 %5, label %then0__1, label %else__1

then0__1:                                         ; preds = %entry
  %6 = bitcast { i64, double, i1 }* %0 to %Tuple*
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  ret i64 %truncated

else__1:                                          ; preds = %entry
  %abs = call double @Microsoft__Quantum__Math__AbsD__body(double %remainder)
  %7 = fcmp ole double %abs, 5.000000e-01
  br i1 %7, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %else__1
  br label %condContinue__1

condFalse__1:                                     ; preds = %else__1
  br i1 %isPositive, label %condTrue__2, label %condFalse__2

condTrue__2:                                      ; preds = %condFalse__1
  br label %condContinue__2

condFalse__2:                                     ; preds = %condFalse__1
  br label %condContinue__2

condContinue__2:                                  ; preds = %condFalse__2, %condTrue__2
  %8 = phi i64 [ 1, %condTrue__2 ], [ -1, %condFalse__2 ]
  br label %condContinue__1

condContinue__1:                                  ; preds = %condContinue__2, %condTrue__1
  %9 = phi i64 [ 0, %condTrue__1 ], [ %8, %condContinue__2 ]
  %10 = add i64 %truncated, %9
  %11 = bitcast { i64, double, i1 }* %0 to %Tuple*
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  ret i64 %10

continue__1:                                      ; No predecessors!
  %12 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @7, i32 0, i32 0))
  %13 = bitcast { i64, double, i1 }* %0 to %Tuple*
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  call void @__quantum__rt__fail(%String* %12)
  unreachable
}

define internal double @Microsoft__Quantum__Math__PI__body() {
entry:
  ret double 0x400921FB54442D18
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__body(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body(%Callable* %0, %Array* %inputQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  ret void
}

declare void @__quantum__rt__array_update_alias_count(%Array*, i32)

define internal void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body(%Callable* %singleElementOperation, %Array* %register) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %0 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %1 = extractvalue %Range %0, 0
  %2 = extractvalue %Range %0, 1
  %3 = extractvalue %Range %0, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %4 = icmp sgt i64 %2, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %idxQubit = phi i64 [ %1, %preheader__1 ], [ %14, %exiting__1 ]
  %5 = icmp sle i64 %idxQubit, %3
  %6 = icmp sge i64 %idxQubit, %3
  %7 = select i1 %4, i1 %5, i1 %6
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %idxQubit)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  %12 = bitcast %Tuple* %11 to { %Qubit* }*
  %13 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %12, i32 0, i32 0
  store %Qubit* %10, %Qubit** %13, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %singleElementOperation, %Tuple* %11, %Tuple* null)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %14 = add i64 %idxQubit, %2
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__X__adj(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__X__ctladj(%Array* %3, %Qubit* %4)
  ret void
}

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*)

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32)

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32)

define internal void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__adj(%Qubit* %qubit) {
entry:
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %control = load %Qubit*, %Qubit** %5, align 8
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %6 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %7 = icmp eq i64 %6, 2
  br i1 %7, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %10, %Qubit* %13, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %14 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %14)
  %15 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %16 = bitcast %Tuple* %15 to { %Array*, %Qubit* }*
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %16, i32 0, i32 0
  %18 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %16, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %17, align 8
  store %Qubit* %qubit, %Qubit** %18, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %14, { %Array*, %Qubit* }* %16)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %14, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %14, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %15, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__adj(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj(%Callable* %0, %Array* %inputQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj(%Callable* %singleElementOperation, %Array* %register) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %0 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %1 = extractvalue %Range %0, 0
  %2 = extractvalue %Range %0, 1
  %3 = extractvalue %Range %0, 2
  %4 = sub i64 %3, %1
  %5 = sdiv i64 %4, %2
  %6 = mul i64 %2, %5
  %7 = add i64 %1, %6
  %8 = sub i64 0, %2
  %9 = load %Range, %Range* @EmptyRange, align 4
  %10 = insertvalue %Range %9, i64 %7, 0
  %11 = insertvalue %Range %10, i64 %8, 1
  %12 = insertvalue %Range %11, i64 %1, 2
  %13 = extractvalue %Range %12, 0
  %14 = extractvalue %Range %12, 1
  %15 = extractvalue %Range %12, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %16 = icmp sgt i64 %14, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %__qsVar0__idxQubit__ = phi i64 [ %13, %preheader__1 ], [ %27, %exiting__1 ]
  %17 = icmp sle i64 %__qsVar0__idxQubit__, %15
  %18 = icmp sge i64 %__qsVar0__idxQubit__, %15
  %19 = select i1 %16, i1 %17, i1 %18
  br i1 %19, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %20 = call %Callable* @__quantum__rt__callable_copy(%Callable* %singleElementOperation, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %20)
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %__qsVar0__idxQubit__)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = load %Qubit*, %Qubit** %22, align 8
  %24 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  %25 = bitcast %Tuple* %24 to { %Qubit* }*
  %26 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %25, i32 0, i32 0
  store %Qubit* %23, %Qubit** %26, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %20, %Tuple* %24, %Tuple* null)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %20, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %27 = add i64 %__qsVar0__idxQubit__, %14
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__ctl(%Array* %__controlQubits__, %Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %1 = bitcast %Tuple* %0 to { %Callable*, %Array* }*
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 0
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 1
  %4 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 1)
  store %Callable* %4, %Callable** %2, align 8
  store %Array* %inputQubits, %Array** %3, align 8
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctl(%Array* %__controlQubits__, { %Callable*, %Array* }* %1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctl(%Array* %__controlQubits__, { %Callable*, %Array* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i32 0, i32 0
  %singleElementOperation = load %Callable*, %Callable** %1, align 8
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i32 0, i32 1
  %register = load %Array*, %Array** %2, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %3 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %4 = extractvalue %Range %3, 0
  %5 = extractvalue %Range %3, 1
  %6 = extractvalue %Range %3, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %7 = icmp sgt i64 %5, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %idxQubit = phi i64 [ %4, %preheader__1 ], [ %19, %exiting__1 ]
  %8 = icmp sle i64 %idxQubit, %6
  %9 = icmp sge i64 %idxQubit, %6
  %10 = select i1 %7, i1 %8, i1 %9
  br i1 %10, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %11 = call %Callable* @__quantum__rt__callable_copy(%Callable* %singleElementOperation, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 1)
  call void @__quantum__rt__callable_make_controlled(%Callable* %11)
  %12 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %13 = bitcast %Tuple* %12 to { %Array*, %Qubit* }*
  %14 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %13, i32 0, i32 0
  %15 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %13, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__controlQubits__, i32 1)
  %16 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %idxQubit)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = load %Qubit*, %Qubit** %17, align 8
  store %Array* %__controlQubits__, %Array** %14, align 8
  store %Qubit* %18, %Qubit** %15, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %11, %Tuple* %12, %Tuple* null)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %11, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %11, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %19 = add i64 %idxQubit, %5
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

declare %Tuple* @__quantum__rt__tuple_create(i64)

declare void @__quantum__rt__array_update_reference_count(%Array*, i32)

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32)

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__ctladj(%Array* %__controlQubits__, %Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %1 = bitcast %Tuple* %0 to { %Callable*, %Array* }*
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 0
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 1
  %4 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 1)
  store %Callable* %4, %Callable** %2, align 8
  store %Array* %inputQubits, %Array** %3, align 8
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctladj(%Array* %__controlQubits__, { %Callable*, %Array* }* %1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctladj(%Array* %__controlQubits__, { %Callable*, %Array* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i32 0, i32 0
  %singleElementOperation = load %Callable*, %Callable** %1, align 8
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %0, i32 0, i32 1
  %register = load %Array*, %Array** %2, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %3 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %4 = extractvalue %Range %3, 0
  %5 = extractvalue %Range %3, 1
  %6 = extractvalue %Range %3, 2
  %7 = sub i64 %6, %4
  %8 = sdiv i64 %7, %5
  %9 = mul i64 %5, %8
  %10 = add i64 %4, %9
  %11 = sub i64 0, %5
  %12 = load %Range, %Range* @EmptyRange, align 4
  %13 = insertvalue %Range %12, i64 %10, 0
  %14 = insertvalue %Range %13, i64 %11, 1
  %15 = insertvalue %Range %14, i64 %4, 2
  %16 = extractvalue %Range %15, 0
  %17 = extractvalue %Range %15, 1
  %18 = extractvalue %Range %15, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %19 = icmp sgt i64 %17, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %__qsVar0__idxQubit__ = phi i64 [ %16, %preheader__1 ], [ %31, %exiting__1 ]
  %20 = icmp sle i64 %__qsVar0__idxQubit__, %18
  %21 = icmp sge i64 %__qsVar0__idxQubit__, %18
  %22 = select i1 %19, i1 %20, i1 %21
  br i1 %22, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %23 = call %Callable* @__quantum__rt__callable_copy(%Callable* %singleElementOperation, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %23, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %23)
  call void @__quantum__rt__callable_make_controlled(%Callable* %23)
  %24 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %25 = bitcast %Tuple* %24 to { %Array*, %Qubit* }*
  %26 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %25, i32 0, i32 0
  %27 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %25, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__controlQubits__, i32 1)
  %28 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %__qsVar0__idxQubit__)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = load %Qubit*, %Qubit** %29, align 8
  store %Array* %__controlQubits__, %Array** %26, align 8
  store %Qubit* %30, %Qubit** %27, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %23, %Tuple* %24, %Tuple* null)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %23, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %23, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %31 = add i64 %__qsVar0__idxQubit__, %17
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__body(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__body(%Callable* %0, %Array* %inputQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__H__ctladj(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit)
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %6, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %7 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %7)
  %8 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %9 = bitcast %Tuple* %8 to { %Array*, %Qubit* }*
  %10 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %9, i32 0, i32 0
  %11 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %9, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %10, align 8
  store %Qubit* %qubit, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %7, { %Array*, %Qubit* }* %9)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %7, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %7, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__adj(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__adj(%Callable* %0, %Array* %inputQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__ctl(%Array* %__controlQubits__, %Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %1 = bitcast %Tuple* %0 to { %Callable*, %Array* }*
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 0
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 1
  %4 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 1)
  store %Callable* %4, %Callable** %2, align 8
  store %Array* %inputQubits, %Array** %3, align 8
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctl(%Array* %__controlQubits__, { %Callable*, %Array* }* %1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__ctladj(%Array* %__controlQubits__, %Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %1 = bitcast %Tuple* %0 to { %Callable*, %Array* }*
  %2 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 0
  %3 = getelementptr inbounds { %Callable*, %Array* }, { %Callable*, %Array* }* %1, i32 0, i32 1
  %4 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 1)
  store %Callable* %4, %Callable** %2, align 8
  store %Array* %inputQubits, %Array** %3, align 8
  call void @Microsoft__Quantum__Canon___4c110278436e424c88331fe98549619e_ApplyToEachCA__ctladj(%Array* %__controlQubits__, { %Callable*, %Array* }* %1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutAllOnes__body(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %0 = call %Array* @Microsoft__Quantum__Arrays___110fb1b2946b49f697c7a38944bfad0e_Most__body(%Array* %inputQubits)
  %1 = call %Qubit* @Microsoft__Quantum__Arrays___47e371a42ca7445c8aeb44c9bba30d89_Tail__body(%Array* %inputQubits)
  call void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %0, %Qubit* %1)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__z__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %control = load %Qubit*, %Qubit** %5, align 8
  call void @__quantum__qis__cz__body(%Qubit* %control, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %6 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %7 = icmp eq i64 %6, 2
  br i1 %7, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %10)
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %13)
  %14 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = load %Qubit*, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %qubit, %Qubit* %16)
  %17 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = load %Qubit*, %Qubit** %18, align 8
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %19)
  %20 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = load %Qubit*, %Qubit** %21, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %22, %Qubit* %qubit)
  %23 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = load %Qubit*, %Qubit** %24, align 8
  %26 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = load %Qubit*, %Qubit** %27, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %25, %Qubit* %28)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit)
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %31)
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %34, %Qubit* %qubit)
  %35 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = load %Qubit*, %Qubit** %36, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %qubit, %Qubit* %37)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit)
  %38 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = load %Qubit*, %Qubit** %39, align 8
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %40)
  %41 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = load %Qubit*, %Qubit** %42, align 8
  %44 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %43, %Qubit* %46)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %47 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %47)
  %48 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %49 = bitcast %Tuple* %48 to { %Array*, %Qubit* }*
  %50 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %49, i32 0, i32 0
  %51 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %49, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %50, align 8
  store %Qubit* %qubit, %Qubit** %51, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %47, { %Array*, %Qubit* }* %49)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %47, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %47, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %48, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal %Array* @Microsoft__Quantum__Arrays___110fb1b2946b49f697c7a38944bfad0e_Most__body(%Array* %array) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %array)
  %1 = sub i64 %0, 2
  %2 = load %Range, %Range* @EmptyRange, align 4
  %3 = insertvalue %Range %2, i64 0, 0
  %4 = insertvalue %Range %3, i64 1, 1
  %5 = insertvalue %Range %4, i64 %1, 2
  %6 = call %Array* @__quantum__rt__array_slice_1d(%Array* %array, %Range %5, i1 true)
  call void @__quantum__rt__array_update_reference_count(%Array* %6, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %6, i32 -1)
  ret %Array* %6
}

define internal %Qubit* @Microsoft__Quantum__Arrays___47e371a42ca7445c8aeb44c9bba30d89_Tail__body(%Array* %array) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %array)
  %1 = icmp sgt i64 %0, 0
  %2 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @6, i32 0, i32 0))
  call void @Microsoft__Quantum__Diagnostics__EqualityFactB__body(i1 %1, i1 true, %String* %2)
  %3 = sub i64 %0, 1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %array, i64 %3)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 -1)
  ret %Qubit* %6
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  %outputQubit = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %outputQubit)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %outputQubit)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  br i1 false, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  %1 = call i64 @__quantum__rt__array_get_size_1d(%Array* %inputQubits)
  %2 = sub i64 %1, 1
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %3 = phi i64 [ %2, %condTrue__1 ], [ 0, %condFalse__1 ]
  br i1 false, label %condTrue__2, label %condFalse__2

condTrue__2:                                      ; preds = %condContinue__1
  br label %condContinue__2

condFalse__2:                                     ; preds = %condContinue__1
  %4 = call i64 @__quantum__rt__array_get_size_1d(%Array* %inputQubits)
  %5 = sub i64 %4, 1
  br label %condContinue__2

condContinue__2:                                  ; preds = %condFalse__2, %condTrue__2
  %6 = phi i64 [ 0, %condTrue__2 ], [ %5, %condFalse__2 ]
  %7 = load %Range, %Range* @EmptyRange, align 4
  %8 = insertvalue %Range %7, i64 %3, 0
  %9 = insertvalue %Range %8, i64 2, 1
  %10 = insertvalue %Range %9, i64 %6, 2
  %11 = call %Array* @__quantum__rt__array_slice_1d(%Array* %inputQubits, %Range %10, i1 true)
  call void @Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body(%Callable* %0, %Array* %11)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %inputQubits, %Qubit* %outputQubit)
  %12 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  br i1 false, label %condTrue__3, label %condFalse__3

condTrue__3:                                      ; preds = %condContinue__2
  %13 = call i64 @__quantum__rt__array_get_size_1d(%Array* %inputQubits)
  %14 = sub i64 %13, 1
  br label %condContinue__3

condFalse__3:                                     ; preds = %condContinue__2
  br label %condContinue__3

condContinue__3:                                  ; preds = %condFalse__3, %condTrue__3
  %15 = phi i64 [ %14, %condTrue__3 ], [ 0, %condFalse__3 ]
  br i1 false, label %condTrue__4, label %condFalse__4

condTrue__4:                                      ; preds = %condContinue__3
  br label %condContinue__4

condFalse__4:                                     ; preds = %condContinue__3
  %16 = call i64 @__quantum__rt__array_get_size_1d(%Array* %inputQubits)
  %17 = sub i64 %16, 1
  br label %condContinue__4

condContinue__4:                                  ; preds = %condFalse__4, %condTrue__4
  %18 = phi i64 [ 0, %condTrue__4 ], [ %17, %condFalse__4 ]
  %19 = load %Range, %Range* @EmptyRange, align 4
  %20 = insertvalue %Range %19, i64 %15, 0
  %21 = insertvalue %Range %20, i64 2, 1
  %22 = insertvalue %Range %21, i64 %18, 2
  %23 = call %Array* @__quantum__rt__array_slice_1d(%Array* %inputQubits, %Range %22, i1 true)
  call void @Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__adj(%Callable* %12, %Array* %23)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %outputQubit)
  call void @Microsoft__Quantum__Intrinsic__X__adj(%Qubit* %outputQubit)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %11, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %23, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %outputQubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

define internal void @Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__body(%Callable* %singleElementOperation, %Array* %register) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %0 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %1 = extractvalue %Range %0, 0
  %2 = extractvalue %Range %0, 1
  %3 = extractvalue %Range %0, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %4 = icmp sgt i64 %2, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %idxQubit = phi i64 [ %1, %preheader__1 ], [ %14, %exiting__1 ]
  %5 = icmp sle i64 %idxQubit, %3
  %6 = icmp sge i64 %idxQubit, %3
  %7 = select i1 %4, i1 %5, i1 %6
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %idxQubit)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  %12 = bitcast %Tuple* %11 to { %Qubit* }*
  %13 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %12, i32 0, i32 0
  store %Qubit* %10, %Qubit** %13, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %singleElementOperation, %Tuple* %11, %Tuple* null)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %14 = add i64 %idxQubit, %2
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*)

declare %Array* @__quantum__rt__array_slice_1d(%Array*, %Range, i1)

define internal void @Microsoft__Quantum__Canon___5ca8b9fc0ab44bcfb2607b58c0fae5a2_ApplyToEachA__adj(%Callable* %singleElementOperation, %Array* %register) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 1)
  %0 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %register)
  %1 = extractvalue %Range %0, 0
  %2 = extractvalue %Range %0, 1
  %3 = extractvalue %Range %0, 2
  %4 = sub i64 %3, %1
  %5 = sdiv i64 %4, %2
  %6 = mul i64 %2, %5
  %7 = add i64 %1, %6
  %8 = sub i64 0, %2
  %9 = load %Range, %Range* @EmptyRange, align 4
  %10 = insertvalue %Range %9, i64 %7, 0
  %11 = insertvalue %Range %10, i64 %8, 1
  %12 = insertvalue %Range %11, i64 %1, 2
  %13 = extractvalue %Range %12, 0
  %14 = extractvalue %Range %12, 1
  %15 = extractvalue %Range %12, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %16 = icmp sgt i64 %14, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %__qsVar0__idxQubit__ = phi i64 [ %13, %preheader__1 ], [ %27, %exiting__1 ]
  %17 = icmp sle i64 %__qsVar0__idxQubit__, %15
  %18 = icmp sge i64 %__qsVar0__idxQubit__, %15
  %19 = select i1 %16, i1 %17, i1 %18
  br i1 %19, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %20 = call %Callable* @__quantum__rt__callable_copy(%Callable* %singleElementOperation, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %20)
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %register, i64 %__qsVar0__idxQubit__)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = load %Qubit*, %Qubit** %22, align 8
  %24 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  %25 = bitcast %Tuple* %24 to { %Qubit* }*
  %26 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %25, i32 0, i32 0
  store %Qubit* %23, %Qubit** %26, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %20, %Tuple* %24, %Tuple* null)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %20, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %24, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %27 = add i64 %__qsVar0__idxQubit__, %14
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @__quantum__rt__capture_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %singleElementOperation, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %register, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutUniform__body(%Array* %inputQubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 1)
  call void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__adj(%Array* %inputQubits)
  call void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__body(%Array* %inputQubits)
  call void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutAllOnes__body(%Array* %inputQubits)
  call void @Microsoft__Quantum__Samples__SimpleGrover__PrepareAllOnes__adj(%Array* %inputQubits)
  call void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__body(%Array* %inputQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %inputQubits, i32 -1)
  ret void
}

define internal %Array* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body(i64 %nQubits) {
entry:
  %qubits = call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 1)
  call void @Microsoft__Quantum__Samples__SimpleGrover__PrepareUniform__body(%Array* %qubits)
  %0 = call i64 @Microsoft__Quantum__Samples__SimpleGrover__NIterations__body(i64 %nQubits)
  %1 = sub i64 %0, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %idxIteration = phi i64 [ 0, %entry ], [ %3, %exiting__1 ]
  %2 = icmp sle i64 %idxIteration, %1
  br i1 %2, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  call void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body(%Array* %qubits)
  call void @Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutUniform__body(%Array* %qubits)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %3 = add i64 %idxIteration, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %4 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %5 = call %Array* @Microsoft__Quantum__Arrays___cc8b97951aaa4583b29088e81dd1a081_ForEach__body(%Callable* %4, %Array* %qubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %4, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %qubits)
  ret %Array* %5
}

declare void @__quantum__rt__qubit_release_array(%Array*)

define internal %Array* @Microsoft__Quantum__Arrays___cc8b97951aaa4583b29088e81dd1a081_ForEach__body(%Callable* %action, %Array* %array) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %action, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %action, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 1)
  %0 = call %Result* @__quantum__rt__result_get_zero()
  %1 = call i64 @__quantum__rt__array_get_size_1d(%Array* %array)
  %2 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %1)
  %3 = sub i64 %1, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %4 = phi i64 [ 0, %entry ], [ %8, %exiting__1 ]
  %5 = icmp sle i64 %4, %3
  br i1 %5, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %6 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %2, i64 %4)
  %7 = bitcast i8* %6 to %Result**
  store %Result* %0, %Result** %7, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 1)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %8 = add i64 %4, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %resultArray = alloca %Array*, align 8
  store %Array* %2, %Array** %resultArray, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %2, i32 1)
  %9 = call %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %array)
  %10 = extractvalue %Range %9, 0
  %11 = extractvalue %Range %9, 1
  %12 = extractvalue %Range %9, 2
  br label %preheader__1

preheader__1:                                     ; preds = %exit__1
  %13 = icmp sgt i64 %11, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %idxElement = phi i64 [ %10, %preheader__1 ], [ %32, %exiting__2 ]
  %14 = icmp sle i64 %idxElement, %12
  %15 = icmp sge i64 %idxElement, %12
  %16 = select i1 %13, i1 %14, i1 %15
  br i1 %16, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %17 = load %Array*, %Array** %resultArray, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 -1)
  %18 = call %Array* @__quantum__rt__array_copy(%Array* %17, i1 false)
  %19 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %array, i64 %idxElement)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = load %Qubit*, %Qubit** %20, align 8
  %22 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  %23 = bitcast %Tuple* %22 to { %Qubit* }*
  %24 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %23, i32 0, i32 0
  store %Qubit* %21, %Qubit** %24, align 8
  %25 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64))
  call void @__quantum__rt__callable_invoke(%Callable* %action, %Tuple* %22, %Tuple* %25)
  %26 = bitcast %Tuple* %25 to { %Result* }*
  %27 = getelementptr inbounds { %Result* }, { %Result* }* %26, i32 0, i32 0
  %28 = load %Result*, %Result** %27, align 8
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 %idxElement)
  %30 = bitcast i8* %29 to %Result**
  call void @__quantum__rt__result_update_reference_count(%Result* %28, i32 1)
  %31 = load %Result*, %Result** %30, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %31, i32 -1)
  store %Result* %28, %Result** %30, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 1)
  store %Array* %18, %Array** %resultArray, align 8
  call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %22, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %28, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %32 = add i64 %idxElement, %11
  br label %header__2

exit__2:                                          ; preds = %header__2
  %33 = load %Array*, %Array** %resultArray, align 8
  call void @__quantum__rt__capture_update_alias_count(%Callable* %action, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %action, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %33, i32 -1)
  ret %Array* %33
}

define internal void @Microsoft__Quantum__Measurement__MResetZ__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  %3 = call %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %2)
  %4 = bitcast %Tuple* %result-tuple to { %Result* }*
  %5 = getelementptr inbounds { %Result* }, { %Result* }* %4, i32 0, i32 0
  store %Result* %3, %Result** %5, align 8
  ret void
}

define internal %Result* @Microsoft__Quantum__Measurement__MResetZ__body(%Qubit* %target) {
entry:
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %target)
  call void @__quantum__qis__reset__body(%Qubit* %target)
  ret %Result* %result
}

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__reset__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyControlledX____body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyControlledX____adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyControlledZ____body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cz__body(%Qubit* %control, %Qubit* %target)
  ret void
}

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyControlledZ____adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cz__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____body(double %theta) {
entry:
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____adj(double %theta) {
entry:
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____ctl(%Array* %controls, double %theta) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %1 = icmp sgt i64 %0, 0
  br i1 %1, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %qubit = load %Qubit*, %Qubit** %3, align 8
  %4 = sub i64 %0, 1
  %5 = load %Range, %Range* @EmptyRange, align 4
  %6 = insertvalue %Range %5, i64 1, 0
  %7 = insertvalue %Range %6, i64 1, 1
  %8 = insertvalue %Range %7, i64 %4, 2
  %rest = call %Array* @__quantum__rt__array_slice_1d(%Array* %controls, %Range %8, i1 true)
  call void @__quantum__rt__array_update_alias_count(%Array* %rest, i32 1)
  %9 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %10 = bitcast %Tuple* %9 to { double, %Qubit* }*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 0
  %12 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 1
  store double %theta, double* %11, align 8
  store %Qubit* %qubit, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__R1__ctl(%Array* %rest, { double, %Qubit* }* %10)
  call void @__quantum__rt__array_update_alias_count(%Array* %rest, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %rest, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %9, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

define internal void @Microsoft__Quantum__Intrinsic__R1__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { i2, double, %Qubit* }*
  %5 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 1
  %7 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 2
  %8 = load i2, i2* @PauliZ, align 1
  store i2 %8, i2* %5, align 1
  store double %theta, double* %6, align 8
  store %Qubit* %qubit, %Qubit** %7, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %4)
  %9 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %10 = bitcast %Tuple* %9 to { i2, double, %Qubit* }*
  %11 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %10, i32 0, i32 0
  %12 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %10, i32 0, i32 1
  %13 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %10, i32 0, i32 2
  %14 = load i2, i2* @PauliI, align 1
  %15 = fneg double %theta
  store i2 %14, i2* %11, align 1
  store double %15, double* %12, align 8
  store %Qubit* %qubit, %Qubit** %13, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %10)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %9, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____ctladj(%Array* %controls, double %theta) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %1 = icmp sgt i64 %0, 0
  br i1 %1, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %__qsVar0__qubit__ = load %Qubit*, %Qubit** %3, align 8
  %4 = sub i64 %0, 1
  %5 = load %Range, %Range* @EmptyRange, align 4
  %6 = insertvalue %Range %5, i64 1, 0
  %7 = insertvalue %Range %6, i64 1, 1
  %8 = insertvalue %Range %7, i64 %4, 2
  %__qsVar1__rest__ = call %Array* @__quantum__rt__array_slice_1d(%Array* %controls, %Range %8, i1 true)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__rest__, i32 1)
  %9 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %10 = bitcast %Tuple* %9 to { double, %Qubit* }*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 0
  %12 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 1
  store double %theta, double* %11, align 8
  store %Qubit* %__qsVar0__qubit__, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__R1__ctladj(%Array* %__qsVar1__rest__, { double, %Qubit* }* %10)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__rest__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__rest__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %9, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { i2, double, %Qubit* }*
  %5 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 1
  %7 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i32 0, i32 2
  %8 = load i2, i2* @PauliI, align 1
  %9 = fneg double %theta
  store i2 %8, i2* %5, align 1
  store double %9, double* %6, align 8
  store %Qubit* %qubit, %Qubit** %7, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctladj(%Array* %__controlQubits__, { i2, double, %Qubit* }* %4)
  %10 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %11 = bitcast %Tuple* %10 to { i2, double, %Qubit* }*
  %12 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %11, i32 0, i32 0
  %13 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %11, i32 0, i32 1
  %14 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %11, i32 0, i32 2
  %15 = load i2, i2* @PauliZ, align 1
  store i2 %15, i2* %12, align 1
  store double %theta, double* %13, align 8
  store %Qubit* %qubit, %Qubit** %14, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctladj(%Array* %__controlQubits__, { i2, double, %Qubit* }* %11)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %10, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledH____body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledH____adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledX____body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__x__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledX____adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledZ____body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__z__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__z__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyUncontrolledZ____adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__z__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____body(%Qubit* %qubit, i2 %from, i2 %to) {
entry:
  %0 = icmp eq i2 %from, %to
  br i1 %0, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %continue__1

test1__1:                                         ; preds = %entry
  %1 = load i2, i2* @PauliZ, align 1
  %2 = icmp eq i2 %from, %1
  br i1 %2, label %condTrue__1, label %condContinue__1

condTrue__1:                                      ; preds = %test1__1
  %3 = load i2, i2* @PauliX, align 1
  %4 = icmp eq i2 %to, %3
  br label %condContinue__1

condContinue__1:                                  ; preds = %condTrue__1, %test1__1
  %5 = phi i1 [ %4, %condTrue__1 ], [ %2, %test1__1 ]
  %6 = xor i1 %5, true
  br i1 %6, label %condTrue__2, label %condContinue__2

condTrue__2:                                      ; preds = %condContinue__1
  %7 = load i2, i2* @PauliX, align 1
  %8 = icmp eq i2 %from, %7
  br i1 %8, label %condTrue__3, label %condContinue__3

condTrue__3:                                      ; preds = %condTrue__2
  %9 = load i2, i2* @PauliZ, align 1
  %10 = icmp eq i2 %to, %9
  br label %condContinue__3

condContinue__3:                                  ; preds = %condTrue__3, %condTrue__2
  %11 = phi i1 [ %10, %condTrue__3 ], [ %8, %condTrue__2 ]
  br label %condContinue__2

condContinue__2:                                  ; preds = %condContinue__3, %condContinue__1
  %12 = phi i1 [ %11, %condContinue__3 ], [ %5, %condContinue__1 ]
  br i1 %12, label %then1__1, label %test2__1

then1__1:                                         ; preds = %condContinue__2
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %condContinue__2
  %13 = load i2, i2* @PauliZ, align 1
  %14 = icmp eq i2 %from, %13
  br i1 %14, label %condTrue__4, label %condContinue__4

condTrue__4:                                      ; preds = %test2__1
  %15 = load i2, i2* @PauliY, align 1
  %16 = icmp eq i2 %to, %15
  br label %condContinue__4

condContinue__4:                                  ; preds = %condTrue__4, %test2__1
  %17 = phi i1 [ %16, %condTrue__4 ], [ %14, %test2__1 ]
  br i1 %17, label %then2__1, label %test3__1

then2__1:                                         ; preds = %condContinue__4
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  br label %continue__1

test3__1:                                         ; preds = %condContinue__4
  %18 = load i2, i2* @PauliY, align 1
  %19 = icmp eq i2 %from, %18
  br i1 %19, label %condTrue__5, label %condContinue__5

condTrue__5:                                      ; preds = %test3__1
  %20 = load i2, i2* @PauliZ, align 1
  %21 = icmp eq i2 %to, %20
  br label %condContinue__5

condContinue__5:                                  ; preds = %condTrue__5, %test3__1
  %22 = phi i1 [ %21, %condTrue__5 ], [ %19, %test3__1 ]
  br i1 %22, label %then3__1, label %test4__1

then3__1:                                         ; preds = %condContinue__5
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  br label %continue__1

test4__1:                                         ; preds = %condContinue__5
  %23 = load i2, i2* @PauliY, align 1
  %24 = icmp eq i2 %from, %23
  br i1 %24, label %condTrue__6, label %condContinue__6

condTrue__6:                                      ; preds = %test4__1
  %25 = load i2, i2* @PauliX, align 1
  %26 = icmp eq i2 %to, %25
  br label %condContinue__6

condContinue__6:                                  ; preds = %condTrue__6, %test4__1
  %27 = phi i1 [ %26, %condTrue__6 ], [ %24, %test4__1 ]
  br i1 %27, label %then4__1, label %test5__1

then4__1:                                         ; preds = %condContinue__6
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit)
  br label %continue__1

test5__1:                                         ; preds = %condContinue__6
  %28 = load i2, i2* @PauliX, align 1
  %29 = icmp eq i2 %from, %28
  br i1 %29, label %condTrue__7, label %condContinue__7

condTrue__7:                                      ; preds = %test5__1
  %30 = load i2, i2* @PauliY, align 1
  %31 = icmp eq i2 %to, %30
  br label %condContinue__7

condContinue__7:                                  ; preds = %condTrue__7, %test5__1
  %32 = phi i1 [ %31, %condTrue__7 ], [ %29, %test5__1 ]
  br i1 %32, label %then5__1, label %else__1

then5__1:                                         ; preds = %condContinue__7
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %condContinue__7
  %33 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0))
  call void @__quantum__rt__fail(%String* %33)
  unreachable

continue__1:                                      ; preds = %then5__1, %then4__1, %then3__1, %then2__1, %then1__1, %then0__1
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__s__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__s__adj(%Qubit* %qubit)
  ret void
}

declare %String* @__quantum__rt__string_create(i8*)

declare void @__quantum__rt__fail(%String*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____adj(%Qubit* %qubit, i2 %from, i2 %to) {
entry:
  %0 = icmp eq i2 %from, %to
  br i1 %0, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  br label %continue__1

test1__1:                                         ; preds = %entry
  %1 = load i2, i2* @PauliZ, align 1
  %2 = icmp eq i2 %from, %1
  br i1 %2, label %condTrue__1, label %condContinue__1

condTrue__1:                                      ; preds = %test1__1
  %3 = load i2, i2* @PauliX, align 1
  %4 = icmp eq i2 %to, %3
  br label %condContinue__1

condContinue__1:                                  ; preds = %condTrue__1, %test1__1
  %5 = phi i1 [ %4, %condTrue__1 ], [ %2, %test1__1 ]
  %6 = xor i1 %5, true
  br i1 %6, label %condTrue__2, label %condContinue__2

condTrue__2:                                      ; preds = %condContinue__1
  %7 = load i2, i2* @PauliX, align 1
  %8 = icmp eq i2 %from, %7
  br i1 %8, label %condTrue__3, label %condContinue__3

condTrue__3:                                      ; preds = %condTrue__2
  %9 = load i2, i2* @PauliZ, align 1
  %10 = icmp eq i2 %to, %9
  br label %condContinue__3

condContinue__3:                                  ; preds = %condTrue__3, %condTrue__2
  %11 = phi i1 [ %10, %condTrue__3 ], [ %8, %condTrue__2 ]
  br label %condContinue__2

condContinue__2:                                  ; preds = %condContinue__3, %condContinue__1
  %12 = phi i1 [ %11, %condContinue__3 ], [ %5, %condContinue__1 ]
  br i1 %12, label %then1__1, label %test2__1

then1__1:                                         ; preds = %condContinue__2
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %condContinue__2
  %13 = load i2, i2* @PauliZ, align 1
  %14 = icmp eq i2 %from, %13
  br i1 %14, label %condTrue__4, label %condContinue__4

condTrue__4:                                      ; preds = %test2__1
  %15 = load i2, i2* @PauliY, align 1
  %16 = icmp eq i2 %to, %15
  br label %condContinue__4

condContinue__4:                                  ; preds = %condTrue__4, %test2__1
  %17 = phi i1 [ %16, %condTrue__4 ], [ %14, %test2__1 ]
  br i1 %17, label %then2__1, label %test3__1

then2__1:                                         ; preds = %condContinue__4
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  br label %continue__1

test3__1:                                         ; preds = %condContinue__4
  %18 = load i2, i2* @PauliY, align 1
  %19 = icmp eq i2 %from, %18
  br i1 %19, label %condTrue__5, label %condContinue__5

condTrue__5:                                      ; preds = %test3__1
  %20 = load i2, i2* @PauliZ, align 1
  %21 = icmp eq i2 %to, %20
  br label %condContinue__5

condContinue__5:                                  ; preds = %condTrue__5, %test3__1
  %22 = phi i1 [ %21, %condTrue__5 ], [ %19, %test3__1 ]
  br i1 %22, label %then3__1, label %test4__1

then3__1:                                         ; preds = %condContinue__5
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit)
  br label %continue__1

test4__1:                                         ; preds = %condContinue__5
  %23 = load i2, i2* @PauliY, align 1
  %24 = icmp eq i2 %from, %23
  br i1 %24, label %condTrue__6, label %condContinue__6

condTrue__6:                                      ; preds = %test4__1
  %25 = load i2, i2* @PauliX, align 1
  %26 = icmp eq i2 %to, %25
  br label %condContinue__6

condContinue__6:                                  ; preds = %condTrue__6, %test4__1
  %27 = phi i1 [ %26, %condTrue__6 ], [ %24, %test4__1 ]
  br i1 %27, label %then4__1, label %test5__1

then4__1:                                         ; preds = %condContinue__6
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit)
  br label %continue__1

test5__1:                                         ; preds = %condContinue__6
  %28 = load i2, i2* @PauliX, align 1
  %29 = icmp eq i2 %from, %28
  br i1 %29, label %condTrue__7, label %condContinue__7

condTrue__7:                                      ; preds = %test5__1
  %30 = load i2, i2* @PauliY, align 1
  %31 = icmp eq i2 %to, %30
  br label %condContinue__7

condContinue__7:                                  ; preds = %condTrue__7, %test5__1
  %32 = phi i1 [ %31, %condTrue__7 ], [ %29, %test5__1 ]
  br i1 %32, label %then5__1, label %else__1

then5__1:                                         ; preds = %condContinue__7
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %condContinue__7
  %33 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0))
  call void @__quantum__rt__fail(%String* %33)
  unreachable

continue__1:                                      ; preds = %then5__1, %then4__1, %then3__1, %then2__1, %then1__1, %then0__1
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__t__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__t__adj(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  %0 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %1 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to %Qubit**
  %3 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %4 = bitcast i8* %3 to %Qubit**
  store %Qubit* %control1, %Qubit** %2, align 8
  store %Qubit* %control2, %Qubit** %4, align 8
  call void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %0, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__ctl(%Array* %ctls, { %Qubit*, %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control1 = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %control2 = load %Qubit*, %Qubit** %2, align 8
  %3 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 2
  %target = load %Qubit*, %Qubit** %3, align 8
  %4 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 0)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 1)
  %8 = bitcast i8* %7 to %Qubit**
  store %Qubit* %control1, %Qubit** %6, align 8
  store %Qubit* %control2, %Qubit** %8, align 8
  %9 = call %Array* @__quantum__rt__array_concatenate(%Array* %ctls, %Array* %4)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %9, %Qubit* %target)
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %4, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %9, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*)

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control1 = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %control2 = load %Qubit*, %Qubit** %2, align 8
  %3 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 2
  %target = load %Qubit*, %Qubit** %3, align 8
  %4 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 3))
  %5 = bitcast %Tuple* %4 to { %Qubit*, %Qubit*, %Qubit* }*
  %6 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 0
  %7 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 1
  %8 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 2
  store %Qubit* %control1, %Qubit** %6, align 8
  store %Qubit* %control2, %Qubit** %7, align 8
  store %Qubit* %target, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit*, %Qubit* }* %5)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %4, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %ctls, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %9, %Qubit* %control, %Qubit* %target)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %10 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__CNOT__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %10)
  %11 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %12 = bitcast %Tuple* %11 to { %Array*, { %Qubit*, %Qubit* }* }*
  %13 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %12, i32 0, i32 0
  %14 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %12, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %15 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %16 = bitcast %Tuple* %15 to { %Qubit*, %Qubit* }*
  %17 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %16, i32 0, i32 0
  %18 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %16, i32 0, i32 1
  store %Qubit* %control, %Qubit** %17, align 8
  store %Qubit* %target, %Qubit** %18, align 8
  store %Array* %ctls, %Array** %13, align 8
  store { %Qubit*, %Qubit* }* %16, { %Qubit*, %Qubit* }** %14, align 8
  call void @Microsoft__Quantum__Intrinsic___cf632a65937f42fc8584ed343018a315___QsRef23__ApplyWithLessControlsA____body(%Callable* %10, { %Array*, { %Qubit*, %Qubit* }* }* %12)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %10, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %10, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %15, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic___cf632a65937f42fc8584ed343018a315___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, { %Qubit*, %Qubit* }* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 1
  %arg = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  %3 = bitcast { %Qubit*, %Qubit* }* %arg to %Tuple*
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 1)
  %numControls = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %numControlPairs = sdiv i64 %numControls, 2
  %temps = call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs)
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 1)
  %4 = sub i64 %numControlPairs, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0__numPair__ = phi i64 [ 0, %entry ], [ %18, %exiting__1 ]
  %5 = icmp sle i64 %__qsVar0__numPair__, %4
  br i1 %5, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %6 = mul i64 2, %__qsVar0__numPair__
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %6)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  %10 = mul i64 2, %__qsVar0__numPair__
  %11 = add i64 %10, 1
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0__numPair__)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %9, %Qubit* %14, %Qubit* %17)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %18 = add i64 %__qsVar0__numPair__, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %19 = srem i64 %numControls, 2
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %temps, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %21 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = sub i64 %numControls, 1
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %24)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  store %Qubit* %27, %Qubit** %23, align 8
  %28 = call %Array* @__quantum__rt__array_concatenate(%Array* %temps, %Array* %21)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1__newControls__ = phi %Array* [ %temps, %condTrue__1 ], [ %28, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 1)
  %29 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %30 = bitcast %Tuple* %29 to { %Array*, { %Qubit*, %Qubit* }* }*
  %31 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %30, i32 0, i32 0
  %32 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %30, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 1)
  store %Array* %__qsVar1__newControls__, %Array** %31, align 8
  store { %Qubit*, %Qubit* }* %arg, { %Qubit*, %Qubit* }** %32, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %29, %Tuple* null)
  %33 = sub i64 %numControlPairs, 1
  %34 = sub i64 %33, 0
  %35 = sdiv i64 %34, 1
  %36 = mul i64 1, %35
  %37 = add i64 0, %36
  %38 = load %Range, %Range* @EmptyRange, align 4
  %39 = insertvalue %Range %38, i64 %37, 0
  %40 = insertvalue %Range %39, i64 -1, 1
  %41 = insertvalue %Range %40, i64 0, 2
  %42 = extractvalue %Range %41, 0
  %43 = extractvalue %Range %41, 1
  %44 = extractvalue %Range %41, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %45 = icmp sgt i64 %43, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0__numPair____ = phi i64 [ %42, %preheader__1 ], [ %61, %exiting__2 ]
  %46 = icmp sle i64 %__qsVar0____qsVar0__numPair____, %44
  %47 = icmp sge i64 %__qsVar0____qsVar0__numPair____, %44
  %48 = select i1 %45, i1 %46, i1 %47
  br i1 %48, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %49 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %50 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = load %Qubit*, %Qubit** %51, align 8
  %53 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %54 = add i64 %53, 1
  %55 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %54)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = load %Qubit*, %Qubit** %56, align 8
  %58 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0____qsVar0__numPair____)
  %59 = bitcast i8* %58 to %Qubit**
  %60 = load %Qubit*, %Qubit** %59, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %52, %Qubit* %57, %Qubit* %60)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %61 = add i64 %__qsVar0____qsVar0__numPair____, %43
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %temps)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit*, %Qubit* }*
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit*, %Qubit* }*
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Qubit*, %Qubit** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { %Qubit*, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %3, { %Qubit*, %Qubit* }* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { %Qubit*, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctladj(%Array* %3, { %Qubit*, %Qubit* }* %4)
  ret void
}

declare void @__quantum__rt__callable_make_controlled(%Callable*)

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %4 = bitcast %Tuple* %3 to { %Qubit*, %Qubit* }*
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 1
  store %Qubit* %control, %Qubit** %5, align 8
  store %Qubit* %target, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %arg = load %Qubit*, %Qubit** %2, align 8
  %numControls = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %numControlPairs = sdiv i64 %numControls, 2
  %temps = call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs)
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 1)
  %3 = sub i64 %numControlPairs, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0__numPair__ = phi i64 [ 0, %entry ], [ %17, %exiting__1 ]
  %4 = icmp sle i64 %__qsVar0__numPair__, %3
  br i1 %4, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %5 = mul i64 2, %__qsVar0__numPair__
  %6 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %5)
  %7 = bitcast i8* %6 to %Qubit**
  %8 = load %Qubit*, %Qubit** %7, align 8
  %9 = mul i64 2, %__qsVar0__numPair__
  %10 = add i64 %9, 1
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %10)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  %14 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0__numPair__)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = load %Qubit*, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %8, %Qubit* %13, %Qubit* %16)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %17 = add i64 %__qsVar0__numPair__, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %18 = srem i64 %numControls, 2
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %temps, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %20 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %20, i64 0)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = sub i64 %numControls, 1
  %24 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = load %Qubit*, %Qubit** %25, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  %27 = call %Array* @__quantum__rt__array_concatenate(%Array* %temps, %Array* %20)
  call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %20, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1__newControls__ = phi %Array* [ %temps, %condTrue__1 ], [ %27, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 1)
  %28 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %29 = bitcast %Tuple* %28 to { %Array*, %Qubit* }*
  %30 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %29, i32 0, i32 0
  %31 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %29, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 1)
  store %Array* %__qsVar1__newControls__, %Array** %30, align 8
  store %Qubit* %arg, %Qubit** %31, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %28, %Tuple* null)
  %32 = sub i64 %numControlPairs, 1
  %33 = sub i64 %32, 0
  %34 = sdiv i64 %33, 1
  %35 = mul i64 1, %34
  %36 = add i64 0, %35
  %37 = load %Range, %Range* @EmptyRange, align 4
  %38 = insertvalue %Range %37, i64 %36, 0
  %39 = insertvalue %Range %38, i64 -1, 1
  %40 = insertvalue %Range %39, i64 0, 2
  %41 = extractvalue %Range %40, 0
  %42 = extractvalue %Range %40, 1
  %43 = extractvalue %Range %40, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %44 = icmp sgt i64 %42, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0__numPair____ = phi i64 [ %41, %preheader__1 ], [ %60, %exiting__2 ]
  %45 = icmp sle i64 %__qsVar0____qsVar0__numPair____, %43
  %46 = icmp sge i64 %__qsVar0____qsVar0__numPair____, %43
  %47 = select i1 %44, i1 %45, i1 %46
  br i1 %47, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %48 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %49 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %48)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = load %Qubit*, %Qubit** %50, align 8
  %52 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %53 = add i64 %52, 1
  %54 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %53)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = load %Qubit*, %Qubit** %55, align 8
  %57 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0____qsVar0__numPair____)
  %58 = bitcast i8* %57 to %Qubit**
  %59 = load %Qubit*, %Qubit** %58, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %51, %Qubit* %56, %Qubit* %59)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %60 = add i64 %__qsVar0____qsVar0__numPair____, %42
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %28, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %temps)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R__body(i2 %pauli, double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliX, align 1
  %1 = icmp eq i2 %pauli, %0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Intrinsic__Rx__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = load i2, i2* @PauliY, align 1
  %3 = icmp eq i2 %pauli, %2
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  call void @Microsoft__Quantum__Intrinsic__Ry__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %4 = load i2, i2* @PauliZ, align 1
  %5 = icmp eq i2 %pauli, %4
  br i1 %5, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %theta, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %6 = fneg double %theta
  %7 = fdiv double %6, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____body(double %7)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__body(double %theta, %Qubit* %qubit) {
entry:
  call void @__quantum__qis__rx__body(double %theta, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__body(double %theta, %Qubit* %qubit) {
entry:
  call void @__quantum__qis__ry__body(double %theta, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__body(double %theta, %Qubit* %qubit) {
entry:
  call void @__quantum__qis__rz__body(double %theta, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R__adj(i2 %pauli, double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliX, align 1
  %1 = icmp eq i2 %pauli, %0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Intrinsic__Rx__adj(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = load i2, i2* @PauliY, align 1
  %3 = icmp eq i2 %pauli, %2
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  call void @Microsoft__Quantum__Intrinsic__Ry__adj(double %theta, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %4 = load i2, i2* @PauliZ, align 1
  %5 = icmp eq i2 %pauli, %4
  br i1 %5, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %theta, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %6 = fneg double %theta
  %7 = fdiv double %6, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____adj(double %7)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__Rx__body(double %0, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__Ry__body(double %0, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %0, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 0
  %pauli = load i2, i2* %1, align 1
  %2 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 1
  %theta = load double, double* %2, align 8
  %3 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 2
  %qubit = load %Qubit*, %Qubit** %3, align 8
  %4 = load i2, i2* @PauliX, align 1
  %5 = icmp eq i2 %pauli, %4
  br i1 %5, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  %6 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %7 = bitcast %Tuple* %6 to { double, %Qubit* }*
  %8 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %7, i32 0, i32 0
  %9 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %7, i32 0, i32 1
  store double %theta, double* %8, align 8
  store %Qubit* %qubit, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %7)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %10 = load i2, i2* @PauliY, align 1
  %11 = icmp eq i2 %pauli, %10
  br i1 %11, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %12 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %13 = bitcast %Tuple* %12 to { double, %Qubit* }*
  %14 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %13, i32 0, i32 0
  %15 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %13, i32 0, i32 1
  store double %theta, double* %14, align 8
  store %Qubit* %qubit, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %13)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %16 = load i2, i2* @PauliZ, align 1
  %17 = icmp eq i2 %pauli, %16
  br i1 %17, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %18 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %19 = bitcast %Tuple* %18 to { double, %Qubit* }*
  %20 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %19, i32 0, i32 0
  %21 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %19, i32 0, i32 1
  store double %theta, double* %20, align 8
  store %Qubit* %qubit, %Qubit** %21, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %19)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %18, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %22 = fneg double %theta
  %23 = fdiv double %22, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____ctl(%Array* %__controlQubits__, double %23)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__ctl(%Array* %ctls, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__rx__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = load i2, i2* @PauliZ, align 1
  %8 = load i2, i2* @PauliX, align 1
  call void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____body(%Qubit* %qubit, i2 %7, i2 %8)
  %9 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %10 = bitcast %Tuple* %9 to { double, %Qubit* }*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 0
  %12 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 1
  store double %theta, double* %11, align 8
  store %Qubit* %qubit, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %ctls, { double, %Qubit* }* %10)
  %13 = load i2, i2* @PauliZ, align 1
  %14 = load i2, i2* @PauliX, align 1
  call void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____adj(%Qubit* %qubit, i2 %13, i2 %14)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %9, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %15 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Rx__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %15)
  %16 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %17 = bitcast %Tuple* %16 to { %Array*, { double, %Qubit* }* }*
  %18 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %17, i32 0, i32 0
  %19 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %17, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %20 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %21 = bitcast %Tuple* %20 to { double, %Qubit* }*
  %22 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %21, i32 0, i32 0
  %23 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %21, i32 0, i32 1
  store double %theta, double* %22, align 8
  store %Qubit* %qubit, %Qubit** %23, align 8
  store %Array* %ctls, %Array** %18, align 8
  store { double, %Qubit* }* %21, { double, %Qubit* }** %19, align 8
  call void @Microsoft__Quantum__Intrinsic___5bd674dd289649c79c398bad24a1d7c7___QsRef23__ApplyWithLessControlsA____body(%Callable* %15, { %Array*, { double, %Qubit* }* }* %17)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %15, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %15, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %20, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %16, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__ctl(%Array* %ctls, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__ry__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = load i2, i2* @PauliZ, align 1
  %8 = load i2, i2* @PauliY, align 1
  call void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____body(%Qubit* %qubit, i2 %7, i2 %8)
  %9 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %10 = bitcast %Tuple* %9 to { double, %Qubit* }*
  %11 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 0
  %12 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %10, i32 0, i32 1
  store double %theta, double* %11, align 8
  store %Qubit* %qubit, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %ctls, { double, %Qubit* }* %10)
  %13 = load i2, i2* @PauliZ, align 1
  %14 = load i2, i2* @PauliY, align 1
  call void @Microsoft__Quantum__Intrinsic____QsRef23__MapPauli____adj(%Qubit* %qubit, i2 %13, i2 %14)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %9, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %15 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Ry__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %15)
  %16 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %17 = bitcast %Tuple* %16 to { %Array*, { double, %Qubit* }* }*
  %18 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %17, i32 0, i32 0
  %19 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %17, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %20 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %21 = bitcast %Tuple* %20 to { double, %Qubit* }*
  %22 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %21, i32 0, i32 0
  %23 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %21, i32 0, i32 1
  store double %theta, double* %22, align 8
  store %Qubit* %qubit, %Qubit** %23, align 8
  store %Array* %ctls, %Array** %18, align 8
  store { double, %Qubit* }* %21, { double, %Qubit* }** %19, align 8
  call void @Microsoft__Quantum__Intrinsic___5bd674dd289649c79c398bad24a1d7c7___QsRef23__ApplyWithLessControlsA____body(%Callable* %15, { %Array*, { double, %Qubit* }* }* %17)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %15, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %15, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %20, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %16, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %ctls, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = fdiv double %theta, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %7, %Qubit* %qubit)
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %10, %Qubit* %qubit)
  %11 = fneg double %theta
  %12 = fdiv double %11, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %12, %Qubit* %qubit)
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %15, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %16 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Rz__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %16)
  %17 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %18 = bitcast %Tuple* %17 to { %Array*, { double, %Qubit* }* }*
  %19 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %18, i32 0, i32 0
  %20 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %18, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  %21 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %22 = bitcast %Tuple* %21 to { double, %Qubit* }*
  %23 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %22, i32 0, i32 0
  %24 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %22, i32 0, i32 1
  store double %theta, double* %23, align 8
  store %Qubit* %qubit, %Qubit** %24, align 8
  store %Array* %ctls, %Array** %19, align 8
  store { double, %Qubit* }* %22, { double, %Qubit* }** %20, align 8
  call void @Microsoft__Quantum__Intrinsic___5bd674dd289649c79c398bad24a1d7c7___QsRef23__ApplyWithLessControlsA____body(%Callable* %16, { %Array*, { double, %Qubit* }* }* %18)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %16, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %16, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %21, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %17, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R__ctladj(%Array* %__controlQubits__, { i2, double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 0
  %pauli = load i2, i2* %1, align 1
  %2 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 1
  %theta = load double, double* %2, align 8
  %3 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %0, i32 0, i32 2
  %qubit = load %Qubit*, %Qubit** %3, align 8
  %4 = load i2, i2* @PauliX, align 1
  %5 = icmp eq i2 %pauli, %4
  br i1 %5, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  %6 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %7 = bitcast %Tuple* %6 to { double, %Qubit* }*
  %8 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %7, i32 0, i32 0
  %9 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %7, i32 0, i32 1
  store double %theta, double* %8, align 8
  store %Qubit* %qubit, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %7)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %10 = load i2, i2* @PauliY, align 1
  %11 = icmp eq i2 %pauli, %10
  br i1 %11, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %12 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %13 = bitcast %Tuple* %12 to { double, %Qubit* }*
  %14 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %13, i32 0, i32 0
  %15 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %13, i32 0, i32 1
  store double %theta, double* %14, align 8
  store %Qubit* %qubit, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %13)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %16 = load i2, i2* @PauliZ, align 1
  %17 = icmp eq i2 %pauli, %16
  br i1 %17, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %18 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %19 = bitcast %Tuple* %18 to { double, %Qubit* }*
  %20 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %19, i32 0, i32 0
  %21 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %19, i32 0, i32 1
  store double %theta, double* %20, align 8
  store %Qubit* %qubit, %Qubit** %21, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %19)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %18, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %22 = fneg double %theta
  %23 = fdiv double %22, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic____QsRef23__ApplyGlobalPhase____ctladj(%Array* %__controlQubits__, double %23)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { double, %Qubit* }*
  %5 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 1
  %7 = fneg double %theta
  store double %7, double* %5, align 8
  store %Qubit* %qubit, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { double, %Qubit* }*
  %5 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 1
  %7 = fneg double %theta
  store double %7, double* %5, align 8
  store %Qubit* %qubit, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { double, %Qubit* }*
  %5 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %4, i32 0, i32 1
  %7 = fneg double %theta
  store double %7, double* %5, align 8
  store %Qubit* %qubit, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1__body(double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliZ, align 1
  call void @Microsoft__Quantum__Intrinsic__R__body(i2 %0, double %theta, %Qubit* %qubit)
  %1 = load i2, i2* @PauliI, align 1
  %2 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__R__body(i2 %1, double %2, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliI, align 1
  %1 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__R__adj(i2 %0, double %1, %Qubit* %qubit)
  %2 = load i2, i2* @PauliZ, align 1
  call void @Microsoft__Quantum__Intrinsic__R__adj(i2 %2, double %theta, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1Frac__body(i64 %numerator, i64 %power, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliZ, align 1
  %1 = sub i64 0, %numerator
  %2 = add i64 %power, 1
  call void @Microsoft__Quantum__Intrinsic__RFrac__body(i2 %0, i64 %1, i64 %2, %Qubit* %qubit)
  %3 = load i2, i2* @PauliI, align 1
  %4 = add i64 %power, 1
  call void @Microsoft__Quantum__Intrinsic__RFrac__body(i2 %3, i64 %numerator, i64 %4, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__RFrac__body(i2 %pauli, i64 %numerator, i64 %power, %Qubit* %qubit) {
entry:
  %0 = call double @Microsoft__Quantum__Math__PI__body()
  %1 = fmul double -2.000000e+00, %0
  %2 = sitofp i64 %numerator to double
  %3 = fmul double %1, %2
  %4 = sitofp i64 %power to double
  %5 = call double @llvm.pow.f64(double 2.000000e+00, double %4)
  %angle = fdiv double %3, %5
  call void @Microsoft__Quantum__Intrinsic__R__body(i2 %pauli, double %angle, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1Frac__adj(i64 %numerator, i64 %power, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliI, align 1
  %1 = add i64 %power, 1
  call void @Microsoft__Quantum__Intrinsic__RFrac__adj(i2 %0, i64 %numerator, i64 %1, %Qubit* %qubit)
  %2 = load i2, i2* @PauliZ, align 1
  %3 = sub i64 0, %numerator
  %4 = add i64 %power, 1
  call void @Microsoft__Quantum__Intrinsic__RFrac__adj(i2 %2, i64 %3, i64 %4, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__RFrac__adj(i2 %pauli, i64 %numerator, i64 %power, %Qubit* %qubit) {
entry:
  %0 = call double @Microsoft__Quantum__Math__PI__body()
  %1 = fmul double -2.000000e+00, %0
  %2 = sitofp i64 %numerator to double
  %3 = fmul double %1, %2
  %4 = sitofp i64 %power to double
  %5 = call double @llvm.pow.f64(double 2.000000e+00, double %4)
  %__qsVar0__angle__ = fdiv double %3, %5
  call void @Microsoft__Quantum__Intrinsic__R__adj(i2 %pauli, double %__qsVar0__angle__, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1Frac__ctl(%Array* %__controlQubits__, { i64, i64, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 0
  %numerator = load i64, i64* %1, align 4
  %2 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 1
  %power = load i64, i64* %2, align 4
  %3 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 2
  %qubit = load %Qubit*, %Qubit** %3, align 8
  %4 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, i64, i64, %Qubit* }* getelementptr ({ i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* null, i32 1) to i64))
  %5 = bitcast %Tuple* %4 to { i2, i64, i64, %Qubit* }*
  %6 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 0
  %7 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 1
  %8 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 2
  %9 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 3
  %10 = load i2, i2* @PauliZ, align 1
  %11 = sub i64 0, %numerator
  %12 = add i64 %power, 1
  store i2 %10, i2* %6, align 1
  store i64 %11, i64* %7, align 4
  store i64 %12, i64* %8, align 4
  store %Qubit* %qubit, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__RFrac__ctl(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %5)
  %13 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, i64, i64, %Qubit* }* getelementptr ({ i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* null, i32 1) to i64))
  %14 = bitcast %Tuple* %13 to { i2, i64, i64, %Qubit* }*
  %15 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %14, i32 0, i32 0
  %16 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %14, i32 0, i32 1
  %17 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %14, i32 0, i32 2
  %18 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %14, i32 0, i32 3
  %19 = load i2, i2* @PauliI, align 1
  %20 = add i64 %power, 1
  store i2 %19, i2* %15, align 1
  store i64 %numerator, i64* %16, align 4
  store i64 %20, i64* %17, align 4
  store %Qubit* %qubit, %Qubit** %18, align 8
  call void @Microsoft__Quantum__Intrinsic__RFrac__ctl(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %14)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %4, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__RFrac__ctl(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 0
  %pauli = load i2, i2* %1, align 1
  %2 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 1
  %numerator = load i64, i64* %2, align 4
  %3 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 2
  %power = load i64, i64* %3, align 4
  %4 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 3
  %qubit = load %Qubit*, %Qubit** %4, align 8
  %5 = call double @Microsoft__Quantum__Math__PI__body()
  %6 = fmul double -2.000000e+00, %5
  %7 = sitofp i64 %numerator to double
  %8 = fmul double %6, %7
  %9 = sitofp i64 %power to double
  %10 = call double @llvm.pow.f64(double 2.000000e+00, double %9)
  %angle = fdiv double %8, %10
  %11 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %12 = bitcast %Tuple* %11 to { i2, double, %Qubit* }*
  %13 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 0
  %14 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 1
  %15 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 2
  store i2 %pauli, i2* %13, align 1
  store double %angle, double* %14, align 8
  store %Qubit* %qubit, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %12)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__R1Frac__ctladj(%Array* %__controlQubits__, { i64, i64, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 0
  %numerator = load i64, i64* %1, align 4
  %2 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 1
  %power = load i64, i64* %2, align 4
  %3 = getelementptr inbounds { i64, i64, %Qubit* }, { i64, i64, %Qubit* }* %0, i32 0, i32 2
  %qubit = load %Qubit*, %Qubit** %3, align 8
  %4 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, i64, i64, %Qubit* }* getelementptr ({ i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* null, i32 1) to i64))
  %5 = bitcast %Tuple* %4 to { i2, i64, i64, %Qubit* }*
  %6 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 0
  %7 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 1
  %8 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 2
  %9 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %5, i32 0, i32 3
  %10 = load i2, i2* @PauliI, align 1
  %11 = add i64 %power, 1
  store i2 %10, i2* %6, align 1
  store i64 %numerator, i64* %7, align 4
  store i64 %11, i64* %8, align 4
  store %Qubit* %qubit, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__RFrac__ctladj(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %5)
  %12 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, i64, i64, %Qubit* }* getelementptr ({ i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* null, i32 1) to i64))
  %13 = bitcast %Tuple* %12 to { i2, i64, i64, %Qubit* }*
  %14 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %13, i32 0, i32 0
  %15 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %13, i32 0, i32 1
  %16 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %13, i32 0, i32 2
  %17 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %13, i32 0, i32 3
  %18 = load i2, i2* @PauliZ, align 1
  %19 = sub i64 0, %numerator
  %20 = add i64 %power, 1
  store i2 %18, i2* %14, align 1
  store i64 %19, i64* %15, align 4
  store i64 %20, i64* %16, align 4
  store %Qubit* %qubit, %Qubit** %17, align 8
  call void @Microsoft__Quantum__Intrinsic__RFrac__ctladj(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %13)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %4, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %12, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__RFrac__ctladj(%Array* %__controlQubits__, { i2, i64, i64, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 0
  %pauli = load i2, i2* %1, align 1
  %2 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 1
  %numerator = load i64, i64* %2, align 4
  %3 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 2
  %power = load i64, i64* %3, align 4
  %4 = getelementptr inbounds { i2, i64, i64, %Qubit* }, { i2, i64, i64, %Qubit* }* %0, i32 0, i32 3
  %qubit = load %Qubit*, %Qubit** %4, align 8
  %5 = call double @Microsoft__Quantum__Math__PI__body()
  %6 = fmul double -2.000000e+00, %5
  %7 = sitofp i64 %numerator to double
  %8 = fmul double %6, %7
  %9 = sitofp i64 %power to double
  %10 = call double @llvm.pow.f64(double 2.000000e+00, double %9)
  %__qsVar0__angle__ = fdiv double %8, %10
  %11 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %12 = bitcast %Tuple* %11 to { i2, double, %Qubit* }*
  %13 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 0
  %14 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 1
  %15 = getelementptr inbounds { i2, double, %Qubit* }, { i2, double, %Qubit* }* %12, i32 0, i32 2
  store i2 %pauli, i2* %13, align 1
  store double %__qsVar0__angle__, double* %14, align 8
  store %Qubit* %qubit, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic__R__ctladj(%Array* %__controlQubits__, { i2, double, %Qubit* }* %12)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %11, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Reset__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__reset__body(%Qubit* %qubit)
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #0

declare void @__quantum__qis__rx__body(double, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic___5bd674dd289649c79c398bad24a1d7c7___QsRef23__ApplyWithLessControlsA____body(%Callable* %op, { %Array*, { double, %Qubit* }* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %arg = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  %3 = bitcast { double, %Qubit* }* %arg to %Tuple*
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 1)
  %numControls = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %numControlPairs = sdiv i64 %numControls, 2
  %temps = call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs)
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 1)
  %4 = sub i64 %numControlPairs, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0__numPair__ = phi i64 [ 0, %entry ], [ %18, %exiting__1 ]
  %5 = icmp sle i64 %__qsVar0__numPair__, %4
  br i1 %5, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %6 = mul i64 2, %__qsVar0__numPair__
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %6)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  %10 = mul i64 2, %__qsVar0__numPair__
  %11 = add i64 %10, 1
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0__numPair__)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %9, %Qubit* %14, %Qubit* %17)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %18 = add i64 %__qsVar0__numPair__, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %19 = srem i64 %numControls, 2
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %temps, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %21 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = sub i64 %numControls, 1
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %24)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  store %Qubit* %27, %Qubit** %23, align 8
  %28 = call %Array* @__quantum__rt__array_concatenate(%Array* %temps, %Array* %21)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1__newControls__ = phi %Array* [ %temps, %condTrue__1 ], [ %28, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 1)
  %29 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %30 = bitcast %Tuple* %29 to { %Array*, { double, %Qubit* }* }*
  %31 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %30, i32 0, i32 0
  %32 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %30, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 1)
  store %Array* %__qsVar1__newControls__, %Array** %31, align 8
  store { double, %Qubit* }* %arg, { double, %Qubit* }** %32, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %op, %Tuple* %29, %Tuple* null)
  %33 = sub i64 %numControlPairs, 1
  %34 = sub i64 %33, 0
  %35 = sdiv i64 %34, 1
  %36 = mul i64 1, %35
  %37 = add i64 0, %36
  %38 = load %Range, %Range* @EmptyRange, align 4
  %39 = insertvalue %Range %38, i64 %37, 0
  %40 = insertvalue %Range %39, i64 -1, 1
  %41 = insertvalue %Range %40, i64 0, 2
  %42 = extractvalue %Range %41, 0
  %43 = extractvalue %Range %41, 1
  %44 = extractvalue %Range %41, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %45 = icmp sgt i64 %43, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0__numPair____ = phi i64 [ %42, %preheader__1 ], [ %61, %exiting__2 ]
  %46 = icmp sle i64 %__qsVar0____qsVar0__numPair____, %44
  %47 = icmp sge i64 %__qsVar0____qsVar0__numPair____, %44
  %48 = select i1 %45, i1 %46, i1 %47
  br i1 %48, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %49 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %50 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = load %Qubit*, %Qubit** %51, align 8
  %53 = mul i64 2, %__qsVar0____qsVar0__numPair____
  %54 = add i64 %53, 1
  %55 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %54)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = load %Qubit*, %Qubit** %56, align 8
  %58 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps, i64 %__qsVar0____qsVar0__numPair____)
  %59 = bitcast i8* %58 to %Qubit**
  %60 = load %Qubit*, %Qubit** %59, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %52, %Qubit* %57, %Qubit* %60)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %61 = add i64 %__qsVar0____qsVar0__numPair____, %43
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %temps, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %temps)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__body(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__adj(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__ctl(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rx__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rx__ctladj(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

declare void @__quantum__qis__ry__body(double, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__Ry__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__body(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__adj(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__ctl(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Ry__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Ry__ctladj(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

declare void @__quantum__qis__rz__body(double, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__Rz__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { double, %Qubit* }*
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %3 = load double, double* %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, { double, %Qubit* }* }*
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctladj(%Array* %3, { double, %Qubit* }* %4)
  ret void
}

declare void @__quantum__qis__s__body(%Qubit*)

declare void @__quantum__qis__s__adj(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__S__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__s__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %6)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit)
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %9, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit)
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %12, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %13 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__S__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %13)
  %14 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %15 = bitcast %Tuple* %14 to { %Array*, %Qubit* }*
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 0
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %16, align 8
  store %Qubit* %qubit, %Qubit** %17, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %13, { %Array*, %Qubit* }* %15)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %14, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__S__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__S__ctladj(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__ctladj(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__s__adj(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %6)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit)
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %9, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit)
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %12, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %13 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__S__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %13)
  call void @__quantum__rt__callable_make_controlled(%Callable* %13)
  %14 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %15 = bitcast %Tuple* %14 to { %Array*, %Qubit* }*
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 0
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %16, align 8
  store %Qubit* %qubit, %Qubit** %17, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %13, { %Array*, %Qubit* }* %15)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %14, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__rt__callable_make_adjoint(%Callable*)

declare void @__quantum__qis__t__body(%Qubit*)

declare void @__quantum__qis__t__adj(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__t__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic__R1Frac__body(i64 1, i64 3, %Qubit* %6)
  call void @Microsoft__Quantum__Intrinsic__R1Frac__body(i64 1, i64 3, %Qubit* %qubit)
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %9, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__R1Frac__adj(i64 1, i64 3, %Qubit* %qubit)
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %12, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %13 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__T__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_controlled(%Callable* %13)
  %14 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %15 = bitcast %Tuple* %14 to { %Array*, %Qubit* }*
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 0
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %16, align 8
  store %Qubit* %qubit, %Qubit** %17, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %13, { %Array*, %Qubit* }* %15)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %14, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__t__adj(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic__R1Frac__adj(i64 1, i64 3, %Qubit* %6)
  call void @Microsoft__Quantum__Intrinsic__R1Frac__adj(i64 1, i64 3, %Qubit* %qubit)
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %9, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic__R1Frac__body(i64 1, i64 3, %Qubit* %qubit)
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %12, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %13 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__T__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %13)
  call void @__quantum__rt__callable_make_controlled(%Callable* %13)
  %14 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %15 = bitcast %Tuple* %14 to { %Array*, %Qubit* }*
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 0
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %15, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 1)
  store %Array* %ctls, %Array** %16, align 8
  store %Qubit* %qubit, %Qubit** %17, align 8
  call void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____body(%Callable* %13, { %Array*, %Qubit* }* %15)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %13, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %14, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__z__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__adj(%Qubit* %qubit) {
entry:
  call void @Microsoft__Quantum__Intrinsic__Z__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__Z__body(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__adj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Qubit* }*
  %1 = getelementptr inbounds { %Qubit* }, { %Qubit* }* %0, i32 0, i32 0
  %2 = load %Qubit*, %Qubit** %1, align 8
  call void @Microsoft__Quantum__Intrinsic__Z__adj(%Qubit* %2)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__Z__ctladj(%Array* %3, %Qubit* %4)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @Microsoft__Quantum__Intrinsic__Z__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32)

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32)

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*)

define internal void @Microsoft__Quantum__Intrinsic___2c6e60ef56234aab9ee5c0ef71ab71f8___QsRef23__ApplyWithLessControlsA____adj(%Callable* %op, { %Array*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i32 0, i32 1
  %arg = load %Qubit*, %Qubit** %2, align 8
  %__qsVar0__numControls__ = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %__qsVar1__numControlPairs__ = sdiv i64 %__qsVar0__numControls__, 2
  %__qsVar2__temps__ = call %Array* @__quantum__rt__qubit_allocate_array(i64 %__qsVar1__numControlPairs__)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 1)
  %3 = sub i64 %__qsVar1__numControlPairs__, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0____qsVar3__numPair____ = phi i64 [ 0, %entry ], [ %17, %exiting__1 ]
  %4 = icmp sle i64 %__qsVar0____qsVar3__numPair____, %3
  br i1 %4, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %5 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %6 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %5)
  %7 = bitcast i8* %6 to %Qubit**
  %8 = load %Qubit*, %Qubit** %7, align 8
  %9 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %10 = add i64 %9, 1
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %10)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  %14 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar3__numPair____)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = load %Qubit*, %Qubit** %15, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %8, %Qubit* %13, %Qubit* %16)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %17 = add i64 %__qsVar0____qsVar3__numPair____, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %18 = srem i64 %__qsVar0__numControls__, 2
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar2__temps__, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %20 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %20, i64 0)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = sub i64 %__qsVar0__numControls__, 1
  %24 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = load %Qubit*, %Qubit** %25, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  %27 = call %Array* @__quantum__rt__array_concatenate(%Array* %__qsVar2__temps__, %Array* %20)
  call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %20, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %27, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1____qsVar4__newControls____ = phi %Array* [ %__qsVar2__temps__, %condTrue__1 ], [ %27, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  %28 = call %Callable* @__quantum__rt__callable_copy(%Callable* %op, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %28, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %28)
  %29 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %30 = bitcast %Tuple* %29 to { %Array*, %Qubit* }*
  %31 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %30, i32 0, i32 0
  %32 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %30, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  store %Array* %__qsVar1____qsVar4__newControls____, %Array** %31, align 8
  store %Qubit* %arg, %Qubit** %32, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %28, %Tuple* %29, %Tuple* null)
  %33 = sub i64 %__qsVar1__numControlPairs__, 1
  %34 = sub i64 %33, 0
  %35 = sdiv i64 %34, 1
  %36 = mul i64 1, %35
  %37 = add i64 0, %36
  %38 = load %Range, %Range* @EmptyRange, align 4
  %39 = insertvalue %Range %38, i64 %37, 0
  %40 = insertvalue %Range %39, i64 -1, 1
  %41 = insertvalue %Range %40, i64 0, 2
  %42 = extractvalue %Range %41, 0
  %43 = extractvalue %Range %41, 1
  %44 = extractvalue %Range %41, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %45 = icmp sgt i64 %43, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0____qsVar3__numPair______ = phi i64 [ %42, %preheader__1 ], [ %61, %exiting__2 ]
  %46 = icmp sle i64 %__qsVar0____qsVar0____qsVar3__numPair______, %44
  %47 = icmp sge i64 %__qsVar0____qsVar0____qsVar3__numPair______, %44
  %48 = select i1 %45, i1 %46, i1 %47
  br i1 %48, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %49 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %50 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %49)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = load %Qubit*, %Qubit** %51, align 8
  %53 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %54 = add i64 %53, 1
  %55 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %54)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = load %Qubit*, %Qubit** %56, align 8
  %58 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar0____qsVar3__numPair______)
  %59 = bitcast i8* %58 to %Qubit**
  %60 = load %Qubit*, %Qubit** %59, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %52, %Qubit* %57, %Qubit* %60)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %61 = add i64 %__qsVar0____qsVar0____qsVar3__numPair______, %43
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %28, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %28, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %29, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %__qsVar2__temps__)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  ret void
}

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1)

declare void @__quantum__rt__tuple_update_alias_count(%Tuple*, i32)

define internal void @Microsoft__Quantum__Intrinsic___cf632a65937f42fc8584ed343018a315___QsRef23__ApplyWithLessControlsA____adj(%Callable* %op, { %Array*, { %Qubit*, %Qubit* }* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %0, i32 0, i32 1
  %arg = load { %Qubit*, %Qubit* }*, { %Qubit*, %Qubit* }** %2, align 8
  %3 = bitcast { %Qubit*, %Qubit* }* %arg to %Tuple*
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 1)
  %__qsVar0__numControls__ = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %__qsVar1__numControlPairs__ = sdiv i64 %__qsVar0__numControls__, 2
  %__qsVar2__temps__ = call %Array* @__quantum__rt__qubit_allocate_array(i64 %__qsVar1__numControlPairs__)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 1)
  %4 = sub i64 %__qsVar1__numControlPairs__, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0____qsVar3__numPair____ = phi i64 [ 0, %entry ], [ %18, %exiting__1 ]
  %5 = icmp sle i64 %__qsVar0____qsVar3__numPair____, %4
  br i1 %5, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %6 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %6)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  %10 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %11 = add i64 %10, 1
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar3__numPair____)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %9, %Qubit* %14, %Qubit* %17)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %18 = add i64 %__qsVar0____qsVar3__numPair____, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %19 = srem i64 %__qsVar0__numControls__, 2
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar2__temps__, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %21 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = sub i64 %__qsVar0__numControls__, 1
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %24)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  store %Qubit* %27, %Qubit** %23, align 8
  %28 = call %Array* @__quantum__rt__array_concatenate(%Array* %__qsVar2__temps__, %Array* %21)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1____qsVar4__newControls____ = phi %Array* [ %__qsVar2__temps__, %condTrue__1 ], [ %28, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  %29 = call %Callable* @__quantum__rt__callable_copy(%Callable* %op, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %29)
  %30 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %31 = bitcast %Tuple* %30 to { %Array*, { %Qubit*, %Qubit* }* }*
  %32 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %31, i32 0, i32 0
  %33 = getelementptr inbounds { %Array*, { %Qubit*, %Qubit* }* }, { %Array*, { %Qubit*, %Qubit* }* }* %31, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 1)
  store %Array* %__qsVar1____qsVar4__newControls____, %Array** %32, align 8
  store { %Qubit*, %Qubit* }* %arg, { %Qubit*, %Qubit* }** %33, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %29, %Tuple* %30, %Tuple* null)
  %34 = sub i64 %__qsVar1__numControlPairs__, 1
  %35 = sub i64 %34, 0
  %36 = sdiv i64 %35, 1
  %37 = mul i64 1, %36
  %38 = add i64 0, %37
  %39 = load %Range, %Range* @EmptyRange, align 4
  %40 = insertvalue %Range %39, i64 %38, 0
  %41 = insertvalue %Range %40, i64 -1, 1
  %42 = insertvalue %Range %41, i64 0, 2
  %43 = extractvalue %Range %42, 0
  %44 = extractvalue %Range %42, 1
  %45 = extractvalue %Range %42, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %46 = icmp sgt i64 %44, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0____qsVar3__numPair______ = phi i64 [ %43, %preheader__1 ], [ %62, %exiting__2 ]
  %47 = icmp sle i64 %__qsVar0____qsVar0____qsVar3__numPair______, %45
  %48 = icmp sge i64 %__qsVar0____qsVar0____qsVar3__numPair______, %45
  %49 = select i1 %46, i1 %47, i1 %48
  br i1 %49, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %50 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %51 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %50)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = load %Qubit*, %Qubit** %52, align 8
  %54 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %55 = add i64 %54, 1
  %56 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %55)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = load %Qubit*, %Qubit** %57, align 8
  %59 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar0____qsVar3__numPair______)
  %60 = bitcast i8* %59 to %Qubit**
  %61 = load %Qubit*, %Qubit** %60, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %53, %Qubit* %58, %Qubit* %61)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %62 = add i64 %__qsVar0____qsVar0____qsVar3__numPair______, %44
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %29, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %30, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %__qsVar2__temps__)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic___5bd674dd289649c79c398bad24a1d7c7___QsRef23__ApplyWithLessControlsA____adj(%Callable* %op, { %Array*, { double, %Qubit* }* }* %0) {
entry:
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 1)
  %1 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 0
  %controls = load %Array*, %Array** %1, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 1)
  %2 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %0, i32 0, i32 1
  %arg = load { double, %Qubit* }*, { double, %Qubit* }** %2, align 8
  %3 = bitcast { double, %Qubit* }* %arg to %Tuple*
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 1)
  %__qsVar0__numControls__ = call i64 @__quantum__rt__array_get_size_1d(%Array* %controls)
  %__qsVar1__numControlPairs__ = sdiv i64 %__qsVar0__numControls__, 2
  %__qsVar2__temps__ = call %Array* @__quantum__rt__qubit_allocate_array(i64 %__qsVar1__numControlPairs__)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 1)
  %4 = sub i64 %__qsVar1__numControlPairs__, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0____qsVar3__numPair____ = phi i64 [ 0, %entry ], [ %18, %exiting__1 ]
  %5 = icmp sle i64 %__qsVar0____qsVar3__numPair____, %4
  br i1 %5, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %6 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %6)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  %10 = mul i64 2, %__qsVar0____qsVar3__numPair____
  %11 = add i64 %10, 1
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar3__numPair____)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____body(%Qubit* %9, %Qubit* %14, %Qubit* %17)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %18 = add i64 %__qsVar0____qsVar3__numPair____, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %19 = srem i64 %__qsVar0__numControls__, 2
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %exit__1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar2__temps__, i32 1)
  br label %condContinue__1

condFalse__1:                                     ; preds = %exit__1
  %21 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = sub i64 %__qsVar0__numControls__, 1
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %24)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  store %Qubit* %27, %Qubit** %23, align 8
  %28 = call %Array* @__quantum__rt__array_concatenate(%Array* %__qsVar2__temps__, %Array* %21)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 1)
  call void @__quantum__rt__array_update_reference_count(%Array* %21, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %28, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %__qsVar1____qsVar4__newControls____ = phi %Array* [ %__qsVar2__temps__, %condTrue__1 ], [ %28, %condFalse__1 ]
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  %29 = call %Callable* @__quantum__rt__callable_copy(%Callable* %op, i1 false)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 1)
  call void @__quantum__rt__callable_make_adjoint(%Callable* %29)
  %30 = call %Tuple* @__quantum__rt__tuple_create(i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2))
  %31 = bitcast %Tuple* %30 to { %Array*, { double, %Qubit* }* }*
  %32 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %31, i32 0, i32 0
  %33 = getelementptr inbounds { %Array*, { double, %Qubit* }* }, { %Array*, { double, %Qubit* }* }* %31, i32 0, i32 1
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 1)
  store %Array* %__qsVar1____qsVar4__newControls____, %Array** %32, align 8
  store { double, %Qubit* }* %arg, { double, %Qubit* }** %33, align 8
  call void @__quantum__rt__callable_invoke(%Callable* %29, %Tuple* %30, %Tuple* null)
  %34 = sub i64 %__qsVar1__numControlPairs__, 1
  %35 = sub i64 %34, 0
  %36 = sdiv i64 %35, 1
  %37 = mul i64 1, %36
  %38 = add i64 0, %37
  %39 = load %Range, %Range* @EmptyRange, align 4
  %40 = insertvalue %Range %39, i64 %38, 0
  %41 = insertvalue %Range %40, i64 -1, 1
  %42 = insertvalue %Range %41, i64 0, 2
  %43 = extractvalue %Range %42, 0
  %44 = extractvalue %Range %42, 1
  %45 = extractvalue %Range %42, 2
  br label %preheader__1

preheader__1:                                     ; preds = %condContinue__1
  %46 = icmp sgt i64 %44, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0____qsVar3__numPair______ = phi i64 [ %43, %preheader__1 ], [ %62, %exiting__2 ]
  %47 = icmp sle i64 %__qsVar0____qsVar0____qsVar3__numPair______, %45
  %48 = icmp sge i64 %__qsVar0____qsVar0____qsVar3__numPair______, %45
  %49 = select i1 %46, i1 %47, i1 %48
  br i1 %49, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %50 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %51 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %50)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = load %Qubit*, %Qubit** %52, align 8
  %54 = mul i64 2, %__qsVar0____qsVar0____qsVar3__numPair______
  %55 = add i64 %54, 1
  %56 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls, i64 %55)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = load %Qubit*, %Qubit** %57, align 8
  %59 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %__qsVar2__temps__, i64 %__qsVar0____qsVar0____qsVar3__numPair______)
  %60 = bitcast i8* %59 to %Qubit**
  %61 = load %Qubit*, %Qubit** %60, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef23__PhaseCCX____adj(%Qubit* %53, %Qubit* %58, %Qubit* %61)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %62 = add i64 %__qsVar0____qsVar0____qsVar3__numPair______, %44
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar2__temps__, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %29, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %29, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1____qsVar4__newControls____, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %30, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %__qsVar2__temps__)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %op, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %controls, i32 -1)
  call void @__quantum__rt__tuple_update_alias_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Diagnostics__EqualityFactB__body(i1 %actual, i1 %expected, %String* %message) {
entry:
  %0 = icmp ne i1 %actual, %expected
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Diagnostics___60bad4475c254a6c802ee2b003f655d8___QsRef2__FormattedFailure____body(i1 %actual, i1 %expected, %String* %message)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  ret void
}

define internal void @Microsoft__Quantum__Diagnostics___60bad4475c254a6c802ee2b003f655d8___QsRef2__FormattedFailure____body(i1 %actual, i1 %expected, %String* %message) {
entry:
  %0 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %1 = call %String* @__quantum__rt__string_concatenate(%String* %0, %String* %message)
  %2 = call %String* @__quantum__rt__string_concatenate(%String* %1, %String* %0)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -1)
  %3 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @2, i32 0, i32 0))
  %4 = call %String* @__quantum__rt__string_concatenate(%String* %2, %String* %3)
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %3, i32 -1)
  br i1 %expected, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  %5 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0))
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  %6 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0))
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %7 = phi %String* [ %5, %condTrue__1 ], [ %6, %condFalse__1 ]
  %8 = call %String* @__quantum__rt__string_concatenate(%String* %4, %String* %7)
  call void @__quantum__rt__string_update_reference_count(%String* %4, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %7, i32 -1)
  %9 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0))
  %10 = call %String* @__quantum__rt__string_concatenate(%String* %8, %String* %9)
  call void @__quantum__rt__string_update_reference_count(%String* %8, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %9, i32 -1)
  br i1 %actual, label %condTrue__2, label %condFalse__2

condTrue__2:                                      ; preds = %condContinue__1
  %11 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0))
  br label %condContinue__2

condFalse__2:                                     ; preds = %condContinue__1
  %12 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0))
  br label %condContinue__2

condContinue__2:                                  ; preds = %condFalse__2, %condTrue__2
  %13 = phi %String* [ %11, %condTrue__2 ], [ %12, %condFalse__2 ]
  %14 = call %String* @__quantum__rt__string_concatenate(%String* %10, %String* %13)
  call void @__quantum__rt__string_update_reference_count(%String* %10, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %13, i32 -1)
  call void @__quantum__rt__fail(%String* %14)
  unreachable
}

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

declare %String* @__quantum__rt__string_concatenate(%String*, %String*)

define internal %Range @Microsoft__Quantum__Arrays___2922dd69138d4ef3847890b41aea21f2_IndexRange__body(%Array* %array) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %array)
  %1 = sub i64 %0, 1
  %2 = load %Range, %Range* @EmptyRange, align 4
  %3 = insertvalue %Range %2, i64 0, 0
  %4 = insertvalue %Range %3, i64 1, 1
  %5 = insertvalue %Range %4, i64 %1, 2
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  ret %Range %5
}

declare %Result* @__quantum__rt__result_get_zero()

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare %Array* @__quantum__rt__array_copy(%Array*, i1)

define internal { i64, double, i1 }* @Microsoft__Quantum__Math____QsRef3__ExtendedTruncation____body(double %value) {
entry:
  %truncated = fptosi double %value to i64
  %0 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i64, double, i1 }* getelementptr ({ i64, double, i1 }, { i64, double, i1 }* null, i32 1) to i64))
  %1 = bitcast %Tuple* %0 to { i64, double, i1 }*
  %2 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %1, i32 0, i32 0
  %3 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %1, i32 0, i32 1
  %4 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %1, i32 0, i32 2
  %5 = sitofp i64 %truncated to double
  %6 = fsub double %5, %value
  %7 = fcmp oge double %value, 0.000000e+00
  store i64 %truncated, i64* %2, align 4
  store double %6, double* %3, align 8
  store i1 %7, i1* %4, align 1
  ret { i64, double, i1 }* %1
}

define internal double @Microsoft__Quantum__Math__AbsD__body(double %a) {
entry:
  %0 = fcmp olt double %a, 0.000000e+00
  br i1 %0, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  %1 = fneg double %a
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %2 = phi double [ %1, %condTrue__1 ], [ %a, %condFalse__1 ]
  ret double %2
}

define internal double @Microsoft__Quantum__Math__ArcSin__body(double %y) {
entry:
  %0 = call double @__quantum__qis__arcsin__body(double %y)
  ret double %0
}

define internal double @Microsoft__Quantum__Math__Sqrt__body(double %d) {
entry:
  %0 = call double @__quantum__qis__sqrt__body(double %d)
  ret double %0
}

define { i64, i8* }* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__Interop(i64 %nQubits) #1 {
entry:
  %0 = call %Array* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body(i64 %nQubits)
  %1 = call i64 @__quantum__rt__array_get_size_1d(%Array* %0)
  %2 = mul i64 %1, 1
  %3 = call i8* @__quantum__rt__memory_allocate(i64 %2)
  %4 = ptrtoint i8* %3 to i64
  %5 = sub i64 %1, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %6 = phi i64 [ 0, %entry ], [ %17, %exiting__1 ]
  %7 = icmp sle i64 %6, %5
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = mul i64 %6, 1
  %9 = add i64 %4, %8
  %10 = inttoptr i64 %9 to i8*
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %6)
  %12 = bitcast i8* %11 to %Result**
  %13 = load %Result*, %Result** %12, align 8
  %14 = call %Result* @__quantum__rt__result_get_zero()
  %15 = call i1 @__quantum__rt__result_equal(%Result* %13, %Result* %14)
  %16 = select i1 %15, i8 0, i8 -1
  store i8 %16, i8* %10, align 1
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %17 = add i64 %6, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %18 = call i8* @__quantum__rt__memory_allocate(i64 ptrtoint ({ i64, i8* }* getelementptr ({ i64, i8* }, { i64, i8* }* null, i32 1) to i64))
  %19 = bitcast i8* %18 to { i64, i8* }*
  %20 = getelementptr { i64, i8* }, { i64, i8* }* %19, i64 0, i32 0
  store i64 %1, i64* %20, align 4
  %21 = getelementptr { i64, i8* }, { i64, i8* }* %19, i64 0, i32 1
  store i8* %3, i8** %21, align 8
  %22 = sub i64 %1, 1
  br label %header__2

header__2:                                        ; preds = %exiting__2, %exit__1
  %23 = phi i64 [ 0, %exit__1 ], [ %28, %exiting__2 ]
  %24 = icmp sle i64 %23, %22
  br i1 %24, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %23)
  %26 = bitcast i8* %25 to %Result**
  %27 = load %Result*, %Result** %26, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %27, i32 -1)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %28 = add i64 %23, 1
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  ret { i64, i8* }* %19
}

declare i8* @__quantum__rt__memory_allocate(i64)

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

define void @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput(i64 %nQubits) #2 {
entry:
  %0 = call %Array* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body(i64 %nQubits)
  %1 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0))
  %2 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0))
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 1)
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %0)
  %4 = sub i64 %3, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %5 = phi %String* [ %2, %entry ], [ %15, %exiting__1 ]
  %6 = phi i64 [ 0, %entry ], [ %16, %exiting__1 ]
  %7 = icmp sle i64 %6, %4
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %6)
  %9 = bitcast i8* %8 to %Result**
  %10 = load %Result*, %Result** %9, align 8
  %11 = icmp ne %String* %5, %2
  br i1 %11, label %condTrue__1, label %condContinue__1

condTrue__1:                                      ; preds = %body__1
  %12 = call %String* @__quantum__rt__string_concatenate(%String* %5, %String* %1)
  call void @__quantum__rt__string_update_reference_count(%String* %5, i32 -1)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condTrue__1, %body__1
  %13 = phi %String* [ %12, %condTrue__1 ], [ %5, %body__1 ]
  %14 = call %String* @__quantum__rt__result_to_string(%Result* %10)
  %15 = call %String* @__quantum__rt__string_concatenate(%String* %13, %String* %14)
  call void @__quantum__rt__string_update_reference_count(%String* %13, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %14, i32 -1)
  br label %exiting__1

exiting__1:                                       ; preds = %condContinue__1
  %16 = add i64 %6, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %17 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @10, i32 0, i32 0))
  %18 = call %String* @__quantum__rt__string_concatenate(%String* %5, %String* %17)
  call void @__quantum__rt__string_update_reference_count(%String* %5, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %17, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 -1)
  call void @__quantum__rt__message(%String* %18)
  %19 = sub i64 %3, 1
  br label %header__2

header__2:                                        ; preds = %exiting__2, %exit__1
  %20 = phi i64 [ 0, %exit__1 ], [ %25, %exiting__2 ]
  %21 = icmp sle i64 %20, %19
  br i1 %21, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %20)
  %23 = bitcast i8* %22 to %Result**
  %24 = load %Result*, %Result** %23, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %24, i32 -1)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %25 = add i64 %20, 1
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %18, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__result_to_string(%Result*)

attributes #0 = { nounwind readnone speculatable willreturn }
attributes #1 = { "InteropFriendly" }
attributes #2 = { "EntryPoint" }
