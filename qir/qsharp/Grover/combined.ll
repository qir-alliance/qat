; ModuleID = 'qat-link'
source_filename = "qat-link"

%Tuple = type opaque
%Array = type opaque
%Callable = type opaque
%Qubit = type opaque
%Range = type { i64, i64, i64 }
%Result = type opaque

@Microsoft__Quantum__Measurement__MResetZ__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Measurement__MResetZ__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]
@Microsoft__Quantum__Intrinsic__X__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__Z__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]
@Microsoft__Quantum__Intrinsic__H__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper]

define { i64, i8* }* @Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__Interop(i64 %nQubits) local_unnamed_addr #0 {
entry:
  %qubits.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %nQubits)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %0 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %1 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %2 = add i64 %1, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %.not1.i1.i = icmp slt i64 %2, 0
  br i1 %.not1.i1.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.2.exit.i, label %body__1.i3.i

body__1.i3.i:                                     ; preds = %body__1.i3.i, %entry
  %idxQubit2.i.i = phi i64 [ %8, %body__1.i3.i ], [ 0, %entry ]
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i.i)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  %6 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %7 = bitcast %Tuple* %6 to %Qubit**
  store %Qubit* %5, %Qubit** %7, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %0, %Tuple* %6, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %6, i32 -1)
  %8 = add i64 %idxQubit2.i.i, 1
  %.not.i2.i = icmp sgt i64 %8, %2
  br i1 %.not.i2.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.2.exit.i, label %body__1.i3.i

Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.2.exit.i: ; preds = %body__1.i3.i, %entry
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  %9 = shl nuw i64 1, %nQubits
  %10 = sitofp i64 %9 to double
  %11 = tail call double @__quantum__qis__sqrt__body(double %10)
  %12 = fdiv double 1.000000e+00, %11
  %13 = tail call double @__quantum__qis__arcsin__body(double %12)
  %14 = fdiv double 0x3FE921FB54442D18, %13
  %15 = fadd double %14, -5.000000e-01
  %16 = fptosi double %15 to i64
  %17 = tail call %Tuple* @__quantum__rt__tuple_create(i64 24)
  %18 = bitcast %Tuple* %17 to { i64, double, i1 }*
  %19 = bitcast %Tuple* %17 to i64*
  %20 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %18, i64 0, i32 1
  %21 = getelementptr inbounds { i64, double, i1 }, { i64, double, i1 }* %18, i64 0, i32 2
  %22 = sitofp i64 %16 to double
  %23 = fsub double %22, %15
  %24 = fcmp oge double %15, 0.000000e+00
  store i64 %16, i64* %19, align 4
  store double %23, double* %20, align 8
  store i1 %24, i1* %21, align 1
  %25 = load i64, i64* %19, align 4
  %26 = load double, double* %20, align 8
  %27 = fcmp olt double %26, 0.000000e+00
  %28 = fneg double %26
  %29 = select i1 %27, double %28, double %26
  %30 = fcmp ugt double %29, 1.000000e-15
  %31 = fcmp ole double %29, 5.000000e-01
  %32 = select i1 %24, i64 1, i64 -1
  %33 = select i1 %31, i64 0, i64 %32
  %34 = select i1 %30, i64 %33, i64 0
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %17, i32 -1)
  %35 = add i64 %25, -1
  %36 = add i64 %35, %34
  %37 = icmp slt i64 %36, 0
  br label %load

load:                                             ; preds = %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.2.exit.i
  br label %quantum

quantum:                                          ; preds = %load
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br i1 %37, label %exit__1.i, label %body__1.i

body__1.i:                                        ; preds = %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i, %exit_quantum_grouping
  %38 = phi i64 [ %373, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i ], [ 0, %exit_quantum_grouping ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %39 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %40 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %41 = add i64 %40, -1
  %42 = insertvalue %Range { i64 0, i64 2, i64 -1 }, i64 %41, 2
  %43 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %42, i1 true)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %39, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %39, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %43, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %43, i32 1)
  %44 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %43)
  %45 = add i64 %44, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %43, i32 -1)
  %46 = icmp slt i64 %45, 0
  br label %load10

load10:                                           ; preds = %body__1.i
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__x__body(%Qubit* null)
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %46, label %Microsoft__Quantum__Canon___ba3eb388531b4e6aa5f8fec1a4368731_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %body__1.i.i.i, %exit_quantum_grouping8
  %idxQubit2.i.i.i = phi i64 [ %52, %body__1.i.i.i ], [ 0, %exit_quantum_grouping8 ]
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %43, i64 %idxQubit2.i.i.i)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = load %Qubit*, %Qubit** %48, align 8
  %50 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %51 = bitcast %Tuple* %50 to %Qubit**
  store %Qubit* %49, %Qubit** %51, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %39, %Tuple* %50, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %50, i32 -1)
  %52 = add i64 %idxQubit2.i.i.i, 1
  %.not.i.i.i = icmp sgt i64 %52, %45
  br i1 %.not.i.i.i, label %Microsoft__Quantum__Canon___ba3eb388531b4e6aa5f8fec1a4368731_ApplyToEachA__body.exit.i.i, label %body__1.i.i.i

Microsoft__Quantum__Canon___ba3eb388531b4e6aa5f8fec1a4368731_ApplyToEachA__body.exit.i.i: ; preds = %body__1.i.i.i, %exit_quantum_grouping8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %39, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %39, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %43, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %53 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %Microsoft__Quantum__Canon___ba3eb388531b4e6aa5f8fec1a4368731_ApplyToEachA__body.exit.i.i
  br label %load15

load15:                                           ; preds = %then0__1.i.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

test1__1.i.i:                                     ; preds = %Microsoft__Quantum__Canon___ba3eb388531b4e6aa5f8fec1a4368731_ApplyToEachA__body.exit.i.i
  %55 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %56 = icmp eq i64 %55, 1
  br i1 %56, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %57 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 0)
  %58 = bitcast i8* %57 to %Qubit**
  br label %load20

load20:                                           ; preds = %then1__1.i.i
  %59 = load %Qubit*, %Qubit** %58, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__cnot__body(%Qubit* %59, %Qubit* null)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %60 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %61 = icmp eq i64 %60, 2
  br i1 %61, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 0)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 1)
  %65 = bitcast i8* %64 to %Qubit**
  %66 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %70 = bitcast i8* %69 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %66, i32 1)
  %71 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %66)
  %72 = icmp eq i64 %71, 0
  br label %load25

load25:                                           ; preds = %then2__1.i.i
  %73 = load %Qubit*, %Qubit** %63, align 8
  %74 = load %Qubit*, %Qubit** %65, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__h__body(%Qubit* null)
  store %Qubit* %73, %Qubit** %68, align 8
  store %Qubit* %74, %Qubit** %70, align 8
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br i1 %72, label %then0__1.i.i.i, label %test1__1.i.i.i

then0__1.i.i.i:                                   ; preds = %exit_quantum_grouping23
  br label %load30

load30:                                           ; preds = %then0__1.i.i.i
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__z__body(%Qubit* null)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i

test1__1.i.i.i:                                   ; preds = %exit_quantum_grouping23
  %75 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %66)
  %76 = icmp eq i64 %75, 1
  br i1 %76, label %then1__1.i.i.i, label %test2__1.i.i.i

then1__1.i.i.i:                                   ; preds = %test1__1.i.i.i
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %78 = bitcast i8* %77 to %Qubit**
  br label %load35

load35:                                           ; preds = %then1__1.i.i.i
  %79 = load %Qubit*, %Qubit** %78, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__cz__body(%Qubit* %79, %Qubit* null)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i

test2__1.i.i.i:                                   ; preds = %test1__1.i.i.i
  %80 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %66)
  %81 = icmp eq i64 %80, 2
  br i1 %81, label %then2__1.i.i.i, label %else__1.i.i.i

then2__1.i.i.i:                                   ; preds = %test2__1.i.i.i
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %85 = bitcast i8* %84 to %Qubit**
  %86 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %87 = bitcast i8* %86 to %Qubit**
  %88 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %89 = bitcast i8* %88 to %Qubit**
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %93 = bitcast i8* %92 to %Qubit**
  %94 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %95 = bitcast i8* %94 to %Qubit**
  %96 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %97 = bitcast i8* %96 to %Qubit**
  %98 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %99 = bitcast i8* %98 to %Qubit**
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %103 = bitcast i8* %102 to %Qubit**
  %104 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 1)
  %105 = bitcast i8* %104 to %Qubit**
  %106 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %66, i64 0)
  %107 = bitcast i8* %106 to %Qubit**
  br label %load40

load40:                                           ; preds = %then2__1.i.i.i
  %108 = load %Qubit*, %Qubit** %83, align 8
  %109 = load %Qubit*, %Qubit** %85, align 8
  %110 = load %Qubit*, %Qubit** %87, align 8
  %111 = load %Qubit*, %Qubit** %89, align 8
  %112 = load %Qubit*, %Qubit** %91, align 8
  %113 = load %Qubit*, %Qubit** %93, align 8
  %114 = load %Qubit*, %Qubit** %95, align 8
  %115 = load %Qubit*, %Qubit** %97, align 8
  %116 = load %Qubit*, %Qubit** %99, align 8
  %117 = load %Qubit*, %Qubit** %101, align 8
  %118 = load %Qubit*, %Qubit** %103, align 8
  %119 = load %Qubit*, %Qubit** %105, align 8
  %120 = load %Qubit*, %Qubit** %107, align 8
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__t__adj(%Qubit* %108)
  tail call void @__quantum__qis__t__adj(%Qubit* %109)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* %110)
  tail call void @__quantum__qis__t__body(%Qubit* %111)
  tail call void @__quantum__qis__cnot__body(%Qubit* %112, %Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %113, %Qubit* %114)
  tail call void @__quantum__qis__t__body(%Qubit* null)
  tail call void @__quantum__qis__t__adj(%Qubit* %115)
  tail call void @__quantum__qis__cnot__body(%Qubit* %116, %Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* %117)
  tail call void @__quantum__qis__t__adj(%Qubit* null)
  tail call void @__quantum__qis__t__body(%Qubit* %118)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i

else__1.i.i.i:                                    ; preds = %test2__1.i.i.i
  %121 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %121)
  %122 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %123 = bitcast %Tuple* %122 to { %Array*, %Qubit* }*
  %124 = bitcast %Tuple* %122 to %Array**
  %125 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %123, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %66, i32 1)
  store %Array* %66, %Array** %124, align 8
  store %Qubit* null, %Qubit** %125, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %121, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %121, i32 1)
  %controls.i.i.i.i = load %Array*, %Array** %124, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i.i, i32 1)
  %arg.i.i.i.i = load %Qubit*, %Qubit** %125, align 8
  %numControls.i.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i.i)
  %numControlPairs.i.i.i.i = sdiv i64 %numControls.i.i.i.i, 2
  %temps.i.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i.i, i32 1)
  %.not.not1.i.i.i.i = icmp sgt i64 %numControls.i.i.i.i, 1
  br i1 %.not.not1.i.i.i.i, label %body__1.i.i.i.i, label %exit__1.i.i.i.i

