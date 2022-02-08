; ModuleID = 'qat-link'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque

@Microsoft__Quantum__Samples__T__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Samples__T__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]

define i64 @Microsoft__Quantum__Samples__CountNumbers__Interop() local_unnamed_addr #0 {
entry:
  %x.i = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 10)
  %0 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 0)
  %1 = bitcast i8* %0 to i64*
  %2 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 1)
  %3 = bitcast i8* %2 to i64*
  %4 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 2)
  %5 = bitcast i8* %4 to i64*
  %6 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 3)
  %7 = bitcast i8* %6 to i64*
  %8 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 4)
  %9 = bitcast i8* %8 to i64*
  %10 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 5)
  %11 = bitcast i8* %10 to i64*
  %12 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 6)
  %13 = bitcast i8* %12 to i64*
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 7)
  %15 = bitcast i8* %14 to i64*
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 8)
  %17 = bitcast i8* %16 to i64*
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 9)
  %19 = bitcast i8* %18 to i64*
  store i64 2, i64* %1, align 4
  store i64 0, i64* %3, align 4
  store i64 2, i64* %5, align 4
  store i64 0, i64* %7, align 4
  store i64 1, i64* %9, align 4
  store i64 1, i64* %11, align 4
  store i64 1, i64* %13, align 4
  store i64 1, i64* %15, align 4
  store i64 1, i64* %17, align 4
  store i64 0, i64* %19, align 4
  %20 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Samples__T__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %20, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %20, i32 1)
  %21 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %x.i)
  %22 = add i64 %21, -1
  %.not2.i.i = icmp slt i64 %22, 0
  br i1 %.not2.i.i, label %Microsoft__Quantum__Samples__CountNumbers__body.1.exit, label %body__1.i.i

body__1.i.i:                                      ; preds = %entry, %body__1.i.i
  %23 = phi i64 [ %32, %body__1.i.i ], [ 0, %entry ]
  %totalFound.03.i.i = phi i64 [ %spec.select.i.i, %body__1.i.i ], [ 0, %entry ]
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %x.i, i64 %23)
  %25 = bitcast i8* %24 to i64*
  %element.i.i = load i64, i64* %25, align 4
  %26 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %27 = bitcast %Tuple* %26 to i64*
  store i64 %element.i.i, i64* %27, align 4
  %28 = tail call %Tuple* @__quantum__rt__tuple_create(i64 1)
  tail call void @__quantum__rt__callable_invoke(%Callable* %20, %Tuple* %26, %Tuple* %28)
  %29 = bitcast %Tuple* %28 to i1*
  %30 = load i1, i1* %29, align 1
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %26, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %28, i32 -1)
  %31 = zext i1 %30 to i64
  %spec.select.i.i = add i64 %totalFound.03.i.i, %31
  %32 = add i64 %23, 1
  %.not.i.i = icmp sgt i64 %32, %22
  br i1 %.not.i.i, label %Microsoft__Quantum__Samples__CountNumbers__body.1.exit, label %body__1.i.i

Microsoft__Quantum__Samples__CountNumbers__body.1.exit: ; preds = %body__1.i.i, %entry
  %33 = phi i64 [ 0, %entry ], [ %spec.select.i.i, %body__1.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %20, i32 -1)
  %34 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 10)
  %35 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 0)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 1)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 2)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 3)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 4)
  %44 = bitcast i8* %43 to %Qubit**
  %45 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 5)
  %46 = bitcast i8* %45 to %Qubit**
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 6)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 7)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 8)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 9)
  %54 = bitcast i8* %53 to %Qubit**
  %55 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %34, i64 3)
  %56 = bitcast i8* %55 to %Qubit**
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %20, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %20, i32 -1)
  br label %load

load:                                             ; preds = %Microsoft__Quantum__Samples__CountNumbers__body.1.exit
  %57 = load %Qubit*, %Qubit** %56, align 8
  br label %quantum

quantum:                                          ; preds = %load
  store %Qubit* null, %Qubit** %36, align 8
  store %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit** %38, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %40, align 8
  store %Qubit* inttoptr (i64 3 to %Qubit*), %Qubit** %42, align 8
  store %Qubit* inttoptr (i64 4 to %Qubit*), %Qubit** %44, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %46, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %48, align 8
  store %Qubit* inttoptr (i64 7 to %Qubit*), %Qubit** %50, align 8
  store %Qubit* inttoptr (i64 8 to %Qubit*), %Qubit** %52, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %54, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %57)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret i64 %33
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32) local_unnamed_addr

declare i64 @__quantum__rt__array_get_size_1d(%Array*) local_unnamed_addr

declare %Tuple* @__quantum__rt__tuple_create(i64) local_unnamed_addr

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32) local_unnamed_addr

; Function Attrs: nofree norecurse nounwind
define internal void @Microsoft__Quantum__Samples__T__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture %result-tuple) #1 {
entry:
  %0 = bitcast %Tuple* %arg-tuple to i64*
  %1 = load i64, i64* %0, align 4
  %2 = icmp sgt i64 %1, 0
  %3 = bitcast %Tuple* %result-tuple to i1*
  store i1 %2, i1* %3, align 1
  ret void
}

attributes #0 = { "InteropFriendly" "requiredQubits"="10" "requiredResults"="0" }
attributes #1 = { nofree norecurse nounwind }