body__1.i.i.i.i:                                  ; preds = %exit_quantum_grouping43, %else__1.i.i.i
  %126 = phi i64 [ %135, %exit_quantum_grouping43 ], [ 0, %else__1.i.i.i ]
  %127 = shl nuw i64 %126, 1
  %128 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %127)
  %129 = bitcast i8* %128 to %Qubit**
  %130 = or i64 %127, 1
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %130)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i.i, i64 %126)
  %134 = bitcast i8* %133 to %Qubit**
  %135 = add nuw nsw i64 %126, 1
  %136 = icmp slt i64 %135, %numControlPairs.i.i.i.i
  br label %load45

load45:                                           ; preds = %body__1.i.i.i.i
  %137 = load %Qubit*, %Qubit** %129, align 8
  %138 = load %Qubit*, %Qubit** %132, align 8
  %139 = load %Qubit*, %Qubit** %134, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %139)
  tail call void @__quantum__qis__cnot__body(%Qubit* %139, %Qubit* %137)
  tail call void @__quantum__qis__cnot__body(%Qubit* %137, %Qubit* %138)
  tail call void @__quantum__qis__t__body(%Qubit* %138)
  tail call void @__quantum__qis__t__adj(%Qubit* %137)
  tail call void @__quantum__qis__t__body(%Qubit* %139)
  tail call void @__quantum__qis__cnot__body(%Qubit* %139, %Qubit* %137)
  tail call void @__quantum__qis__cnot__body(%Qubit* %137, %Qubit* %138)
  tail call void @__quantum__qis__t__adj(%Qubit* %138)
  tail call void @__quantum__qis__cnot__body(%Qubit* %139, %Qubit* %138)
  tail call void @__quantum__qis__h__body(%Qubit* %139)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %136, label %body__1.i.i.i.i, label %exit__1.i.i.i.i

exit__1.i.i.i.i:                                  ; preds = %exit_quantum_grouping43, %else__1.i.i.i
  %140 = and i64 %numControls.i.i.i.i, 1
  %141 = icmp eq i64 %140, 0
  br i1 %141, label %condTrue__1.i.i.i.i, label %condFalse__1.i.i.i.i

condTrue__1.i.i.i.i:                              ; preds = %exit__1.i.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i.i, i32 1)
  br label %condContinue__1.i.i.i.i

condFalse__1.i.i.i.i:                             ; preds = %exit__1.i.i.i.i
  %142 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %143 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %142, i64 0)
  %144 = bitcast i8* %143 to %Qubit**
  %145 = add i64 %numControls.i.i.i.i, -1
  %146 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %145)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = load %Qubit*, %Qubit** %147, align 8
  store %Qubit* %148, %Qubit** %144, align 8
  %149 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i.i, %Array* %142)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %149, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %142, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %149, i32 -1)
  br label %condContinue__1.i.i.i.i

condContinue__1.i.i.i.i:                          ; preds = %condFalse__1.i.i.i.i, %condTrue__1.i.i.i.i
  %__qsVar1__newControls__.i.i.i.i = phi %Array* [ %temps.i.i.i.i, %condTrue__1.i.i.i.i ], [ %149, %condFalse__1.i.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i.i, i32 1)
  %150 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %151 = bitcast %Tuple* %150 to { %Array*, %Qubit* }*
  %152 = bitcast %Tuple* %150 to %Array**
  %153 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %151, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i.i, %Array** %152, align 8
  store %Qubit* %arg.i.i.i.i, %Qubit** %153, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %121, %Tuple* %150, %Tuple* null)
  br i1 %.not.not1.i.i.i.i, label %body__2.preheader.i.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i

body__2.preheader.i.i.i.i:                        ; preds = %condContinue__1.i.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i.i = add nsw i64 %numControlPairs.i.i.i.i, -1
  br label %body__2.i.i.i.i

body__2.i.i.i.i:                                  ; preds = %exit_quantum_grouping48, %body__2.preheader.i.i.i.i
  %154 = phi i64 [ %163, %exit_quantum_grouping48 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i.i, %body__2.preheader.i.i.i.i ]
  %155 = shl nuw i64 %154, 1
  %156 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %155)
  %157 = bitcast i8* %156 to %Qubit**
  %158 = or i64 %155, 1
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i.i, i64 %158)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i.i, i64 %154)
  %162 = bitcast i8* %161 to %Qubit**
  %163 = add i64 %154, -1
  %164 = icmp sgt i64 %163, -1
  br label %load50

load50:                                           ; preds = %body__2.i.i.i.i
  %165 = load %Qubit*, %Qubit** %157, align 8
  %166 = load %Qubit*, %Qubit** %160, align 8
  %167 = load %Qubit*, %Qubit** %162, align 8
  br label %quantum47

quantum47:                                        ; preds = %load50
  tail call void @__quantum__qis__h__body(%Qubit* %167)
  tail call void @__quantum__qis__cnot__body(%Qubit* %167, %Qubit* %166)
  tail call void @__quantum__qis__t__body(%Qubit* %166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %165, %Qubit* %166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %167, %Qubit* %165)
  tail call void @__quantum__qis__t__adj(%Qubit* %167)
  tail call void @__quantum__qis__t__body(%Qubit* %165)
  tail call void @__quantum__qis__t__adj(%Qubit* %166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %165, %Qubit* %166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %167, %Qubit* %165)
  tail call void @__quantum__qis__h__body(%Qubit* %167)
  br label %readout49

readout49:                                        ; preds = %quantum47
  br label %post-classical46

post-classical46:                                 ; preds = %readout49
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical46
  br i1 %164, label %body__2.i.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i: ; preds = %exit_quantum_grouping48, %condContinue__1.i.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %150, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %121, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %121, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %121, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %121, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %66, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %122, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i: ; preds = %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.6.exit.i.i.i, %exit_quantum_grouping38, %exit_quantum_grouping33, %exit_quantum_grouping28
  tail call void @__quantum__rt__array_update_alias_count(%Array* %66, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %66, i32 -1)
  br label %load55

load55:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.5.exit.i.i
  br label %quantum52

quantum52:                                        ; preds = %load55
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %readout54

readout54:                                        ; preds = %quantum52
  br label %post-classical51

post-classical51:                                 ; preds = %readout54
  br label %exit_quantum_grouping53

exit_quantum_grouping53:                          ; preds = %post-classical51
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %168 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %168)
  %169 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %170 = bitcast %Tuple* %169 to { %Array*, %Qubit* }*
  %171 = bitcast %Tuple* %169 to %Array**
  %172 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %170, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %qubits.i, i32 1)
  store %Array* %qubits.i, %Array** %171, align 8
  store %Qubit* null, %Qubit** %172, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %168, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %168, i32 1)
  %controls.i.i.i = load %Array*, %Array** %171, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %arg.i.i.i = load %Qubit*, %Qubit** %172, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i5.i, label %exit__1.i.i.i

body__1.i.i5.i:                                   ; preds = %exit_quantum_grouping58, %else__1.i.i
  %173 = phi i64 [ %182, %exit_quantum_grouping58 ], [ 0, %else__1.i.i ]
  %174 = shl nuw i64 %173, 1
  %175 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %174)
  %176 = bitcast i8* %175 to %Qubit**
  %177 = or i64 %174, 1
  %178 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %177)
  %179 = bitcast i8* %178 to %Qubit**
  %180 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %173)
  %181 = bitcast i8* %180 to %Qubit**
  %182 = add nuw nsw i64 %173, 1
  %183 = icmp slt i64 %182, %numControlPairs.i.i.i
  br label %load60

load60:                                           ; preds = %body__1.i.i5.i
  %184 = load %Qubit*, %Qubit** %176, align 8
  %185 = load %Qubit*, %Qubit** %179, align 8
  %186 = load %Qubit*, %Qubit** %181, align 8
  br label %quantum57

quantum57:                                        ; preds = %load60
  tail call void @__quantum__qis__h__body(%Qubit* %186)
  tail call void @__quantum__qis__cnot__body(%Qubit* %186, %Qubit* %184)
  tail call void @__quantum__qis__cnot__body(%Qubit* %184, %Qubit* %185)
  tail call void @__quantum__qis__t__body(%Qubit* %185)
  tail call void @__quantum__qis__t__adj(%Qubit* %184)
  tail call void @__quantum__qis__t__body(%Qubit* %186)
  tail call void @__quantum__qis__cnot__body(%Qubit* %186, %Qubit* %184)
  tail call void @__quantum__qis__cnot__body(%Qubit* %184, %Qubit* %185)
  tail call void @__quantum__qis__t__adj(%Qubit* %185)
  tail call void @__quantum__qis__cnot__body(%Qubit* %186, %Qubit* %185)
  tail call void @__quantum__qis__h__body(%Qubit* %186)
  br label %readout59

readout59:                                        ; preds = %quantum57
  br label %post-classical56

post-classical56:                                 ; preds = %readout59
  br label %exit_quantum_grouping58

exit_quantum_grouping58:                          ; preds = %post-classical56
  br i1 %183, label %body__1.i.i5.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping58, %else__1.i.i
  %187 = and i64 %numControls.i.i.i, 1
  %188 = icmp eq i64 %187, 0
  br i1 %188, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %189 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %190 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %189, i64 0)
  %191 = bitcast i8* %190 to %Qubit**
  %192 = add i64 %numControls.i.i.i, -1
  %193 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %192)
  %194 = bitcast i8* %193 to %Qubit**
  %195 = load %Qubit*, %Qubit** %194, align 8
  store %Qubit* %195, %Qubit** %191, align 8
  %196 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %189)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %196, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %189, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %196, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %196, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %197 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %198 = bitcast %Tuple* %197 to { %Array*, %Qubit* }*
  %199 = bitcast %Tuple* %197 to %Array**
  %200 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %198, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %199, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %200, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %168, %Tuple* %197, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping63, %body__2.preheader.i.i.i
  %201 = phi i64 [ %210, %exit_quantum_grouping63 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %202 = shl nuw i64 %201, 1
  %203 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %202)
  %204 = bitcast i8* %203 to %Qubit**
  %205 = or i64 %202, 1
  %206 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %205)
  %207 = bitcast i8* %206 to %Qubit**
  %208 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %201)
  %209 = bitcast i8* %208 to %Qubit**
  %210 = add i64 %201, -1
  %211 = icmp sgt i64 %210, -1
  br label %load65

load65:                                           ; preds = %body__2.i.i.i
  %212 = load %Qubit*, %Qubit** %204, align 8
  %213 = load %Qubit*, %Qubit** %207, align 8
  %214 = load %Qubit*, %Qubit** %209, align 8
  br label %quantum62

quantum62:                                        ; preds = %load65
  tail call void @__quantum__qis__h__body(%Qubit* %214)
  tail call void @__quantum__qis__cnot__body(%Qubit* %214, %Qubit* %213)
  tail call void @__quantum__qis__t__body(%Qubit* %213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %212, %Qubit* %213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %214, %Qubit* %212)
  tail call void @__quantum__qis__t__adj(%Qubit* %214)
  tail call void @__quantum__qis__t__body(%Qubit* %212)
  tail call void @__quantum__qis__t__adj(%Qubit* %213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %212, %Qubit* %213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %214, %Qubit* %212)
  tail call void @__quantum__qis__h__body(%Qubit* %214)
  br label %readout64

readout64:                                        ; preds = %quantum62
  br label %post-classical61

post-classical61:                                 ; preds = %readout64
  br label %exit_quantum_grouping63

exit_quantum_grouping63:                          ; preds = %post-classical61
  br i1 %211, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i: ; preds = %exit_quantum_grouping63, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %197, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %168, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %168, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %168, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %168, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %169, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i

Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i:   ; preds = %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.4.exit.i.i, %exit_quantum_grouping53, %exit_quantum_grouping18, %exit_quantum_grouping13
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %215 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %216 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %217 = add i64 %216, -1
  %218 = insertvalue %Range { i64 0, i64 2, i64 -1 }, i64 %217, 2
  %219 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %218, i1 true)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %215, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %215, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %219, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %219, i32 1)
  %220 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %219)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %219, i32 -1)
  %__qsVar0__idxQubit__1.i.i.i = add i64 %220, -1
  %221 = icmp sgt i64 %__qsVar0__idxQubit__1.i.i.i, -1
  br i1 %221, label %body__1.i1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i

body__1.i1.i.i:                                   ; preds = %body__1.i1.i.i, %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i
  %__qsVar0__idxQubit__2.i.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i.i, %body__1.i1.i.i ], [ %__qsVar0__idxQubit__1.i.i.i, %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i ]
  %222 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %215, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %222, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %222)
  %223 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %219, i64 %__qsVar0__idxQubit__2.i.i.i)
  %224 = bitcast i8* %223 to %Qubit**
  %225 = load %Qubit*, %Qubit** %224, align 8
  %226 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %227 = bitcast %Tuple* %226 to %Qubit**
  store %Qubit* %225, %Qubit** %227, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %222, %Tuple* %226, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %222, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %222, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %226, i32 -1)
  %__qsVar0__idxQubit__.i.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i.i, -1
  %228 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i.i, 0
  br i1 %228, label %body__1.i1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i

Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i: ; preds = %body__1.i1.i.i, %Microsoft__Quantum__Intrinsic__X__ctl.3.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %215, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %215, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %219, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %39, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %39, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %43, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %215, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %215, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %219, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %229 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %229, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %229, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %230 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %231 = add i64 %230, -1
  %232 = icmp sgt i64 %231, -1
  br label %load70

load70:                                           ; preds = %Microsoft__Quantum__Samples__SimpleGrover__ReflectAboutMarked__body.exit.i
  br label %quantum67

quantum67:                                        ; preds = %load70
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__x__body(%Qubit* null)
  br label %readout69

readout69:                                        ; preds = %quantum67
  br label %post-classical66

post-classical66:                                 ; preds = %readout69
  br label %exit_quantum_grouping68

exit_quantum_grouping68:                          ; preds = %post-classical66
  br i1 %232, label %body__1.i6.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i

body__1.i6.i:                                     ; preds = %body__1.i6.i, %exit_quantum_grouping68
  %__qsVar0__idxQubit__2.i.i = phi i64 [ %__qsVar0__idxQubit__.i.i, %body__1.i6.i ], [ %231, %exit_quantum_grouping68 ]
  %233 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %229, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %233, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %233)
  %234 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %__qsVar0__idxQubit__2.i.i)
  %235 = bitcast i8* %234 to %Qubit**
  %236 = load %Qubit*, %Qubit** %235, align 8
  %237 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %238 = bitcast %Tuple* %237 to %Qubit**
  store %Qubit* %236, %Qubit** %238, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %233, %Tuple* %237, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %233, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %233, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %237, i32 -1)
  %__qsVar0__idxQubit__.i.i = add nsw i64 %__qsVar0__idxQubit__2.i.i, -1
  %239 = icmp sgt i64 %__qsVar0__idxQubit__2.i.i, 0
  br i1 %239, label %body__1.i6.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i

Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i: ; preds = %body__1.i6.i, %exit_quantum_grouping68
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %229, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %229, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %229, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %229, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %240 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %240, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %240, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %241 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %242 = add i64 %241, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %.not1.i8.i = icmp slt i64 %242, 0
  br i1 %.not1.i8.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.8.exit.i, label %body__1.i11.i

body__1.i11.i:                                    ; preds = %body__1.i11.i, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i
  %idxQubit2.i9.i = phi i64 [ %248, %body__1.i11.i ], [ 0, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i ]
  %243 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i9.i)
  %244 = bitcast i8* %243 to %Qubit**
  %245 = load %Qubit*, %Qubit** %244, align 8
  %246 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %247 = bitcast %Tuple* %246 to %Qubit**
  store %Qubit* %245, %Qubit** %247, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %240, %Tuple* %246, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %246, i32 -1)
  %248 = add i64 %idxQubit2.i9.i, 1
  %.not.i10.i = icmp sgt i64 %248, %242
  br i1 %.not.i10.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.8.exit.i, label %body__1.i11.i

Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.8.exit.i: ; preds = %body__1.i11.i, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.7.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %240, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %240, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %240, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %240, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %249 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %250 = add i64 %249, -2
  %251 = insertvalue %Range { i64 0, i64 1, i64 -1 }, i64 %250, 2
  %252 = tail call %Array* @__quantum__rt__array_slice_1d(%Array* %qubits.i, %Range %251, i1 true)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %252, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %252, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %253 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %254 = icmp sgt i64 %253, 0
  tail call void @llvm.assume(i1 %254)
  %255 = add nsw i64 %253, -1
  %256 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %255)
  %257 = bitcast i8* %256 to %Qubit**
  %258 = load %Qubit*, %Qubit** %257, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %252, i32 1)
  %259 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %252)
  %260 = icmp eq i64 %259, 0
  br i1 %260, label %then0__1.i13.i, label %test1__1.i14.i

then0__1.i13.i:                                   ; preds = %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.8.exit.i
  br label %load75

load75:                                           ; preds = %then0__1.i13.i
  br label %quantum72

quantum72:                                        ; preds = %load75
  tail call void @__quantum__qis__z__body(%Qubit* %258)
  br label %readout74

readout74:                                        ; preds = %quantum72
  br label %post-classical71

post-classical71:                                 ; preds = %readout74
  br label %exit_quantum_grouping73

exit_quantum_grouping73:                          ; preds = %post-classical71
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

test1__1.i14.i:                                   ; preds = %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.8.exit.i
  %261 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %252)
  %262 = icmp eq i64 %261, 1
  br i1 %262, label %then1__1.i16.i, label %test2__1.i17.i

then1__1.i16.i:                                   ; preds = %test1__1.i14.i
  %263 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %264 = bitcast i8* %263 to %Qubit**
  br label %load80

load80:                                           ; preds = %then1__1.i16.i
  %265 = load %Qubit*, %Qubit** %264, align 8
  br label %quantum77

quantum77:                                        ; preds = %load80
  tail call void @__quantum__qis__cz__body(%Qubit* %265, %Qubit* %258)
  br label %readout79

readout79:                                        ; preds = %quantum77
  br label %post-classical76

post-classical76:                                 ; preds = %readout79
  br label %exit_quantum_grouping78

exit_quantum_grouping78:                          ; preds = %post-classical76
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

test2__1.i17.i:                                   ; preds = %test1__1.i14.i
  %266 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %252)
  %267 = icmp eq i64 %266, 2
  br i1 %267, label %then2__1.i18.i, label %else__1.i25.i

then2__1.i18.i:                                   ; preds = %test2__1.i17.i
  %268 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %269 = bitcast i8* %268 to %Qubit**
  %270 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 1)
  %271 = bitcast i8* %270 to %Qubit**
  %272 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %273 = bitcast i8* %272 to %Qubit**
  %274 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %275 = bitcast i8* %274 to %Qubit**
  %276 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 1)
  %277 = bitcast i8* %276 to %Qubit**
  %278 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 1)
  %279 = bitcast i8* %278 to %Qubit**
  %280 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %281 = bitcast i8* %280 to %Qubit**
  %282 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %283 = bitcast i8* %282 to %Qubit**
  %284 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 1)
  %285 = bitcast i8* %284 to %Qubit**
  %286 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %287 = bitcast i8* %286 to %Qubit**
  %288 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %289 = bitcast i8* %288 to %Qubit**
  %290 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 1)
  %291 = bitcast i8* %290 to %Qubit**
  %292 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %252, i64 0)
  %293 = bitcast i8* %292 to %Qubit**
  br label %load85

load85:                                           ; preds = %then2__1.i18.i
  %294 = load %Qubit*, %Qubit** %269, align 8
  %295 = load %Qubit*, %Qubit** %271, align 8
  %296 = load %Qubit*, %Qubit** %273, align 8
  %297 = load %Qubit*, %Qubit** %275, align 8
  %298 = load %Qubit*, %Qubit** %277, align 8
  %299 = load %Qubit*, %Qubit** %279, align 8
  %300 = load %Qubit*, %Qubit** %281, align 8
  %301 = load %Qubit*, %Qubit** %283, align 8
  %302 = load %Qubit*, %Qubit** %285, align 8
  %303 = load %Qubit*, %Qubit** %287, align 8
  %304 = load %Qubit*, %Qubit** %289, align 8
  %305 = load %Qubit*, %Qubit** %291, align 8
  %306 = load %Qubit*, %Qubit** %293, align 8
  br label %quantum82

quantum82:                                        ; preds = %load85
  tail call void @__quantum__qis__t__adj(%Qubit* %294)
  tail call void @__quantum__qis__t__adj(%Qubit* %295)
  tail call void @__quantum__qis__cnot__body(%Qubit* %258, %Qubit* %296)
  tail call void @__quantum__qis__t__body(%Qubit* %297)
  tail call void @__quantum__qis__cnot__body(%Qubit* %298, %Qubit* %258)
  tail call void @__quantum__qis__cnot__body(%Qubit* %299, %Qubit* %300)
  tail call void @__quantum__qis__t__body(%Qubit* %258)
  tail call void @__quantum__qis__t__adj(%Qubit* %301)
  tail call void @__quantum__qis__cnot__body(%Qubit* %302, %Qubit* %258)
  tail call void @__quantum__qis__cnot__body(%Qubit* %258, %Qubit* %303)
  tail call void @__quantum__qis__t__adj(%Qubit* %258)
  tail call void @__quantum__qis__t__body(%Qubit* %304)
  tail call void @__quantum__qis__cnot__body(%Qubit* %305, %Qubit* %306)
  br label %readout84

readout84:                                        ; preds = %quantum82
  br label %post-classical81

post-classical81:                                 ; preds = %readout84
  br label %exit_quantum_grouping83

exit_quantum_grouping83:                          ; preds = %post-classical81
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

else__1.i25.i:                                    ; preds = %test2__1.i17.i
  %307 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %307)
  %308 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %309 = bitcast %Tuple* %308 to { %Array*, %Qubit* }*
  %310 = bitcast %Tuple* %308 to %Array**
  %311 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %309, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %252, i32 1)
  store %Array* %252, %Array** %310, align 8
  store %Qubit* %258, %Qubit** %311, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %307, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %307, i32 1)
  %controls.i.i19.i = load %Array*, %Array** %310, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i19.i, i32 1)
  %arg.i.i20.i = load %Qubit*, %Qubit** %311, align 8
  %numControls.i.i21.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i19.i)
  %numControlPairs.i.i22.i = sdiv i64 %numControls.i.i21.i, 2
  %temps.i.i23.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i22.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i23.i, i32 1)
  %.not.not1.i.i24.i = icmp sgt i64 %numControls.i.i21.i, 1
  br i1 %.not.not1.i.i24.i, label %body__1.i.i28.i, label %exit__1.i.i29.i

body__1.i.i28.i:                                  ; preds = %exit_quantum_grouping88, %else__1.i25.i
  %312 = phi i64 [ %321, %exit_quantum_grouping88 ], [ 0, %else__1.i25.i ]
  %313 = shl nuw i64 %312, 1
  %314 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %313)
  %315 = bitcast i8* %314 to %Qubit**
  %316 = or i64 %313, 1
  %317 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %316)
  %318 = bitcast i8* %317 to %Qubit**
  %319 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i23.i, i64 %312)
  %320 = bitcast i8* %319 to %Qubit**
  %321 = add nuw nsw i64 %312, 1
  %322 = icmp slt i64 %321, %numControlPairs.i.i22.i
  br label %load90

load90:                                           ; preds = %body__1.i.i28.i
  %323 = load %Qubit*, %Qubit** %315, align 8
  %324 = load %Qubit*, %Qubit** %318, align 8
  %325 = load %Qubit*, %Qubit** %320, align 8
  br label %quantum87

quantum87:                                        ; preds = %load90
  tail call void @__quantum__qis__h__body(%Qubit* %325)
  tail call void @__quantum__qis__cnot__body(%Qubit* %325, %Qubit* %323)
  tail call void @__quantum__qis__cnot__body(%Qubit* %323, %Qubit* %324)
  tail call void @__quantum__qis__t__body(%Qubit* %324)
  tail call void @__quantum__qis__t__adj(%Qubit* %323)
  tail call void @__quantum__qis__t__body(%Qubit* %325)
  tail call void @__quantum__qis__cnot__body(%Qubit* %325, %Qubit* %323)
  tail call void @__quantum__qis__cnot__body(%Qubit* %323, %Qubit* %324)
  tail call void @__quantum__qis__t__adj(%Qubit* %324)
  tail call void @__quantum__qis__cnot__body(%Qubit* %325, %Qubit* %324)
  tail call void @__quantum__qis__h__body(%Qubit* %325)
  br label %readout89

readout89:                                        ; preds = %quantum87
  br label %post-classical86

post-classical86:                                 ; preds = %readout89
  br label %exit_quantum_grouping88

exit_quantum_grouping88:                          ; preds = %post-classical86
  br i1 %322, label %body__1.i.i28.i, label %exit__1.i.i29.i

exit__1.i.i29.i:                                  ; preds = %exit_quantum_grouping88, %else__1.i25.i
  %326 = and i64 %numControls.i.i21.i, 1
  %327 = icmp eq i64 %326, 0
  br i1 %327, label %condTrue__1.i.i30.i, label %condFalse__1.i.i31.i

condTrue__1.i.i30.i:                              ; preds = %exit__1.i.i29.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i23.i, i32 1)
  br label %condContinue__1.i.i33.i

condFalse__1.i.i31.i:                             ; preds = %exit__1.i.i29.i
  %328 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %329 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %328, i64 0)
  %330 = bitcast i8* %329 to %Qubit**
  %331 = add i64 %numControls.i.i21.i, -1
  %332 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %331)
  %333 = bitcast i8* %332 to %Qubit**
  %334 = load %Qubit*, %Qubit** %333, align 8
  store %Qubit* %334, %Qubit** %330, align 8
  %335 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i23.i, %Array* %328)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %335, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %328, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %335, i32 -1)
  br label %condContinue__1.i.i33.i

condContinue__1.i.i33.i:                          ; preds = %condFalse__1.i.i31.i, %condTrue__1.i.i30.i
  %__qsVar1__newControls__.i.i32.i = phi %Array* [ %temps.i.i23.i, %condTrue__1.i.i30.i ], [ %335, %condFalse__1.i.i31.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i32.i, i32 1)
  %336 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %337 = bitcast %Tuple* %336 to { %Array*, %Qubit* }*
  %338 = bitcast %Tuple* %336 to %Array**
  %339 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %337, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i32.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i32.i, %Array** %338, align 8
  store %Qubit* %arg.i.i20.i, %Qubit** %339, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %307, %Tuple* %336, %Tuple* null)
  br i1 %.not.not1.i.i24.i, label %body__2.preheader.i.i35.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i

body__2.preheader.i.i35.i:                        ; preds = %condContinue__1.i.i33.i
  %__qsVar0____qsVar0__numPair____3.i.i34.i = add nsw i64 %numControlPairs.i.i22.i, -1
  br label %body__2.i.i38.i

body__2.i.i38.i:                                  ; preds = %exit_quantum_grouping93, %body__2.preheader.i.i35.i
  %340 = phi i64 [ %349, %exit_quantum_grouping93 ], [ %__qsVar0____qsVar0__numPair____3.i.i34.i, %body__2.preheader.i.i35.i ]
  %341 = shl nuw i64 %340, 1
  %342 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %341)
  %343 = bitcast i8* %342 to %Qubit**
  %344 = or i64 %341, 1
  %345 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i19.i, i64 %344)
  %346 = bitcast i8* %345 to %Qubit**
  %347 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i23.i, i64 %340)
  %348 = bitcast i8* %347 to %Qubit**
  %349 = add i64 %340, -1
  %350 = icmp sgt i64 %349, -1
  br label %load95

load95:                                           ; preds = %body__2.i.i38.i
  %351 = load %Qubit*, %Qubit** %343, align 8
  %352 = load %Qubit*, %Qubit** %346, align 8
  %353 = load %Qubit*, %Qubit** %348, align 8
  br label %quantum92

quantum92:                                        ; preds = %load95
  tail call void @__quantum__qis__h__body(%Qubit* %353)
  tail call void @__quantum__qis__cnot__body(%Qubit* %353, %Qubit* %352)
  tail call void @__quantum__qis__t__body(%Qubit* %352)
  tail call void @__quantum__qis__cnot__body(%Qubit* %351, %Qubit* %352)
  tail call void @__quantum__qis__cnot__body(%Qubit* %353, %Qubit* %351)
  tail call void @__quantum__qis__t__adj(%Qubit* %353)
  tail call void @__quantum__qis__t__body(%Qubit* %351)
  tail call void @__quantum__qis__t__adj(%Qubit* %352)
  tail call void @__quantum__qis__cnot__body(%Qubit* %351, %Qubit* %352)
  tail call void @__quantum__qis__cnot__body(%Qubit* %353, %Qubit* %351)
  tail call void @__quantum__qis__h__body(%Qubit* %353)
  br label %readout94

readout94:                                        ; preds = %quantum92
  br label %post-classical91

post-classical91:                                 ; preds = %readout94
  br label %exit_quantum_grouping93

exit_quantum_grouping93:                          ; preds = %post-classical91
  br i1 %350, label %body__2.i.i38.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i: ; preds = %exit_quantum_grouping93, %condContinue__1.i.i33.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i23.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i32.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i32.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i32.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %336, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i23.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %307, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %307, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i19.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %307, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %307, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %252, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %308, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i:   ; preds = %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.10.exit.i.i, %exit_quantum_grouping83, %exit_quantum_grouping78, %exit_quantum_grouping73
  tail call void @__quantum__rt__array_update_alias_count(%Array* %252, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %252, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %354 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %354, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %354, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %355 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %__qsVar0__idxQubit__1.i39.i = add i64 %355, -1
  %356 = icmp sgt i64 %__qsVar0__idxQubit__1.i39.i, -1
  br i1 %356, label %body__1.i42.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i

body__1.i42.i:                                    ; preds = %body__1.i42.i, %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i
  %__qsVar0__idxQubit__2.i40.i = phi i64 [ %__qsVar0__idxQubit__.i41.i, %body__1.i42.i ], [ %__qsVar0__idxQubit__1.i39.i, %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i ]
  %357 = tail call %Callable* @__quantum__rt__callable_copy(%Callable* %354, i1 false)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %357, i32 1)
  tail call void @__quantum__rt__callable_make_adjoint(%Callable* %357)
  %358 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %__qsVar0__idxQubit__2.i40.i)
  %359 = bitcast i8* %358 to %Qubit**
  %360 = load %Qubit*, %Qubit** %359, align 8
  %361 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %362 = bitcast %Tuple* %361 to %Qubit**
  store %Qubit* %360, %Qubit** %362, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %357, %Tuple* %361, %Tuple* null)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %357, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %357, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %361, i32 -1)
  %__qsVar0__idxQubit__.i41.i = add nsw i64 %__qsVar0__idxQubit__2.i40.i, -1
  %363 = icmp sgt i64 %__qsVar0__idxQubit__2.i40.i, 0
  br i1 %363, label %body__1.i42.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i

Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i: ; preds = %body__1.i42.i, %Microsoft__Quantum__Intrinsic__Z__ctl.9.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %354, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %354, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %354, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %354, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %364 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %364, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %364, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %365 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %366 = add i64 %365, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %.not1.i44.i = icmp slt i64 %366, 0
  br i1 %.not1.i44.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i, label %body__1.i47.i

body__1.i47.i:                                    ; preds = %body__1.i47.i, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i
  %idxQubit2.i45.i = phi i64 [ %372, %body__1.i47.i ], [ 0, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i ]
  %367 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxQubit2.i45.i)
  %368 = bitcast i8* %367 to %Qubit**
  %369 = load %Qubit*, %Qubit** %368, align 8
  %370 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %371 = bitcast %Tuple* %370 to %Qubit**
  store %Qubit* %369, %Qubit** %371, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %364, %Tuple* %370, %Tuple* null)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %370, i32 -1)
  %372 = add i64 %idxQubit2.i45.i, 1
  %.not.i46.i = icmp sgt i64 %372, %366
  br i1 %.not.i46.i, label %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i, label %body__1.i47.i

Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i: ; preds = %body__1.i47.i, %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__adj.11.exit.i
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %364, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %364, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %364, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %364, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %373 = add i64 %38, 1
  %.not.i = icmp sgt i64 %373, %36
  br i1 %.not.i, label %exit__1.i, label %body__1.i

exit__1.i:                                        ; preds = %Microsoft__Quantum__Canon___223aaae9de984c89bf07d203892167cf_ApplyToEachCA__body.12.exit.i, %exit_quantum_grouping
  %374 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Measurement__MResetZ__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %374, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %374, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %375 = tail call %Result* @__quantum__rt__result_get_zero()
  %376 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %377 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 %376)
  %378 = add i64 %376, -1
  %.not2.i.i = icmp slt i64 %378, 0
  br i1 %.not2.i.i, label %exit__1.i.i, label %body__1.i.i

body__1.i.i:                                      ; preds = %body__1.i.i, %exit__1.i
  %379 = phi i64 [ %382, %body__1.i.i ], [ 0, %exit__1.i ]
  %380 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %377, i64 %379)
  %381 = bitcast i8* %380 to %Result**
  store %Result* %375, %Result** %381, align 8
  %382 = add i64 %379, 1
  %.not.i.i = icmp sgt i64 %382, %378
  br i1 %.not.i.i, label %exit__1.i.i, label %body__1.i.i

exit__1.i.i:                                      ; preds = %body__1.i.i, %exit__1.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %377, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 1)
  %383 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %qubits.i)
  %384 = add i64 %383, -1
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  %.not13.i.i = icmp slt i64 %384, 0
  br i1 %.not13.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.i.i, %exit__1.i.i
  %385 = phi %Array* [ %386, %body__2.i.i ], [ %377, %exit__1.i.i ]
  %idxElement4.i.i = phi i64 [ %397, %body__2.i.i ], [ 0, %exit__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %385, i32 -1)
  %386 = tail call %Array* @__quantum__rt__array_copy(%Array* %385, i1 false)
  %387 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits.i, i64 %idxElement4.i.i)
  %388 = bitcast i8* %387 to %Qubit**
  %389 = load %Qubit*, %Qubit** %388, align 8
  %390 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  %391 = bitcast %Tuple* %390 to %Qubit**
  store %Qubit* %389, %Qubit** %391, align 8
  %392 = tail call %Tuple* @__quantum__rt__tuple_create(i64 8)
  tail call void @__quantum__rt__callable_invoke(%Callable* %374, %Tuple* %390, %Tuple* %392)
  %393 = bitcast %Tuple* %392 to %Result**
  %394 = load %Result*, %Result** %393, align 8
  %395 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %386, i64 %idxElement4.i.i)
  %396 = bitcast i8* %395 to %Result**
  store %Result* %394, %Result** %396, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %386, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %385, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %390, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %392, i32 -1)
  %397 = add i64 %idxElement4.i.i, 1
  %.not1.i.i = icmp sgt i64 %397, %384
  br i1 %.not1.i.i, label %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, label %body__2.i.i

Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit: ; preds = %exit__1.i.i, %body__2.i.i
  %.lcssa.i.i = phi %Array* [ %377, %exit__1.i.i ], [ %386, %body__2.i.i ]
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %374, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %374, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %.lcssa.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %qubits.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %374, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %374, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %qubits.i)
  %398 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %.lcssa.i.i)
  %399 = tail call i8* @__quantum__rt__memory_allocate(i64 %398)
  %400 = ptrtoint i8* %399 to i64
  %401 = add i64 %398, -1
  %.not4 = icmp slt i64 %401, 0
  br i1 %.not4, label %exit__1, label %body__1

body__1:                                          ; preds = %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit, %exit_quantum_grouping98
  %402 = phi i64 [ %407, %exit_quantum_grouping98 ], [ 0, %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit ]
  %403 = add i64 %402, %400
  %404 = inttoptr i64 %403 to i8*
  %405 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %402)
  %406 = bitcast i8* %405 to %Result**
  %407 = add i64 %402, 1
  %408 = icmp sgt i64 %407, %401
  br label %load100

load100:                                          ; preds = %body__1
  %409 = load %Result*, %Result** %406, align 8
  br label %quantum97

quantum97:                                        ; preds = %load100
  br label %readout99

readout99:                                        ; preds = %quantum97
  %410 = tail call i1 @__quantum__qis__read_result__body(%Result* %409)
  br label %post-classical96

post-classical96:                                 ; preds = %readout99
  %411 = sext i1 %410 to i8
  store i8 %411, i8* %404, align 1
  br label %exit_quantum_grouping98

exit_quantum_grouping98:                          ; preds = %post-classical96
  br i1 %408, label %exit__1, label %body__1

exit__1:                                          ; preds = %exit_quantum_grouping98, %Microsoft__Quantum__Samples__SimpleGrover__SearchForMarkedInput__body.1.exit
  %412 = tail call i8* @__quantum__rt__memory_allocate(i64 16)
  %413 = bitcast i8* %412 to i64*
  store i64 %398, i64* %413, align 4
  %414 = getelementptr i8, i8* %412, i64 8
  %415 = bitcast i8* %414 to i8**
  store i8* %399, i8** %415, align 8
  br i1 %.not4, label %exit__2, label %body__2

body__2:                                          ; preds = %exit__1, %body__2
  %416 = phi i64 [ %418, %body__2 ], [ 0, %exit__1 ]
  %417 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %.lcssa.i.i, i64 %416)
  %418 = add i64 %416, 1
  %.not3 = icmp sgt i64 %418, %401
  br i1 %.not3, label %exit__2, label %body__2

exit__2:                                          ; preds = %body__2, %exit__1
  %419 = bitcast i8* %412 to { i64, i8* }*
  tail call void @__quantum__rt__array_update_reference_count(%Array* %.lcssa.i.i, i32 -1)
  ret { i64, i8* }* %419
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*) local_unnamed_addr

declare i8* @__quantum__rt__memory_allocate(i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare %Result* @__quantum__rt__result_get_zero() local_unnamed_addr

declare void @__quantum__rt__array_update_reference_count(%Array*, i32) local_unnamed_addr

declare %Array* @__quantum__rt__qubit_allocate_array(i64) local_unnamed_addr

declare void @__quantum__rt__array_update_alias_count(%Array*, i32) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__qubit_release_array(%Array*) local_unnamed_addr

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32) local_unnamed_addr

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32) local_unnamed_addr

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare %Array* @__quantum__rt__array_copy(%Array*, i1) local_unnamed_addr

declare %Tuple* @__quantum__rt__tuple_create(i64) local_unnamed_addr

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*) local_unnamed_addr

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32) local_unnamed_addr

define internal void @Microsoft__Quantum__Measurement__MResetZ__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = bitcast %Tuple* %result-tuple to %Result**
  br label %load

load:                                             ; preds = %entry
  %2 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  %3 = tail call %Result* @__quantum__qis__m__body(%Qubit* %2)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  store %Result* %3, %Result** %1, align 8
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare %Callable* @__quantum__rt__callable_copy(%Callable*, i1) local_unnamed_addr

declare void @__quantum__rt__callable_make_adjoint(%Callable*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__X__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %22 = bitcast i8* %21 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 1)
  %23 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %24 = icmp eq i64 %23, 0
  br label %load10

load10:                                           ; preds = %then2__1.i
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %24, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping8
  br label %load15

load15:                                           ; preds = %then0__1.i.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping8
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  br label %load20

load20:                                           ; preds = %then1__1.i.i
  %31 = load %Qubit*, %Qubit** %30, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %32 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %33 = icmp eq i64 %32, 2
  br i1 %33, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %59 = bitcast i8* %58 to %Qubit**
  br label %load25

load25:                                           ; preds = %then2__1.i.i
  %60 = load %Qubit*, %Qubit** %35, align 8
  %61 = load %Qubit*, %Qubit** %37, align 8
  %62 = load %Qubit*, %Qubit** %39, align 8
  %63 = load %Qubit*, %Qubit** %41, align 8
  %64 = load %Qubit*, %Qubit** %43, align 8
  %65 = load %Qubit*, %Qubit** %45, align 8
  %66 = load %Qubit*, %Qubit** %47, align 8
  %67 = load %Qubit*, %Qubit** %49, align 8
  %68 = load %Qubit*, %Qubit** %51, align 8
  %69 = load %Qubit*, %Qubit** %53, align 8
  %70 = load %Qubit*, %Qubit** %55, align 8
  %71 = load %Qubit*, %Qubit** %57, align 8
  %72 = load %Qubit*, %Qubit** %59, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %62)
  tail call void @__quantum__qis__t__body(%Qubit* %63)
  tail call void @__quantum__qis__cnot__body(%Qubit* %64, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %67)
  tail call void @__quantum__qis__cnot__body(%Qubit* %68, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %73 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %73)
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Array**
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 1)
  store %Array* %18, %Array** %76, align 8
  store %Qubit* %4, %Qubit** %77, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 1)
  %78 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %78, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %79 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %79, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %80 = phi i64 [ %89, %exit_quantum_grouping28 ], [ 0, %else__1.i.i ]
  %81 = shl nuw i64 %80, 1
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %81)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = or i64 %81, 1
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %84)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %80)
  %88 = bitcast i8* %87 to %Qubit**
  %89 = add nuw nsw i64 %80, 1
  %90 = icmp slt i64 %89, %numControlPairs.i.i.i
  br label %load30

load30:                                           ; preds = %body__1.i.i.i
  %91 = load %Qubit*, %Qubit** %83, align 8
  %92 = load %Qubit*, %Qubit** %86, align 8
  %93 = load %Qubit*, %Qubit** %88, align 8
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__body(%Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %91)
  tail call void @__quantum__qis__t__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %92)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %92)
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %90, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %94 = and i64 %numControls.i.i.i, 1
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %96 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %96, i64 0)
  %98 = bitcast i8* %97 to %Qubit**
  %99 = add i64 %numControls.i.i.i, -1
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %99)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = load %Qubit*, %Qubit** %101, align 8
  store %Qubit* %102, %Qubit** %98, align 8
  %103 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %96)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %96, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %103, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %104 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %105 = bitcast %Tuple* %104 to { %Array*, %Qubit* }*
  %106 = bitcast %Tuple* %104 to %Array**
  %107 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %105, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %106, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %107, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %104, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping33, %body__2.preheader.i.i.i
  %108 = phi i64 [ %117, %exit_quantum_grouping33 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %109 = shl nuw i64 %108, 1
  %110 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %109)
  %111 = bitcast i8* %110 to %Qubit**
  %112 = or i64 %109, 1
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %112)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %108)
  %116 = bitcast i8* %115 to %Qubit**
  %117 = add i64 %108, -1
  %118 = icmp sgt i64 %117, -1
  br label %load35

load35:                                           ; preds = %body__2.i.i.i
  %119 = load %Qubit*, %Qubit** %111, align 8
  %120 = load %Qubit*, %Qubit** %114, align 8
  %121 = load %Qubit*, %Qubit** %116, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %120)
  tail call void @__quantum__qis__t__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %121)
  tail call void @__quantum__qis__t__body(%Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %118, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping33, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %104, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping23, %exit_quantum_grouping18, %exit_quantum_grouping13
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  br label %load40

load40:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %122 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %122)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Array*, %Qubit* }*
  %125 = bitcast %Tuple* %123 to %Array**
  %126 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %125, align 8
  store %Qubit* %4, %Qubit** %126, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 1)
  %127 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %127, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %128 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %128, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %129 = phi i64 [ %138, %exit_quantum_grouping43 ], [ 0, %else__1.i ]
  %130 = shl nuw i64 %129, 1
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %130)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = or i64 %130, 1
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %133)
  %135 = bitcast i8* %134 to %Qubit**
  %136 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %129)
  %137 = bitcast i8* %136 to %Qubit**
  %138 = add nuw nsw i64 %129, 1
  %139 = icmp slt i64 %138, %numControlPairs.i.i
  br label %load45

load45:                                           ; preds = %body__1.i.i
  %140 = load %Qubit*, %Qubit** %132, align 8
  %141 = load %Qubit*, %Qubit** %135, align 8
  %142 = load %Qubit*, %Qubit** %137, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__body(%Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %140)
  tail call void @__quantum__qis__t__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %141)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %141)
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %139, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %143 = and i64 %numControls.i.i, 1
  %144 = icmp eq i64 %143, 0
  br i1 %144, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %145 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %146 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %145, i64 0)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = add i64 %numControls.i.i, -1
  %149 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %148)
  %150 = bitcast i8* %149 to %Qubit**
  %151 = load %Qubit*, %Qubit** %150, align 8
  store %Qubit* %151, %Qubit** %147, align 8
  %152 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %145)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %145, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %152, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %153 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %154 = bitcast %Tuple* %153 to { %Array*, %Qubit* }*
  %155 = bitcast %Tuple* %153 to %Array**
  %156 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %154, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %155, align 8
  store %Qubit* %arg.i.i, %Qubit** %156, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %122, %Tuple* %153, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping48, %body__2.preheader.i.i
  %157 = phi i64 [ %166, %exit_quantum_grouping48 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %158 = shl nuw i64 %157, 1
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %158)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = or i64 %158, 1
  %162 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %161)
  %163 = bitcast i8* %162 to %Qubit**
  %164 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %157)
  %165 = bitcast i8* %164 to %Qubit**
  %166 = add i64 %157, -1
  %167 = icmp sgt i64 %166, -1
  br label %load50

load50:                                           ; preds = %body__2.i.i
  %168 = load %Qubit*, %Qubit** %160, align 8
  %169 = load %Qubit*, %Qubit** %163, align 8
  %170 = load %Qubit*, %Qubit** %165, align 8
  br label %quantum47

quantum47:                                        ; preds = %load50
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %169)
  tail call void @__quantum__qis__t__body(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %170)
  tail call void @__quantum__qis__t__body(%Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  br label %readout49

readout49:                                        ; preds = %quantum47
  br label %post-classical46

post-classical46:                                 ; preds = %readout49
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical46
  br i1 %167, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping48, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %153, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping38, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %22 = bitcast i8* %21 to %Qubit**
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 1)
  %23 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %24 = icmp eq i64 %23, 0
  br label %load10

load10:                                           ; preds = %then2__1.i
  %25 = load %Qubit*, %Qubit** %15, align 8
  %26 = load %Qubit*, %Qubit** %17, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  store %Qubit* %25, %Qubit** %20, align 8
  store %Qubit* %26, %Qubit** %22, align 8
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %24, label %then0__1.i.i, label %test1__1.i.i

then0__1.i.i:                                     ; preds = %exit_quantum_grouping8
  br label %load15

load15:                                           ; preds = %then0__1.i.i
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test1__1.i.i:                                     ; preds = %exit_quantum_grouping8
  %27 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %28 = icmp eq i64 %27, 1
  br i1 %28, label %then1__1.i.i, label %test2__1.i.i

then1__1.i.i:                                     ; preds = %test1__1.i.i
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  br label %load20

load20:                                           ; preds = %then1__1.i.i
  %31 = load %Qubit*, %Qubit** %30, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__cz__body(%Qubit* %31, %Qubit* %4)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

test2__1.i.i:                                     ; preds = %test1__1.i.i
  %32 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %18)
  %33 = icmp eq i64 %32, 2
  br i1 %33, label %then2__1.i.i, label %else__1.i.i

then2__1.i.i:                                     ; preds = %test2__1.i.i
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 1)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %18, i64 0)
  %59 = bitcast i8* %58 to %Qubit**
  br label %load25

load25:                                           ; preds = %then2__1.i.i
  %60 = load %Qubit*, %Qubit** %35, align 8
  %61 = load %Qubit*, %Qubit** %37, align 8
  %62 = load %Qubit*, %Qubit** %39, align 8
  %63 = load %Qubit*, %Qubit** %41, align 8
  %64 = load %Qubit*, %Qubit** %43, align 8
  %65 = load %Qubit*, %Qubit** %45, align 8
  %66 = load %Qubit*, %Qubit** %47, align 8
  %67 = load %Qubit*, %Qubit** %49, align 8
  %68 = load %Qubit*, %Qubit** %51, align 8
  %69 = load %Qubit*, %Qubit** %53, align 8
  %70 = load %Qubit*, %Qubit** %55, align 8
  %71 = load %Qubit*, %Qubit** %57, align 8
  %72 = load %Qubit*, %Qubit** %59, align 8
  br label %quantum22

quantum22:                                        ; preds = %load25
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__adj(%Qubit* %61)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %62)
  tail call void @__quantum__qis__t__body(%Qubit* %63)
  tail call void @__quantum__qis__cnot__body(%Qubit* %64, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %65, %Qubit* %66)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %67)
  tail call void @__quantum__qis__cnot__body(%Qubit* %68, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %69)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %70)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  br label %readout24

readout24:                                        ; preds = %quantum22
  br label %post-classical21

post-classical21:                                 ; preds = %readout24
  br label %exit_quantum_grouping23

exit_quantum_grouping23:                          ; preds = %post-classical21
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

else__1.i.i:                                      ; preds = %test2__1.i.i
  %73 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %73)
  %74 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = bitcast %Tuple* %74 to %Array**
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 1)
  store %Array* %18, %Array** %76, align 8
  store %Qubit* %4, %Qubit** %77, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 1)
  %78 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 0
  %controls.i.i.i = load %Array*, %Array** %78, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 1)
  %79 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  %arg.i.i.i = load %Qubit*, %Qubit** %79, align 8
  %numControls.i.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i.i)
  %numControlPairs.i.i.i = sdiv i64 %numControls.i.i.i, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 1)
  %.not.not1.i.i.i = icmp sgt i64 %numControls.i.i.i, 1
  br i1 %.not.not1.i.i.i, label %body__1.i.i.i, label %exit__1.i.i.i

body__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %80 = phi i64 [ %89, %exit_quantum_grouping28 ], [ 0, %else__1.i.i ]
  %81 = shl nuw i64 %80, 1
  %82 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %81)
  %83 = bitcast i8* %82 to %Qubit**
  %84 = or i64 %81, 1
  %85 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %84)
  %86 = bitcast i8* %85 to %Qubit**
  %87 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %80)
  %88 = bitcast i8* %87 to %Qubit**
  %89 = add nuw nsw i64 %80, 1
  %90 = icmp slt i64 %89, %numControlPairs.i.i.i
  br label %load30

load30:                                           ; preds = %body__1.i.i.i
  %91 = load %Qubit*, %Qubit** %83, align 8
  %92 = load %Qubit*, %Qubit** %86, align 8
  %93 = load %Qubit*, %Qubit** %88, align 8
  br label %quantum27

quantum27:                                        ; preds = %load30
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__body(%Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %91)
  tail call void @__quantum__qis__t__body(%Qubit* %93)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %91)
  tail call void @__quantum__qis__cnot__body(%Qubit* %91, %Qubit* %92)
  tail call void @__quantum__qis__t__adj(%Qubit* %92)
  tail call void @__quantum__qis__cnot__body(%Qubit* %93, %Qubit* %92)
  tail call void @__quantum__qis__h__body(%Qubit* %93)
  br label %readout29

readout29:                                        ; preds = %quantum27
  br label %post-classical26

post-classical26:                                 ; preds = %readout29
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical26
  br i1 %90, label %body__1.i.i.i, label %exit__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping28, %else__1.i.i
  %94 = and i64 %numControls.i.i.i, 1
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i.i, i32 1)
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %96 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %97 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %96, i64 0)
  %98 = bitcast i8* %97 to %Qubit**
  %99 = add i64 %numControls.i.i.i, -1
  %100 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %99)
  %101 = bitcast i8* %100 to %Qubit**
  %102 = load %Qubit*, %Qubit** %101, align 8
  store %Qubit* %102, %Qubit** %98, align 8
  %103 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i.i, %Array* %96)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %96, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %103, i32 -1)
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %condFalse__1.i.i.i, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %103, %condFalse__1.i.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  %104 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %105 = bitcast %Tuple* %104 to { %Array*, %Qubit* }*
  %106 = bitcast %Tuple* %104 to %Array**
  %107 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %105, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %106, align 8
  store %Qubit* %arg.i.i.i, %Qubit** %107, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %73, %Tuple* %104, %Tuple* null)
  br i1 %.not.not1.i.i.i, label %body__2.preheader.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i

body__2.preheader.i.i.i:                          ; preds = %condContinue__1.i.i.i
  %__qsVar0____qsVar0__numPair____3.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %exit_quantum_grouping33, %body__2.preheader.i.i.i
  %108 = phi i64 [ %117, %exit_quantum_grouping33 ], [ %__qsVar0____qsVar0__numPair____3.i.i.i, %body__2.preheader.i.i.i ]
  %109 = shl nuw i64 %108, 1
  %110 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %109)
  %111 = bitcast i8* %110 to %Qubit**
  %112 = or i64 %109, 1
  %113 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i.i, i64 %112)
  %114 = bitcast i8* %113 to %Qubit**
  %115 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i.i, i64 %108)
  %116 = bitcast i8* %115 to %Qubit**
  %117 = add i64 %108, -1
  %118 = icmp sgt i64 %117, -1
  br label %load35

load35:                                           ; preds = %body__2.i.i.i
  %119 = load %Qubit*, %Qubit** %111, align 8
  %120 = load %Qubit*, %Qubit** %114, align 8
  %121 = load %Qubit*, %Qubit** %116, align 8
  br label %quantum32

quantum32:                                        ; preds = %load35
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %120)
  tail call void @__quantum__qis__t__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %121)
  tail call void @__quantum__qis__t__body(%Qubit* %119)
  tail call void @__quantum__qis__t__adj(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %119, %Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %121, %Qubit* %119)
  tail call void @__quantum__qis__h__body(%Qubit* %121)
  br label %readout34

readout34:                                        ; preds = %quantum32
  br label %post-classical31

post-classical31:                                 ; preds = %readout34
  br label %exit_quantum_grouping33

exit_quantum_grouping33:                          ; preds = %post-classical31
  br i1 %118, label %body__2.i.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %exit_quantum_grouping33, %condContinue__1.i.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %104, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %73, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %74, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.exit.i:     ; preds = %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i.i, %exit_quantum_grouping23, %exit_quantum_grouping18, %exit_quantum_grouping13
  tail call void @__quantum__rt__array_update_alias_count(%Array* %18, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %18, i32 -1)
  br label %load40

load40:                                           ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.exit.i
  br label %quantum37

quantum37:                                        ; preds = %load40
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout39

readout39:                                        ; preds = %quantum37
  br label %post-classical36

post-classical36:                                 ; preds = %readout39
  br label %exit_quantum_grouping38

exit_quantum_grouping38:                          ; preds = %post-classical36
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %122 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__X__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %122)
  %123 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %124 = bitcast %Tuple* %123 to { %Array*, %Qubit* }*
  %125 = bitcast %Tuple* %123 to %Array**
  %126 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %125, align 8
  store %Qubit* %4, %Qubit** %126, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 1)
  %127 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %127, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %128 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %124, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %128, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %129 = phi i64 [ %138, %exit_quantum_grouping43 ], [ 0, %else__1.i ]
  %130 = shl nuw i64 %129, 1
  %131 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %130)
  %132 = bitcast i8* %131 to %Qubit**
  %133 = or i64 %130, 1
  %134 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %133)
  %135 = bitcast i8* %134 to %Qubit**
  %136 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %129)
  %137 = bitcast i8* %136 to %Qubit**
  %138 = add nuw nsw i64 %129, 1
  %139 = icmp slt i64 %138, %numControlPairs.i.i
  br label %load45

load45:                                           ; preds = %body__1.i.i
  %140 = load %Qubit*, %Qubit** %132, align 8
  %141 = load %Qubit*, %Qubit** %135, align 8
  %142 = load %Qubit*, %Qubit** %137, align 8
  br label %quantum42

quantum42:                                        ; preds = %load45
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__body(%Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %140)
  tail call void @__quantum__qis__t__body(%Qubit* %142)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %140)
  tail call void @__quantum__qis__cnot__body(%Qubit* %140, %Qubit* %141)
  tail call void @__quantum__qis__t__adj(%Qubit* %141)
  tail call void @__quantum__qis__cnot__body(%Qubit* %142, %Qubit* %141)
  tail call void @__quantum__qis__h__body(%Qubit* %142)
  br label %readout44

readout44:                                        ; preds = %quantum42
  br label %post-classical41

post-classical41:                                 ; preds = %readout44
  br label %exit_quantum_grouping43

exit_quantum_grouping43:                          ; preds = %post-classical41
  br i1 %139, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping43, %else__1.i
  %143 = and i64 %numControls.i.i, 1
  %144 = icmp eq i64 %143, 0
  br i1 %144, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %145 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %146 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %145, i64 0)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = add i64 %numControls.i.i, -1
  %149 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %148)
  %150 = bitcast i8* %149 to %Qubit**
  %151 = load %Qubit*, %Qubit** %150, align 8
  store %Qubit* %151, %Qubit** %147, align 8
  %152 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %145)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %145, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %152, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %152, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %153 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %154 = bitcast %Tuple* %153 to { %Array*, %Qubit* }*
  %155 = bitcast %Tuple* %153 to %Array**
  %156 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %154, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %155, align 8
  store %Qubit* %arg.i.i, %Qubit** %156, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %122, %Tuple* %153, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping48, %body__2.preheader.i.i
  %157 = phi i64 [ %166, %exit_quantum_grouping48 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %158 = shl nuw i64 %157, 1
  %159 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %158)
  %160 = bitcast i8* %159 to %Qubit**
  %161 = or i64 %158, 1
  %162 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %161)
  %163 = bitcast i8* %162 to %Qubit**
  %164 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %157)
  %165 = bitcast i8* %164 to %Qubit**
  %166 = add i64 %157, -1
  %167 = icmp sgt i64 %166, -1
  br label %load50

load50:                                           ; preds = %body__2.i.i
  %168 = load %Qubit*, %Qubit** %160, align 8
  %169 = load %Qubit*, %Qubit** %163, align 8
  %170 = load %Qubit*, %Qubit** %165, align 8
  br label %quantum47

quantum47:                                        ; preds = %load50
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %169)
  tail call void @__quantum__qis__t__body(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %170)
  tail call void @__quantum__qis__t__body(%Qubit* %168)
  tail call void @__quantum__qis__t__adj(%Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %168, %Qubit* %169)
  tail call void @__quantum__qis__cnot__body(%Qubit* %170, %Qubit* %168)
  tail call void @__quantum__qis__h__body(%Qubit* %170)
  br label %readout49

readout49:                                        ; preds = %quantum47
  br label %post-classical46

post-classical46:                                 ; preds = %readout49
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical46
  br i1 %167, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping48, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %153, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %122, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %123, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__X__ctl.exit

Microsoft__Quantum__Intrinsic__X__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping38, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__Z__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  br label %load10

load10:                                           ; preds = %then2__1.i
  %40 = load %Qubit*, %Qubit** %15, align 8
  %41 = load %Qubit*, %Qubit** %17, align 8
  %42 = load %Qubit*, %Qubit** %19, align 8
  %43 = load %Qubit*, %Qubit** %21, align 8
  %44 = load %Qubit*, %Qubit** %23, align 8
  %45 = load %Qubit*, %Qubit** %25, align 8
  %46 = load %Qubit*, %Qubit** %27, align 8
  %47 = load %Qubit*, %Qubit** %29, align 8
  %48 = load %Qubit*, %Qubit** %31, align 8
  %49 = load %Qubit*, %Qubit** %33, align 8
  %50 = load %Qubit*, %Qubit** %35, align 8
  %51 = load %Qubit*, %Qubit** %37, align 8
  %52 = load %Qubit*, %Qubit** %39, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__t__adj(%Qubit* %40)
  tail call void @__quantum__qis__t__adj(%Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %45, %Qubit* %46)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %47)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %53 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %53)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %55 = bitcast %Tuple* %54 to { %Array*, %Qubit* }*
  %56 = bitcast %Tuple* %54 to %Array**
  %57 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %56, align 8
  store %Qubit* %4, %Qubit** %57, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 1)
  %58 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %58, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %59 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %59, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %60 = phi i64 [ %69, %exit_quantum_grouping13 ], [ 0, %else__1.i ]
  %61 = shl nuw i64 %60, 1
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %61)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = or i64 %61, 1
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %64)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %60)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = add nuw nsw i64 %60, 1
  %70 = icmp slt i64 %69, %numControlPairs.i.i
  br label %load15

load15:                                           ; preds = %body__1.i.i
  %71 = load %Qubit*, %Qubit** %63, align 8
  %72 = load %Qubit*, %Qubit** %66, align 8
  %73 = load %Qubit*, %Qubit** %68, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__body(%Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %71)
  tail call void @__quantum__qis__t__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %72)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %72)
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %70, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %74 = and i64 %numControls.i.i, 1
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %76 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 0)
  %78 = bitcast i8* %77 to %Qubit**
  %79 = add i64 %numControls.i.i, -1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = load %Qubit*, %Qubit** %81, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  %83 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %76)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %76, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %83, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %84 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %85 = bitcast %Tuple* %84 to { %Array*, %Qubit* }*
  %86 = bitcast %Tuple* %84 to %Array**
  %87 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %85, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %86, align 8
  store %Qubit* %arg.i.i, %Qubit** %87, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %84, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping18, %body__2.preheader.i.i
  %88 = phi i64 [ %97, %exit_quantum_grouping18 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %89 = shl nuw i64 %88, 1
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %89)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = or i64 %89, 1
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %92)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %88)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %88, -1
  %98 = icmp sgt i64 %97, -1
  br label %load20

load20:                                           ; preds = %body__2.i.i
  %99 = load %Qubit*, %Qubit** %91, align 8
  %100 = load %Qubit*, %Qubit** %94, align 8
  %101 = load %Qubit*, %Qubit** %96, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %100)
  tail call void @__quantum__qis__t__body(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %101)
  tail call void @__quantum__qis__t__body(%Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %84, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %test2__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__cz__body(%Qubit* %11, %Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

test2__1.i:                                       ; preds = %test1__1.i
  %12 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %13 = icmp eq i64 %12, 2
  br i1 %13, label %then2__1.i, label %else__1.i

then2__1.i:                                       ; preds = %test2__1.i
  %14 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %17 = bitcast i8* %16 to %Qubit**
  %18 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %19 = bitcast i8* %18 to %Qubit**
  %20 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %21 = bitcast i8* %20 to %Qubit**
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 1)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %39 = bitcast i8* %38 to %Qubit**
  br label %load10

load10:                                           ; preds = %then2__1.i
  %40 = load %Qubit*, %Qubit** %15, align 8
  %41 = load %Qubit*, %Qubit** %17, align 8
  %42 = load %Qubit*, %Qubit** %19, align 8
  %43 = load %Qubit*, %Qubit** %21, align 8
  %44 = load %Qubit*, %Qubit** %23, align 8
  %45 = load %Qubit*, %Qubit** %25, align 8
  %46 = load %Qubit*, %Qubit** %27, align 8
  %47 = load %Qubit*, %Qubit** %29, align 8
  %48 = load %Qubit*, %Qubit** %31, align 8
  %49 = load %Qubit*, %Qubit** %33, align 8
  %50 = load %Qubit*, %Qubit** %35, align 8
  %51 = load %Qubit*, %Qubit** %37, align 8
  %52 = load %Qubit*, %Qubit** %39, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__t__adj(%Qubit* %40)
  tail call void @__quantum__qis__t__adj(%Qubit* %41)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %44, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %45, %Qubit* %46)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %47)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %51, %Qubit* %52)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %test2__1.i
  %53 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__Z__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %53)
  %54 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %55 = bitcast %Tuple* %54 to { %Array*, %Qubit* }*
  %56 = bitcast %Tuple* %54 to %Array**
  %57 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %56, align 8
  store %Qubit* %4, %Qubit** %57, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 1)
  %58 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %58, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %59 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %55, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %59, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %60 = phi i64 [ %69, %exit_quantum_grouping13 ], [ 0, %else__1.i ]
  %61 = shl nuw i64 %60, 1
  %62 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %61)
  %63 = bitcast i8* %62 to %Qubit**
  %64 = or i64 %61, 1
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %64)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %60)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = add nuw nsw i64 %60, 1
  %70 = icmp slt i64 %69, %numControlPairs.i.i
  br label %load15

load15:                                           ; preds = %body__1.i.i
  %71 = load %Qubit*, %Qubit** %63, align 8
  %72 = load %Qubit*, %Qubit** %66, align 8
  %73 = load %Qubit*, %Qubit** %68, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__body(%Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %71)
  tail call void @__quantum__qis__t__body(%Qubit* %73)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %71)
  tail call void @__quantum__qis__cnot__body(%Qubit* %71, %Qubit* %72)
  tail call void @__quantum__qis__t__adj(%Qubit* %72)
  tail call void @__quantum__qis__cnot__body(%Qubit* %73, %Qubit* %72)
  tail call void @__quantum__qis__h__body(%Qubit* %73)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %70, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping13, %else__1.i
  %74 = and i64 %numControls.i.i, 1
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %76 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %77 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %76, i64 0)
  %78 = bitcast i8* %77 to %Qubit**
  %79 = add i64 %numControls.i.i, -1
  %80 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %79)
  %81 = bitcast i8* %80 to %Qubit**
  %82 = load %Qubit*, %Qubit** %81, align 8
  store %Qubit* %82, %Qubit** %78, align 8
  %83 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %76)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %76, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %83, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %83, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %84 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %85 = bitcast %Tuple* %84 to { %Array*, %Qubit* }*
  %86 = bitcast %Tuple* %84 to %Array**
  %87 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %85, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %86, align 8
  store %Qubit* %arg.i.i, %Qubit** %87, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %53, %Tuple* %84, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping18, %body__2.preheader.i.i
  %88 = phi i64 [ %97, %exit_quantum_grouping18 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %89 = shl nuw i64 %88, 1
  %90 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %89)
  %91 = bitcast i8* %90 to %Qubit**
  %92 = or i64 %89, 1
  %93 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %92)
  %94 = bitcast i8* %93 to %Qubit**
  %95 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %88)
  %96 = bitcast i8* %95 to %Qubit**
  %97 = add i64 %88, -1
  %98 = icmp sgt i64 %97, -1
  br label %load20

load20:                                           ; preds = %body__2.i.i
  %99 = load %Qubit*, %Qubit** %91, align 8
  %100 = load %Qubit*, %Qubit** %94, align 8
  %101 = load %Qubit*, %Qubit** %96, align 8
  br label %quantum17

quantum17:                                        ; preds = %load20
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %100)
  tail call void @__quantum__qis__t__body(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %101)
  tail call void @__quantum__qis__t__body(%Qubit* %99)
  tail call void @__quantum__qis__t__adj(%Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %100)
  tail call void @__quantum__qis__cnot__body(%Qubit* %101, %Qubit* %99)
  tail call void @__quantum__qis__h__body(%Qubit* %101)
  br label %readout19

readout19:                                        ; preds = %quantum17
  br label %post-classical16

post-classical16:                                 ; preds = %readout19
  br label %exit_quantum_grouping18

exit_quantum_grouping18:                          ; preds = %post-classical16
  br i1 %98, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping18, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %84, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %53, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %exit_quantum_grouping8, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_slice_1d(%Array*, %Range, i1) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__H__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  br label %load

load:                                             ; preds = %entry
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %1)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %12 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %12)
  %13 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %14 = bitcast %Tuple* %13 to { %Array*, %Qubit* }*
  %15 = bitcast %Tuple* %13 to %Array**
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %15, align 8
  store %Qubit* %4, %Qubit** %16, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 1)
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %17, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %18 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %18, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %19 = phi i64 [ %28, %exit_quantum_grouping8 ], [ 0, %else__1.i ]
  %20 = shl nuw i64 %19, 1
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = or i64 %20, 1
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %19)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = add nuw nsw i64 %19, 1
  %29 = icmp slt i64 %28, %numControlPairs.i.i
  br label %load10

load10:                                           ; preds = %body__1.i.i
  %30 = load %Qubit*, %Qubit** %22, align 8
  %31 = load %Qubit*, %Qubit** %25, align 8
  %32 = load %Qubit*, %Qubit** %27, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__body(%Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %30)
  tail call void @__quantum__qis__t__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %31)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %31)
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %29, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %33 = and i64 %numControls.i.i, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = add i64 %numControls.i.i, -1
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %38)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = load %Qubit*, %Qubit** %40, align 8
  store %Qubit* %41, %Qubit** %37, align 8
  %42 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %35)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %42, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %43 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %44 = bitcast %Tuple* %43 to { %Array*, %Qubit* }*
  %45 = bitcast %Tuple* %43 to %Array**
  %46 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %44, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %45, align 8
  store %Qubit* %arg.i.i, %Qubit** %46, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %43, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping13, %body__2.preheader.i.i
  %47 = phi i64 [ %56, %exit_quantum_grouping13 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %48 = shl nuw i64 %47, 1
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %48)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = or i64 %48, 1
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %51)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %47)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = add i64 %47, -1
  %57 = icmp sgt i64 %56, -1
  br label %load15

load15:                                           ; preds = %body__2.i.i
  %58 = load %Qubit*, %Qubit** %50, align 8
  %59 = load %Qubit*, %Qubit** %53, align 8
  %60 = load %Qubit*, %Qubit** %55, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %59)
  tail call void @__quantum__qis__t__body(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %43, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 1)
  %5 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %then0__1.i, label %test1__1.i

then0__1.i:                                       ; preds = %entry
  br label %load

load:                                             ; preds = %then0__1.i
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

test1__1.i:                                       ; preds = %entry
  %7 = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %3)
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %then1__1.i, label %else__1.i

then1__1.i:                                       ; preds = %test1__1.i
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  br label %load5

load5:                                            ; preds = %then1__1.i
  %11 = load %Qubit*, %Qubit** %10, align 8
  br label %quantum2

quantum2:                                         ; preds = %load5
  tail call void @__quantum__qis__s__body(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %11, %Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__h__body(%Qubit* %4)
  tail call void @__quantum__qis__s__adj(%Qubit* %4)
  br label %readout4

readout4:                                         ; preds = %quantum2
  br label %post-classical1

post-classical1:                                  ; preds = %readout4
  br label %exit_quantum_grouping3

exit_quantum_grouping3:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

else__1.i:                                        ; preds = %test1__1.i
  %12 = tail call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* nonnull @Microsoft__Quantum__Intrinsic__H__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %12)
  %13 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %14 = bitcast %Tuple* %13 to { %Array*, %Qubit* }*
  %15 = bitcast %Tuple* %13 to %Array**
  %16 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 1)
  store %Array* %3, %Array** %15, align 8
  store %Qubit* %4, %Qubit** %16, align 8
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 1)
  %17 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 0
  %controls.i.i = load %Array*, %Array** %17, align 8
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 1)
  %18 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %14, i64 0, i32 1
  %arg.i.i = load %Qubit*, %Qubit** %18, align 8
  %numControls.i.i = tail call i64 @__quantum__rt__array_get_size_1d(%Array* %controls.i.i)
  %numControlPairs.i.i = sdiv i64 %numControls.i.i, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 1)
  %.not.not1.i.i = icmp sgt i64 %numControls.i.i, 1
  br i1 %.not.not1.i.i, label %body__1.i.i, label %exit__1.i.i

body__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %19 = phi i64 [ %28, %exit_quantum_grouping8 ], [ 0, %else__1.i ]
  %20 = shl nuw i64 %19, 1
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = or i64 %20, 1
  %24 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %19)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = add nuw nsw i64 %19, 1
  %29 = icmp slt i64 %28, %numControlPairs.i.i
  br label %load10

load10:                                           ; preds = %body__1.i.i
  %30 = load %Qubit*, %Qubit** %22, align 8
  %31 = load %Qubit*, %Qubit** %25, align 8
  %32 = load %Qubit*, %Qubit** %27, align 8
  br label %quantum7

quantum7:                                         ; preds = %load10
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__body(%Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %30)
  tail call void @__quantum__qis__t__body(%Qubit* %32)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %30)
  tail call void @__quantum__qis__cnot__body(%Qubit* %30, %Qubit* %31)
  tail call void @__quantum__qis__t__adj(%Qubit* %31)
  tail call void @__quantum__qis__cnot__body(%Qubit* %32, %Qubit* %31)
  tail call void @__quantum__qis__h__body(%Qubit* %32)
  br label %readout9

readout9:                                         ; preds = %quantum7
  br label %post-classical6

post-classical6:                                  ; preds = %readout9
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical6
  br i1 %29, label %body__1.i.i, label %exit__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping8, %else__1.i
  %33 = and i64 %numControls.i.i, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  tail call void @__quantum__rt__array_update_reference_count(%Array* %temps.i.i, i32 1)
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %35 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %36 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %35, i64 0)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = add i64 %numControls.i.i, -1
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %38)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = load %Qubit*, %Qubit** %40, align 8
  store %Qubit* %41, %Qubit** %37, align 8
  %42 = tail call %Array* @__quantum__rt__array_concatenate(%Array* %temps.i.i, %Array* %35)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %35, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %42, i32 -1)
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %condFalse__1.i.i, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %42, %condFalse__1.i.i ]
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  %43 = tail call %Tuple* @__quantum__rt__tuple_create(i64 16)
  %44 = bitcast %Tuple* %43 to { %Array*, %Qubit* }*
  %45 = bitcast %Tuple* %43 to %Array**
  %46 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %44, i64 0, i32 1
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 1)
  store %Array* %__qsVar1__newControls__.i.i, %Array** %45, align 8
  store %Qubit* %arg.i.i, %Qubit** %46, align 8
  tail call void @__quantum__rt__callable_invoke(%Callable* %12, %Tuple* %43, %Tuple* null)
  br i1 %.not.not1.i.i, label %body__2.preheader.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

body__2.preheader.i.i:                            ; preds = %condContinue__1.i.i
  %__qsVar0____qsVar0__numPair____3.i.i = add nsw i64 %numControlPairs.i.i, -1
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %exit_quantum_grouping13, %body__2.preheader.i.i
  %47 = phi i64 [ %56, %exit_quantum_grouping13 ], [ %__qsVar0____qsVar0__numPair____3.i.i, %body__2.preheader.i.i ]
  %48 = shl nuw i64 %47, 1
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %48)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = or i64 %48, 1
  %52 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %controls.i.i, i64 %51)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %temps.i.i, i64 %47)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = add i64 %47, -1
  %57 = icmp sgt i64 %56, -1
  br label %load15

load15:                                           ; preds = %body__2.i.i
  %58 = load %Qubit*, %Qubit** %50, align 8
  %59 = load %Qubit*, %Qubit** %53, align 8
  %60 = load %Qubit*, %Qubit** %55, align 8
  br label %quantum12

quantum12:                                        ; preds = %load15
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %59)
  tail call void @__quantum__qis__t__body(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %60)
  tail call void @__quantum__qis__t__body(%Qubit* %58)
  tail call void @__quantum__qis__t__adj(%Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %58, %Qubit* %59)
  tail call void @__quantum__qis__cnot__body(%Qubit* %60, %Qubit* %58)
  tail call void @__quantum__qis__h__body(%Qubit* %60)
  br label %readout14

readout14:                                        ; preds = %quantum12
  br label %post-classical11

post-classical11:                                 ; preds = %readout14
  br label %exit_quantum_grouping13

exit_quantum_grouping13:                          ; preds = %post-classical11
  br i1 %57, label %body__2.i.i, label %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %exit_quantum_grouping13, %condContinue__1.i.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %temps.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %__qsVar1__newControls__.i.i, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %43, i32 -1)
  tail call void @__quantum__rt__qubit_release_array(%Array* %temps.i.i)
  tail call void @__quantum__rt__capture_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_alias_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %controls.i.i, i32 -1)
  tail call void @__quantum__rt__capture_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__callable_update_reference_count(%Callable* %12, i32 -1)
  tail call void @__quantum__rt__array_update_reference_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__tuple_update_reference_count(%Tuple* %13, i32 -1)
  br label %Microsoft__Quantum__Intrinsic__H__ctl.exit

Microsoft__Quantum__Intrinsic__H__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping3, %Microsoft__Quantum__Intrinsic___3f85a1f2a80843aea8ef2fdcae555f3f___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  tail call void @__quantum__rt__array_update_alias_count(%Array* %3, i32 -1)
  ret void
}

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare double @__quantum__qis__sqrt__body(double) local_unnamed_addr

declare double @__quantum__qis__arcsin__body(double) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

attributes #0 = { "InteropFriendly" "requiredQubits"="1" "requiredResults"="0" }
attributes #1 = { nounwind willreturn }

