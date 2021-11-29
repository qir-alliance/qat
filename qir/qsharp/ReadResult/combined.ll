; ModuleID = 'qat-link'
source_filename = "qat-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%Tuple = type opaque
%Qubit = type opaque
%Array = type opaque
%Callable = type { [4 x void (i8*, i8*, i8*)*]*, [2 x void (i8*, i32)*]*, i8*, i32, i32 }
%Result = type opaque

@Microsoft__Quantum__Intrinsic__Z = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__adj__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctl__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper]

define i64 @ConstArrayReduction__Main__Interop(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1 = bitcast i8* %0 to i64*
  %2 = getelementptr inbounds i8, i8* %0, i64 8
  %3 = bitcast i8* %2 to i64*
  %4 = getelementptr inbounds i8, i8* %0, i64 16
  %5 = bitcast i8* %4 to i64*
  %6 = getelementptr inbounds i8, i8* %0, i64 24
  %7 = bitcast i8* %6 to i64*
  store i64 8, i64* %1, align 8
  store i64 1, i64* %3, align 8
  store i64 1, i64* %5, align 8
  store i64 0, i64* %7, align 8
  %8 = getelementptr inbounds i8, i8* %0, i64 32
  %9 = bitcast i8* %8 to %Qubit**
  store %Qubit* inttoptr (i64 12 to %Qubit*), %Qubit** %9, align 8
  %10 = load i64, i64* %7, align 8
  %11 = add nsw i64 %10, 1
  store i64 %11, i64* %7, align 8
  %12 = load i64, i64* %3, align 8
  br label %quantum

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  switch i64 %12, label %else__1.i.i [
    i64 0, label %then0__1.i.i
    i64 1, label %then1__1.i.i
    i64 2, label %then2__1.i.i
  ]

then0__1.i.i:                                     ; preds = %exit_quantum_grouping
  br label %quantum3

quantum3:                                         ; preds = %then0__1.i.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout2

readout2:                                         ; preds = %quantum3
  br label %post-classical1

post-classical1:                                  ; preds = %readout2
  br label %exit_quantum_grouping4

exit_quantum_grouping4:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i

then1__1.i.i:                                     ; preds = %exit_quantum_grouping
  %13 = load %Qubit*, %Qubit** %9, align 8
  br label %quantum7

quantum7:                                         ; preds = %then1__1.i.i
  tail call void @__quantum__qis__cz__body(%Qubit* %13, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout6

readout6:                                         ; preds = %quantum7
  br label %post-classical5

post-classical5:                                  ; preds = %readout6
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical5
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i

then2__1.i.i:                                     ; preds = %exit_quantum_grouping
  %14 = bitcast i8* %0 to %Array*
  %15 = bitcast %Array* %14 to i64*
  %16 = load %Qubit*, %Qubit** %9, align 8
  %17 = load i64, i64* %15, align 8
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  %19 = getelementptr inbounds i8, i8* %18, i64 32
  %20 = bitcast i8* %19 to %Qubit**
  %21 = load %Qubit*, %Qubit** %20, align 8
  %22 = load %Qubit*, %Qubit** %9, align 8
  %23 = load %Qubit*, %Qubit** %9, align 8
  %24 = load i64, i64* %15, align 8
  %25 = getelementptr inbounds i8, i8* %0, i64 %24
  %26 = getelementptr inbounds i8, i8* %25, i64 32
  %27 = bitcast i8* %26 to %Qubit**
  %28 = load %Qubit*, %Qubit** %27, align 8
  %29 = load i64, i64* %15, align 8
  %30 = getelementptr inbounds i8, i8* %0, i64 %29
  %31 = getelementptr inbounds i8, i8* %30, i64 32
  %32 = bitcast i8* %31 to %Qubit**
  %33 = load %Qubit*, %Qubit** %32, align 8
  %34 = load %Qubit*, %Qubit** %9, align 8
  %35 = load %Qubit*, %Qubit** %9, align 8
  %36 = load i64, i64* %15, align 8
  %37 = getelementptr inbounds i8, i8* %0, i64 %36
  %38 = getelementptr inbounds i8, i8* %37, i64 32
  %39 = bitcast i8* %38 to %Qubit**
  %40 = load %Qubit*, %Qubit** %39, align 8
  %41 = load %Qubit*, %Qubit** %9, align 8
  %42 = load %Qubit*, %Qubit** %9, align 8
  %43 = load i64, i64* %15, align 8
  %44 = getelementptr inbounds i8, i8* %0, i64 %43
  %45 = getelementptr inbounds i8, i8* %44, i64 32
  %46 = bitcast i8* %45 to %Qubit**
  %47 = load %Qubit*, %Qubit** %46, align 8
  %48 = load %Qubit*, %Qubit** %9, align 8
  br label %quantum11

quantum11:                                        ; preds = %then2__1.i.i
  tail call void @__quantum__qis__t__adj(%Qubit* %16)
  tail call void @__quantum__qis__t__adj(%Qubit* %21)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %22)
  tail call void @__quantum__qis__t__body(%Qubit* %23)
  tail call void @__quantum__qis__cnot__body(%Qubit* %28, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %33, %Qubit* %34)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %35)
  tail call void @__quantum__qis__cnot__body(%Qubit* %40, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %41)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %42)
  tail call void @__quantum__qis__cnot__body(%Qubit* %47, %Qubit* %48)
  br label %readout10

readout10:                                        ; preds = %quantum11
  br label %post-classical9

post-classical9:                                  ; preds = %readout10
  br label %exit_quantum_grouping12

exit_quantum_grouping12:                          ; preds = %post-classical9
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i

else__1.i.i:                                      ; preds = %exit_quantum_grouping
  %49 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %50 = bitcast i8* %49 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %50, align 8
  %51 = getelementptr inbounds i8, i8* %49, i64 8
  %52 = getelementptr inbounds i8, i8* %49, i64 16
  %53 = bitcast i8* %52 to i8**
  %54 = getelementptr inbounds i8, i8* %49, i64 24
  %55 = bitcast i8* %54 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %51, i8 0, i64 16, i1 false)
  store i32 1, i32* %55, align 8
  %56 = getelementptr inbounds i8, i8* %49, i64 28
  %57 = bitcast i8* %56 to i32*
  store i32 0, i32* %57, align 4
  %58 = bitcast i8* %49 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %58)
  %59 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %60 = bitcast i8* %59 to i64*
  %61 = getelementptr inbounds i8, i8* %59, i64 8
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr inbounds i8, i8* %59, i64 16
  %64 = bitcast i8* %63 to i64*
  store i64 16, i64* %60, align 8
  store i64 1, i64* %62, align 8
  store i64 0, i64* %64, align 8
  %65 = getelementptr inbounds i8, i8* %59, i64 24
  %66 = bitcast i8* %65 to %Tuple*
  %67 = bitcast %Tuple* %66 to { %Array*, %Qubit* }*
  %68 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %67, i64 0, i32 1
  %69 = load i64, i64* %5, align 8
  %70 = add nsw i64 %69, 1
  store i64 %70, i64* %5, align 8
  %71 = icmp slt i64 %69, 0
  br i1 %71, label %72, label %__quantum__rt__array_update_reference_count.exit.i.i

72:                                               ; preds = %else__1.i.i
  tail call void @free(i8* nonnull %0) #2
  br label %__quantum__rt__array_update_reference_count.exit.i.i

__quantum__rt__array_update_reference_count.exit.i.i: ; preds = %72, %else__1.i.i
  %73 = bitcast %Tuple* %66 to i8**
  store i8* %0, i8** %73, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %68, align 8
  %74 = load i32, i32* %57, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %57, align 4
  %controls8.i.i.i = load i8*, i8** %73, align 8
  %76 = getelementptr inbounds i8, i8* %controls8.i.i.i, i64 24
  %77 = bitcast i8* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = add nsw i64 %78, 1
  store i64 %79, i64* %77, align 8
  %80 = bitcast %Qubit** %68 to i64*
  %arg1.i.i.i = load i64, i64* %80, align 8
  %81 = getelementptr inbounds i8, i8* %controls8.i.i.i, i64 8
  %82 = bitcast i8* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %numControlPairs.i.i.i = sdiv i64 %83, 2
  %temps.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i)
  %84 = bitcast %Array* %temps.i.i.i to i8*
  %85 = getelementptr inbounds i8, i8* %84, i64 24
  %86 = bitcast i8* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = add nsw i64 %87, 1
  store i64 %88, i64* %86, align 8
  %.not.not9.i.i.i = icmp sgt i64 %83, 1
  br i1 %.not.not9.i.i.i, label %body__1.lr.ph.i.i.i, label %exit__1.i.i.i

body__1.lr.ph.i.i.i:                              ; preds = %__quantum__rt__array_update_reference_count.exit.i.i
  %89 = bitcast i8* %controls8.i.i.i to i64*
  %90 = bitcast %Array* %temps.i.i.i to i64*
  %91 = getelementptr inbounds i8, i8* %controls8.i.i.i, i64 32
  %92 = getelementptr inbounds i8, i8* %84, i64 32
  br label %body__1.i.i.i

body__1.i.i.i:                                    ; preds = %body__1.lr.ph.i.i.i, %exit_quantum_grouping16
  %93 = phi i64 [ 0, %body__1.lr.ph.i.i.i ], [ %110, %exit_quantum_grouping16 ]
  %94 = shl nuw i64 %93, 1
  %95 = load i64, i64* %89, align 8
  %96 = mul nsw i64 %95, %94
  %97 = getelementptr inbounds i8, i8* %91, i64 %96
  %98 = bitcast i8* %97 to %Qubit**
  %99 = load %Qubit*, %Qubit** %98, align 8
  %100 = or i64 %94, 1
  %101 = mul nsw i64 %100, %95
  %102 = getelementptr inbounds i8, i8* %91, i64 %101
  %103 = bitcast i8* %102 to %Qubit**
  %104 = load %Qubit*, %Qubit** %103, align 8
  %105 = load i64, i64* %90, align 8
  %106 = mul nsw i64 %105, %93
  %107 = getelementptr inbounds i8, i8* %92, i64 %106
  %108 = bitcast i8* %107 to %Qubit**
  %109 = load %Qubit*, %Qubit** %108, align 8
  %110 = add nuw nsw i64 %93, 1
  %111 = icmp eq i64 %110, %numControlPairs.i.i.i
  br label %quantum15

quantum15:                                        ; preds = %body__1.i.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %109)
  tail call void @__quantum__qis__cnot__body(%Qubit* %109, %Qubit* %99)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %104)
  tail call void @__quantum__qis__t__body(%Qubit* %104)
  tail call void @__quantum__qis__t__adj(%Qubit* %99)
  tail call void @__quantum__qis__t__body(%Qubit* %109)
  tail call void @__quantum__qis__cnot__body(%Qubit* %109, %Qubit* %99)
  tail call void @__quantum__qis__cnot__body(%Qubit* %99, %Qubit* %104)
  tail call void @__quantum__qis__t__adj(%Qubit* %104)
  tail call void @__quantum__qis__cnot__body(%Qubit* %109, %Qubit* %104)
  tail call void @__quantum__qis__h__body(%Qubit* %109)
  br label %readout14

readout14:                                        ; preds = %quantum15
  br label %post-classical13

post-classical13:                                 ; preds = %readout14
  br label %exit_quantum_grouping16

exit_quantum_grouping16:                          ; preds = %post-classical13
  br i1 %111, label %exit__1.i.i.i, label %body__1.i.i.i

exit__1.i.i.i:                                    ; preds = %exit_quantum_grouping16, %__quantum__rt__array_update_reference_count.exit.i.i
  %112 = and i64 %83, 1
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %condTrue__1.i.i.i, label %condFalse__1.i.i.i

condTrue__1.i.i.i:                                ; preds = %exit__1.i.i.i
  %114 = getelementptr inbounds i8, i8* %84, i64 16
  %115 = bitcast i8* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = add nsw i64 %116, 1
  store i64 %117, i64* %115, align 8
  %118 = icmp slt i64 %116, 0
  br i1 %118, label %119, label %condContinue__1.i.i.i

119:                                              ; preds = %condTrue__1.i.i.i
  tail call void @free(i8* nonnull %84) #2
  br label %condContinue__1.i.i.i

condFalse__1.i.i.i:                               ; preds = %exit__1.i.i.i
  %120 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %121 = bitcast i8* %120 to i64*
  %122 = getelementptr inbounds i8, i8* %120, i64 8
  %123 = bitcast i8* %122 to i64*
  %124 = getelementptr inbounds i8, i8* %120, i64 16
  %125 = bitcast i8* %124 to i64*
  %126 = getelementptr inbounds i8, i8* %120, i64 24
  %127 = bitcast i8* %126 to i64*
  store i64 8, i64* %121, align 8
  store i64 1, i64* %123, align 8
  store i64 1, i64* %125, align 8
  store i64 0, i64* %127, align 8
  %128 = getelementptr inbounds i8, i8* %120, i64 32
  %129 = add i64 %83, -1
  %130 = bitcast i8* %controls8.i.i.i to i64*
  %131 = load i64, i64* %130, align 8
  %132 = mul nsw i64 %131, %129
  %133 = getelementptr inbounds i8, i8* %controls8.i.i.i, i64 %132
  %134 = getelementptr inbounds i8, i8* %133, i64 32
  %135 = bitcast i8* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = bitcast i8* %128 to i64*
  store i64 %136, i64* %137, align 8
  %138 = bitcast %Array* %temps.i.i.i to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds i8, i8* %84, i64 8
  %141 = bitcast i8* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = load i64, i64* %123, align 8
  %144 = getelementptr inbounds i8, i8* %84, i64 32
  %145 = add nsw i64 %143, %142
  %sext.i.i.i.i = shl i64 %139, 32
  %146 = ashr exact i64 %sext.i.i.i.i, 32
  %147 = mul nsw i64 %145, %146
  %148 = add i64 %147, 32
  %149 = tail call i8* @malloc(i64 %148) #5
  %150 = bitcast i8* %149 to i64*
  %151 = getelementptr inbounds i8, i8* %149, i64 8
  %152 = bitcast i8* %151 to i64*
  %153 = getelementptr inbounds i8, i8* %149, i64 16
  %154 = bitcast i8* %153 to i64*
  %155 = getelementptr inbounds i8, i8* %149, i64 24
  %156 = bitcast i8* %155 to i64*
  store i64 %146, i64* %150, align 8
  store i64 %145, i64* %152, align 8
  store i64 1, i64* %154, align 8
  store i64 0, i64* %156, align 8
  %157 = getelementptr inbounds i8, i8* %149, i64 32
  %158 = mul nsw i64 %142, %139
  %159 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %157, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %157, i8* nonnull align 1 %144, i64 %158, i1 false) #2
  %160 = getelementptr inbounds i8, i8* %157, i64 %158
  %161 = mul nsw i64 %143, %139
  %162 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %160, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %160, i8* nonnull align 1 %128, i64 %161, i1 false) #2
  %163 = bitcast i8* %149 to %Array*
  %164 = load i64, i64* %154, align 8
  %165 = add nsw i64 %164, 1
  store i64 %165, i64* %154, align 8
  %166 = icmp slt i64 %164, 0
  br i1 %166, label %167, label %__quantum__rt__array_update_reference_count.exit2.i.i.i

167:                                              ; preds = %condFalse__1.i.i.i
  tail call void @free(i8* nonnull %149) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i.i

__quantum__rt__array_update_reference_count.exit2.i.i.i: ; preds = %167, %condFalse__1.i.i.i
  %168 = load i64, i64* %125, align 8
  %169 = add nsw i64 %168, -1
  store i64 %169, i64* %125, align 8
  %170 = icmp slt i64 %168, 2
  br i1 %170, label %171, label %__quantum__rt__array_update_reference_count.exit3.i.i.i

171:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i.i
  tail call void @free(i8* nonnull %120) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i.i

__quantum__rt__array_update_reference_count.exit3.i.i.i: ; preds = %171, %__quantum__rt__array_update_reference_count.exit2.i.i.i
  %172 = load i64, i64* %154, align 8
  %173 = add nsw i64 %172, -1
  store i64 %173, i64* %154, align 8
  %174 = icmp slt i64 %172, 2
  br i1 %174, label %175, label %condContinue__1.i.i.i

175:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i.i
  tail call void @free(i8* nonnull %149) #2
  br label %condContinue__1.i.i.i

condContinue__1.i.i.i:                            ; preds = %175, %__quantum__rt__array_update_reference_count.exit3.i.i.i, %119, %condTrue__1.i.i.i
  %__qsVar1__newControls__.i.i.i = phi %Array* [ %temps.i.i.i, %condTrue__1.i.i.i ], [ %temps.i.i.i, %119 ], [ %163, %__quantum__rt__array_update_reference_count.exit3.i.i.i ], [ %163, %175 ]
  %176 = bitcast %Array* %__qsVar1__newControls__.i.i.i to i8*
  %177 = getelementptr inbounds i8, i8* %176, i64 24
  %178 = bitcast i8* %177 to i64*
  %179 = load i64, i64* %178, align 8
  %180 = add nsw i64 %179, 1
  store i64 %180, i64* %178, align 8
  %181 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %182 = bitcast i8* %181 to i64*
  %183 = getelementptr inbounds i8, i8* %181, i64 8
  %184 = bitcast i8* %183 to i64*
  %185 = getelementptr inbounds i8, i8* %181, i64 16
  %186 = bitcast i8* %185 to i64*
  store i64 16, i64* %182, align 8
  store i64 1, i64* %184, align 8
  store i64 0, i64* %186, align 8
  %187 = getelementptr inbounds i8, i8* %181, i64 24
  %188 = bitcast i8* %187 to %Tuple*
  %189 = bitcast %Tuple* %188 to { %Array*, %Qubit* }*
  %190 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %189, i64 0, i32 0
  %191 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %189, i64 0, i32 1
  %192 = getelementptr inbounds i8, i8* %176, i64 16
  %193 = bitcast i8* %192 to i64*
  %194 = load i64, i64* %193, align 8
  %195 = add nsw i64 %194, 1
  store i64 %195, i64* %193, align 8
  %196 = icmp slt i64 %194, 0
  br i1 %196, label %197, label %__quantum__rt__array_update_reference_count.exit5.i.i.i

197:                                              ; preds = %condContinue__1.i.i.i
  tail call void @free(i8* nonnull %176) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i.i

__quantum__rt__array_update_reference_count.exit5.i.i.i: ; preds = %197, %condContinue__1.i.i.i
  store %Array* %__qsVar1__newControls__.i.i.i, %Array** %190, align 8
  %198 = bitcast %Qubit** %191 to i64*
  store i64 %arg1.i.i.i, i64* %198, align 8
  %199 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %50, align 8
  %200 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %199, i64 0, i64 0
  %201 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %200, align 8
  %202 = load i8*, i8** %53, align 8
  tail call void %201(i8* %202, i8* nonnull %187, i8* null)
  br i1 %.not.not9.i.i.i, label %body__2.lr.ph.i.i.i, label %exit__2.i.i.i

body__2.lr.ph.i.i.i:                              ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i.i
  %__qsVar0____qsVar0__numPair____11.i.i.i = add nsw i64 %numControlPairs.i.i.i, -1
  %203 = bitcast i8* %controls8.i.i.i to i64*
  %204 = bitcast %Array* %temps.i.i.i to i64*
  %205 = getelementptr inbounds i8, i8* %controls8.i.i.i, i64 32
  %206 = getelementptr inbounds i8, i8* %84, i64 32
  br label %body__2.i.i.i

body__2.i.i.i:                                    ; preds = %body__2.lr.ph.i.i.i, %exit_quantum_grouping20
  %207 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i.i, %body__2.lr.ph.i.i.i ], [ %224, %exit_quantum_grouping20 ]
  %208 = shl nuw i64 %207, 1
  %209 = load i64, i64* %203, align 8
  %210 = mul nsw i64 %209, %208
  %211 = getelementptr inbounds i8, i8* %205, i64 %210
  %212 = bitcast i8* %211 to %Qubit**
  %213 = load %Qubit*, %Qubit** %212, align 8
  %214 = or i64 %208, 1
  %215 = mul nsw i64 %214, %209
  %216 = getelementptr inbounds i8, i8* %205, i64 %215
  %217 = bitcast i8* %216 to %Qubit**
  %218 = load %Qubit*, %Qubit** %217, align 8
  %219 = load i64, i64* %204, align 8
  %220 = mul nsw i64 %219, %207
  %221 = getelementptr inbounds i8, i8* %206, i64 %220
  %222 = bitcast i8* %221 to %Qubit**
  %223 = load %Qubit*, %Qubit** %222, align 8
  %224 = add i64 %207, -1
  %225 = icmp sgt i64 %224, -1
  br label %quantum19

quantum19:                                        ; preds = %body__2.i.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %223)
  tail call void @__quantum__qis__cnot__body(%Qubit* %223, %Qubit* %218)
  tail call void @__quantum__qis__t__body(%Qubit* %218)
  tail call void @__quantum__qis__cnot__body(%Qubit* %213, %Qubit* %218)
  tail call void @__quantum__qis__cnot__body(%Qubit* %223, %Qubit* %213)
  tail call void @__quantum__qis__t__adj(%Qubit* %223)
  tail call void @__quantum__qis__t__body(%Qubit* %213)
  tail call void @__quantum__qis__t__adj(%Qubit* %218)
  tail call void @__quantum__qis__cnot__body(%Qubit* %213, %Qubit* %218)
  tail call void @__quantum__qis__cnot__body(%Qubit* %223, %Qubit* %213)
  tail call void @__quantum__qis__h__body(%Qubit* %223)
  br label %readout18

readout18:                                        ; preds = %quantum19
  br label %post-classical17

post-classical17:                                 ; preds = %readout18
  br label %exit_quantum_grouping20

exit_quantum_grouping20:                          ; preds = %post-classical17
  br i1 %225, label %body__2.i.i.i, label %exit__2.i.i.i

exit__2.i.i.i:                                    ; preds = %exit_quantum_grouping20, %__quantum__rt__array_update_reference_count.exit5.i.i.i
  %226 = load i64, i64* %86, align 8
  %227 = add nsw i64 %226, -1
  store i64 %227, i64* %86, align 8
  %228 = load i64, i64* %178, align 8
  %229 = add nsw i64 %228, -1
  store i64 %229, i64* %178, align 8
  %230 = load i64, i64* %193, align 8
  %231 = add nsw i64 %230, -1
  store i64 %231, i64* %193, align 8
  %232 = icmp slt i64 %230, 2
  br i1 %232, label %233, label %__quantum__rt__array_update_reference_count.exit6.i.i.i

233:                                              ; preds = %exit__2.i.i.i
  tail call void @free(i8* nonnull %176) #2
  %.pre.i.i.i = load i64, i64* %193, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i.i

__quantum__rt__array_update_reference_count.exit6.i.i.i: ; preds = %233, %exit__2.i.i.i
  %234 = phi i64 [ %231, %exit__2.i.i.i ], [ %.pre.i.i.i, %233 ]
  %235 = add nsw i64 %234, -1
  store i64 %235, i64* %193, align 8
  %236 = icmp slt i64 %234, 2
  br i1 %236, label %237, label %__quantum__rt__array_update_reference_count.exit7.i.i.i

237:                                              ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i.i
  tail call void @free(i8* nonnull %176) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i.i

__quantum__rt__array_update_reference_count.exit7.i.i.i: ; preds = %237, %__quantum__rt__array_update_reference_count.exit6.i.i.i
  %238 = load i64, i64* %184, align 8
  %239 = add nsw i64 %238, -1
  store i64 %239, i64* %184, align 8
  %240 = icmp slt i64 %238, 2
  br i1 %240, label %241, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i

241:                                              ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i.i
  tail call void @free(i8* nonnull %181) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i: ; preds = %241, %__quantum__rt__array_update_reference_count.exit7.i.i.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i.i)
  %242 = load i32, i32* %57, align 4
  %243 = add nsw i32 %242, -1
  store i32 %243, i32* %57, align 4
  %244 = load i64, i64* %77, align 8
  %245 = add nsw i64 %244, -1
  store i64 %245, i64* %77, align 8
  %246 = load i32, i32* %55, align 8
  %247 = add nsw i32 %246, -1
  store i32 %247, i32* %55, align 8
  %248 = load i64, i64* %5, align 8
  %249 = add nsw i64 %248, -1
  store i64 %249, i64* %5, align 8
  %250 = icmp slt i64 %248, 2
  br i1 %250, label %251, label %__quantum__rt__array_update_reference_count.exit1.i.i

251:                                              ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i
  tail call void @free(i8* nonnull %0) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i.i

__quantum__rt__array_update_reference_count.exit1.i.i: ; preds = %251, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i
  %252 = load i64, i64* %62, align 8
  %253 = add nsw i64 %252, -1
  store i64 %253, i64* %62, align 8
  %254 = icmp slt i64 %252, 2
  br i1 %254, label %255, label %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i

255:                                              ; preds = %__quantum__rt__array_update_reference_count.exit1.i.i
  tail call void @free(i8* nonnull %59) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i:  ; preds = %255, %__quantum__rt__array_update_reference_count.exit1.i.i, %exit_quantum_grouping12, %exit_quantum_grouping8, %exit_quantum_grouping4
  %256 = load i64, i64* %7, align 8
  %257 = add nsw i64 %256, -1
  store i64 %257, i64* %7, align 8
  %258 = load i64, i64* %5, align 8
  %259 = add nsw i64 %258, -1
  store i64 %259, i64* %5, align 8
  %260 = icmp slt i64 %258, 2
  br i1 %260, label %261, label %Microsoft__Quantum__Canon__CZ__body.exit.i

261:                                              ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i
  tail call void @free(i8* nonnull %0) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit.i

Microsoft__Quantum__Canon__CZ__body.exit.i:       ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.30.exit.i, %261
  %262 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %263 = bitcast i8* %262 to i64*
  %264 = getelementptr inbounds i8, i8* %262, i64 8
  %265 = bitcast i8* %264 to i64*
  %266 = getelementptr inbounds i8, i8* %262, i64 16
  %267 = bitcast i8* %266 to i64*
  %268 = getelementptr inbounds i8, i8* %262, i64 24
  %269 = bitcast i8* %268 to i64*
  store i64 8, i64* %263, align 8
  store i64 1, i64* %265, align 8
  store i64 1, i64* %267, align 8
  store i64 0, i64* %269, align 8
  %270 = getelementptr inbounds i8, i8* %262, i64 32
  %271 = bitcast i8* %270 to %Qubit**
  store %Qubit* inttoptr (i64 13 to %Qubit*), %Qubit** %271, align 8
  %272 = load i64, i64* %269, align 8
  %273 = add nsw i64 %272, 1
  store i64 %273, i64* %269, align 8
  %274 = load i64, i64* %265, align 8
  br label %quantum403

quantum403:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  br label %readout402

readout402:                                       ; preds = %quantum403
  %275 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical401

post-classical401:                                ; preds = %readout402
  br label %exit_quantum_grouping404

exit_quantum_grouping404:                         ; preds = %post-classical401
  switch i64 %274, label %else__1.i5.i [
    i64 0, label %then0__1.i1.i
    i64 1, label %then1__1.i3.i
    i64 2, label %then2__1.i4.i
  ]

then0__1.i1.i:                                    ; preds = %exit_quantum_grouping404
  br label %quantum23

quantum23:                                        ; preds = %then0__1.i1.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout22

readout22:                                        ; preds = %quantum23
  br label %post-classical21

post-classical21:                                 ; preds = %readout22
  br label %exit_quantum_grouping24

exit_quantum_grouping24:                          ; preds = %post-classical21
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i

then1__1.i3.i:                                    ; preds = %exit_quantum_grouping404
  %276 = load %Qubit*, %Qubit** %271, align 8
  br label %quantum27

quantum27:                                        ; preds = %then1__1.i3.i
  tail call void @__quantum__qis__cz__body(%Qubit* %276, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout26

readout26:                                        ; preds = %quantum27
  br label %post-classical25

post-classical25:                                 ; preds = %readout26
  br label %exit_quantum_grouping28

exit_quantum_grouping28:                          ; preds = %post-classical25
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i

then2__1.i4.i:                                    ; preds = %exit_quantum_grouping404
  %277 = bitcast i8* %262 to %Array*
  %278 = bitcast %Array* %277 to i64*
  %279 = load %Qubit*, %Qubit** %271, align 8
  %280 = load i64, i64* %278, align 8
  %281 = getelementptr inbounds i8, i8* %262, i64 %280
  %282 = getelementptr inbounds i8, i8* %281, i64 32
  %283 = bitcast i8* %282 to %Qubit**
  %284 = load %Qubit*, %Qubit** %283, align 8
  %285 = load %Qubit*, %Qubit** %271, align 8
  %286 = load %Qubit*, %Qubit** %271, align 8
  %287 = load i64, i64* %278, align 8
  %288 = getelementptr inbounds i8, i8* %262, i64 %287
  %289 = getelementptr inbounds i8, i8* %288, i64 32
  %290 = bitcast i8* %289 to %Qubit**
  %291 = load %Qubit*, %Qubit** %290, align 8
  %292 = load i64, i64* %278, align 8
  %293 = getelementptr inbounds i8, i8* %262, i64 %292
  %294 = getelementptr inbounds i8, i8* %293, i64 32
  %295 = bitcast i8* %294 to %Qubit**
  %296 = load %Qubit*, %Qubit** %295, align 8
  %297 = load %Qubit*, %Qubit** %271, align 8
  %298 = load %Qubit*, %Qubit** %271, align 8
  %299 = load i64, i64* %278, align 8
  %300 = getelementptr inbounds i8, i8* %262, i64 %299
  %301 = getelementptr inbounds i8, i8* %300, i64 32
  %302 = bitcast i8* %301 to %Qubit**
  %303 = load %Qubit*, %Qubit** %302, align 8
  %304 = load %Qubit*, %Qubit** %271, align 8
  %305 = load %Qubit*, %Qubit** %271, align 8
  %306 = load i64, i64* %278, align 8
  %307 = getelementptr inbounds i8, i8* %262, i64 %306
  %308 = getelementptr inbounds i8, i8* %307, i64 32
  %309 = bitcast i8* %308 to %Qubit**
  %310 = load %Qubit*, %Qubit** %309, align 8
  %311 = load %Qubit*, %Qubit** %271, align 8
  br label %quantum31

quantum31:                                        ; preds = %then2__1.i4.i
  tail call void @__quantum__qis__t__adj(%Qubit* %279)
  tail call void @__quantum__qis__t__adj(%Qubit* %284)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %285)
  tail call void @__quantum__qis__t__body(%Qubit* %286)
  tail call void @__quantum__qis__cnot__body(%Qubit* %291, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %296, %Qubit* %297)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %298)
  tail call void @__quantum__qis__cnot__body(%Qubit* %303, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %304)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %305)
  tail call void @__quantum__qis__cnot__body(%Qubit* %310, %Qubit* %311)
  br label %readout30

readout30:                                        ; preds = %quantum31
  br label %post-classical29

post-classical29:                                 ; preds = %readout30
  br label %exit_quantum_grouping32

exit_quantum_grouping32:                          ; preds = %post-classical29
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i

else__1.i5.i:                                     ; preds = %exit_quantum_grouping404
  %312 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %313 = bitcast i8* %312 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %313, align 8
  %314 = getelementptr inbounds i8, i8* %312, i64 8
  %315 = getelementptr inbounds i8, i8* %312, i64 16
  %316 = bitcast i8* %315 to i8**
  %317 = getelementptr inbounds i8, i8* %312, i64 24
  %318 = bitcast i8* %317 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %314, i8 0, i64 16, i1 false)
  store i32 1, i32* %318, align 8
  %319 = getelementptr inbounds i8, i8* %312, i64 28
  %320 = bitcast i8* %319 to i32*
  store i32 0, i32* %320, align 4
  %321 = bitcast i8* %312 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %321)
  %322 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %323 = bitcast i8* %322 to i64*
  %324 = getelementptr inbounds i8, i8* %322, i64 8
  %325 = bitcast i8* %324 to i64*
  %326 = getelementptr inbounds i8, i8* %322, i64 16
  %327 = bitcast i8* %326 to i64*
  store i64 16, i64* %323, align 8
  store i64 1, i64* %325, align 8
  store i64 0, i64* %327, align 8
  %328 = getelementptr inbounds i8, i8* %322, i64 24
  %329 = bitcast i8* %328 to %Tuple*
  %330 = bitcast %Tuple* %329 to { %Array*, %Qubit* }*
  %331 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %330, i64 0, i32 1
  %332 = load i64, i64* %267, align 8
  %333 = add nsw i64 %332, 1
  store i64 %333, i64* %267, align 8
  %334 = icmp slt i64 %332, 0
  br i1 %334, label %335, label %__quantum__rt__array_update_reference_count.exit.i11.i

335:                                              ; preds = %else__1.i5.i
  tail call void @free(i8* nonnull %262) #2
  br label %__quantum__rt__array_update_reference_count.exit.i11.i

__quantum__rt__array_update_reference_count.exit.i11.i: ; preds = %335, %else__1.i5.i
  %336 = bitcast %Tuple* %329 to i8**
  store i8* %262, i8** %336, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %331, align 8
  %337 = load i32, i32* %320, align 4
  %338 = add nsw i32 %337, 1
  store i32 %338, i32* %320, align 4
  %controls8.i.i6.i = load i8*, i8** %336, align 8
  %339 = getelementptr inbounds i8, i8* %controls8.i.i6.i, i64 24
  %340 = bitcast i8* %339 to i64*
  %341 = load i64, i64* %340, align 8
  %342 = add nsw i64 %341, 1
  store i64 %342, i64* %340, align 8
  %343 = bitcast %Qubit** %331 to i64*
  %arg1.i.i7.i = load i64, i64* %343, align 8
  %344 = getelementptr inbounds i8, i8* %controls8.i.i6.i, i64 8
  %345 = bitcast i8* %344 to i64*
  %346 = load i64, i64* %345, align 8
  %numControlPairs.i.i8.i = sdiv i64 %346, 2
  %temps.i.i9.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i8.i)
  %347 = bitcast %Array* %temps.i.i9.i to i8*
  %348 = getelementptr inbounds i8, i8* %347, i64 24
  %349 = bitcast i8* %348 to i64*
  %350 = load i64, i64* %349, align 8
  %351 = add nsw i64 %350, 1
  store i64 %351, i64* %349, align 8
  %.not.not9.i.i10.i = icmp sgt i64 %346, 1
  br i1 %.not.not9.i.i10.i, label %body__1.lr.ph.i.i12.i, label %exit__1.i.i16.i

body__1.lr.ph.i.i12.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit.i11.i
  %352 = bitcast i8* %controls8.i.i6.i to i64*
  %353 = bitcast %Array* %temps.i.i9.i to i64*
  %354 = getelementptr inbounds i8, i8* %controls8.i.i6.i, i64 32
  %355 = getelementptr inbounds i8, i8* %347, i64 32
  br label %body__1.i.i15.i

body__1.i.i15.i:                                  ; preds = %body__1.lr.ph.i.i12.i, %exit_quantum_grouping36
  %356 = phi i64 [ 0, %body__1.lr.ph.i.i12.i ], [ %373, %exit_quantum_grouping36 ]
  %357 = shl nuw i64 %356, 1
  %358 = load i64, i64* %352, align 8
  %359 = mul nsw i64 %358, %357
  %360 = getelementptr inbounds i8, i8* %354, i64 %359
  %361 = bitcast i8* %360 to %Qubit**
  %362 = load %Qubit*, %Qubit** %361, align 8
  %363 = or i64 %357, 1
  %364 = mul nsw i64 %363, %358
  %365 = getelementptr inbounds i8, i8* %354, i64 %364
  %366 = bitcast i8* %365 to %Qubit**
  %367 = load %Qubit*, %Qubit** %366, align 8
  %368 = load i64, i64* %353, align 8
  %369 = mul nsw i64 %368, %356
  %370 = getelementptr inbounds i8, i8* %355, i64 %369
  %371 = bitcast i8* %370 to %Qubit**
  %372 = load %Qubit*, %Qubit** %371, align 8
  %373 = add nuw nsw i64 %356, 1
  %374 = icmp eq i64 %373, %numControlPairs.i.i8.i
  br label %quantum35

quantum35:                                        ; preds = %body__1.i.i15.i
  tail call void @__quantum__qis__h__body(%Qubit* %372)
  tail call void @__quantum__qis__cnot__body(%Qubit* %372, %Qubit* %362)
  tail call void @__quantum__qis__cnot__body(%Qubit* %362, %Qubit* %367)
  tail call void @__quantum__qis__t__body(%Qubit* %367)
  tail call void @__quantum__qis__t__adj(%Qubit* %362)
  tail call void @__quantum__qis__t__body(%Qubit* %372)
  tail call void @__quantum__qis__cnot__body(%Qubit* %372, %Qubit* %362)
  tail call void @__quantum__qis__cnot__body(%Qubit* %362, %Qubit* %367)
  tail call void @__quantum__qis__t__adj(%Qubit* %367)
  tail call void @__quantum__qis__cnot__body(%Qubit* %372, %Qubit* %367)
  tail call void @__quantum__qis__h__body(%Qubit* %372)
  br label %readout34

readout34:                                        ; preds = %quantum35
  br label %post-classical33

post-classical33:                                 ; preds = %readout34
  br label %exit_quantum_grouping36

exit_quantum_grouping36:                          ; preds = %post-classical33
  br i1 %374, label %exit__1.i.i16.i, label %body__1.i.i15.i

exit__1.i.i16.i:                                  ; preds = %exit_quantum_grouping36, %__quantum__rt__array_update_reference_count.exit.i11.i
  %375 = and i64 %346, 1
  %376 = icmp eq i64 %375, 0
  br i1 %376, label %condTrue__1.i.i17.i, label %condFalse__1.i.i19.i

condTrue__1.i.i17.i:                              ; preds = %exit__1.i.i16.i
  %377 = getelementptr inbounds i8, i8* %347, i64 16
  %378 = bitcast i8* %377 to i64*
  %379 = load i64, i64* %378, align 8
  %380 = add nsw i64 %379, 1
  store i64 %380, i64* %378, align 8
  %381 = icmp slt i64 %379, 0
  br i1 %381, label %382, label %condContinue__1.i.i23.i

382:                                              ; preds = %condTrue__1.i.i17.i
  tail call void @free(i8* nonnull %347) #2
  br label %condContinue__1.i.i23.i

condFalse__1.i.i19.i:                             ; preds = %exit__1.i.i16.i
  %383 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %384 = bitcast i8* %383 to i64*
  %385 = getelementptr inbounds i8, i8* %383, i64 8
  %386 = bitcast i8* %385 to i64*
  %387 = getelementptr inbounds i8, i8* %383, i64 16
  %388 = bitcast i8* %387 to i64*
  %389 = getelementptr inbounds i8, i8* %383, i64 24
  %390 = bitcast i8* %389 to i64*
  store i64 8, i64* %384, align 8
  store i64 1, i64* %386, align 8
  store i64 1, i64* %388, align 8
  store i64 0, i64* %390, align 8
  %391 = getelementptr inbounds i8, i8* %383, i64 32
  %392 = add i64 %346, -1
  %393 = bitcast i8* %controls8.i.i6.i to i64*
  %394 = load i64, i64* %393, align 8
  %395 = mul nsw i64 %394, %392
  %396 = getelementptr inbounds i8, i8* %controls8.i.i6.i, i64 %395
  %397 = getelementptr inbounds i8, i8* %396, i64 32
  %398 = bitcast i8* %397 to i64*
  %399 = load i64, i64* %398, align 8
  %400 = bitcast i8* %391 to i64*
  store i64 %399, i64* %400, align 8
  %401 = bitcast %Array* %temps.i.i9.i to i64*
  %402 = load i64, i64* %401, align 8
  %403 = getelementptr inbounds i8, i8* %347, i64 8
  %404 = bitcast i8* %403 to i64*
  %405 = load i64, i64* %404, align 8
  %406 = load i64, i64* %386, align 8
  %407 = getelementptr inbounds i8, i8* %347, i64 32
  %408 = add nsw i64 %406, %405
  %sext.i.i.i18.i = shl i64 %402, 32
  %409 = ashr exact i64 %sext.i.i.i18.i, 32
  %410 = mul nsw i64 %408, %409
  %411 = add i64 %410, 32
  %412 = tail call i8* @malloc(i64 %411) #5
  %413 = bitcast i8* %412 to i64*
  %414 = getelementptr inbounds i8, i8* %412, i64 8
  %415 = bitcast i8* %414 to i64*
  %416 = getelementptr inbounds i8, i8* %412, i64 16
  %417 = bitcast i8* %416 to i64*
  %418 = getelementptr inbounds i8, i8* %412, i64 24
  %419 = bitcast i8* %418 to i64*
  store i64 %409, i64* %413, align 8
  store i64 %408, i64* %415, align 8
  store i64 1, i64* %417, align 8
  store i64 0, i64* %419, align 8
  %420 = getelementptr inbounds i8, i8* %412, i64 32
  %421 = mul nsw i64 %405, %402
  %422 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %420, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %420, i8* nonnull align 1 %407, i64 %421, i1 false) #2
  %423 = getelementptr inbounds i8, i8* %420, i64 %421
  %424 = mul nsw i64 %406, %402
  %425 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %423, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %423, i8* nonnull align 1 %391, i64 %424, i1 false) #2
  %426 = bitcast i8* %412 to %Array*
  %427 = load i64, i64* %417, align 8
  %428 = add nsw i64 %427, 1
  store i64 %428, i64* %417, align 8
  %429 = icmp slt i64 %427, 0
  br i1 %429, label %430, label %__quantum__rt__array_update_reference_count.exit2.i.i20.i

430:                                              ; preds = %condFalse__1.i.i19.i
  tail call void @free(i8* nonnull %412) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i20.i

__quantum__rt__array_update_reference_count.exit2.i.i20.i: ; preds = %430, %condFalse__1.i.i19.i
  %431 = load i64, i64* %388, align 8
  %432 = add nsw i64 %431, -1
  store i64 %432, i64* %388, align 8
  %433 = icmp slt i64 %431, 2
  br i1 %433, label %434, label %__quantum__rt__array_update_reference_count.exit3.i.i21.i

434:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i20.i
  tail call void @free(i8* nonnull %383) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i21.i

__quantum__rt__array_update_reference_count.exit3.i.i21.i: ; preds = %434, %__quantum__rt__array_update_reference_count.exit2.i.i20.i
  %435 = load i64, i64* %417, align 8
  %436 = add nsw i64 %435, -1
  store i64 %436, i64* %417, align 8
  %437 = icmp slt i64 %435, 2
  br i1 %437, label %438, label %condContinue__1.i.i23.i

438:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i21.i
  tail call void @free(i8* nonnull %412) #2
  br label %condContinue__1.i.i23.i

condContinue__1.i.i23.i:                          ; preds = %438, %__quantum__rt__array_update_reference_count.exit3.i.i21.i, %382, %condTrue__1.i.i17.i
  %__qsVar1__newControls__.i.i22.i = phi %Array* [ %temps.i.i9.i, %condTrue__1.i.i17.i ], [ %temps.i.i9.i, %382 ], [ %426, %__quantum__rt__array_update_reference_count.exit3.i.i21.i ], [ %426, %438 ]
  %439 = bitcast %Array* %__qsVar1__newControls__.i.i22.i to i8*
  %440 = getelementptr inbounds i8, i8* %439, i64 24
  %441 = bitcast i8* %440 to i64*
  %442 = load i64, i64* %441, align 8
  %443 = add nsw i64 %442, 1
  store i64 %443, i64* %441, align 8
  %444 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %445 = bitcast i8* %444 to i64*
  %446 = getelementptr inbounds i8, i8* %444, i64 8
  %447 = bitcast i8* %446 to i64*
  %448 = getelementptr inbounds i8, i8* %444, i64 16
  %449 = bitcast i8* %448 to i64*
  store i64 16, i64* %445, align 8
  store i64 1, i64* %447, align 8
  store i64 0, i64* %449, align 8
  %450 = getelementptr inbounds i8, i8* %444, i64 24
  %451 = bitcast i8* %450 to %Tuple*
  %452 = bitcast %Tuple* %451 to { %Array*, %Qubit* }*
  %453 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %452, i64 0, i32 0
  %454 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %452, i64 0, i32 1
  %455 = getelementptr inbounds i8, i8* %439, i64 16
  %456 = bitcast i8* %455 to i64*
  %457 = load i64, i64* %456, align 8
  %458 = add nsw i64 %457, 1
  store i64 %458, i64* %456, align 8
  %459 = icmp slt i64 %457, 0
  br i1 %459, label %460, label %__quantum__rt__array_update_reference_count.exit5.i.i24.i

460:                                              ; preds = %condContinue__1.i.i23.i
  tail call void @free(i8* nonnull %439) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i24.i

__quantum__rt__array_update_reference_count.exit5.i.i24.i: ; preds = %460, %condContinue__1.i.i23.i
  store %Array* %__qsVar1__newControls__.i.i22.i, %Array** %453, align 8
  %461 = bitcast %Qubit** %454 to i64*
  store i64 %arg1.i.i7.i, i64* %461, align 8
  %462 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %313, align 8
  %463 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %462, i64 0, i64 0
  %464 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %463, align 8
  %465 = load i8*, i8** %316, align 8
  tail call void %464(i8* %465, i8* nonnull %450, i8* null)
  br i1 %.not.not9.i.i10.i, label %body__2.lr.ph.i.i26.i, label %exit__2.i.i30.i

body__2.lr.ph.i.i26.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i24.i
  %__qsVar0____qsVar0__numPair____11.i.i25.i = add nsw i64 %numControlPairs.i.i8.i, -1
  %466 = bitcast i8* %controls8.i.i6.i to i64*
  %467 = bitcast %Array* %temps.i.i9.i to i64*
  %468 = getelementptr inbounds i8, i8* %controls8.i.i6.i, i64 32
  %469 = getelementptr inbounds i8, i8* %347, i64 32
  br label %body__2.i.i29.i

body__2.i.i29.i:                                  ; preds = %body__2.lr.ph.i.i26.i, %exit_quantum_grouping40
  %470 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i25.i, %body__2.lr.ph.i.i26.i ], [ %487, %exit_quantum_grouping40 ]
  %471 = shl nuw i64 %470, 1
  %472 = load i64, i64* %466, align 8
  %473 = mul nsw i64 %472, %471
  %474 = getelementptr inbounds i8, i8* %468, i64 %473
  %475 = bitcast i8* %474 to %Qubit**
  %476 = load %Qubit*, %Qubit** %475, align 8
  %477 = or i64 %471, 1
  %478 = mul nsw i64 %477, %472
  %479 = getelementptr inbounds i8, i8* %468, i64 %478
  %480 = bitcast i8* %479 to %Qubit**
  %481 = load %Qubit*, %Qubit** %480, align 8
  %482 = load i64, i64* %467, align 8
  %483 = mul nsw i64 %482, %470
  %484 = getelementptr inbounds i8, i8* %469, i64 %483
  %485 = bitcast i8* %484 to %Qubit**
  %486 = load %Qubit*, %Qubit** %485, align 8
  %487 = add i64 %470, -1
  %488 = icmp sgt i64 %487, -1
  br label %quantum39

quantum39:                                        ; preds = %body__2.i.i29.i
  tail call void @__quantum__qis__h__body(%Qubit* %486)
  tail call void @__quantum__qis__cnot__body(%Qubit* %486, %Qubit* %481)
  tail call void @__quantum__qis__t__body(%Qubit* %481)
  tail call void @__quantum__qis__cnot__body(%Qubit* %476, %Qubit* %481)
  tail call void @__quantum__qis__cnot__body(%Qubit* %486, %Qubit* %476)
  tail call void @__quantum__qis__t__adj(%Qubit* %486)
  tail call void @__quantum__qis__t__body(%Qubit* %476)
  tail call void @__quantum__qis__t__adj(%Qubit* %481)
  tail call void @__quantum__qis__cnot__body(%Qubit* %476, %Qubit* %481)
  tail call void @__quantum__qis__cnot__body(%Qubit* %486, %Qubit* %476)
  tail call void @__quantum__qis__h__body(%Qubit* %486)
  br label %readout38

readout38:                                        ; preds = %quantum39
  br label %post-classical37

post-classical37:                                 ; preds = %readout38
  br label %exit_quantum_grouping40

exit_quantum_grouping40:                          ; preds = %post-classical37
  br i1 %488, label %body__2.i.i29.i, label %exit__2.i.i30.i

exit__2.i.i30.i:                                  ; preds = %exit_quantum_grouping40, %__quantum__rt__array_update_reference_count.exit5.i.i24.i
  %489 = load i64, i64* %349, align 8
  %490 = add nsw i64 %489, -1
  store i64 %490, i64* %349, align 8
  %491 = load i64, i64* %441, align 8
  %492 = add nsw i64 %491, -1
  store i64 %492, i64* %441, align 8
  %493 = load i64, i64* %456, align 8
  %494 = add nsw i64 %493, -1
  store i64 %494, i64* %456, align 8
  %495 = icmp slt i64 %493, 2
  br i1 %495, label %496, label %__quantum__rt__array_update_reference_count.exit6.i.i32.i

496:                                              ; preds = %exit__2.i.i30.i
  tail call void @free(i8* nonnull %439) #2
  %.pre.i.i31.i = load i64, i64* %456, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i32.i

__quantum__rt__array_update_reference_count.exit6.i.i32.i: ; preds = %496, %exit__2.i.i30.i
  %497 = phi i64 [ %494, %exit__2.i.i30.i ], [ %.pre.i.i31.i, %496 ]
  %498 = add nsw i64 %497, -1
  store i64 %498, i64* %456, align 8
  %499 = icmp slt i64 %497, 2
  br i1 %499, label %500, label %__quantum__rt__array_update_reference_count.exit7.i.i33.i

500:                                              ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i32.i
  tail call void @free(i8* nonnull %439) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i33.i

__quantum__rt__array_update_reference_count.exit7.i.i33.i: ; preds = %500, %__quantum__rt__array_update_reference_count.exit6.i.i32.i
  %501 = load i64, i64* %447, align 8
  %502 = add nsw i64 %501, -1
  store i64 %502, i64* %447, align 8
  %503 = icmp slt i64 %501, 2
  br i1 %503, label %504, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i

504:                                              ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i33.i
  tail call void @free(i8* nonnull %444) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i: ; preds = %504, %__quantum__rt__array_update_reference_count.exit7.i.i33.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i9.i)
  %505 = load i32, i32* %320, align 4
  %506 = add nsw i32 %505, -1
  store i32 %506, i32* %320, align 4
  %507 = load i64, i64* %340, align 8
  %508 = add nsw i64 %507, -1
  store i64 %508, i64* %340, align 8
  %509 = load i32, i32* %318, align 8
  %510 = add nsw i32 %509, -1
  store i32 %510, i32* %318, align 8
  %511 = load i64, i64* %267, align 8
  %512 = add nsw i64 %511, -1
  store i64 %512, i64* %267, align 8
  %513 = icmp slt i64 %511, 2
  br i1 %513, label %514, label %__quantum__rt__array_update_reference_count.exit1.i35.i

514:                                              ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i
  tail call void @free(i8* nonnull %262) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i35.i

__quantum__rt__array_update_reference_count.exit1.i35.i: ; preds = %514, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i
  %515 = load i64, i64* %325, align 8
  %516 = add nsw i64 %515, -1
  store i64 %516, i64* %325, align 8
  %517 = icmp slt i64 %515, 2
  br i1 %517, label %518, label %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i

518:                                              ; preds = %__quantum__rt__array_update_reference_count.exit1.i35.i
  tail call void @free(i8* nonnull %322) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i:  ; preds = %518, %__quantum__rt__array_update_reference_count.exit1.i35.i, %exit_quantum_grouping32, %exit_quantum_grouping28, %exit_quantum_grouping24
  %519 = load i64, i64* %269, align 8
  %520 = add nsw i64 %519, -1
  store i64 %520, i64* %269, align 8
  %521 = load i64, i64* %267, align 8
  %522 = add nsw i64 %521, -1
  store i64 %522, i64* %267, align 8
  %523 = icmp slt i64 %521, 2
  br i1 %523, label %524, label %Microsoft__Quantum__Canon__CZ__body.exit19.i

524:                                              ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i
  tail call void @free(i8* nonnull %262) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit19.i

Microsoft__Quantum__Canon__CZ__body.exit19.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.31.exit.i, %524
  %525 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %526 = bitcast i8* %525 to i64*
  %527 = getelementptr inbounds i8, i8* %525, i64 8
  %528 = bitcast i8* %527 to i64*
  %529 = getelementptr inbounds i8, i8* %525, i64 16
  %530 = bitcast i8* %529 to i64*
  %531 = getelementptr inbounds i8, i8* %525, i64 24
  %532 = bitcast i8* %531 to i64*
  store i64 8, i64* %526, align 8
  store i64 1, i64* %528, align 8
  store i64 1, i64* %530, align 8
  store i64 0, i64* %532, align 8
  %533 = getelementptr inbounds i8, i8* %525, i64 32
  %534 = bitcast i8* %533 to %Qubit**
  store %Qubit* inttoptr (i64 14 to %Qubit*), %Qubit** %534, align 8
  %535 = load i64, i64* %532, align 8
  %536 = add nsw i64 %535, 1
  store i64 %536, i64* %532, align 8
  %537 = load i64, i64* %528, align 8
  br label %quantum407

quantum407:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit19.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout406

readout406:                                       ; preds = %quantum407
  %538 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  br label %post-classical405

post-classical405:                                ; preds = %readout406
  br label %exit_quantum_grouping408

exit_quantum_grouping408:                         ; preds = %post-classical405
  switch i64 %537, label %else__1.i40.i [
    i64 0, label %then0__1.i36.i
    i64 1, label %then1__1.i38.i
    i64 2, label %then2__1.i39.i
  ]

then0__1.i36.i:                                   ; preds = %exit_quantum_grouping408
  br label %quantum43

quantum43:                                        ; preds = %then0__1.i36.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout42

readout42:                                        ; preds = %quantum43
  br label %post-classical41

post-classical41:                                 ; preds = %readout42
  br label %exit_quantum_grouping44

exit_quantum_grouping44:                          ; preds = %post-classical41
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i

then1__1.i38.i:                                   ; preds = %exit_quantum_grouping408
  %539 = load %Qubit*, %Qubit** %534, align 8
  br label %quantum47

quantum47:                                        ; preds = %then1__1.i38.i
  tail call void @__quantum__qis__cz__body(%Qubit* %539, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout46

readout46:                                        ; preds = %quantum47
  br label %post-classical45

post-classical45:                                 ; preds = %readout46
  br label %exit_quantum_grouping48

exit_quantum_grouping48:                          ; preds = %post-classical45
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i

then2__1.i39.i:                                   ; preds = %exit_quantum_grouping408
  %540 = bitcast i8* %525 to %Array*
  %541 = bitcast %Array* %540 to i64*
  %542 = load %Qubit*, %Qubit** %534, align 8
  %543 = load i64, i64* %541, align 8
  %544 = getelementptr inbounds i8, i8* %525, i64 %543
  %545 = getelementptr inbounds i8, i8* %544, i64 32
  %546 = bitcast i8* %545 to %Qubit**
  %547 = load %Qubit*, %Qubit** %546, align 8
  %548 = load %Qubit*, %Qubit** %534, align 8
  %549 = load %Qubit*, %Qubit** %534, align 8
  %550 = load i64, i64* %541, align 8
  %551 = getelementptr inbounds i8, i8* %525, i64 %550
  %552 = getelementptr inbounds i8, i8* %551, i64 32
  %553 = bitcast i8* %552 to %Qubit**
  %554 = load %Qubit*, %Qubit** %553, align 8
  %555 = load i64, i64* %541, align 8
  %556 = getelementptr inbounds i8, i8* %525, i64 %555
  %557 = getelementptr inbounds i8, i8* %556, i64 32
  %558 = bitcast i8* %557 to %Qubit**
  %559 = load %Qubit*, %Qubit** %558, align 8
  %560 = load %Qubit*, %Qubit** %534, align 8
  %561 = load %Qubit*, %Qubit** %534, align 8
  %562 = load i64, i64* %541, align 8
  %563 = getelementptr inbounds i8, i8* %525, i64 %562
  %564 = getelementptr inbounds i8, i8* %563, i64 32
  %565 = bitcast i8* %564 to %Qubit**
  %566 = load %Qubit*, %Qubit** %565, align 8
  %567 = load %Qubit*, %Qubit** %534, align 8
  %568 = load %Qubit*, %Qubit** %534, align 8
  %569 = load i64, i64* %541, align 8
  %570 = getelementptr inbounds i8, i8* %525, i64 %569
  %571 = getelementptr inbounds i8, i8* %570, i64 32
  %572 = bitcast i8* %571 to %Qubit**
  %573 = load %Qubit*, %Qubit** %572, align 8
  %574 = load %Qubit*, %Qubit** %534, align 8
  br label %quantum51

quantum51:                                        ; preds = %then2__1.i39.i
  tail call void @__quantum__qis__t__adj(%Qubit* %542)
  tail call void @__quantum__qis__t__adj(%Qubit* %547)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %548)
  tail call void @__quantum__qis__t__body(%Qubit* %549)
  tail call void @__quantum__qis__cnot__body(%Qubit* %554, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %559, %Qubit* %560)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %561)
  tail call void @__quantum__qis__cnot__body(%Qubit* %566, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %567)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %568)
  tail call void @__quantum__qis__cnot__body(%Qubit* %573, %Qubit* %574)
  br label %readout50

readout50:                                        ; preds = %quantum51
  br label %post-classical49

post-classical49:                                 ; preds = %readout50
  br label %exit_quantum_grouping52

exit_quantum_grouping52:                          ; preds = %post-classical49
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i

else__1.i40.i:                                    ; preds = %exit_quantum_grouping408
  %575 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %576 = bitcast i8* %575 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %576, align 8
  %577 = getelementptr inbounds i8, i8* %575, i64 8
  %578 = getelementptr inbounds i8, i8* %575, i64 16
  %579 = bitcast i8* %578 to i8**
  %580 = getelementptr inbounds i8, i8* %575, i64 24
  %581 = bitcast i8* %580 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %577, i8 0, i64 16, i1 false)
  store i32 1, i32* %581, align 8
  %582 = getelementptr inbounds i8, i8* %575, i64 28
  %583 = bitcast i8* %582 to i32*
  store i32 0, i32* %583, align 4
  %584 = bitcast i8* %575 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %584)
  %585 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %586 = bitcast i8* %585 to i64*
  %587 = getelementptr inbounds i8, i8* %585, i64 8
  %588 = bitcast i8* %587 to i64*
  %589 = getelementptr inbounds i8, i8* %585, i64 16
  %590 = bitcast i8* %589 to i64*
  store i64 16, i64* %586, align 8
  store i64 1, i64* %588, align 8
  store i64 0, i64* %590, align 8
  %591 = getelementptr inbounds i8, i8* %585, i64 24
  %592 = bitcast i8* %591 to %Tuple*
  %593 = bitcast %Tuple* %592 to { %Array*, %Qubit* }*
  %594 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %593, i64 0, i32 1
  %595 = load i64, i64* %530, align 8
  %596 = add nsw i64 %595, 1
  store i64 %596, i64* %530, align 8
  %597 = icmp slt i64 %595, 0
  br i1 %597, label %598, label %__quantum__rt__array_update_reference_count.exit.i46.i

598:                                              ; preds = %else__1.i40.i
  tail call void @free(i8* nonnull %525) #2
  br label %__quantum__rt__array_update_reference_count.exit.i46.i

__quantum__rt__array_update_reference_count.exit.i46.i: ; preds = %598, %else__1.i40.i
  %599 = bitcast %Tuple* %592 to i8**
  store i8* %525, i8** %599, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %594, align 8
  %600 = load i32, i32* %583, align 4
  %601 = add nsw i32 %600, 1
  store i32 %601, i32* %583, align 4
  %controls8.i.i41.i = load i8*, i8** %599, align 8
  %602 = getelementptr inbounds i8, i8* %controls8.i.i41.i, i64 24
  %603 = bitcast i8* %602 to i64*
  %604 = load i64, i64* %603, align 8
  %605 = add nsw i64 %604, 1
  store i64 %605, i64* %603, align 8
  %606 = bitcast %Qubit** %594 to i64*
  %arg1.i.i42.i = load i64, i64* %606, align 8
  %607 = getelementptr inbounds i8, i8* %controls8.i.i41.i, i64 8
  %608 = bitcast i8* %607 to i64*
  %609 = load i64, i64* %608, align 8
  %numControlPairs.i.i43.i = sdiv i64 %609, 2
  %temps.i.i44.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i43.i)
  %610 = bitcast %Array* %temps.i.i44.i to i8*
  %611 = getelementptr inbounds i8, i8* %610, i64 24
  %612 = bitcast i8* %611 to i64*
  %613 = load i64, i64* %612, align 8
  %614 = add nsw i64 %613, 1
  store i64 %614, i64* %612, align 8
  %.not.not9.i.i45.i = icmp sgt i64 %609, 1
  br i1 %.not.not9.i.i45.i, label %body__1.lr.ph.i.i47.i, label %exit__1.i.i51.i

body__1.lr.ph.i.i47.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit.i46.i
  %615 = bitcast i8* %controls8.i.i41.i to i64*
  %616 = bitcast %Array* %temps.i.i44.i to i64*
  %617 = getelementptr inbounds i8, i8* %controls8.i.i41.i, i64 32
  %618 = getelementptr inbounds i8, i8* %610, i64 32
  br label %body__1.i.i50.i

body__1.i.i50.i:                                  ; preds = %body__1.lr.ph.i.i47.i, %exit_quantum_grouping56
  %619 = phi i64 [ 0, %body__1.lr.ph.i.i47.i ], [ %636, %exit_quantum_grouping56 ]
  %620 = shl nuw i64 %619, 1
  %621 = load i64, i64* %615, align 8
  %622 = mul nsw i64 %621, %620
  %623 = getelementptr inbounds i8, i8* %617, i64 %622
  %624 = bitcast i8* %623 to %Qubit**
  %625 = load %Qubit*, %Qubit** %624, align 8
  %626 = or i64 %620, 1
  %627 = mul nsw i64 %626, %621
  %628 = getelementptr inbounds i8, i8* %617, i64 %627
  %629 = bitcast i8* %628 to %Qubit**
  %630 = load %Qubit*, %Qubit** %629, align 8
  %631 = load i64, i64* %616, align 8
  %632 = mul nsw i64 %631, %619
  %633 = getelementptr inbounds i8, i8* %618, i64 %632
  %634 = bitcast i8* %633 to %Qubit**
  %635 = load %Qubit*, %Qubit** %634, align 8
  %636 = add nuw nsw i64 %619, 1
  %637 = icmp eq i64 %636, %numControlPairs.i.i43.i
  br label %quantum55

quantum55:                                        ; preds = %body__1.i.i50.i
  tail call void @__quantum__qis__h__body(%Qubit* %635)
  tail call void @__quantum__qis__cnot__body(%Qubit* %635, %Qubit* %625)
  tail call void @__quantum__qis__cnot__body(%Qubit* %625, %Qubit* %630)
  tail call void @__quantum__qis__t__body(%Qubit* %630)
  tail call void @__quantum__qis__t__adj(%Qubit* %625)
  tail call void @__quantum__qis__t__body(%Qubit* %635)
  tail call void @__quantum__qis__cnot__body(%Qubit* %635, %Qubit* %625)
  tail call void @__quantum__qis__cnot__body(%Qubit* %625, %Qubit* %630)
  tail call void @__quantum__qis__t__adj(%Qubit* %630)
  tail call void @__quantum__qis__cnot__body(%Qubit* %635, %Qubit* %630)
  tail call void @__quantum__qis__h__body(%Qubit* %635)
  br label %readout54

readout54:                                        ; preds = %quantum55
  br label %post-classical53

post-classical53:                                 ; preds = %readout54
  br label %exit_quantum_grouping56

exit_quantum_grouping56:                          ; preds = %post-classical53
  br i1 %637, label %exit__1.i.i51.i, label %body__1.i.i50.i

exit__1.i.i51.i:                                  ; preds = %exit_quantum_grouping56, %__quantum__rt__array_update_reference_count.exit.i46.i
  %638 = and i64 %609, 1
  %639 = icmp eq i64 %638, 0
  br i1 %639, label %condTrue__1.i.i52.i, label %condFalse__1.i.i54.i

condTrue__1.i.i52.i:                              ; preds = %exit__1.i.i51.i
  %640 = getelementptr inbounds i8, i8* %610, i64 16
  %641 = bitcast i8* %640 to i64*
  %642 = load i64, i64* %641, align 8
  %643 = add nsw i64 %642, 1
  store i64 %643, i64* %641, align 8
  %644 = icmp slt i64 %642, 0
  br i1 %644, label %645, label %condContinue__1.i.i58.i

645:                                              ; preds = %condTrue__1.i.i52.i
  tail call void @free(i8* nonnull %610) #2
  br label %condContinue__1.i.i58.i

condFalse__1.i.i54.i:                             ; preds = %exit__1.i.i51.i
  %646 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %647 = bitcast i8* %646 to i64*
  %648 = getelementptr inbounds i8, i8* %646, i64 8
  %649 = bitcast i8* %648 to i64*
  %650 = getelementptr inbounds i8, i8* %646, i64 16
  %651 = bitcast i8* %650 to i64*
  %652 = getelementptr inbounds i8, i8* %646, i64 24
  %653 = bitcast i8* %652 to i64*
  store i64 8, i64* %647, align 8
  store i64 1, i64* %649, align 8
  store i64 1, i64* %651, align 8
  store i64 0, i64* %653, align 8
  %654 = getelementptr inbounds i8, i8* %646, i64 32
  %655 = add i64 %609, -1
  %656 = bitcast i8* %controls8.i.i41.i to i64*
  %657 = load i64, i64* %656, align 8
  %658 = mul nsw i64 %657, %655
  %659 = getelementptr inbounds i8, i8* %controls8.i.i41.i, i64 %658
  %660 = getelementptr inbounds i8, i8* %659, i64 32
  %661 = bitcast i8* %660 to i64*
  %662 = load i64, i64* %661, align 8
  %663 = bitcast i8* %654 to i64*
  store i64 %662, i64* %663, align 8
  %664 = bitcast %Array* %temps.i.i44.i to i64*
  %665 = load i64, i64* %664, align 8
  %666 = getelementptr inbounds i8, i8* %610, i64 8
  %667 = bitcast i8* %666 to i64*
  %668 = load i64, i64* %667, align 8
  %669 = load i64, i64* %649, align 8
  %670 = getelementptr inbounds i8, i8* %610, i64 32
  %671 = add nsw i64 %669, %668
  %sext.i.i.i53.i = shl i64 %665, 32
  %672 = ashr exact i64 %sext.i.i.i53.i, 32
  %673 = mul nsw i64 %671, %672
  %674 = add i64 %673, 32
  %675 = tail call i8* @malloc(i64 %674) #5
  %676 = bitcast i8* %675 to i64*
  %677 = getelementptr inbounds i8, i8* %675, i64 8
  %678 = bitcast i8* %677 to i64*
  %679 = getelementptr inbounds i8, i8* %675, i64 16
  %680 = bitcast i8* %679 to i64*
  %681 = getelementptr inbounds i8, i8* %675, i64 24
  %682 = bitcast i8* %681 to i64*
  store i64 %672, i64* %676, align 8
  store i64 %671, i64* %678, align 8
  store i64 1, i64* %680, align 8
  store i64 0, i64* %682, align 8
  %683 = getelementptr inbounds i8, i8* %675, i64 32
  %684 = mul nsw i64 %668, %665
  %685 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %683, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %683, i8* nonnull align 1 %670, i64 %684, i1 false) #2
  %686 = getelementptr inbounds i8, i8* %683, i64 %684
  %687 = mul nsw i64 %669, %665
  %688 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %686, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %686, i8* nonnull align 1 %654, i64 %687, i1 false) #2
  %689 = bitcast i8* %675 to %Array*
  %690 = load i64, i64* %680, align 8
  %691 = add nsw i64 %690, 1
  store i64 %691, i64* %680, align 8
  %692 = icmp slt i64 %690, 0
  br i1 %692, label %693, label %__quantum__rt__array_update_reference_count.exit2.i.i55.i

693:                                              ; preds = %condFalse__1.i.i54.i
  tail call void @free(i8* nonnull %675) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i55.i

__quantum__rt__array_update_reference_count.exit2.i.i55.i: ; preds = %693, %condFalse__1.i.i54.i
  %694 = load i64, i64* %651, align 8
  %695 = add nsw i64 %694, -1
  store i64 %695, i64* %651, align 8
  %696 = icmp slt i64 %694, 2
  br i1 %696, label %697, label %__quantum__rt__array_update_reference_count.exit3.i.i56.i

697:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i55.i
  tail call void @free(i8* nonnull %646) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i56.i

__quantum__rt__array_update_reference_count.exit3.i.i56.i: ; preds = %697, %__quantum__rt__array_update_reference_count.exit2.i.i55.i
  %698 = load i64, i64* %680, align 8
  %699 = add nsw i64 %698, -1
  store i64 %699, i64* %680, align 8
  %700 = icmp slt i64 %698, 2
  br i1 %700, label %701, label %condContinue__1.i.i58.i

701:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i56.i
  tail call void @free(i8* nonnull %675) #2
  br label %condContinue__1.i.i58.i

condContinue__1.i.i58.i:                          ; preds = %701, %__quantum__rt__array_update_reference_count.exit3.i.i56.i, %645, %condTrue__1.i.i52.i
  %__qsVar1__newControls__.i.i57.i = phi %Array* [ %temps.i.i44.i, %condTrue__1.i.i52.i ], [ %temps.i.i44.i, %645 ], [ %689, %__quantum__rt__array_update_reference_count.exit3.i.i56.i ], [ %689, %701 ]
  %702 = bitcast %Array* %__qsVar1__newControls__.i.i57.i to i8*
  %703 = getelementptr inbounds i8, i8* %702, i64 24
  %704 = bitcast i8* %703 to i64*
  %705 = load i64, i64* %704, align 8
  %706 = add nsw i64 %705, 1
  store i64 %706, i64* %704, align 8
  %707 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %708 = bitcast i8* %707 to i64*
  %709 = getelementptr inbounds i8, i8* %707, i64 8
  %710 = bitcast i8* %709 to i64*
  %711 = getelementptr inbounds i8, i8* %707, i64 16
  %712 = bitcast i8* %711 to i64*
  store i64 16, i64* %708, align 8
  store i64 1, i64* %710, align 8
  store i64 0, i64* %712, align 8
  %713 = getelementptr inbounds i8, i8* %707, i64 24
  %714 = bitcast i8* %713 to %Tuple*
  %715 = bitcast %Tuple* %714 to { %Array*, %Qubit* }*
  %716 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %715, i64 0, i32 0
  %717 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %715, i64 0, i32 1
  %718 = getelementptr inbounds i8, i8* %702, i64 16
  %719 = bitcast i8* %718 to i64*
  %720 = load i64, i64* %719, align 8
  %721 = add nsw i64 %720, 1
  store i64 %721, i64* %719, align 8
  %722 = icmp slt i64 %720, 0
  br i1 %722, label %723, label %__quantum__rt__array_update_reference_count.exit5.i.i59.i

723:                                              ; preds = %condContinue__1.i.i58.i
  tail call void @free(i8* nonnull %702) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i59.i

__quantum__rt__array_update_reference_count.exit5.i.i59.i: ; preds = %723, %condContinue__1.i.i58.i
  store %Array* %__qsVar1__newControls__.i.i57.i, %Array** %716, align 8
  %724 = bitcast %Qubit** %717 to i64*
  store i64 %arg1.i.i42.i, i64* %724, align 8
  %725 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %576, align 8
  %726 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %725, i64 0, i64 0
  %727 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %726, align 8
  %728 = load i8*, i8** %579, align 8
  tail call void %727(i8* %728, i8* nonnull %713, i8* null)
  br i1 %.not.not9.i.i45.i, label %body__2.lr.ph.i.i61.i, label %exit__2.i.i65.i

body__2.lr.ph.i.i61.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i59.i
  %__qsVar0____qsVar0__numPair____11.i.i60.i = add nsw i64 %numControlPairs.i.i43.i, -1
  %729 = bitcast i8* %controls8.i.i41.i to i64*
  %730 = bitcast %Array* %temps.i.i44.i to i64*
  %731 = getelementptr inbounds i8, i8* %controls8.i.i41.i, i64 32
  %732 = getelementptr inbounds i8, i8* %610, i64 32
  br label %body__2.i.i64.i

body__2.i.i64.i:                                  ; preds = %body__2.lr.ph.i.i61.i, %exit_quantum_grouping60
  %733 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i60.i, %body__2.lr.ph.i.i61.i ], [ %750, %exit_quantum_grouping60 ]
  %734 = shl nuw i64 %733, 1
  %735 = load i64, i64* %729, align 8
  %736 = mul nsw i64 %735, %734
  %737 = getelementptr inbounds i8, i8* %731, i64 %736
  %738 = bitcast i8* %737 to %Qubit**
  %739 = load %Qubit*, %Qubit** %738, align 8
  %740 = or i64 %734, 1
  %741 = mul nsw i64 %740, %735
  %742 = getelementptr inbounds i8, i8* %731, i64 %741
  %743 = bitcast i8* %742 to %Qubit**
  %744 = load %Qubit*, %Qubit** %743, align 8
  %745 = load i64, i64* %730, align 8
  %746 = mul nsw i64 %745, %733
  %747 = getelementptr inbounds i8, i8* %732, i64 %746
  %748 = bitcast i8* %747 to %Qubit**
  %749 = load %Qubit*, %Qubit** %748, align 8
  %750 = add i64 %733, -1
  %751 = icmp sgt i64 %750, -1
  br label %quantum59

quantum59:                                        ; preds = %body__2.i.i64.i
  tail call void @__quantum__qis__h__body(%Qubit* %749)
  tail call void @__quantum__qis__cnot__body(%Qubit* %749, %Qubit* %744)
  tail call void @__quantum__qis__t__body(%Qubit* %744)
  tail call void @__quantum__qis__cnot__body(%Qubit* %739, %Qubit* %744)
  tail call void @__quantum__qis__cnot__body(%Qubit* %749, %Qubit* %739)
  tail call void @__quantum__qis__t__adj(%Qubit* %749)
  tail call void @__quantum__qis__t__body(%Qubit* %739)
  tail call void @__quantum__qis__t__adj(%Qubit* %744)
  tail call void @__quantum__qis__cnot__body(%Qubit* %739, %Qubit* %744)
  tail call void @__quantum__qis__cnot__body(%Qubit* %749, %Qubit* %739)
  tail call void @__quantum__qis__h__body(%Qubit* %749)
  br label %readout58

readout58:                                        ; preds = %quantum59
  br label %post-classical57

post-classical57:                                 ; preds = %readout58
  br label %exit_quantum_grouping60

exit_quantum_grouping60:                          ; preds = %post-classical57
  br i1 %751, label %body__2.i.i64.i, label %exit__2.i.i65.i

exit__2.i.i65.i:                                  ; preds = %exit_quantum_grouping60, %__quantum__rt__array_update_reference_count.exit5.i.i59.i
  %752 = load i64, i64* %612, align 8
  %753 = add nsw i64 %752, -1
  store i64 %753, i64* %612, align 8
  %754 = load i64, i64* %704, align 8
  %755 = add nsw i64 %754, -1
  store i64 %755, i64* %704, align 8
  %756 = load i64, i64* %719, align 8
  %757 = add nsw i64 %756, -1
  store i64 %757, i64* %719, align 8
  %758 = icmp slt i64 %756, 2
  br i1 %758, label %759, label %__quantum__rt__array_update_reference_count.exit6.i.i67.i

759:                                              ; preds = %exit__2.i.i65.i
  tail call void @free(i8* nonnull %702) #2
  %.pre.i.i66.i = load i64, i64* %719, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i67.i

__quantum__rt__array_update_reference_count.exit6.i.i67.i: ; preds = %759, %exit__2.i.i65.i
  %760 = phi i64 [ %757, %exit__2.i.i65.i ], [ %.pre.i.i66.i, %759 ]
  %761 = add nsw i64 %760, -1
  store i64 %761, i64* %719, align 8
  %762 = icmp slt i64 %760, 2
  br i1 %762, label %763, label %__quantum__rt__array_update_reference_count.exit7.i.i68.i

763:                                              ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i67.i
  tail call void @free(i8* nonnull %702) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i68.i

__quantum__rt__array_update_reference_count.exit7.i.i68.i: ; preds = %763, %__quantum__rt__array_update_reference_count.exit6.i.i67.i
  %764 = load i64, i64* %710, align 8
  %765 = add nsw i64 %764, -1
  store i64 %765, i64* %710, align 8
  %766 = icmp slt i64 %764, 2
  br i1 %766, label %767, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i69.i

767:                                              ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i68.i
  tail call void @free(i8* nonnull %707) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i69.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i69.i: ; preds = %767, %__quantum__rt__array_update_reference_count.exit7.i.i68.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i44.i)
  %768 = load i32, i32* %583, align 4
  %769 = add nsw i32 %768, -1
  store i32 %769, i32* %583, align 4
  %770 = load i64, i64* %603, align 8
  %771 = add nsw i64 %770, -1
  store i64 %771, i64* %603, align 8
  %772 = load i32, i32* %581, align 8
  %773 = add nsw i32 %772, -1
  store i32 %773, i32* %581, align 8
  %774 = load i64, i64* %530, align 8
  %775 = add nsw i64 %774, -1
  store i64 %775, i64* %530, align 8
  %776 = icmp slt i64 %774, 2
  br i1 %776, label %777, label %__quantum__rt__array_update_reference_count.exit1.i70.i

777:                                              ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i69.i
  tail call void @free(i8* nonnull %525) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i70.i

__quantum__rt__array_update_reference_count.exit1.i70.i: ; preds = %777, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i69.i
  %778 = load i64, i64* %588, align 8
  %779 = add nsw i64 %778, -1
  store i64 %779, i64* %588, align 8
  %780 = icmp slt i64 %778, 2
  br i1 %780, label %781, label %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i

781:                                              ; preds = %__quantum__rt__array_update_reference_count.exit1.i70.i
  tail call void @free(i8* nonnull %585) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i:  ; preds = %781, %__quantum__rt__array_update_reference_count.exit1.i70.i, %exit_quantum_grouping52, %exit_quantum_grouping48, %exit_quantum_grouping44
  %782 = load i64, i64* %532, align 8
  %783 = add nsw i64 %782, -1
  store i64 %783, i64* %532, align 8
  %784 = load i64, i64* %530, align 8
  %785 = add nsw i64 %784, -1
  store i64 %785, i64* %530, align 8
  %786 = icmp slt i64 %784, 2
  br i1 %786, label %787, label %Microsoft__Quantum__Canon__CZ__body.exit20.i

787:                                              ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i
  tail call void @free(i8* nonnull %525) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit20.i

Microsoft__Quantum__Canon__CZ__body.exit20.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.32.exit.i, %787
  %788 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %789 = bitcast i8* %788 to i64*
  %790 = getelementptr inbounds i8, i8* %788, i64 8
  %791 = bitcast i8* %790 to i64*
  %792 = getelementptr inbounds i8, i8* %788, i64 16
  %793 = bitcast i8* %792 to i64*
  %794 = getelementptr inbounds i8, i8* %788, i64 24
  %795 = bitcast i8* %794 to i64*
  store i64 8, i64* %789, align 8
  store i64 1, i64* %791, align 8
  store i64 1, i64* %793, align 8
  store i64 0, i64* %795, align 8
  %796 = getelementptr inbounds i8, i8* %788, i64 32
  %797 = bitcast i8* %796 to %Qubit**
  store %Qubit* inttoptr (i64 15 to %Qubit*), %Qubit** %797, align 8
  %798 = load i64, i64* %795, align 8
  %799 = add nsw i64 %798, 1
  store i64 %799, i64* %795, align 8
  %800 = load i64, i64* %791, align 8
  br label %quantum411

quantum411:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit20.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  br label %readout410

readout410:                                       ; preds = %quantum411
  %801 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))
  br label %post-classical409

post-classical409:                                ; preds = %readout410
  br label %exit_quantum_grouping412

exit_quantum_grouping412:                         ; preds = %post-classical409
  switch i64 %800, label %else__1.i75.i [
    i64 0, label %then0__1.i71.i
    i64 1, label %then1__1.i73.i
    i64 2, label %then2__1.i74.i
  ]

then0__1.i71.i:                                   ; preds = %exit_quantum_grouping412
  br label %quantum63

quantum63:                                        ; preds = %then0__1.i71.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout62

readout62:                                        ; preds = %quantum63
  br label %post-classical61

post-classical61:                                 ; preds = %readout62
  br label %exit_quantum_grouping64

exit_quantum_grouping64:                          ; preds = %post-classical61
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i

then1__1.i73.i:                                   ; preds = %exit_quantum_grouping412
  %802 = load %Qubit*, %Qubit** %797, align 8
  br label %quantum67

quantum67:                                        ; preds = %then1__1.i73.i
  tail call void @__quantum__qis__cz__body(%Qubit* %802, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout66

readout66:                                        ; preds = %quantum67
  br label %post-classical65

post-classical65:                                 ; preds = %readout66
  br label %exit_quantum_grouping68

exit_quantum_grouping68:                          ; preds = %post-classical65
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i

then2__1.i74.i:                                   ; preds = %exit_quantum_grouping412
  %803 = bitcast i8* %788 to %Array*
  %804 = bitcast %Array* %803 to i64*
  %805 = load %Qubit*, %Qubit** %797, align 8
  %806 = load i64, i64* %804, align 8
  %807 = getelementptr inbounds i8, i8* %788, i64 %806
  %808 = getelementptr inbounds i8, i8* %807, i64 32
  %809 = bitcast i8* %808 to %Qubit**
  %810 = load %Qubit*, %Qubit** %809, align 8
  %811 = load %Qubit*, %Qubit** %797, align 8
  %812 = load %Qubit*, %Qubit** %797, align 8
  %813 = load i64, i64* %804, align 8
  %814 = getelementptr inbounds i8, i8* %788, i64 %813
  %815 = getelementptr inbounds i8, i8* %814, i64 32
  %816 = bitcast i8* %815 to %Qubit**
  %817 = load %Qubit*, %Qubit** %816, align 8
  %818 = load i64, i64* %804, align 8
  %819 = getelementptr inbounds i8, i8* %788, i64 %818
  %820 = getelementptr inbounds i8, i8* %819, i64 32
  %821 = bitcast i8* %820 to %Qubit**
  %822 = load %Qubit*, %Qubit** %821, align 8
  %823 = load %Qubit*, %Qubit** %797, align 8
  %824 = load %Qubit*, %Qubit** %797, align 8
  %825 = load i64, i64* %804, align 8
  %826 = getelementptr inbounds i8, i8* %788, i64 %825
  %827 = getelementptr inbounds i8, i8* %826, i64 32
  %828 = bitcast i8* %827 to %Qubit**
  %829 = load %Qubit*, %Qubit** %828, align 8
  %830 = load %Qubit*, %Qubit** %797, align 8
  %831 = load %Qubit*, %Qubit** %797, align 8
  %832 = load i64, i64* %804, align 8
  %833 = getelementptr inbounds i8, i8* %788, i64 %832
  %834 = getelementptr inbounds i8, i8* %833, i64 32
  %835 = bitcast i8* %834 to %Qubit**
  %836 = load %Qubit*, %Qubit** %835, align 8
  %837 = load %Qubit*, %Qubit** %797, align 8
  br label %quantum71

quantum71:                                        ; preds = %then2__1.i74.i
  tail call void @__quantum__qis__t__adj(%Qubit* %805)
  tail call void @__quantum__qis__t__adj(%Qubit* %810)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %811)
  tail call void @__quantum__qis__t__body(%Qubit* %812)
  tail call void @__quantum__qis__cnot__body(%Qubit* %817, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %822, %Qubit* %823)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %824)
  tail call void @__quantum__qis__cnot__body(%Qubit* %829, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %830)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %831)
  tail call void @__quantum__qis__cnot__body(%Qubit* %836, %Qubit* %837)
  br label %readout70

readout70:                                        ; preds = %quantum71
  br label %post-classical69

post-classical69:                                 ; preds = %readout70
  br label %exit_quantum_grouping72

exit_quantum_grouping72:                          ; preds = %post-classical69
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i

else__1.i75.i:                                    ; preds = %exit_quantum_grouping412
  %838 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %839 = bitcast i8* %838 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %839, align 8
  %840 = getelementptr inbounds i8, i8* %838, i64 8
  %841 = getelementptr inbounds i8, i8* %838, i64 16
  %842 = bitcast i8* %841 to i8**
  %843 = getelementptr inbounds i8, i8* %838, i64 24
  %844 = bitcast i8* %843 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %840, i8 0, i64 16, i1 false)
  store i32 1, i32* %844, align 8
  %845 = getelementptr inbounds i8, i8* %838, i64 28
  %846 = bitcast i8* %845 to i32*
  store i32 0, i32* %846, align 4
  %847 = bitcast i8* %838 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %847)
  %848 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %849 = bitcast i8* %848 to i64*
  %850 = getelementptr inbounds i8, i8* %848, i64 8
  %851 = bitcast i8* %850 to i64*
  %852 = getelementptr inbounds i8, i8* %848, i64 16
  %853 = bitcast i8* %852 to i64*
  store i64 16, i64* %849, align 8
  store i64 1, i64* %851, align 8
  store i64 0, i64* %853, align 8
  %854 = getelementptr inbounds i8, i8* %848, i64 24
  %855 = bitcast i8* %854 to %Tuple*
  %856 = bitcast %Tuple* %855 to { %Array*, %Qubit* }*
  %857 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %856, i64 0, i32 1
  %858 = load i64, i64* %793, align 8
  %859 = add nsw i64 %858, 1
  store i64 %859, i64* %793, align 8
  %860 = icmp slt i64 %858, 0
  br i1 %860, label %861, label %__quantum__rt__array_update_reference_count.exit.i81.i

861:                                              ; preds = %else__1.i75.i
  tail call void @free(i8* nonnull %788) #2
  br label %__quantum__rt__array_update_reference_count.exit.i81.i

__quantum__rt__array_update_reference_count.exit.i81.i: ; preds = %861, %else__1.i75.i
  %862 = bitcast %Tuple* %855 to i8**
  store i8* %788, i8** %862, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %857, align 8
  %863 = load i32, i32* %846, align 4
  %864 = add nsw i32 %863, 1
  store i32 %864, i32* %846, align 4
  %controls8.i.i76.i = load i8*, i8** %862, align 8
  %865 = getelementptr inbounds i8, i8* %controls8.i.i76.i, i64 24
  %866 = bitcast i8* %865 to i64*
  %867 = load i64, i64* %866, align 8
  %868 = add nsw i64 %867, 1
  store i64 %868, i64* %866, align 8
  %869 = bitcast %Qubit** %857 to i64*
  %arg1.i.i77.i = load i64, i64* %869, align 8
  %870 = getelementptr inbounds i8, i8* %controls8.i.i76.i, i64 8
  %871 = bitcast i8* %870 to i64*
  %872 = load i64, i64* %871, align 8
  %numControlPairs.i.i78.i = sdiv i64 %872, 2
  %temps.i.i79.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i78.i)
  %873 = bitcast %Array* %temps.i.i79.i to i8*
  %874 = getelementptr inbounds i8, i8* %873, i64 24
  %875 = bitcast i8* %874 to i64*
  %876 = load i64, i64* %875, align 8
  %877 = add nsw i64 %876, 1
  store i64 %877, i64* %875, align 8
  %.not.not9.i.i80.i = icmp sgt i64 %872, 1
  br i1 %.not.not9.i.i80.i, label %body__1.lr.ph.i.i82.i, label %exit__1.i.i86.i

body__1.lr.ph.i.i82.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit.i81.i
  %878 = bitcast i8* %controls8.i.i76.i to i64*
  %879 = bitcast %Array* %temps.i.i79.i to i64*
  %880 = getelementptr inbounds i8, i8* %controls8.i.i76.i, i64 32
  %881 = getelementptr inbounds i8, i8* %873, i64 32
  br label %body__1.i.i85.i

body__1.i.i85.i:                                  ; preds = %body__1.lr.ph.i.i82.i, %exit_quantum_grouping76
  %882 = phi i64 [ 0, %body__1.lr.ph.i.i82.i ], [ %899, %exit_quantum_grouping76 ]
  %883 = shl nuw i64 %882, 1
  %884 = load i64, i64* %878, align 8
  %885 = mul nsw i64 %884, %883
  %886 = getelementptr inbounds i8, i8* %880, i64 %885
  %887 = bitcast i8* %886 to %Qubit**
  %888 = load %Qubit*, %Qubit** %887, align 8
  %889 = or i64 %883, 1
  %890 = mul nsw i64 %889, %884
  %891 = getelementptr inbounds i8, i8* %880, i64 %890
  %892 = bitcast i8* %891 to %Qubit**
  %893 = load %Qubit*, %Qubit** %892, align 8
  %894 = load i64, i64* %879, align 8
  %895 = mul nsw i64 %894, %882
  %896 = getelementptr inbounds i8, i8* %881, i64 %895
  %897 = bitcast i8* %896 to %Qubit**
  %898 = load %Qubit*, %Qubit** %897, align 8
  %899 = add nuw nsw i64 %882, 1
  %900 = icmp eq i64 %899, %numControlPairs.i.i78.i
  br label %quantum75

quantum75:                                        ; preds = %body__1.i.i85.i
  tail call void @__quantum__qis__h__body(%Qubit* %898)
  tail call void @__quantum__qis__cnot__body(%Qubit* %898, %Qubit* %888)
  tail call void @__quantum__qis__cnot__body(%Qubit* %888, %Qubit* %893)
  tail call void @__quantum__qis__t__body(%Qubit* %893)
  tail call void @__quantum__qis__t__adj(%Qubit* %888)
  tail call void @__quantum__qis__t__body(%Qubit* %898)
  tail call void @__quantum__qis__cnot__body(%Qubit* %898, %Qubit* %888)
  tail call void @__quantum__qis__cnot__body(%Qubit* %888, %Qubit* %893)
  tail call void @__quantum__qis__t__adj(%Qubit* %893)
  tail call void @__quantum__qis__cnot__body(%Qubit* %898, %Qubit* %893)
  tail call void @__quantum__qis__h__body(%Qubit* %898)
  br label %readout74

readout74:                                        ; preds = %quantum75
  br label %post-classical73

post-classical73:                                 ; preds = %readout74
  br label %exit_quantum_grouping76

exit_quantum_grouping76:                          ; preds = %post-classical73
  br i1 %900, label %exit__1.i.i86.i, label %body__1.i.i85.i

exit__1.i.i86.i:                                  ; preds = %exit_quantum_grouping76, %__quantum__rt__array_update_reference_count.exit.i81.i
  %901 = and i64 %872, 1
  %902 = icmp eq i64 %901, 0
  br i1 %902, label %condTrue__1.i.i87.i, label %condFalse__1.i.i89.i

condTrue__1.i.i87.i:                              ; preds = %exit__1.i.i86.i
  %903 = getelementptr inbounds i8, i8* %873, i64 16
  %904 = bitcast i8* %903 to i64*
  %905 = load i64, i64* %904, align 8
  %906 = add nsw i64 %905, 1
  store i64 %906, i64* %904, align 8
  %907 = icmp slt i64 %905, 0
  br i1 %907, label %908, label %condContinue__1.i.i93.i

908:                                              ; preds = %condTrue__1.i.i87.i
  tail call void @free(i8* nonnull %873) #2
  br label %condContinue__1.i.i93.i

condFalse__1.i.i89.i:                             ; preds = %exit__1.i.i86.i
  %909 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %910 = bitcast i8* %909 to i64*
  %911 = getelementptr inbounds i8, i8* %909, i64 8
  %912 = bitcast i8* %911 to i64*
  %913 = getelementptr inbounds i8, i8* %909, i64 16
  %914 = bitcast i8* %913 to i64*
  %915 = getelementptr inbounds i8, i8* %909, i64 24
  %916 = bitcast i8* %915 to i64*
  store i64 8, i64* %910, align 8
  store i64 1, i64* %912, align 8
  store i64 1, i64* %914, align 8
  store i64 0, i64* %916, align 8
  %917 = getelementptr inbounds i8, i8* %909, i64 32
  %918 = add i64 %872, -1
  %919 = bitcast i8* %controls8.i.i76.i to i64*
  %920 = load i64, i64* %919, align 8
  %921 = mul nsw i64 %920, %918
  %922 = getelementptr inbounds i8, i8* %controls8.i.i76.i, i64 %921
  %923 = getelementptr inbounds i8, i8* %922, i64 32
  %924 = bitcast i8* %923 to i64*
  %925 = load i64, i64* %924, align 8
  %926 = bitcast i8* %917 to i64*
  store i64 %925, i64* %926, align 8
  %927 = bitcast %Array* %temps.i.i79.i to i64*
  %928 = load i64, i64* %927, align 8
  %929 = getelementptr inbounds i8, i8* %873, i64 8
  %930 = bitcast i8* %929 to i64*
  %931 = load i64, i64* %930, align 8
  %932 = load i64, i64* %912, align 8
  %933 = getelementptr inbounds i8, i8* %873, i64 32
  %934 = add nsw i64 %932, %931
  %sext.i.i.i88.i = shl i64 %928, 32
  %935 = ashr exact i64 %sext.i.i.i88.i, 32
  %936 = mul nsw i64 %934, %935
  %937 = add i64 %936, 32
  %938 = tail call i8* @malloc(i64 %937) #5
  %939 = bitcast i8* %938 to i64*
  %940 = getelementptr inbounds i8, i8* %938, i64 8
  %941 = bitcast i8* %940 to i64*
  %942 = getelementptr inbounds i8, i8* %938, i64 16
  %943 = bitcast i8* %942 to i64*
  %944 = getelementptr inbounds i8, i8* %938, i64 24
  %945 = bitcast i8* %944 to i64*
  store i64 %935, i64* %939, align 8
  store i64 %934, i64* %941, align 8
  store i64 1, i64* %943, align 8
  store i64 0, i64* %945, align 8
  %946 = getelementptr inbounds i8, i8* %938, i64 32
  %947 = mul nsw i64 %931, %928
  %948 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %946, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %946, i8* nonnull align 1 %933, i64 %947, i1 false) #2
  %949 = getelementptr inbounds i8, i8* %946, i64 %947
  %950 = mul nsw i64 %932, %928
  %951 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %949, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %949, i8* nonnull align 1 %917, i64 %950, i1 false) #2
  %952 = bitcast i8* %938 to %Array*
  %953 = load i64, i64* %943, align 8
  %954 = add nsw i64 %953, 1
  store i64 %954, i64* %943, align 8
  %955 = icmp slt i64 %953, 0
  br i1 %955, label %956, label %__quantum__rt__array_update_reference_count.exit2.i.i90.i

956:                                              ; preds = %condFalse__1.i.i89.i
  tail call void @free(i8* nonnull %938) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i90.i

__quantum__rt__array_update_reference_count.exit2.i.i90.i: ; preds = %956, %condFalse__1.i.i89.i
  %957 = load i64, i64* %914, align 8
  %958 = add nsw i64 %957, -1
  store i64 %958, i64* %914, align 8
  %959 = icmp slt i64 %957, 2
  br i1 %959, label %960, label %__quantum__rt__array_update_reference_count.exit3.i.i91.i

960:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i90.i
  tail call void @free(i8* nonnull %909) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i91.i

__quantum__rt__array_update_reference_count.exit3.i.i91.i: ; preds = %960, %__quantum__rt__array_update_reference_count.exit2.i.i90.i
  %961 = load i64, i64* %943, align 8
  %962 = add nsw i64 %961, -1
  store i64 %962, i64* %943, align 8
  %963 = icmp slt i64 %961, 2
  br i1 %963, label %964, label %condContinue__1.i.i93.i

964:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i91.i
  tail call void @free(i8* nonnull %938) #2
  br label %condContinue__1.i.i93.i

condContinue__1.i.i93.i:                          ; preds = %964, %__quantum__rt__array_update_reference_count.exit3.i.i91.i, %908, %condTrue__1.i.i87.i
  %__qsVar1__newControls__.i.i92.i = phi %Array* [ %temps.i.i79.i, %condTrue__1.i.i87.i ], [ %temps.i.i79.i, %908 ], [ %952, %__quantum__rt__array_update_reference_count.exit3.i.i91.i ], [ %952, %964 ]
  %965 = bitcast %Array* %__qsVar1__newControls__.i.i92.i to i8*
  %966 = getelementptr inbounds i8, i8* %965, i64 24
  %967 = bitcast i8* %966 to i64*
  %968 = load i64, i64* %967, align 8
  %969 = add nsw i64 %968, 1
  store i64 %969, i64* %967, align 8
  %970 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %971 = bitcast i8* %970 to i64*
  %972 = getelementptr inbounds i8, i8* %970, i64 8
  %973 = bitcast i8* %972 to i64*
  %974 = getelementptr inbounds i8, i8* %970, i64 16
  %975 = bitcast i8* %974 to i64*
  store i64 16, i64* %971, align 8
  store i64 1, i64* %973, align 8
  store i64 0, i64* %975, align 8
  %976 = getelementptr inbounds i8, i8* %970, i64 24
  %977 = bitcast i8* %976 to %Tuple*
  %978 = bitcast %Tuple* %977 to { %Array*, %Qubit* }*
  %979 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %978, i64 0, i32 0
  %980 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %978, i64 0, i32 1
  %981 = getelementptr inbounds i8, i8* %965, i64 16
  %982 = bitcast i8* %981 to i64*
  %983 = load i64, i64* %982, align 8
  %984 = add nsw i64 %983, 1
  store i64 %984, i64* %982, align 8
  %985 = icmp slt i64 %983, 0
  br i1 %985, label %986, label %__quantum__rt__array_update_reference_count.exit5.i.i94.i

986:                                              ; preds = %condContinue__1.i.i93.i
  tail call void @free(i8* nonnull %965) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i94.i

__quantum__rt__array_update_reference_count.exit5.i.i94.i: ; preds = %986, %condContinue__1.i.i93.i
  store %Array* %__qsVar1__newControls__.i.i92.i, %Array** %979, align 8
  %987 = bitcast %Qubit** %980 to i64*
  store i64 %arg1.i.i77.i, i64* %987, align 8
  %988 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %839, align 8
  %989 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %988, i64 0, i64 0
  %990 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %989, align 8
  %991 = load i8*, i8** %842, align 8
  tail call void %990(i8* %991, i8* nonnull %976, i8* null)
  br i1 %.not.not9.i.i80.i, label %body__2.lr.ph.i.i96.i, label %exit__2.i.i100.i

body__2.lr.ph.i.i96.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i94.i
  %__qsVar0____qsVar0__numPair____11.i.i95.i = add nsw i64 %numControlPairs.i.i78.i, -1
  %992 = bitcast i8* %controls8.i.i76.i to i64*
  %993 = bitcast %Array* %temps.i.i79.i to i64*
  %994 = getelementptr inbounds i8, i8* %controls8.i.i76.i, i64 32
  %995 = getelementptr inbounds i8, i8* %873, i64 32
  br label %body__2.i.i99.i

body__2.i.i99.i:                                  ; preds = %body__2.lr.ph.i.i96.i, %exit_quantum_grouping80
  %996 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i95.i, %body__2.lr.ph.i.i96.i ], [ %1013, %exit_quantum_grouping80 ]
  %997 = shl nuw i64 %996, 1
  %998 = load i64, i64* %992, align 8
  %999 = mul nsw i64 %998, %997
  %1000 = getelementptr inbounds i8, i8* %994, i64 %999
  %1001 = bitcast i8* %1000 to %Qubit**
  %1002 = load %Qubit*, %Qubit** %1001, align 8
  %1003 = or i64 %997, 1
  %1004 = mul nsw i64 %1003, %998
  %1005 = getelementptr inbounds i8, i8* %994, i64 %1004
  %1006 = bitcast i8* %1005 to %Qubit**
  %1007 = load %Qubit*, %Qubit** %1006, align 8
  %1008 = load i64, i64* %993, align 8
  %1009 = mul nsw i64 %1008, %996
  %1010 = getelementptr inbounds i8, i8* %995, i64 %1009
  %1011 = bitcast i8* %1010 to %Qubit**
  %1012 = load %Qubit*, %Qubit** %1011, align 8
  %1013 = add i64 %996, -1
  %1014 = icmp sgt i64 %1013, -1
  br label %quantum79

quantum79:                                        ; preds = %body__2.i.i99.i
  tail call void @__quantum__qis__h__body(%Qubit* %1012)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1012, %Qubit* %1007)
  tail call void @__quantum__qis__t__body(%Qubit* %1007)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1002, %Qubit* %1007)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1012, %Qubit* %1002)
  tail call void @__quantum__qis__t__adj(%Qubit* %1012)
  tail call void @__quantum__qis__t__body(%Qubit* %1002)
  tail call void @__quantum__qis__t__adj(%Qubit* %1007)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1002, %Qubit* %1007)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1012, %Qubit* %1002)
  tail call void @__quantum__qis__h__body(%Qubit* %1012)
  br label %readout78

readout78:                                        ; preds = %quantum79
  br label %post-classical77

post-classical77:                                 ; preds = %readout78
  br label %exit_quantum_grouping80

exit_quantum_grouping80:                          ; preds = %post-classical77
  br i1 %1014, label %body__2.i.i99.i, label %exit__2.i.i100.i

exit__2.i.i100.i:                                 ; preds = %exit_quantum_grouping80, %__quantum__rt__array_update_reference_count.exit5.i.i94.i
  %1015 = load i64, i64* %875, align 8
  %1016 = add nsw i64 %1015, -1
  store i64 %1016, i64* %875, align 8
  %1017 = load i64, i64* %967, align 8
  %1018 = add nsw i64 %1017, -1
  store i64 %1018, i64* %967, align 8
  %1019 = load i64, i64* %982, align 8
  %1020 = add nsw i64 %1019, -1
  store i64 %1020, i64* %982, align 8
  %1021 = icmp slt i64 %1019, 2
  br i1 %1021, label %1022, label %__quantum__rt__array_update_reference_count.exit6.i.i102.i

1022:                                             ; preds = %exit__2.i.i100.i
  tail call void @free(i8* nonnull %965) #2
  %.pre.i.i101.i = load i64, i64* %982, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i102.i

__quantum__rt__array_update_reference_count.exit6.i.i102.i: ; preds = %1022, %exit__2.i.i100.i
  %1023 = phi i64 [ %1020, %exit__2.i.i100.i ], [ %.pre.i.i101.i, %1022 ]
  %1024 = add nsw i64 %1023, -1
  store i64 %1024, i64* %982, align 8
  %1025 = icmp slt i64 %1023, 2
  br i1 %1025, label %1026, label %__quantum__rt__array_update_reference_count.exit7.i.i103.i

1026:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i102.i
  tail call void @free(i8* nonnull %965) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i103.i

__quantum__rt__array_update_reference_count.exit7.i.i103.i: ; preds = %1026, %__quantum__rt__array_update_reference_count.exit6.i.i102.i
  %1027 = load i64, i64* %973, align 8
  %1028 = add nsw i64 %1027, -1
  store i64 %1028, i64* %973, align 8
  %1029 = icmp slt i64 %1027, 2
  br i1 %1029, label %1030, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i104.i

1030:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i103.i
  tail call void @free(i8* nonnull %970) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i104.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i104.i: ; preds = %1030, %__quantum__rt__array_update_reference_count.exit7.i.i103.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i79.i)
  %1031 = load i32, i32* %846, align 4
  %1032 = add nsw i32 %1031, -1
  store i32 %1032, i32* %846, align 4
  %1033 = load i64, i64* %866, align 8
  %1034 = add nsw i64 %1033, -1
  store i64 %1034, i64* %866, align 8
  %1035 = load i32, i32* %844, align 8
  %1036 = add nsw i32 %1035, -1
  store i32 %1036, i32* %844, align 8
  %1037 = load i64, i64* %793, align 8
  %1038 = add nsw i64 %1037, -1
  store i64 %1038, i64* %793, align 8
  %1039 = icmp slt i64 %1037, 2
  br i1 %1039, label %1040, label %__quantum__rt__array_update_reference_count.exit1.i105.i

1040:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i104.i
  tail call void @free(i8* nonnull %788) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i105.i

__quantum__rt__array_update_reference_count.exit1.i105.i: ; preds = %1040, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i104.i
  %1041 = load i64, i64* %851, align 8
  %1042 = add nsw i64 %1041, -1
  store i64 %1042, i64* %851, align 8
  %1043 = icmp slt i64 %1041, 2
  br i1 %1043, label %1044, label %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i

1044:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i105.i
  tail call void @free(i8* nonnull %848) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i:  ; preds = %1044, %__quantum__rt__array_update_reference_count.exit1.i105.i, %exit_quantum_grouping72, %exit_quantum_grouping68, %exit_quantum_grouping64
  %1045 = load i64, i64* %795, align 8
  %1046 = add nsw i64 %1045, -1
  store i64 %1046, i64* %795, align 8
  %1047 = load i64, i64* %793, align 8
  %1048 = add nsw i64 %1047, -1
  store i64 %1048, i64* %793, align 8
  %1049 = icmp slt i64 %1047, 2
  br i1 %1049, label %1050, label %Microsoft__Quantum__Canon__CZ__body.exit21.i

1050:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i
  tail call void @free(i8* nonnull %788) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit21.i

Microsoft__Quantum__Canon__CZ__body.exit21.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.33.exit.i, %1050
  %1051 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1052 = bitcast i8* %1051 to i64*
  %1053 = getelementptr inbounds i8, i8* %1051, i64 8
  %1054 = bitcast i8* %1053 to i64*
  %1055 = getelementptr inbounds i8, i8* %1051, i64 16
  %1056 = bitcast i8* %1055 to i64*
  %1057 = getelementptr inbounds i8, i8* %1051, i64 24
  %1058 = bitcast i8* %1057 to i64*
  store i64 8, i64* %1052, align 8
  store i64 1, i64* %1054, align 8
  store i64 1, i64* %1056, align 8
  store i64 0, i64* %1058, align 8
  %1059 = getelementptr inbounds i8, i8* %1051, i64 32
  %1060 = bitcast i8* %1059 to %Qubit**
  store %Qubit* inttoptr (i64 16 to %Qubit*), %Qubit** %1060, align 8
  %1061 = load i64, i64* %1058, align 8
  %1062 = add nsw i64 %1061, 1
  store i64 %1062, i64* %1058, align 8
  %1063 = load i64, i64* %1054, align 8
  br label %quantum415

quantum415:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit21.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Result* nonnull inttoptr (i64 3 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout414

readout414:                                       ; preds = %quantum415
  %1064 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 3 to %Result*))
  br label %post-classical413

post-classical413:                                ; preds = %readout414
  br label %exit_quantum_grouping416

exit_quantum_grouping416:                         ; preds = %post-classical413
  switch i64 %1063, label %else__1.i110.i [
    i64 0, label %then0__1.i106.i
    i64 1, label %then1__1.i108.i
    i64 2, label %then2__1.i109.i
  ]

then0__1.i106.i:                                  ; preds = %exit_quantum_grouping416
  br label %quantum83

quantum83:                                        ; preds = %then0__1.i106.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  br label %readout82

readout82:                                        ; preds = %quantum83
  br label %post-classical81

post-classical81:                                 ; preds = %readout82
  br label %exit_quantum_grouping84

exit_quantum_grouping84:                          ; preds = %post-classical81
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i

then1__1.i108.i:                                  ; preds = %exit_quantum_grouping416
  %1065 = load %Qubit*, %Qubit** %1060, align 8
  br label %quantum87

quantum87:                                        ; preds = %then1__1.i108.i
  tail call void @__quantum__qis__cz__body(%Qubit* %1065, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  br label %readout86

readout86:                                        ; preds = %quantum87
  br label %post-classical85

post-classical85:                                 ; preds = %readout86
  br label %exit_quantum_grouping88

exit_quantum_grouping88:                          ; preds = %post-classical85
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i

then2__1.i109.i:                                  ; preds = %exit_quantum_grouping416
  %1066 = bitcast i8* %1051 to %Array*
  %1067 = bitcast %Array* %1066 to i64*
  %1068 = load %Qubit*, %Qubit** %1060, align 8
  %1069 = load i64, i64* %1067, align 8
  %1070 = getelementptr inbounds i8, i8* %1051, i64 %1069
  %1071 = getelementptr inbounds i8, i8* %1070, i64 32
  %1072 = bitcast i8* %1071 to %Qubit**
  %1073 = load %Qubit*, %Qubit** %1072, align 8
  %1074 = load %Qubit*, %Qubit** %1060, align 8
  %1075 = load %Qubit*, %Qubit** %1060, align 8
  %1076 = load i64, i64* %1067, align 8
  %1077 = getelementptr inbounds i8, i8* %1051, i64 %1076
  %1078 = getelementptr inbounds i8, i8* %1077, i64 32
  %1079 = bitcast i8* %1078 to %Qubit**
  %1080 = load %Qubit*, %Qubit** %1079, align 8
  %1081 = load i64, i64* %1067, align 8
  %1082 = getelementptr inbounds i8, i8* %1051, i64 %1081
  %1083 = getelementptr inbounds i8, i8* %1082, i64 32
  %1084 = bitcast i8* %1083 to %Qubit**
  %1085 = load %Qubit*, %Qubit** %1084, align 8
  %1086 = load %Qubit*, %Qubit** %1060, align 8
  %1087 = load %Qubit*, %Qubit** %1060, align 8
  %1088 = load i64, i64* %1067, align 8
  %1089 = getelementptr inbounds i8, i8* %1051, i64 %1088
  %1090 = getelementptr inbounds i8, i8* %1089, i64 32
  %1091 = bitcast i8* %1090 to %Qubit**
  %1092 = load %Qubit*, %Qubit** %1091, align 8
  %1093 = load %Qubit*, %Qubit** %1060, align 8
  %1094 = load %Qubit*, %Qubit** %1060, align 8
  %1095 = load i64, i64* %1067, align 8
  %1096 = getelementptr inbounds i8, i8* %1051, i64 %1095
  %1097 = getelementptr inbounds i8, i8* %1096, i64 32
  %1098 = bitcast i8* %1097 to %Qubit**
  %1099 = load %Qubit*, %Qubit** %1098, align 8
  %1100 = load %Qubit*, %Qubit** %1060, align 8
  br label %quantum91

quantum91:                                        ; preds = %then2__1.i109.i
  tail call void @__quantum__qis__t__adj(%Qubit* %1068)
  tail call void @__quantum__qis__t__adj(%Qubit* %1073)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*), %Qubit* %1074)
  tail call void @__quantum__qis__t__body(%Qubit* %1075)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1080, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %1085, %Qubit* %1086)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %1087)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1092, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*), %Qubit* %1093)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %1094)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1099, %Qubit* %1100)
  br label %readout90

readout90:                                        ; preds = %quantum91
  br label %post-classical89

post-classical89:                                 ; preds = %readout90
  br label %exit_quantum_grouping92

exit_quantum_grouping92:                          ; preds = %post-classical89
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i

else__1.i110.i:                                   ; preds = %exit_quantum_grouping416
  %1101 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %1102 = bitcast i8* %1101 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %1102, align 8
  %1103 = getelementptr inbounds i8, i8* %1101, i64 8
  %1104 = getelementptr inbounds i8, i8* %1101, i64 16
  %1105 = bitcast i8* %1104 to i8**
  %1106 = getelementptr inbounds i8, i8* %1101, i64 24
  %1107 = bitcast i8* %1106 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %1103, i8 0, i64 16, i1 false)
  store i32 1, i32* %1107, align 8
  %1108 = getelementptr inbounds i8, i8* %1101, i64 28
  %1109 = bitcast i8* %1108 to i32*
  store i32 0, i32* %1109, align 4
  %1110 = bitcast i8* %1101 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %1110)
  %1111 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1112 = bitcast i8* %1111 to i64*
  %1113 = getelementptr inbounds i8, i8* %1111, i64 8
  %1114 = bitcast i8* %1113 to i64*
  %1115 = getelementptr inbounds i8, i8* %1111, i64 16
  %1116 = bitcast i8* %1115 to i64*
  store i64 16, i64* %1112, align 8
  store i64 1, i64* %1114, align 8
  store i64 0, i64* %1116, align 8
  %1117 = getelementptr inbounds i8, i8* %1111, i64 24
  %1118 = bitcast i8* %1117 to %Tuple*
  %1119 = bitcast %Tuple* %1118 to { %Array*, %Qubit* }*
  %1120 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1119, i64 0, i32 1
  %1121 = load i64, i64* %1056, align 8
  %1122 = add nsw i64 %1121, 1
  store i64 %1122, i64* %1056, align 8
  %1123 = icmp slt i64 %1121, 0
  br i1 %1123, label %1124, label %__quantum__rt__array_update_reference_count.exit.i116.i

1124:                                             ; preds = %else__1.i110.i
  tail call void @free(i8* nonnull %1051) #2
  br label %__quantum__rt__array_update_reference_count.exit.i116.i

__quantum__rt__array_update_reference_count.exit.i116.i: ; preds = %1124, %else__1.i110.i
  %1125 = bitcast %Tuple* %1118 to i8**
  store i8* %1051, i8** %1125, align 8
  store %Qubit* inttoptr (i64 10 to %Qubit*), %Qubit** %1120, align 8
  %1126 = load i32, i32* %1109, align 4
  %1127 = add nsw i32 %1126, 1
  store i32 %1127, i32* %1109, align 4
  %controls8.i.i111.i = load i8*, i8** %1125, align 8
  %1128 = getelementptr inbounds i8, i8* %controls8.i.i111.i, i64 24
  %1129 = bitcast i8* %1128 to i64*
  %1130 = load i64, i64* %1129, align 8
  %1131 = add nsw i64 %1130, 1
  store i64 %1131, i64* %1129, align 8
  %1132 = bitcast %Qubit** %1120 to i64*
  %arg1.i.i112.i = load i64, i64* %1132, align 8
  %1133 = getelementptr inbounds i8, i8* %controls8.i.i111.i, i64 8
  %1134 = bitcast i8* %1133 to i64*
  %1135 = load i64, i64* %1134, align 8
  %numControlPairs.i.i113.i = sdiv i64 %1135, 2
  %temps.i.i114.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i113.i)
  %1136 = bitcast %Array* %temps.i.i114.i to i8*
  %1137 = getelementptr inbounds i8, i8* %1136, i64 24
  %1138 = bitcast i8* %1137 to i64*
  %1139 = load i64, i64* %1138, align 8
  %1140 = add nsw i64 %1139, 1
  store i64 %1140, i64* %1138, align 8
  %.not.not9.i.i115.i = icmp sgt i64 %1135, 1
  br i1 %.not.not9.i.i115.i, label %body__1.lr.ph.i.i117.i, label %exit__1.i.i121.i

body__1.lr.ph.i.i117.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i116.i
  %1141 = bitcast i8* %controls8.i.i111.i to i64*
  %1142 = bitcast %Array* %temps.i.i114.i to i64*
  %1143 = getelementptr inbounds i8, i8* %controls8.i.i111.i, i64 32
  %1144 = getelementptr inbounds i8, i8* %1136, i64 32
  br label %body__1.i.i120.i

body__1.i.i120.i:                                 ; preds = %body__1.lr.ph.i.i117.i, %exit_quantum_grouping96
  %1145 = phi i64 [ 0, %body__1.lr.ph.i.i117.i ], [ %1162, %exit_quantum_grouping96 ]
  %1146 = shl nuw i64 %1145, 1
  %1147 = load i64, i64* %1141, align 8
  %1148 = mul nsw i64 %1147, %1146
  %1149 = getelementptr inbounds i8, i8* %1143, i64 %1148
  %1150 = bitcast i8* %1149 to %Qubit**
  %1151 = load %Qubit*, %Qubit** %1150, align 8
  %1152 = or i64 %1146, 1
  %1153 = mul nsw i64 %1152, %1147
  %1154 = getelementptr inbounds i8, i8* %1143, i64 %1153
  %1155 = bitcast i8* %1154 to %Qubit**
  %1156 = load %Qubit*, %Qubit** %1155, align 8
  %1157 = load i64, i64* %1142, align 8
  %1158 = mul nsw i64 %1157, %1145
  %1159 = getelementptr inbounds i8, i8* %1144, i64 %1158
  %1160 = bitcast i8* %1159 to %Qubit**
  %1161 = load %Qubit*, %Qubit** %1160, align 8
  %1162 = add nuw nsw i64 %1145, 1
  %1163 = icmp eq i64 %1162, %numControlPairs.i.i113.i
  br label %quantum95

quantum95:                                        ; preds = %body__1.i.i120.i
  tail call void @__quantum__qis__h__body(%Qubit* %1161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1161, %Qubit* %1151)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1151, %Qubit* %1156)
  tail call void @__quantum__qis__t__body(%Qubit* %1156)
  tail call void @__quantum__qis__t__adj(%Qubit* %1151)
  tail call void @__quantum__qis__t__body(%Qubit* %1161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1161, %Qubit* %1151)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1151, %Qubit* %1156)
  tail call void @__quantum__qis__t__adj(%Qubit* %1156)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1161, %Qubit* %1156)
  tail call void @__quantum__qis__h__body(%Qubit* %1161)
  br label %readout94

readout94:                                        ; preds = %quantum95
  br label %post-classical93

post-classical93:                                 ; preds = %readout94
  br label %exit_quantum_grouping96

exit_quantum_grouping96:                          ; preds = %post-classical93
  br i1 %1163, label %exit__1.i.i121.i, label %body__1.i.i120.i

exit__1.i.i121.i:                                 ; preds = %exit_quantum_grouping96, %__quantum__rt__array_update_reference_count.exit.i116.i
  %1164 = and i64 %1135, 1
  %1165 = icmp eq i64 %1164, 0
  br i1 %1165, label %condTrue__1.i.i122.i, label %condFalse__1.i.i124.i

condTrue__1.i.i122.i:                             ; preds = %exit__1.i.i121.i
  %1166 = getelementptr inbounds i8, i8* %1136, i64 16
  %1167 = bitcast i8* %1166 to i64*
  %1168 = load i64, i64* %1167, align 8
  %1169 = add nsw i64 %1168, 1
  store i64 %1169, i64* %1167, align 8
  %1170 = icmp slt i64 %1168, 0
  br i1 %1170, label %1171, label %condContinue__1.i.i128.i

1171:                                             ; preds = %condTrue__1.i.i122.i
  tail call void @free(i8* nonnull %1136) #2
  br label %condContinue__1.i.i128.i

condFalse__1.i.i124.i:                            ; preds = %exit__1.i.i121.i
  %1172 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1173 = bitcast i8* %1172 to i64*
  %1174 = getelementptr inbounds i8, i8* %1172, i64 8
  %1175 = bitcast i8* %1174 to i64*
  %1176 = getelementptr inbounds i8, i8* %1172, i64 16
  %1177 = bitcast i8* %1176 to i64*
  %1178 = getelementptr inbounds i8, i8* %1172, i64 24
  %1179 = bitcast i8* %1178 to i64*
  store i64 8, i64* %1173, align 8
  store i64 1, i64* %1175, align 8
  store i64 1, i64* %1177, align 8
  store i64 0, i64* %1179, align 8
  %1180 = getelementptr inbounds i8, i8* %1172, i64 32
  %1181 = add i64 %1135, -1
  %1182 = bitcast i8* %controls8.i.i111.i to i64*
  %1183 = load i64, i64* %1182, align 8
  %1184 = mul nsw i64 %1183, %1181
  %1185 = getelementptr inbounds i8, i8* %controls8.i.i111.i, i64 %1184
  %1186 = getelementptr inbounds i8, i8* %1185, i64 32
  %1187 = bitcast i8* %1186 to i64*
  %1188 = load i64, i64* %1187, align 8
  %1189 = bitcast i8* %1180 to i64*
  store i64 %1188, i64* %1189, align 8
  %1190 = bitcast %Array* %temps.i.i114.i to i64*
  %1191 = load i64, i64* %1190, align 8
  %1192 = getelementptr inbounds i8, i8* %1136, i64 8
  %1193 = bitcast i8* %1192 to i64*
  %1194 = load i64, i64* %1193, align 8
  %1195 = load i64, i64* %1175, align 8
  %1196 = getelementptr inbounds i8, i8* %1136, i64 32
  %1197 = add nsw i64 %1195, %1194
  %sext.i.i.i123.i = shl i64 %1191, 32
  %1198 = ashr exact i64 %sext.i.i.i123.i, 32
  %1199 = mul nsw i64 %1197, %1198
  %1200 = add i64 %1199, 32
  %1201 = tail call i8* @malloc(i64 %1200) #5
  %1202 = bitcast i8* %1201 to i64*
  %1203 = getelementptr inbounds i8, i8* %1201, i64 8
  %1204 = bitcast i8* %1203 to i64*
  %1205 = getelementptr inbounds i8, i8* %1201, i64 16
  %1206 = bitcast i8* %1205 to i64*
  %1207 = getelementptr inbounds i8, i8* %1201, i64 24
  %1208 = bitcast i8* %1207 to i64*
  store i64 %1198, i64* %1202, align 8
  store i64 %1197, i64* %1204, align 8
  store i64 1, i64* %1206, align 8
  store i64 0, i64* %1208, align 8
  %1209 = getelementptr inbounds i8, i8* %1201, i64 32
  %1210 = mul nsw i64 %1194, %1191
  %1211 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1209, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1209, i8* nonnull align 1 %1196, i64 %1210, i1 false) #2
  %1212 = getelementptr inbounds i8, i8* %1209, i64 %1210
  %1213 = mul nsw i64 %1195, %1191
  %1214 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1212, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1212, i8* nonnull align 1 %1180, i64 %1213, i1 false) #2
  %1215 = bitcast i8* %1201 to %Array*
  %1216 = load i64, i64* %1206, align 8
  %1217 = add nsw i64 %1216, 1
  store i64 %1217, i64* %1206, align 8
  %1218 = icmp slt i64 %1216, 0
  br i1 %1218, label %1219, label %__quantum__rt__array_update_reference_count.exit2.i.i125.i

1219:                                             ; preds = %condFalse__1.i.i124.i
  tail call void @free(i8* nonnull %1201) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i125.i

__quantum__rt__array_update_reference_count.exit2.i.i125.i: ; preds = %1219, %condFalse__1.i.i124.i
  %1220 = load i64, i64* %1177, align 8
  %1221 = add nsw i64 %1220, -1
  store i64 %1221, i64* %1177, align 8
  %1222 = icmp slt i64 %1220, 2
  br i1 %1222, label %1223, label %__quantum__rt__array_update_reference_count.exit3.i.i126.i

1223:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i125.i
  tail call void @free(i8* nonnull %1172) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i126.i

__quantum__rt__array_update_reference_count.exit3.i.i126.i: ; preds = %1223, %__quantum__rt__array_update_reference_count.exit2.i.i125.i
  %1224 = load i64, i64* %1206, align 8
  %1225 = add nsw i64 %1224, -1
  store i64 %1225, i64* %1206, align 8
  %1226 = icmp slt i64 %1224, 2
  br i1 %1226, label %1227, label %condContinue__1.i.i128.i

1227:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i126.i
  tail call void @free(i8* nonnull %1201) #2
  br label %condContinue__1.i.i128.i

condContinue__1.i.i128.i:                         ; preds = %1227, %__quantum__rt__array_update_reference_count.exit3.i.i126.i, %1171, %condTrue__1.i.i122.i
  %__qsVar1__newControls__.i.i127.i = phi %Array* [ %temps.i.i114.i, %condTrue__1.i.i122.i ], [ %temps.i.i114.i, %1171 ], [ %1215, %__quantum__rt__array_update_reference_count.exit3.i.i126.i ], [ %1215, %1227 ]
  %1228 = bitcast %Array* %__qsVar1__newControls__.i.i127.i to i8*
  %1229 = getelementptr inbounds i8, i8* %1228, i64 24
  %1230 = bitcast i8* %1229 to i64*
  %1231 = load i64, i64* %1230, align 8
  %1232 = add nsw i64 %1231, 1
  store i64 %1232, i64* %1230, align 8
  %1233 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1234 = bitcast i8* %1233 to i64*
  %1235 = getelementptr inbounds i8, i8* %1233, i64 8
  %1236 = bitcast i8* %1235 to i64*
  %1237 = getelementptr inbounds i8, i8* %1233, i64 16
  %1238 = bitcast i8* %1237 to i64*
  store i64 16, i64* %1234, align 8
  store i64 1, i64* %1236, align 8
  store i64 0, i64* %1238, align 8
  %1239 = getelementptr inbounds i8, i8* %1233, i64 24
  %1240 = bitcast i8* %1239 to %Tuple*
  %1241 = bitcast %Tuple* %1240 to { %Array*, %Qubit* }*
  %1242 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1241, i64 0, i32 0
  %1243 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1241, i64 0, i32 1
  %1244 = getelementptr inbounds i8, i8* %1228, i64 16
  %1245 = bitcast i8* %1244 to i64*
  %1246 = load i64, i64* %1245, align 8
  %1247 = add nsw i64 %1246, 1
  store i64 %1247, i64* %1245, align 8
  %1248 = icmp slt i64 %1246, 0
  br i1 %1248, label %1249, label %__quantum__rt__array_update_reference_count.exit5.i.i129.i

1249:                                             ; preds = %condContinue__1.i.i128.i
  tail call void @free(i8* nonnull %1228) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i129.i

__quantum__rt__array_update_reference_count.exit5.i.i129.i: ; preds = %1249, %condContinue__1.i.i128.i
  store %Array* %__qsVar1__newControls__.i.i127.i, %Array** %1242, align 8
  %1250 = bitcast %Qubit** %1243 to i64*
  store i64 %arg1.i.i112.i, i64* %1250, align 8
  %1251 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %1102, align 8
  %1252 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %1251, i64 0, i64 0
  %1253 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %1252, align 8
  %1254 = load i8*, i8** %1105, align 8
  tail call void %1253(i8* %1254, i8* nonnull %1239, i8* null)
  br i1 %.not.not9.i.i115.i, label %body__2.lr.ph.i.i131.i, label %exit__2.i.i135.i

body__2.lr.ph.i.i131.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i129.i
  %__qsVar0____qsVar0__numPair____11.i.i130.i = add nsw i64 %numControlPairs.i.i113.i, -1
  %1255 = bitcast i8* %controls8.i.i111.i to i64*
  %1256 = bitcast %Array* %temps.i.i114.i to i64*
  %1257 = getelementptr inbounds i8, i8* %controls8.i.i111.i, i64 32
  %1258 = getelementptr inbounds i8, i8* %1136, i64 32
  br label %body__2.i.i134.i

body__2.i.i134.i:                                 ; preds = %body__2.lr.ph.i.i131.i, %exit_quantum_grouping100
  %1259 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i130.i, %body__2.lr.ph.i.i131.i ], [ %1276, %exit_quantum_grouping100 ]
  %1260 = shl nuw i64 %1259, 1
  %1261 = load i64, i64* %1255, align 8
  %1262 = mul nsw i64 %1261, %1260
  %1263 = getelementptr inbounds i8, i8* %1257, i64 %1262
  %1264 = bitcast i8* %1263 to %Qubit**
  %1265 = load %Qubit*, %Qubit** %1264, align 8
  %1266 = or i64 %1260, 1
  %1267 = mul nsw i64 %1266, %1261
  %1268 = getelementptr inbounds i8, i8* %1257, i64 %1267
  %1269 = bitcast i8* %1268 to %Qubit**
  %1270 = load %Qubit*, %Qubit** %1269, align 8
  %1271 = load i64, i64* %1256, align 8
  %1272 = mul nsw i64 %1271, %1259
  %1273 = getelementptr inbounds i8, i8* %1258, i64 %1272
  %1274 = bitcast i8* %1273 to %Qubit**
  %1275 = load %Qubit*, %Qubit** %1274, align 8
  %1276 = add i64 %1259, -1
  %1277 = icmp sgt i64 %1276, -1
  br label %quantum99

quantum99:                                        ; preds = %body__2.i.i134.i
  tail call void @__quantum__qis__h__body(%Qubit* %1275)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1275, %Qubit* %1270)
  tail call void @__quantum__qis__t__body(%Qubit* %1270)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1265, %Qubit* %1270)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1275, %Qubit* %1265)
  tail call void @__quantum__qis__t__adj(%Qubit* %1275)
  tail call void @__quantum__qis__t__body(%Qubit* %1265)
  tail call void @__quantum__qis__t__adj(%Qubit* %1270)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1265, %Qubit* %1270)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1275, %Qubit* %1265)
  tail call void @__quantum__qis__h__body(%Qubit* %1275)
  br label %readout98

readout98:                                        ; preds = %quantum99
  br label %post-classical97

post-classical97:                                 ; preds = %readout98
  br label %exit_quantum_grouping100

exit_quantum_grouping100:                         ; preds = %post-classical97
  br i1 %1277, label %body__2.i.i134.i, label %exit__2.i.i135.i

exit__2.i.i135.i:                                 ; preds = %exit_quantum_grouping100, %__quantum__rt__array_update_reference_count.exit5.i.i129.i
  %1278 = load i64, i64* %1138, align 8
  %1279 = add nsw i64 %1278, -1
  store i64 %1279, i64* %1138, align 8
  %1280 = load i64, i64* %1230, align 8
  %1281 = add nsw i64 %1280, -1
  store i64 %1281, i64* %1230, align 8
  %1282 = load i64, i64* %1245, align 8
  %1283 = add nsw i64 %1282, -1
  store i64 %1283, i64* %1245, align 8
  %1284 = icmp slt i64 %1282, 2
  br i1 %1284, label %1285, label %__quantum__rt__array_update_reference_count.exit6.i.i137.i

1285:                                             ; preds = %exit__2.i.i135.i
  tail call void @free(i8* nonnull %1228) #2
  %.pre.i.i136.i = load i64, i64* %1245, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i137.i

__quantum__rt__array_update_reference_count.exit6.i.i137.i: ; preds = %1285, %exit__2.i.i135.i
  %1286 = phi i64 [ %1283, %exit__2.i.i135.i ], [ %.pre.i.i136.i, %1285 ]
  %1287 = add nsw i64 %1286, -1
  store i64 %1287, i64* %1245, align 8
  %1288 = icmp slt i64 %1286, 2
  br i1 %1288, label %1289, label %__quantum__rt__array_update_reference_count.exit7.i.i138.i

1289:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i137.i
  tail call void @free(i8* nonnull %1228) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i138.i

__quantum__rt__array_update_reference_count.exit7.i.i138.i: ; preds = %1289, %__quantum__rt__array_update_reference_count.exit6.i.i137.i
  %1290 = load i64, i64* %1236, align 8
  %1291 = add nsw i64 %1290, -1
  store i64 %1291, i64* %1236, align 8
  %1292 = icmp slt i64 %1290, 2
  br i1 %1292, label %1293, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i139.i

1293:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i138.i
  tail call void @free(i8* nonnull %1233) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i139.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i139.i: ; preds = %1293, %__quantum__rt__array_update_reference_count.exit7.i.i138.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i114.i)
  %1294 = load i32, i32* %1109, align 4
  %1295 = add nsw i32 %1294, -1
  store i32 %1295, i32* %1109, align 4
  %1296 = load i64, i64* %1129, align 8
  %1297 = add nsw i64 %1296, -1
  store i64 %1297, i64* %1129, align 8
  %1298 = load i32, i32* %1107, align 8
  %1299 = add nsw i32 %1298, -1
  store i32 %1299, i32* %1107, align 8
  %1300 = load i64, i64* %1056, align 8
  %1301 = add nsw i64 %1300, -1
  store i64 %1301, i64* %1056, align 8
  %1302 = icmp slt i64 %1300, 2
  br i1 %1302, label %1303, label %__quantum__rt__array_update_reference_count.exit1.i140.i

1303:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i139.i
  tail call void @free(i8* nonnull %1051) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i140.i

__quantum__rt__array_update_reference_count.exit1.i140.i: ; preds = %1303, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i139.i
  %1304 = load i64, i64* %1114, align 8
  %1305 = add nsw i64 %1304, -1
  store i64 %1305, i64* %1114, align 8
  %1306 = icmp slt i64 %1304, 2
  br i1 %1306, label %1307, label %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i

1307:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i140.i
  tail call void @free(i8* nonnull %1111) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i:  ; preds = %1307, %__quantum__rt__array_update_reference_count.exit1.i140.i, %exit_quantum_grouping92, %exit_quantum_grouping88, %exit_quantum_grouping84
  %1308 = load i64, i64* %1058, align 8
  %1309 = add nsw i64 %1308, -1
  store i64 %1309, i64* %1058, align 8
  %1310 = load i64, i64* %1056, align 8
  %1311 = add nsw i64 %1310, -1
  store i64 %1311, i64* %1056, align 8
  %1312 = icmp slt i64 %1310, 2
  br i1 %1312, label %1313, label %Microsoft__Quantum__Canon__CZ__body.exit22.i

1313:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i
  tail call void @free(i8* nonnull %1051) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit22.i

Microsoft__Quantum__Canon__CZ__body.exit22.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.34.exit.i, %1313
  %1314 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1315 = bitcast i8* %1314 to i64*
  %1316 = getelementptr inbounds i8, i8* %1314, i64 8
  %1317 = bitcast i8* %1316 to i64*
  %1318 = getelementptr inbounds i8, i8* %1314, i64 16
  %1319 = bitcast i8* %1318 to i64*
  %1320 = getelementptr inbounds i8, i8* %1314, i64 24
  %1321 = bitcast i8* %1320 to i64*
  store i64 8, i64* %1315, align 8
  store i64 1, i64* %1317, align 8
  store i64 1, i64* %1319, align 8
  store i64 0, i64* %1321, align 8
  %1322 = getelementptr inbounds i8, i8* %1314, i64 32
  %1323 = bitcast i8* %1322 to %Qubit**
  store %Qubit* inttoptr (i64 17 to %Qubit*), %Qubit** %1323, align 8
  %1324 = load i64, i64* %1321, align 8
  %1325 = add nsw i64 %1324, 1
  store i64 %1325, i64* %1321, align 8
  %1326 = load i64, i64* %1317, align 8
  br label %quantum419

quantum419:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit22.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*), %Result* nonnull inttoptr (i64 4 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 16 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout418

readout418:                                       ; preds = %quantum419
  %1327 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 4 to %Result*))
  br label %post-classical417

post-classical417:                                ; preds = %readout418
  br label %exit_quantum_grouping420

exit_quantum_grouping420:                         ; preds = %post-classical417
  switch i64 %1326, label %else__1.i145.i [
    i64 0, label %then0__1.i141.i
    i64 1, label %then1__1.i143.i
    i64 2, label %then2__1.i144.i
  ]

then0__1.i141.i:                                  ; preds = %exit_quantum_grouping420
  br label %quantum103

quantum103:                                       ; preds = %then0__1.i141.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  br label %readout102

readout102:                                       ; preds = %quantum103
  br label %post-classical101

post-classical101:                                ; preds = %readout102
  br label %exit_quantum_grouping104

exit_quantum_grouping104:                         ; preds = %post-classical101
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i

then1__1.i143.i:                                  ; preds = %exit_quantum_grouping420
  %1328 = load %Qubit*, %Qubit** %1323, align 8
  br label %quantum107

quantum107:                                       ; preds = %then1__1.i143.i
  tail call void @__quantum__qis__cz__body(%Qubit* %1328, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  br label %readout106

readout106:                                       ; preds = %quantum107
  br label %post-classical105

post-classical105:                                ; preds = %readout106
  br label %exit_quantum_grouping108

exit_quantum_grouping108:                         ; preds = %post-classical105
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i

then2__1.i144.i:                                  ; preds = %exit_quantum_grouping420
  %1329 = bitcast i8* %1314 to %Array*
  %1330 = bitcast %Array* %1329 to i64*
  %1331 = load %Qubit*, %Qubit** %1323, align 8
  %1332 = load i64, i64* %1330, align 8
  %1333 = getelementptr inbounds i8, i8* %1314, i64 %1332
  %1334 = getelementptr inbounds i8, i8* %1333, i64 32
  %1335 = bitcast i8* %1334 to %Qubit**
  %1336 = load %Qubit*, %Qubit** %1335, align 8
  %1337 = load %Qubit*, %Qubit** %1323, align 8
  %1338 = load %Qubit*, %Qubit** %1323, align 8
  %1339 = load i64, i64* %1330, align 8
  %1340 = getelementptr inbounds i8, i8* %1314, i64 %1339
  %1341 = getelementptr inbounds i8, i8* %1340, i64 32
  %1342 = bitcast i8* %1341 to %Qubit**
  %1343 = load %Qubit*, %Qubit** %1342, align 8
  %1344 = load i64, i64* %1330, align 8
  %1345 = getelementptr inbounds i8, i8* %1314, i64 %1344
  %1346 = getelementptr inbounds i8, i8* %1345, i64 32
  %1347 = bitcast i8* %1346 to %Qubit**
  %1348 = load %Qubit*, %Qubit** %1347, align 8
  %1349 = load %Qubit*, %Qubit** %1323, align 8
  %1350 = load %Qubit*, %Qubit** %1323, align 8
  %1351 = load i64, i64* %1330, align 8
  %1352 = getelementptr inbounds i8, i8* %1314, i64 %1351
  %1353 = getelementptr inbounds i8, i8* %1352, i64 32
  %1354 = bitcast i8* %1353 to %Qubit**
  %1355 = load %Qubit*, %Qubit** %1354, align 8
  %1356 = load %Qubit*, %Qubit** %1323, align 8
  %1357 = load %Qubit*, %Qubit** %1323, align 8
  %1358 = load i64, i64* %1330, align 8
  %1359 = getelementptr inbounds i8, i8* %1314, i64 %1358
  %1360 = getelementptr inbounds i8, i8* %1359, i64 32
  %1361 = bitcast i8* %1360 to %Qubit**
  %1362 = load %Qubit*, %Qubit** %1361, align 8
  %1363 = load %Qubit*, %Qubit** %1323, align 8
  br label %quantum111

quantum111:                                       ; preds = %then2__1.i144.i
  tail call void @__quantum__qis__t__adj(%Qubit* %1331)
  tail call void @__quantum__qis__t__adj(%Qubit* %1336)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*), %Qubit* %1337)
  tail call void @__quantum__qis__t__body(%Qubit* %1338)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1343, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %1348, %Qubit* %1349)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %1350)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1355, %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*), %Qubit* %1356)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %1357)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1362, %Qubit* %1363)
  br label %readout110

readout110:                                       ; preds = %quantum111
  br label %post-classical109

post-classical109:                                ; preds = %readout110
  br label %exit_quantum_grouping112

exit_quantum_grouping112:                         ; preds = %post-classical109
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i

else__1.i145.i:                                   ; preds = %exit_quantum_grouping420
  %1364 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %1365 = bitcast i8* %1364 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %1365, align 8
  %1366 = getelementptr inbounds i8, i8* %1364, i64 8
  %1367 = getelementptr inbounds i8, i8* %1364, i64 16
  %1368 = bitcast i8* %1367 to i8**
  %1369 = getelementptr inbounds i8, i8* %1364, i64 24
  %1370 = bitcast i8* %1369 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %1366, i8 0, i64 16, i1 false)
  store i32 1, i32* %1370, align 8
  %1371 = getelementptr inbounds i8, i8* %1364, i64 28
  %1372 = bitcast i8* %1371 to i32*
  store i32 0, i32* %1372, align 4
  %1373 = bitcast i8* %1364 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %1373)
  %1374 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1375 = bitcast i8* %1374 to i64*
  %1376 = getelementptr inbounds i8, i8* %1374, i64 8
  %1377 = bitcast i8* %1376 to i64*
  %1378 = getelementptr inbounds i8, i8* %1374, i64 16
  %1379 = bitcast i8* %1378 to i64*
  store i64 16, i64* %1375, align 8
  store i64 1, i64* %1377, align 8
  store i64 0, i64* %1379, align 8
  %1380 = getelementptr inbounds i8, i8* %1374, i64 24
  %1381 = bitcast i8* %1380 to %Tuple*
  %1382 = bitcast %Tuple* %1381 to { %Array*, %Qubit* }*
  %1383 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1382, i64 0, i32 1
  %1384 = load i64, i64* %1319, align 8
  %1385 = add nsw i64 %1384, 1
  store i64 %1385, i64* %1319, align 8
  %1386 = icmp slt i64 %1384, 0
  br i1 %1386, label %1387, label %__quantum__rt__array_update_reference_count.exit.i151.i

1387:                                             ; preds = %else__1.i145.i
  tail call void @free(i8* nonnull %1314) #2
  br label %__quantum__rt__array_update_reference_count.exit.i151.i

__quantum__rt__array_update_reference_count.exit.i151.i: ; preds = %1387, %else__1.i145.i
  %1388 = bitcast %Tuple* %1381 to i8**
  store i8* %1314, i8** %1388, align 8
  store %Qubit* inttoptr (i64 10 to %Qubit*), %Qubit** %1383, align 8
  %1389 = load i32, i32* %1372, align 4
  %1390 = add nsw i32 %1389, 1
  store i32 %1390, i32* %1372, align 4
  %controls8.i.i146.i = load i8*, i8** %1388, align 8
  %1391 = getelementptr inbounds i8, i8* %controls8.i.i146.i, i64 24
  %1392 = bitcast i8* %1391 to i64*
  %1393 = load i64, i64* %1392, align 8
  %1394 = add nsw i64 %1393, 1
  store i64 %1394, i64* %1392, align 8
  %1395 = bitcast %Qubit** %1383 to i64*
  %arg1.i.i147.i = load i64, i64* %1395, align 8
  %1396 = getelementptr inbounds i8, i8* %controls8.i.i146.i, i64 8
  %1397 = bitcast i8* %1396 to i64*
  %1398 = load i64, i64* %1397, align 8
  %numControlPairs.i.i148.i = sdiv i64 %1398, 2
  %temps.i.i149.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i148.i)
  %1399 = bitcast %Array* %temps.i.i149.i to i8*
  %1400 = getelementptr inbounds i8, i8* %1399, i64 24
  %1401 = bitcast i8* %1400 to i64*
  %1402 = load i64, i64* %1401, align 8
  %1403 = add nsw i64 %1402, 1
  store i64 %1403, i64* %1401, align 8
  %.not.not9.i.i150.i = icmp sgt i64 %1398, 1
  br i1 %.not.not9.i.i150.i, label %body__1.lr.ph.i.i152.i, label %exit__1.i.i156.i

body__1.lr.ph.i.i152.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i151.i
  %1404 = bitcast i8* %controls8.i.i146.i to i64*
  %1405 = bitcast %Array* %temps.i.i149.i to i64*
  %1406 = getelementptr inbounds i8, i8* %controls8.i.i146.i, i64 32
  %1407 = getelementptr inbounds i8, i8* %1399, i64 32
  br label %body__1.i.i155.i

body__1.i.i155.i:                                 ; preds = %body__1.lr.ph.i.i152.i, %exit_quantum_grouping116
  %1408 = phi i64 [ 0, %body__1.lr.ph.i.i152.i ], [ %1425, %exit_quantum_grouping116 ]
  %1409 = shl nuw i64 %1408, 1
  %1410 = load i64, i64* %1404, align 8
  %1411 = mul nsw i64 %1410, %1409
  %1412 = getelementptr inbounds i8, i8* %1406, i64 %1411
  %1413 = bitcast i8* %1412 to %Qubit**
  %1414 = load %Qubit*, %Qubit** %1413, align 8
  %1415 = or i64 %1409, 1
  %1416 = mul nsw i64 %1415, %1410
  %1417 = getelementptr inbounds i8, i8* %1406, i64 %1416
  %1418 = bitcast i8* %1417 to %Qubit**
  %1419 = load %Qubit*, %Qubit** %1418, align 8
  %1420 = load i64, i64* %1405, align 8
  %1421 = mul nsw i64 %1420, %1408
  %1422 = getelementptr inbounds i8, i8* %1407, i64 %1421
  %1423 = bitcast i8* %1422 to %Qubit**
  %1424 = load %Qubit*, %Qubit** %1423, align 8
  %1425 = add nuw nsw i64 %1408, 1
  %1426 = icmp eq i64 %1425, %numControlPairs.i.i148.i
  br label %quantum115

quantum115:                                       ; preds = %body__1.i.i155.i
  tail call void @__quantum__qis__h__body(%Qubit* %1424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1424, %Qubit* %1414)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1414, %Qubit* %1419)
  tail call void @__quantum__qis__t__body(%Qubit* %1419)
  tail call void @__quantum__qis__t__adj(%Qubit* %1414)
  tail call void @__quantum__qis__t__body(%Qubit* %1424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1424, %Qubit* %1414)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1414, %Qubit* %1419)
  tail call void @__quantum__qis__t__adj(%Qubit* %1419)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1424, %Qubit* %1419)
  tail call void @__quantum__qis__h__body(%Qubit* %1424)
  br label %readout114

readout114:                                       ; preds = %quantum115
  br label %post-classical113

post-classical113:                                ; preds = %readout114
  br label %exit_quantum_grouping116

exit_quantum_grouping116:                         ; preds = %post-classical113
  br i1 %1426, label %exit__1.i.i156.i, label %body__1.i.i155.i

exit__1.i.i156.i:                                 ; preds = %exit_quantum_grouping116, %__quantum__rt__array_update_reference_count.exit.i151.i
  %1427 = and i64 %1398, 1
  %1428 = icmp eq i64 %1427, 0
  br i1 %1428, label %condTrue__1.i.i157.i, label %condFalse__1.i.i159.i

condTrue__1.i.i157.i:                             ; preds = %exit__1.i.i156.i
  %1429 = getelementptr inbounds i8, i8* %1399, i64 16
  %1430 = bitcast i8* %1429 to i64*
  %1431 = load i64, i64* %1430, align 8
  %1432 = add nsw i64 %1431, 1
  store i64 %1432, i64* %1430, align 8
  %1433 = icmp slt i64 %1431, 0
  br i1 %1433, label %1434, label %condContinue__1.i.i163.i

1434:                                             ; preds = %condTrue__1.i.i157.i
  tail call void @free(i8* nonnull %1399) #2
  br label %condContinue__1.i.i163.i

condFalse__1.i.i159.i:                            ; preds = %exit__1.i.i156.i
  %1435 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1436 = bitcast i8* %1435 to i64*
  %1437 = getelementptr inbounds i8, i8* %1435, i64 8
  %1438 = bitcast i8* %1437 to i64*
  %1439 = getelementptr inbounds i8, i8* %1435, i64 16
  %1440 = bitcast i8* %1439 to i64*
  %1441 = getelementptr inbounds i8, i8* %1435, i64 24
  %1442 = bitcast i8* %1441 to i64*
  store i64 8, i64* %1436, align 8
  store i64 1, i64* %1438, align 8
  store i64 1, i64* %1440, align 8
  store i64 0, i64* %1442, align 8
  %1443 = getelementptr inbounds i8, i8* %1435, i64 32
  %1444 = add i64 %1398, -1
  %1445 = bitcast i8* %controls8.i.i146.i to i64*
  %1446 = load i64, i64* %1445, align 8
  %1447 = mul nsw i64 %1446, %1444
  %1448 = getelementptr inbounds i8, i8* %controls8.i.i146.i, i64 %1447
  %1449 = getelementptr inbounds i8, i8* %1448, i64 32
  %1450 = bitcast i8* %1449 to i64*
  %1451 = load i64, i64* %1450, align 8
  %1452 = bitcast i8* %1443 to i64*
  store i64 %1451, i64* %1452, align 8
  %1453 = bitcast %Array* %temps.i.i149.i to i64*
  %1454 = load i64, i64* %1453, align 8
  %1455 = getelementptr inbounds i8, i8* %1399, i64 8
  %1456 = bitcast i8* %1455 to i64*
  %1457 = load i64, i64* %1456, align 8
  %1458 = load i64, i64* %1438, align 8
  %1459 = getelementptr inbounds i8, i8* %1399, i64 32
  %1460 = add nsw i64 %1458, %1457
  %sext.i.i.i158.i = shl i64 %1454, 32
  %1461 = ashr exact i64 %sext.i.i.i158.i, 32
  %1462 = mul nsw i64 %1460, %1461
  %1463 = add i64 %1462, 32
  %1464 = tail call i8* @malloc(i64 %1463) #5
  %1465 = bitcast i8* %1464 to i64*
  %1466 = getelementptr inbounds i8, i8* %1464, i64 8
  %1467 = bitcast i8* %1466 to i64*
  %1468 = getelementptr inbounds i8, i8* %1464, i64 16
  %1469 = bitcast i8* %1468 to i64*
  %1470 = getelementptr inbounds i8, i8* %1464, i64 24
  %1471 = bitcast i8* %1470 to i64*
  store i64 %1461, i64* %1465, align 8
  store i64 %1460, i64* %1467, align 8
  store i64 1, i64* %1469, align 8
  store i64 0, i64* %1471, align 8
  %1472 = getelementptr inbounds i8, i8* %1464, i64 32
  %1473 = mul nsw i64 %1457, %1454
  %1474 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1472, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1472, i8* nonnull align 1 %1459, i64 %1473, i1 false) #2
  %1475 = getelementptr inbounds i8, i8* %1472, i64 %1473
  %1476 = mul nsw i64 %1458, %1454
  %1477 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1475, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1475, i8* nonnull align 1 %1443, i64 %1476, i1 false) #2
  %1478 = bitcast i8* %1464 to %Array*
  %1479 = load i64, i64* %1469, align 8
  %1480 = add nsw i64 %1479, 1
  store i64 %1480, i64* %1469, align 8
  %1481 = icmp slt i64 %1479, 0
  br i1 %1481, label %1482, label %__quantum__rt__array_update_reference_count.exit2.i.i160.i

1482:                                             ; preds = %condFalse__1.i.i159.i
  tail call void @free(i8* nonnull %1464) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i160.i

__quantum__rt__array_update_reference_count.exit2.i.i160.i: ; preds = %1482, %condFalse__1.i.i159.i
  %1483 = load i64, i64* %1440, align 8
  %1484 = add nsw i64 %1483, -1
  store i64 %1484, i64* %1440, align 8
  %1485 = icmp slt i64 %1483, 2
  br i1 %1485, label %1486, label %__quantum__rt__array_update_reference_count.exit3.i.i161.i

1486:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i160.i
  tail call void @free(i8* nonnull %1435) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i161.i

__quantum__rt__array_update_reference_count.exit3.i.i161.i: ; preds = %1486, %__quantum__rt__array_update_reference_count.exit2.i.i160.i
  %1487 = load i64, i64* %1469, align 8
  %1488 = add nsw i64 %1487, -1
  store i64 %1488, i64* %1469, align 8
  %1489 = icmp slt i64 %1487, 2
  br i1 %1489, label %1490, label %condContinue__1.i.i163.i

1490:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i161.i
  tail call void @free(i8* nonnull %1464) #2
  br label %condContinue__1.i.i163.i

condContinue__1.i.i163.i:                         ; preds = %1490, %__quantum__rt__array_update_reference_count.exit3.i.i161.i, %1434, %condTrue__1.i.i157.i
  %__qsVar1__newControls__.i.i162.i = phi %Array* [ %temps.i.i149.i, %condTrue__1.i.i157.i ], [ %temps.i.i149.i, %1434 ], [ %1478, %__quantum__rt__array_update_reference_count.exit3.i.i161.i ], [ %1478, %1490 ]
  %1491 = bitcast %Array* %__qsVar1__newControls__.i.i162.i to i8*
  %1492 = getelementptr inbounds i8, i8* %1491, i64 24
  %1493 = bitcast i8* %1492 to i64*
  %1494 = load i64, i64* %1493, align 8
  %1495 = add nsw i64 %1494, 1
  store i64 %1495, i64* %1493, align 8
  %1496 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1497 = bitcast i8* %1496 to i64*
  %1498 = getelementptr inbounds i8, i8* %1496, i64 8
  %1499 = bitcast i8* %1498 to i64*
  %1500 = getelementptr inbounds i8, i8* %1496, i64 16
  %1501 = bitcast i8* %1500 to i64*
  store i64 16, i64* %1497, align 8
  store i64 1, i64* %1499, align 8
  store i64 0, i64* %1501, align 8
  %1502 = getelementptr inbounds i8, i8* %1496, i64 24
  %1503 = bitcast i8* %1502 to %Tuple*
  %1504 = bitcast %Tuple* %1503 to { %Array*, %Qubit* }*
  %1505 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1504, i64 0, i32 0
  %1506 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1504, i64 0, i32 1
  %1507 = getelementptr inbounds i8, i8* %1491, i64 16
  %1508 = bitcast i8* %1507 to i64*
  %1509 = load i64, i64* %1508, align 8
  %1510 = add nsw i64 %1509, 1
  store i64 %1510, i64* %1508, align 8
  %1511 = icmp slt i64 %1509, 0
  br i1 %1511, label %1512, label %__quantum__rt__array_update_reference_count.exit5.i.i164.i

1512:                                             ; preds = %condContinue__1.i.i163.i
  tail call void @free(i8* nonnull %1491) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i164.i

__quantum__rt__array_update_reference_count.exit5.i.i164.i: ; preds = %1512, %condContinue__1.i.i163.i
  store %Array* %__qsVar1__newControls__.i.i162.i, %Array** %1505, align 8
  %1513 = bitcast %Qubit** %1506 to i64*
  store i64 %arg1.i.i147.i, i64* %1513, align 8
  %1514 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %1365, align 8
  %1515 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %1514, i64 0, i64 0
  %1516 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %1515, align 8
  %1517 = load i8*, i8** %1368, align 8
  tail call void %1516(i8* %1517, i8* nonnull %1502, i8* null)
  br i1 %.not.not9.i.i150.i, label %body__2.lr.ph.i.i166.i, label %exit__2.i.i170.i

body__2.lr.ph.i.i166.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i164.i
  %__qsVar0____qsVar0__numPair____11.i.i165.i = add nsw i64 %numControlPairs.i.i148.i, -1
  %1518 = bitcast i8* %controls8.i.i146.i to i64*
  %1519 = bitcast %Array* %temps.i.i149.i to i64*
  %1520 = getelementptr inbounds i8, i8* %controls8.i.i146.i, i64 32
  %1521 = getelementptr inbounds i8, i8* %1399, i64 32
  br label %body__2.i.i169.i

body__2.i.i169.i:                                 ; preds = %body__2.lr.ph.i.i166.i, %exit_quantum_grouping120
  %1522 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i165.i, %body__2.lr.ph.i.i166.i ], [ %1539, %exit_quantum_grouping120 ]
  %1523 = shl nuw i64 %1522, 1
  %1524 = load i64, i64* %1518, align 8
  %1525 = mul nsw i64 %1524, %1523
  %1526 = getelementptr inbounds i8, i8* %1520, i64 %1525
  %1527 = bitcast i8* %1526 to %Qubit**
  %1528 = load %Qubit*, %Qubit** %1527, align 8
  %1529 = or i64 %1523, 1
  %1530 = mul nsw i64 %1529, %1524
  %1531 = getelementptr inbounds i8, i8* %1520, i64 %1530
  %1532 = bitcast i8* %1531 to %Qubit**
  %1533 = load %Qubit*, %Qubit** %1532, align 8
  %1534 = load i64, i64* %1519, align 8
  %1535 = mul nsw i64 %1534, %1522
  %1536 = getelementptr inbounds i8, i8* %1521, i64 %1535
  %1537 = bitcast i8* %1536 to %Qubit**
  %1538 = load %Qubit*, %Qubit** %1537, align 8
  %1539 = add i64 %1522, -1
  %1540 = icmp sgt i64 %1539, -1
  br label %quantum119

quantum119:                                       ; preds = %body__2.i.i169.i
  tail call void @__quantum__qis__h__body(%Qubit* %1538)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1538, %Qubit* %1533)
  tail call void @__quantum__qis__t__body(%Qubit* %1533)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1528, %Qubit* %1533)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1538, %Qubit* %1528)
  tail call void @__quantum__qis__t__adj(%Qubit* %1538)
  tail call void @__quantum__qis__t__body(%Qubit* %1528)
  tail call void @__quantum__qis__t__adj(%Qubit* %1533)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1528, %Qubit* %1533)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1538, %Qubit* %1528)
  tail call void @__quantum__qis__h__body(%Qubit* %1538)
  br label %readout118

readout118:                                       ; preds = %quantum119
  br label %post-classical117

post-classical117:                                ; preds = %readout118
  br label %exit_quantum_grouping120

exit_quantum_grouping120:                         ; preds = %post-classical117
  br i1 %1540, label %body__2.i.i169.i, label %exit__2.i.i170.i

exit__2.i.i170.i:                                 ; preds = %exit_quantum_grouping120, %__quantum__rt__array_update_reference_count.exit5.i.i164.i
  %1541 = load i64, i64* %1401, align 8
  %1542 = add nsw i64 %1541, -1
  store i64 %1542, i64* %1401, align 8
  %1543 = load i64, i64* %1493, align 8
  %1544 = add nsw i64 %1543, -1
  store i64 %1544, i64* %1493, align 8
  %1545 = load i64, i64* %1508, align 8
  %1546 = add nsw i64 %1545, -1
  store i64 %1546, i64* %1508, align 8
  %1547 = icmp slt i64 %1545, 2
  br i1 %1547, label %1548, label %__quantum__rt__array_update_reference_count.exit6.i.i172.i

1548:                                             ; preds = %exit__2.i.i170.i
  tail call void @free(i8* nonnull %1491) #2
  %.pre.i.i171.i = load i64, i64* %1508, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i172.i

__quantum__rt__array_update_reference_count.exit6.i.i172.i: ; preds = %1548, %exit__2.i.i170.i
  %1549 = phi i64 [ %1546, %exit__2.i.i170.i ], [ %.pre.i.i171.i, %1548 ]
  %1550 = add nsw i64 %1549, -1
  store i64 %1550, i64* %1508, align 8
  %1551 = icmp slt i64 %1549, 2
  br i1 %1551, label %1552, label %__quantum__rt__array_update_reference_count.exit7.i.i173.i

1552:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i172.i
  tail call void @free(i8* nonnull %1491) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i173.i

__quantum__rt__array_update_reference_count.exit7.i.i173.i: ; preds = %1552, %__quantum__rt__array_update_reference_count.exit6.i.i172.i
  %1553 = load i64, i64* %1499, align 8
  %1554 = add nsw i64 %1553, -1
  store i64 %1554, i64* %1499, align 8
  %1555 = icmp slt i64 %1553, 2
  br i1 %1555, label %1556, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i174.i

1556:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i173.i
  tail call void @free(i8* nonnull %1496) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i174.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i174.i: ; preds = %1556, %__quantum__rt__array_update_reference_count.exit7.i.i173.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i149.i)
  %1557 = load i32, i32* %1372, align 4
  %1558 = add nsw i32 %1557, -1
  store i32 %1558, i32* %1372, align 4
  %1559 = load i64, i64* %1392, align 8
  %1560 = add nsw i64 %1559, -1
  store i64 %1560, i64* %1392, align 8
  %1561 = load i32, i32* %1370, align 8
  %1562 = add nsw i32 %1561, -1
  store i32 %1562, i32* %1370, align 8
  %1563 = load i64, i64* %1319, align 8
  %1564 = add nsw i64 %1563, -1
  store i64 %1564, i64* %1319, align 8
  %1565 = icmp slt i64 %1563, 2
  br i1 %1565, label %1566, label %__quantum__rt__array_update_reference_count.exit1.i175.i

1566:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i174.i
  tail call void @free(i8* nonnull %1314) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i175.i

__quantum__rt__array_update_reference_count.exit1.i175.i: ; preds = %1566, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i174.i
  %1567 = load i64, i64* %1377, align 8
  %1568 = add nsw i64 %1567, -1
  store i64 %1568, i64* %1377, align 8
  %1569 = icmp slt i64 %1567, 2
  br i1 %1569, label %1570, label %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i

1570:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i175.i
  tail call void @free(i8* nonnull %1374) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i:  ; preds = %1570, %__quantum__rt__array_update_reference_count.exit1.i175.i, %exit_quantum_grouping112, %exit_quantum_grouping108, %exit_quantum_grouping104
  %1571 = load i64, i64* %1321, align 8
  %1572 = add nsw i64 %1571, -1
  store i64 %1572, i64* %1321, align 8
  %1573 = load i64, i64* %1319, align 8
  %1574 = add nsw i64 %1573, -1
  store i64 %1574, i64* %1319, align 8
  %1575 = icmp slt i64 %1573, 2
  br i1 %1575, label %1576, label %Microsoft__Quantum__Canon__CZ__body.exit23.i

1576:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i
  tail call void @free(i8* nonnull %1314) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit23.i

Microsoft__Quantum__Canon__CZ__body.exit23.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.35.exit.i, %1576
  %1577 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1578 = bitcast i8* %1577 to i64*
  %1579 = getelementptr inbounds i8, i8* %1577, i64 8
  %1580 = bitcast i8* %1579 to i64*
  %1581 = getelementptr inbounds i8, i8* %1577, i64 16
  %1582 = bitcast i8* %1581 to i64*
  %1583 = getelementptr inbounds i8, i8* %1577, i64 24
  %1584 = bitcast i8* %1583 to i64*
  store i64 8, i64* %1578, align 8
  store i64 1, i64* %1580, align 8
  store i64 1, i64* %1582, align 8
  store i64 0, i64* %1584, align 8
  %1585 = getelementptr inbounds i8, i8* %1577, i64 32
  %1586 = bitcast i8* %1585 to %Qubit**
  store %Qubit* inttoptr (i64 18 to %Qubit*), %Qubit** %1586, align 8
  %1587 = load i64, i64* %1584, align 8
  %1588 = add nsw i64 %1587, 1
  store i64 %1588, i64* %1584, align 8
  %1589 = load i64, i64* %1580, align 8
  br label %quantum423

quantum423:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit23.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*), %Result* nonnull inttoptr (i64 5 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 17 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout422

readout422:                                       ; preds = %quantum423
  %1590 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 5 to %Result*))
  br label %post-classical421

post-classical421:                                ; preds = %readout422
  br label %exit_quantum_grouping424

exit_quantum_grouping424:                         ; preds = %post-classical421
  switch i64 %1589, label %else__1.i180.i [
    i64 0, label %then0__1.i176.i
    i64 1, label %then1__1.i178.i
    i64 2, label %then2__1.i179.i
  ]

then0__1.i176.i:                                  ; preds = %exit_quantum_grouping424
  br label %quantum123

quantum123:                                       ; preds = %then0__1.i176.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout122

readout122:                                       ; preds = %quantum123
  br label %post-classical121

post-classical121:                                ; preds = %readout122
  br label %exit_quantum_grouping124

exit_quantum_grouping124:                         ; preds = %post-classical121
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i

then1__1.i178.i:                                  ; preds = %exit_quantum_grouping424
  %1591 = load %Qubit*, %Qubit** %1586, align 8
  br label %quantum127

quantum127:                                       ; preds = %then1__1.i178.i
  tail call void @__quantum__qis__cz__body(%Qubit* %1591, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout126

readout126:                                       ; preds = %quantum127
  br label %post-classical125

post-classical125:                                ; preds = %readout126
  br label %exit_quantum_grouping128

exit_quantum_grouping128:                         ; preds = %post-classical125
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i

then2__1.i179.i:                                  ; preds = %exit_quantum_grouping424
  %1592 = bitcast i8* %1577 to %Array*
  %1593 = bitcast %Array* %1592 to i64*
  %1594 = load %Qubit*, %Qubit** %1586, align 8
  %1595 = load i64, i64* %1593, align 8
  %1596 = getelementptr inbounds i8, i8* %1577, i64 %1595
  %1597 = getelementptr inbounds i8, i8* %1596, i64 32
  %1598 = bitcast i8* %1597 to %Qubit**
  %1599 = load %Qubit*, %Qubit** %1598, align 8
  %1600 = load %Qubit*, %Qubit** %1586, align 8
  %1601 = load %Qubit*, %Qubit** %1586, align 8
  %1602 = load i64, i64* %1593, align 8
  %1603 = getelementptr inbounds i8, i8* %1577, i64 %1602
  %1604 = getelementptr inbounds i8, i8* %1603, i64 32
  %1605 = bitcast i8* %1604 to %Qubit**
  %1606 = load %Qubit*, %Qubit** %1605, align 8
  %1607 = load i64, i64* %1593, align 8
  %1608 = getelementptr inbounds i8, i8* %1577, i64 %1607
  %1609 = getelementptr inbounds i8, i8* %1608, i64 32
  %1610 = bitcast i8* %1609 to %Qubit**
  %1611 = load %Qubit*, %Qubit** %1610, align 8
  %1612 = load %Qubit*, %Qubit** %1586, align 8
  %1613 = load %Qubit*, %Qubit** %1586, align 8
  %1614 = load i64, i64* %1593, align 8
  %1615 = getelementptr inbounds i8, i8* %1577, i64 %1614
  %1616 = getelementptr inbounds i8, i8* %1615, i64 32
  %1617 = bitcast i8* %1616 to %Qubit**
  %1618 = load %Qubit*, %Qubit** %1617, align 8
  %1619 = load %Qubit*, %Qubit** %1586, align 8
  %1620 = load %Qubit*, %Qubit** %1586, align 8
  %1621 = load i64, i64* %1593, align 8
  %1622 = getelementptr inbounds i8, i8* %1577, i64 %1621
  %1623 = getelementptr inbounds i8, i8* %1622, i64 32
  %1624 = bitcast i8* %1623 to %Qubit**
  %1625 = load %Qubit*, %Qubit** %1624, align 8
  %1626 = load %Qubit*, %Qubit** %1586, align 8
  br label %quantum131

quantum131:                                       ; preds = %then2__1.i179.i
  tail call void @__quantum__qis__t__adj(%Qubit* %1594)
  tail call void @__quantum__qis__t__adj(%Qubit* %1599)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %1600)
  tail call void @__quantum__qis__t__body(%Qubit* %1601)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1606, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %1611, %Qubit* %1612)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %1613)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1618, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %1619)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %1620)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1625, %Qubit* %1626)
  br label %readout130

readout130:                                       ; preds = %quantum131
  br label %post-classical129

post-classical129:                                ; preds = %readout130
  br label %exit_quantum_grouping132

exit_quantum_grouping132:                         ; preds = %post-classical129
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i

else__1.i180.i:                                   ; preds = %exit_quantum_grouping424
  %1627 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %1628 = bitcast i8* %1627 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %1628, align 8
  %1629 = getelementptr inbounds i8, i8* %1627, i64 8
  %1630 = getelementptr inbounds i8, i8* %1627, i64 16
  %1631 = bitcast i8* %1630 to i8**
  %1632 = getelementptr inbounds i8, i8* %1627, i64 24
  %1633 = bitcast i8* %1632 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %1629, i8 0, i64 16, i1 false)
  store i32 1, i32* %1633, align 8
  %1634 = getelementptr inbounds i8, i8* %1627, i64 28
  %1635 = bitcast i8* %1634 to i32*
  store i32 0, i32* %1635, align 4
  %1636 = bitcast i8* %1627 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %1636)
  %1637 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1638 = bitcast i8* %1637 to i64*
  %1639 = getelementptr inbounds i8, i8* %1637, i64 8
  %1640 = bitcast i8* %1639 to i64*
  %1641 = getelementptr inbounds i8, i8* %1637, i64 16
  %1642 = bitcast i8* %1641 to i64*
  store i64 16, i64* %1638, align 8
  store i64 1, i64* %1640, align 8
  store i64 0, i64* %1642, align 8
  %1643 = getelementptr inbounds i8, i8* %1637, i64 24
  %1644 = bitcast i8* %1643 to %Tuple*
  %1645 = bitcast %Tuple* %1644 to { %Array*, %Qubit* }*
  %1646 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1645, i64 0, i32 1
  %1647 = load i64, i64* %1582, align 8
  %1648 = add nsw i64 %1647, 1
  store i64 %1648, i64* %1582, align 8
  %1649 = icmp slt i64 %1647, 0
  br i1 %1649, label %1650, label %__quantum__rt__array_update_reference_count.exit.i186.i

1650:                                             ; preds = %else__1.i180.i
  tail call void @free(i8* nonnull %1577) #2
  br label %__quantum__rt__array_update_reference_count.exit.i186.i

__quantum__rt__array_update_reference_count.exit.i186.i: ; preds = %1650, %else__1.i180.i
  %1651 = bitcast %Tuple* %1644 to i8**
  store i8* %1577, i8** %1651, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %1646, align 8
  %1652 = load i32, i32* %1635, align 4
  %1653 = add nsw i32 %1652, 1
  store i32 %1653, i32* %1635, align 4
  %controls8.i.i181.i = load i8*, i8** %1651, align 8
  %1654 = getelementptr inbounds i8, i8* %controls8.i.i181.i, i64 24
  %1655 = bitcast i8* %1654 to i64*
  %1656 = load i64, i64* %1655, align 8
  %1657 = add nsw i64 %1656, 1
  store i64 %1657, i64* %1655, align 8
  %1658 = bitcast %Qubit** %1646 to i64*
  %arg1.i.i182.i = load i64, i64* %1658, align 8
  %1659 = getelementptr inbounds i8, i8* %controls8.i.i181.i, i64 8
  %1660 = bitcast i8* %1659 to i64*
  %1661 = load i64, i64* %1660, align 8
  %numControlPairs.i.i183.i = sdiv i64 %1661, 2
  %temps.i.i184.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i183.i)
  %1662 = bitcast %Array* %temps.i.i184.i to i8*
  %1663 = getelementptr inbounds i8, i8* %1662, i64 24
  %1664 = bitcast i8* %1663 to i64*
  %1665 = load i64, i64* %1664, align 8
  %1666 = add nsw i64 %1665, 1
  store i64 %1666, i64* %1664, align 8
  %.not.not9.i.i185.i = icmp sgt i64 %1661, 1
  br i1 %.not.not9.i.i185.i, label %body__1.lr.ph.i.i187.i, label %exit__1.i.i191.i

body__1.lr.ph.i.i187.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i186.i
  %1667 = bitcast i8* %controls8.i.i181.i to i64*
  %1668 = bitcast %Array* %temps.i.i184.i to i64*
  %1669 = getelementptr inbounds i8, i8* %controls8.i.i181.i, i64 32
  %1670 = getelementptr inbounds i8, i8* %1662, i64 32
  br label %body__1.i.i190.i

body__1.i.i190.i:                                 ; preds = %body__1.lr.ph.i.i187.i, %exit_quantum_grouping136
  %1671 = phi i64 [ 0, %body__1.lr.ph.i.i187.i ], [ %1688, %exit_quantum_grouping136 ]
  %1672 = shl nuw i64 %1671, 1
  %1673 = load i64, i64* %1667, align 8
  %1674 = mul nsw i64 %1673, %1672
  %1675 = getelementptr inbounds i8, i8* %1669, i64 %1674
  %1676 = bitcast i8* %1675 to %Qubit**
  %1677 = load %Qubit*, %Qubit** %1676, align 8
  %1678 = or i64 %1672, 1
  %1679 = mul nsw i64 %1678, %1673
  %1680 = getelementptr inbounds i8, i8* %1669, i64 %1679
  %1681 = bitcast i8* %1680 to %Qubit**
  %1682 = load %Qubit*, %Qubit** %1681, align 8
  %1683 = load i64, i64* %1668, align 8
  %1684 = mul nsw i64 %1683, %1671
  %1685 = getelementptr inbounds i8, i8* %1670, i64 %1684
  %1686 = bitcast i8* %1685 to %Qubit**
  %1687 = load %Qubit*, %Qubit** %1686, align 8
  %1688 = add nuw nsw i64 %1671, 1
  %1689 = icmp eq i64 %1688, %numControlPairs.i.i183.i
  br label %quantum135

quantum135:                                       ; preds = %body__1.i.i190.i
  tail call void @__quantum__qis__h__body(%Qubit* %1687)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1687, %Qubit* %1677)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1677, %Qubit* %1682)
  tail call void @__quantum__qis__t__body(%Qubit* %1682)
  tail call void @__quantum__qis__t__adj(%Qubit* %1677)
  tail call void @__quantum__qis__t__body(%Qubit* %1687)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1687, %Qubit* %1677)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1677, %Qubit* %1682)
  tail call void @__quantum__qis__t__adj(%Qubit* %1682)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1687, %Qubit* %1682)
  tail call void @__quantum__qis__h__body(%Qubit* %1687)
  br label %readout134

readout134:                                       ; preds = %quantum135
  br label %post-classical133

post-classical133:                                ; preds = %readout134
  br label %exit_quantum_grouping136

exit_quantum_grouping136:                         ; preds = %post-classical133
  br i1 %1689, label %exit__1.i.i191.i, label %body__1.i.i190.i

exit__1.i.i191.i:                                 ; preds = %exit_quantum_grouping136, %__quantum__rt__array_update_reference_count.exit.i186.i
  %1690 = and i64 %1661, 1
  %1691 = icmp eq i64 %1690, 0
  br i1 %1691, label %condTrue__1.i.i192.i, label %condFalse__1.i.i194.i

condTrue__1.i.i192.i:                             ; preds = %exit__1.i.i191.i
  %1692 = getelementptr inbounds i8, i8* %1662, i64 16
  %1693 = bitcast i8* %1692 to i64*
  %1694 = load i64, i64* %1693, align 8
  %1695 = add nsw i64 %1694, 1
  store i64 %1695, i64* %1693, align 8
  %1696 = icmp slt i64 %1694, 0
  br i1 %1696, label %1697, label %condContinue__1.i.i198.i

1697:                                             ; preds = %condTrue__1.i.i192.i
  tail call void @free(i8* nonnull %1662) #2
  br label %condContinue__1.i.i198.i

condFalse__1.i.i194.i:                            ; preds = %exit__1.i.i191.i
  %1698 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1699 = bitcast i8* %1698 to i64*
  %1700 = getelementptr inbounds i8, i8* %1698, i64 8
  %1701 = bitcast i8* %1700 to i64*
  %1702 = getelementptr inbounds i8, i8* %1698, i64 16
  %1703 = bitcast i8* %1702 to i64*
  %1704 = getelementptr inbounds i8, i8* %1698, i64 24
  %1705 = bitcast i8* %1704 to i64*
  store i64 8, i64* %1699, align 8
  store i64 1, i64* %1701, align 8
  store i64 1, i64* %1703, align 8
  store i64 0, i64* %1705, align 8
  %1706 = getelementptr inbounds i8, i8* %1698, i64 32
  %1707 = add i64 %1661, -1
  %1708 = bitcast i8* %controls8.i.i181.i to i64*
  %1709 = load i64, i64* %1708, align 8
  %1710 = mul nsw i64 %1709, %1707
  %1711 = getelementptr inbounds i8, i8* %controls8.i.i181.i, i64 %1710
  %1712 = getelementptr inbounds i8, i8* %1711, i64 32
  %1713 = bitcast i8* %1712 to i64*
  %1714 = load i64, i64* %1713, align 8
  %1715 = bitcast i8* %1706 to i64*
  store i64 %1714, i64* %1715, align 8
  %1716 = bitcast %Array* %temps.i.i184.i to i64*
  %1717 = load i64, i64* %1716, align 8
  %1718 = getelementptr inbounds i8, i8* %1662, i64 8
  %1719 = bitcast i8* %1718 to i64*
  %1720 = load i64, i64* %1719, align 8
  %1721 = load i64, i64* %1701, align 8
  %1722 = getelementptr inbounds i8, i8* %1662, i64 32
  %1723 = add nsw i64 %1721, %1720
  %sext.i.i.i193.i = shl i64 %1717, 32
  %1724 = ashr exact i64 %sext.i.i.i193.i, 32
  %1725 = mul nsw i64 %1723, %1724
  %1726 = add i64 %1725, 32
  %1727 = tail call i8* @malloc(i64 %1726) #5
  %1728 = bitcast i8* %1727 to i64*
  %1729 = getelementptr inbounds i8, i8* %1727, i64 8
  %1730 = bitcast i8* %1729 to i64*
  %1731 = getelementptr inbounds i8, i8* %1727, i64 16
  %1732 = bitcast i8* %1731 to i64*
  %1733 = getelementptr inbounds i8, i8* %1727, i64 24
  %1734 = bitcast i8* %1733 to i64*
  store i64 %1724, i64* %1728, align 8
  store i64 %1723, i64* %1730, align 8
  store i64 1, i64* %1732, align 8
  store i64 0, i64* %1734, align 8
  %1735 = getelementptr inbounds i8, i8* %1727, i64 32
  %1736 = mul nsw i64 %1720, %1717
  %1737 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1735, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1735, i8* nonnull align 1 %1722, i64 %1736, i1 false) #2
  %1738 = getelementptr inbounds i8, i8* %1735, i64 %1736
  %1739 = mul nsw i64 %1721, %1717
  %1740 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1738, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1738, i8* nonnull align 1 %1706, i64 %1739, i1 false) #2
  %1741 = bitcast i8* %1727 to %Array*
  %1742 = load i64, i64* %1732, align 8
  %1743 = add nsw i64 %1742, 1
  store i64 %1743, i64* %1732, align 8
  %1744 = icmp slt i64 %1742, 0
  br i1 %1744, label %1745, label %__quantum__rt__array_update_reference_count.exit2.i.i195.i

1745:                                             ; preds = %condFalse__1.i.i194.i
  tail call void @free(i8* nonnull %1727) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i195.i

__quantum__rt__array_update_reference_count.exit2.i.i195.i: ; preds = %1745, %condFalse__1.i.i194.i
  %1746 = load i64, i64* %1703, align 8
  %1747 = add nsw i64 %1746, -1
  store i64 %1747, i64* %1703, align 8
  %1748 = icmp slt i64 %1746, 2
  br i1 %1748, label %1749, label %__quantum__rt__array_update_reference_count.exit3.i.i196.i

1749:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i195.i
  tail call void @free(i8* nonnull %1698) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i196.i

__quantum__rt__array_update_reference_count.exit3.i.i196.i: ; preds = %1749, %__quantum__rt__array_update_reference_count.exit2.i.i195.i
  %1750 = load i64, i64* %1732, align 8
  %1751 = add nsw i64 %1750, -1
  store i64 %1751, i64* %1732, align 8
  %1752 = icmp slt i64 %1750, 2
  br i1 %1752, label %1753, label %condContinue__1.i.i198.i

1753:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i196.i
  tail call void @free(i8* nonnull %1727) #2
  br label %condContinue__1.i.i198.i

condContinue__1.i.i198.i:                         ; preds = %1753, %__quantum__rt__array_update_reference_count.exit3.i.i196.i, %1697, %condTrue__1.i.i192.i
  %__qsVar1__newControls__.i.i197.i = phi %Array* [ %temps.i.i184.i, %condTrue__1.i.i192.i ], [ %temps.i.i184.i, %1697 ], [ %1741, %__quantum__rt__array_update_reference_count.exit3.i.i196.i ], [ %1741, %1753 ]
  %1754 = bitcast %Array* %__qsVar1__newControls__.i.i197.i to i8*
  %1755 = getelementptr inbounds i8, i8* %1754, i64 24
  %1756 = bitcast i8* %1755 to i64*
  %1757 = load i64, i64* %1756, align 8
  %1758 = add nsw i64 %1757, 1
  store i64 %1758, i64* %1756, align 8
  %1759 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1760 = bitcast i8* %1759 to i64*
  %1761 = getelementptr inbounds i8, i8* %1759, i64 8
  %1762 = bitcast i8* %1761 to i64*
  %1763 = getelementptr inbounds i8, i8* %1759, i64 16
  %1764 = bitcast i8* %1763 to i64*
  store i64 16, i64* %1760, align 8
  store i64 1, i64* %1762, align 8
  store i64 0, i64* %1764, align 8
  %1765 = getelementptr inbounds i8, i8* %1759, i64 24
  %1766 = bitcast i8* %1765 to %Tuple*
  %1767 = bitcast %Tuple* %1766 to { %Array*, %Qubit* }*
  %1768 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1767, i64 0, i32 0
  %1769 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1767, i64 0, i32 1
  %1770 = getelementptr inbounds i8, i8* %1754, i64 16
  %1771 = bitcast i8* %1770 to i64*
  %1772 = load i64, i64* %1771, align 8
  %1773 = add nsw i64 %1772, 1
  store i64 %1773, i64* %1771, align 8
  %1774 = icmp slt i64 %1772, 0
  br i1 %1774, label %1775, label %__quantum__rt__array_update_reference_count.exit5.i.i199.i

1775:                                             ; preds = %condContinue__1.i.i198.i
  tail call void @free(i8* nonnull %1754) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i199.i

__quantum__rt__array_update_reference_count.exit5.i.i199.i: ; preds = %1775, %condContinue__1.i.i198.i
  store %Array* %__qsVar1__newControls__.i.i197.i, %Array** %1768, align 8
  %1776 = bitcast %Qubit** %1769 to i64*
  store i64 %arg1.i.i182.i, i64* %1776, align 8
  %1777 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %1628, align 8
  %1778 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %1777, i64 0, i64 0
  %1779 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %1778, align 8
  %1780 = load i8*, i8** %1631, align 8
  tail call void %1779(i8* %1780, i8* nonnull %1765, i8* null)
  br i1 %.not.not9.i.i185.i, label %body__2.lr.ph.i.i201.i, label %exit__2.i.i205.i

body__2.lr.ph.i.i201.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i199.i
  %__qsVar0____qsVar0__numPair____11.i.i200.i = add nsw i64 %numControlPairs.i.i183.i, -1
  %1781 = bitcast i8* %controls8.i.i181.i to i64*
  %1782 = bitcast %Array* %temps.i.i184.i to i64*
  %1783 = getelementptr inbounds i8, i8* %controls8.i.i181.i, i64 32
  %1784 = getelementptr inbounds i8, i8* %1662, i64 32
  br label %body__2.i.i204.i

body__2.i.i204.i:                                 ; preds = %body__2.lr.ph.i.i201.i, %exit_quantum_grouping140
  %1785 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i200.i, %body__2.lr.ph.i.i201.i ], [ %1802, %exit_quantum_grouping140 ]
  %1786 = shl nuw i64 %1785, 1
  %1787 = load i64, i64* %1781, align 8
  %1788 = mul nsw i64 %1787, %1786
  %1789 = getelementptr inbounds i8, i8* %1783, i64 %1788
  %1790 = bitcast i8* %1789 to %Qubit**
  %1791 = load %Qubit*, %Qubit** %1790, align 8
  %1792 = or i64 %1786, 1
  %1793 = mul nsw i64 %1792, %1787
  %1794 = getelementptr inbounds i8, i8* %1783, i64 %1793
  %1795 = bitcast i8* %1794 to %Qubit**
  %1796 = load %Qubit*, %Qubit** %1795, align 8
  %1797 = load i64, i64* %1782, align 8
  %1798 = mul nsw i64 %1797, %1785
  %1799 = getelementptr inbounds i8, i8* %1784, i64 %1798
  %1800 = bitcast i8* %1799 to %Qubit**
  %1801 = load %Qubit*, %Qubit** %1800, align 8
  %1802 = add i64 %1785, -1
  %1803 = icmp sgt i64 %1802, -1
  br label %quantum139

quantum139:                                       ; preds = %body__2.i.i204.i
  tail call void @__quantum__qis__h__body(%Qubit* %1801)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1801, %Qubit* %1796)
  tail call void @__quantum__qis__t__body(%Qubit* %1796)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1791, %Qubit* %1796)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1801, %Qubit* %1791)
  tail call void @__quantum__qis__t__adj(%Qubit* %1801)
  tail call void @__quantum__qis__t__body(%Qubit* %1791)
  tail call void @__quantum__qis__t__adj(%Qubit* %1796)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1791, %Qubit* %1796)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1801, %Qubit* %1791)
  tail call void @__quantum__qis__h__body(%Qubit* %1801)
  br label %readout138

readout138:                                       ; preds = %quantum139
  br label %post-classical137

post-classical137:                                ; preds = %readout138
  br label %exit_quantum_grouping140

exit_quantum_grouping140:                         ; preds = %post-classical137
  br i1 %1803, label %body__2.i.i204.i, label %exit__2.i.i205.i

exit__2.i.i205.i:                                 ; preds = %exit_quantum_grouping140, %__quantum__rt__array_update_reference_count.exit5.i.i199.i
  %1804 = load i64, i64* %1664, align 8
  %1805 = add nsw i64 %1804, -1
  store i64 %1805, i64* %1664, align 8
  %1806 = load i64, i64* %1756, align 8
  %1807 = add nsw i64 %1806, -1
  store i64 %1807, i64* %1756, align 8
  %1808 = load i64, i64* %1771, align 8
  %1809 = add nsw i64 %1808, -1
  store i64 %1809, i64* %1771, align 8
  %1810 = icmp slt i64 %1808, 2
  br i1 %1810, label %1811, label %__quantum__rt__array_update_reference_count.exit6.i.i207.i

1811:                                             ; preds = %exit__2.i.i205.i
  tail call void @free(i8* nonnull %1754) #2
  %.pre.i.i206.i = load i64, i64* %1771, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i207.i

__quantum__rt__array_update_reference_count.exit6.i.i207.i: ; preds = %1811, %exit__2.i.i205.i
  %1812 = phi i64 [ %1809, %exit__2.i.i205.i ], [ %.pre.i.i206.i, %1811 ]
  %1813 = add nsw i64 %1812, -1
  store i64 %1813, i64* %1771, align 8
  %1814 = icmp slt i64 %1812, 2
  br i1 %1814, label %1815, label %__quantum__rt__array_update_reference_count.exit7.i.i208.i

1815:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i207.i
  tail call void @free(i8* nonnull %1754) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i208.i

__quantum__rt__array_update_reference_count.exit7.i.i208.i: ; preds = %1815, %__quantum__rt__array_update_reference_count.exit6.i.i207.i
  %1816 = load i64, i64* %1762, align 8
  %1817 = add nsw i64 %1816, -1
  store i64 %1817, i64* %1762, align 8
  %1818 = icmp slt i64 %1816, 2
  br i1 %1818, label %1819, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i209.i

1819:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i208.i
  tail call void @free(i8* nonnull %1759) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i209.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i209.i: ; preds = %1819, %__quantum__rt__array_update_reference_count.exit7.i.i208.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i184.i)
  %1820 = load i32, i32* %1635, align 4
  %1821 = add nsw i32 %1820, -1
  store i32 %1821, i32* %1635, align 4
  %1822 = load i64, i64* %1655, align 8
  %1823 = add nsw i64 %1822, -1
  store i64 %1823, i64* %1655, align 8
  %1824 = load i32, i32* %1633, align 8
  %1825 = add nsw i32 %1824, -1
  store i32 %1825, i32* %1633, align 8
  %1826 = load i64, i64* %1582, align 8
  %1827 = add nsw i64 %1826, -1
  store i64 %1827, i64* %1582, align 8
  %1828 = icmp slt i64 %1826, 2
  br i1 %1828, label %1829, label %__quantum__rt__array_update_reference_count.exit1.i210.i

1829:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i209.i
  tail call void @free(i8* nonnull %1577) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i210.i

__quantum__rt__array_update_reference_count.exit1.i210.i: ; preds = %1829, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i209.i
  %1830 = load i64, i64* %1640, align 8
  %1831 = add nsw i64 %1830, -1
  store i64 %1831, i64* %1640, align 8
  %1832 = icmp slt i64 %1830, 2
  br i1 %1832, label %1833, label %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i

1833:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i210.i
  tail call void @free(i8* nonnull %1637) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i:  ; preds = %1833, %__quantum__rt__array_update_reference_count.exit1.i210.i, %exit_quantum_grouping132, %exit_quantum_grouping128, %exit_quantum_grouping124
  %1834 = load i64, i64* %1584, align 8
  %1835 = add nsw i64 %1834, -1
  store i64 %1835, i64* %1584, align 8
  %1836 = load i64, i64* %1582, align 8
  %1837 = add nsw i64 %1836, -1
  store i64 %1837, i64* %1582, align 8
  %1838 = icmp slt i64 %1836, 2
  br i1 %1838, label %1839, label %Microsoft__Quantum__Canon__CZ__body.exit24.i

1839:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i
  tail call void @free(i8* nonnull %1577) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit24.i

Microsoft__Quantum__Canon__CZ__body.exit24.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.36.exit.i, %1839
  %1840 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1841 = bitcast i8* %1840 to i64*
  %1842 = getelementptr inbounds i8, i8* %1840, i64 8
  %1843 = bitcast i8* %1842 to i64*
  %1844 = getelementptr inbounds i8, i8* %1840, i64 16
  %1845 = bitcast i8* %1844 to i64*
  %1846 = getelementptr inbounds i8, i8* %1840, i64 24
  %1847 = bitcast i8* %1846 to i64*
  store i64 8, i64* %1841, align 8
  store i64 1, i64* %1843, align 8
  store i64 1, i64* %1845, align 8
  store i64 0, i64* %1847, align 8
  %1848 = getelementptr inbounds i8, i8* %1840, i64 32
  %1849 = bitcast i8* %1848 to %Qubit**
  store %Qubit* inttoptr (i64 19 to %Qubit*), %Qubit** %1849, align 8
  %1850 = load i64, i64* %1847, align 8
  %1851 = add nsw i64 %1850, 1
  store i64 %1851, i64* %1847, align 8
  %1852 = load i64, i64* %1843, align 8
  br label %quantum427

quantum427:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit24.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*), %Result* nonnull inttoptr (i64 6 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 18 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Qubit* null)
  br label %readout426

readout426:                                       ; preds = %quantum427
  %1853 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 6 to %Result*))
  br label %post-classical425

post-classical425:                                ; preds = %readout426
  br label %exit_quantum_grouping428

exit_quantum_grouping428:                         ; preds = %post-classical425
  switch i64 %1852, label %else__1.i215.i [
    i64 0, label %then0__1.i211.i
    i64 1, label %then1__1.i213.i
    i64 2, label %then2__1.i214.i
  ]

then0__1.i211.i:                                  ; preds = %exit_quantum_grouping428
  br label %quantum143

quantum143:                                       ; preds = %then0__1.i211.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout142

readout142:                                       ; preds = %quantum143
  br label %post-classical141

post-classical141:                                ; preds = %readout142
  br label %exit_quantum_grouping144

exit_quantum_grouping144:                         ; preds = %post-classical141
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i

then1__1.i213.i:                                  ; preds = %exit_quantum_grouping428
  %1854 = load %Qubit*, %Qubit** %1849, align 8
  br label %quantum147

quantum147:                                       ; preds = %then1__1.i213.i
  tail call void @__quantum__qis__cz__body(%Qubit* %1854, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout146

readout146:                                       ; preds = %quantum147
  br label %post-classical145

post-classical145:                                ; preds = %readout146
  br label %exit_quantum_grouping148

exit_quantum_grouping148:                         ; preds = %post-classical145
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i

then2__1.i214.i:                                  ; preds = %exit_quantum_grouping428
  %1855 = bitcast i8* %1840 to %Array*
  %1856 = bitcast %Array* %1855 to i64*
  %1857 = load %Qubit*, %Qubit** %1849, align 8
  %1858 = load i64, i64* %1856, align 8
  %1859 = getelementptr inbounds i8, i8* %1840, i64 %1858
  %1860 = getelementptr inbounds i8, i8* %1859, i64 32
  %1861 = bitcast i8* %1860 to %Qubit**
  %1862 = load %Qubit*, %Qubit** %1861, align 8
  %1863 = load %Qubit*, %Qubit** %1849, align 8
  %1864 = load %Qubit*, %Qubit** %1849, align 8
  %1865 = load i64, i64* %1856, align 8
  %1866 = getelementptr inbounds i8, i8* %1840, i64 %1865
  %1867 = getelementptr inbounds i8, i8* %1866, i64 32
  %1868 = bitcast i8* %1867 to %Qubit**
  %1869 = load %Qubit*, %Qubit** %1868, align 8
  %1870 = load i64, i64* %1856, align 8
  %1871 = getelementptr inbounds i8, i8* %1840, i64 %1870
  %1872 = getelementptr inbounds i8, i8* %1871, i64 32
  %1873 = bitcast i8* %1872 to %Qubit**
  %1874 = load %Qubit*, %Qubit** %1873, align 8
  %1875 = load %Qubit*, %Qubit** %1849, align 8
  %1876 = load %Qubit*, %Qubit** %1849, align 8
  %1877 = load i64, i64* %1856, align 8
  %1878 = getelementptr inbounds i8, i8* %1840, i64 %1877
  %1879 = getelementptr inbounds i8, i8* %1878, i64 32
  %1880 = bitcast i8* %1879 to %Qubit**
  %1881 = load %Qubit*, %Qubit** %1880, align 8
  %1882 = load %Qubit*, %Qubit** %1849, align 8
  %1883 = load %Qubit*, %Qubit** %1849, align 8
  %1884 = load i64, i64* %1856, align 8
  %1885 = getelementptr inbounds i8, i8* %1840, i64 %1884
  %1886 = getelementptr inbounds i8, i8* %1885, i64 32
  %1887 = bitcast i8* %1886 to %Qubit**
  %1888 = load %Qubit*, %Qubit** %1887, align 8
  %1889 = load %Qubit*, %Qubit** %1849, align 8
  br label %quantum151

quantum151:                                       ; preds = %then2__1.i214.i
  tail call void @__quantum__qis__t__adj(%Qubit* %1857)
  tail call void @__quantum__qis__t__adj(%Qubit* %1862)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* %1863)
  tail call void @__quantum__qis__t__body(%Qubit* %1864)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1869, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %1874, %Qubit* %1875)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %1876)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1881, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* %1882)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %1883)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1888, %Qubit* %1889)
  br label %readout150

readout150:                                       ; preds = %quantum151
  br label %post-classical149

post-classical149:                                ; preds = %readout150
  br label %exit_quantum_grouping152

exit_quantum_grouping152:                         ; preds = %post-classical149
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i

else__1.i215.i:                                   ; preds = %exit_quantum_grouping428
  %1890 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %1891 = bitcast i8* %1890 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %1891, align 8
  %1892 = getelementptr inbounds i8, i8* %1890, i64 8
  %1893 = getelementptr inbounds i8, i8* %1890, i64 16
  %1894 = bitcast i8* %1893 to i8**
  %1895 = getelementptr inbounds i8, i8* %1890, i64 24
  %1896 = bitcast i8* %1895 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %1892, i8 0, i64 16, i1 false)
  store i32 1, i32* %1896, align 8
  %1897 = getelementptr inbounds i8, i8* %1890, i64 28
  %1898 = bitcast i8* %1897 to i32*
  store i32 0, i32* %1898, align 4
  %1899 = bitcast i8* %1890 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %1899)
  %1900 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1901 = bitcast i8* %1900 to i64*
  %1902 = getelementptr inbounds i8, i8* %1900, i64 8
  %1903 = bitcast i8* %1902 to i64*
  %1904 = getelementptr inbounds i8, i8* %1900, i64 16
  %1905 = bitcast i8* %1904 to i64*
  store i64 16, i64* %1901, align 8
  store i64 1, i64* %1903, align 8
  store i64 0, i64* %1905, align 8
  %1906 = getelementptr inbounds i8, i8* %1900, i64 24
  %1907 = bitcast i8* %1906 to %Tuple*
  %1908 = bitcast %Tuple* %1907 to { %Array*, %Qubit* }*
  %1909 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %1908, i64 0, i32 1
  %1910 = load i64, i64* %1845, align 8
  %1911 = add nsw i64 %1910, 1
  store i64 %1911, i64* %1845, align 8
  %1912 = icmp slt i64 %1910, 0
  br i1 %1912, label %1913, label %__quantum__rt__array_update_reference_count.exit.i221.i

1913:                                             ; preds = %else__1.i215.i
  tail call void @free(i8* nonnull %1840) #2
  br label %__quantum__rt__array_update_reference_count.exit.i221.i

__quantum__rt__array_update_reference_count.exit.i221.i: ; preds = %1913, %else__1.i215.i
  %1914 = bitcast %Tuple* %1907 to i8**
  store i8* %1840, i8** %1914, align 8
  store %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit** %1909, align 8
  %1915 = load i32, i32* %1898, align 4
  %1916 = add nsw i32 %1915, 1
  store i32 %1916, i32* %1898, align 4
  %controls8.i.i216.i = load i8*, i8** %1914, align 8
  %1917 = getelementptr inbounds i8, i8* %controls8.i.i216.i, i64 24
  %1918 = bitcast i8* %1917 to i64*
  %1919 = load i64, i64* %1918, align 8
  %1920 = add nsw i64 %1919, 1
  store i64 %1920, i64* %1918, align 8
  %1921 = bitcast %Qubit** %1909 to i64*
  %arg1.i.i217.i = load i64, i64* %1921, align 8
  %1922 = getelementptr inbounds i8, i8* %controls8.i.i216.i, i64 8
  %1923 = bitcast i8* %1922 to i64*
  %1924 = load i64, i64* %1923, align 8
  %numControlPairs.i.i218.i = sdiv i64 %1924, 2
  %temps.i.i219.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i218.i)
  %1925 = bitcast %Array* %temps.i.i219.i to i8*
  %1926 = getelementptr inbounds i8, i8* %1925, i64 24
  %1927 = bitcast i8* %1926 to i64*
  %1928 = load i64, i64* %1927, align 8
  %1929 = add nsw i64 %1928, 1
  store i64 %1929, i64* %1927, align 8
  %.not.not9.i.i220.i = icmp sgt i64 %1924, 1
  br i1 %.not.not9.i.i220.i, label %body__1.lr.ph.i.i222.i, label %exit__1.i.i226.i

body__1.lr.ph.i.i222.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i221.i
  %1930 = bitcast i8* %controls8.i.i216.i to i64*
  %1931 = bitcast %Array* %temps.i.i219.i to i64*
  %1932 = getelementptr inbounds i8, i8* %controls8.i.i216.i, i64 32
  %1933 = getelementptr inbounds i8, i8* %1925, i64 32
  br label %body__1.i.i225.i

body__1.i.i225.i:                                 ; preds = %body__1.lr.ph.i.i222.i, %exit_quantum_grouping156
  %1934 = phi i64 [ 0, %body__1.lr.ph.i.i222.i ], [ %1951, %exit_quantum_grouping156 ]
  %1935 = shl nuw i64 %1934, 1
  %1936 = load i64, i64* %1930, align 8
  %1937 = mul nsw i64 %1936, %1935
  %1938 = getelementptr inbounds i8, i8* %1932, i64 %1937
  %1939 = bitcast i8* %1938 to %Qubit**
  %1940 = load %Qubit*, %Qubit** %1939, align 8
  %1941 = or i64 %1935, 1
  %1942 = mul nsw i64 %1941, %1936
  %1943 = getelementptr inbounds i8, i8* %1932, i64 %1942
  %1944 = bitcast i8* %1943 to %Qubit**
  %1945 = load %Qubit*, %Qubit** %1944, align 8
  %1946 = load i64, i64* %1931, align 8
  %1947 = mul nsw i64 %1946, %1934
  %1948 = getelementptr inbounds i8, i8* %1933, i64 %1947
  %1949 = bitcast i8* %1948 to %Qubit**
  %1950 = load %Qubit*, %Qubit** %1949, align 8
  %1951 = add nuw nsw i64 %1934, 1
  %1952 = icmp eq i64 %1951, %numControlPairs.i.i218.i
  br label %quantum155

quantum155:                                       ; preds = %body__1.i.i225.i
  tail call void @__quantum__qis__h__body(%Qubit* %1950)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1950, %Qubit* %1940)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1940, %Qubit* %1945)
  tail call void @__quantum__qis__t__body(%Qubit* %1945)
  tail call void @__quantum__qis__t__adj(%Qubit* %1940)
  tail call void @__quantum__qis__t__body(%Qubit* %1950)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1950, %Qubit* %1940)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1940, %Qubit* %1945)
  tail call void @__quantum__qis__t__adj(%Qubit* %1945)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1950, %Qubit* %1945)
  tail call void @__quantum__qis__h__body(%Qubit* %1950)
  br label %readout154

readout154:                                       ; preds = %quantum155
  br label %post-classical153

post-classical153:                                ; preds = %readout154
  br label %exit_quantum_grouping156

exit_quantum_grouping156:                         ; preds = %post-classical153
  br i1 %1952, label %exit__1.i.i226.i, label %body__1.i.i225.i

exit__1.i.i226.i:                                 ; preds = %exit_quantum_grouping156, %__quantum__rt__array_update_reference_count.exit.i221.i
  %1953 = and i64 %1924, 1
  %1954 = icmp eq i64 %1953, 0
  br i1 %1954, label %condTrue__1.i.i227.i, label %condFalse__1.i.i229.i

condTrue__1.i.i227.i:                             ; preds = %exit__1.i.i226.i
  %1955 = getelementptr inbounds i8, i8* %1925, i64 16
  %1956 = bitcast i8* %1955 to i64*
  %1957 = load i64, i64* %1956, align 8
  %1958 = add nsw i64 %1957, 1
  store i64 %1958, i64* %1956, align 8
  %1959 = icmp slt i64 %1957, 0
  br i1 %1959, label %1960, label %condContinue__1.i.i233.i

1960:                                             ; preds = %condTrue__1.i.i227.i
  tail call void @free(i8* nonnull %1925) #2
  br label %condContinue__1.i.i233.i

condFalse__1.i.i229.i:                            ; preds = %exit__1.i.i226.i
  %1961 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %1962 = bitcast i8* %1961 to i64*
  %1963 = getelementptr inbounds i8, i8* %1961, i64 8
  %1964 = bitcast i8* %1963 to i64*
  %1965 = getelementptr inbounds i8, i8* %1961, i64 16
  %1966 = bitcast i8* %1965 to i64*
  %1967 = getelementptr inbounds i8, i8* %1961, i64 24
  %1968 = bitcast i8* %1967 to i64*
  store i64 8, i64* %1962, align 8
  store i64 1, i64* %1964, align 8
  store i64 1, i64* %1966, align 8
  store i64 0, i64* %1968, align 8
  %1969 = getelementptr inbounds i8, i8* %1961, i64 32
  %1970 = add i64 %1924, -1
  %1971 = bitcast i8* %controls8.i.i216.i to i64*
  %1972 = load i64, i64* %1971, align 8
  %1973 = mul nsw i64 %1972, %1970
  %1974 = getelementptr inbounds i8, i8* %controls8.i.i216.i, i64 %1973
  %1975 = getelementptr inbounds i8, i8* %1974, i64 32
  %1976 = bitcast i8* %1975 to i64*
  %1977 = load i64, i64* %1976, align 8
  %1978 = bitcast i8* %1969 to i64*
  store i64 %1977, i64* %1978, align 8
  %1979 = bitcast %Array* %temps.i.i219.i to i64*
  %1980 = load i64, i64* %1979, align 8
  %1981 = getelementptr inbounds i8, i8* %1925, i64 8
  %1982 = bitcast i8* %1981 to i64*
  %1983 = load i64, i64* %1982, align 8
  %1984 = load i64, i64* %1964, align 8
  %1985 = getelementptr inbounds i8, i8* %1925, i64 32
  %1986 = add nsw i64 %1984, %1983
  %sext.i.i.i228.i = shl i64 %1980, 32
  %1987 = ashr exact i64 %sext.i.i.i228.i, 32
  %1988 = mul nsw i64 %1986, %1987
  %1989 = add i64 %1988, 32
  %1990 = tail call i8* @malloc(i64 %1989) #5
  %1991 = bitcast i8* %1990 to i64*
  %1992 = getelementptr inbounds i8, i8* %1990, i64 8
  %1993 = bitcast i8* %1992 to i64*
  %1994 = getelementptr inbounds i8, i8* %1990, i64 16
  %1995 = bitcast i8* %1994 to i64*
  %1996 = getelementptr inbounds i8, i8* %1990, i64 24
  %1997 = bitcast i8* %1996 to i64*
  store i64 %1987, i64* %1991, align 8
  store i64 %1986, i64* %1993, align 8
  store i64 1, i64* %1995, align 8
  store i64 0, i64* %1997, align 8
  %1998 = getelementptr inbounds i8, i8* %1990, i64 32
  %1999 = mul nsw i64 %1983, %1980
  %2000 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %1998, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %1998, i8* nonnull align 1 %1985, i64 %1999, i1 false) #2
  %2001 = getelementptr inbounds i8, i8* %1998, i64 %1999
  %2002 = mul nsw i64 %1984, %1980
  %2003 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2001, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2001, i8* nonnull align 1 %1969, i64 %2002, i1 false) #2
  %2004 = bitcast i8* %1990 to %Array*
  %2005 = load i64, i64* %1995, align 8
  %2006 = add nsw i64 %2005, 1
  store i64 %2006, i64* %1995, align 8
  %2007 = icmp slt i64 %2005, 0
  br i1 %2007, label %2008, label %__quantum__rt__array_update_reference_count.exit2.i.i230.i

2008:                                             ; preds = %condFalse__1.i.i229.i
  tail call void @free(i8* nonnull %1990) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i230.i

__quantum__rt__array_update_reference_count.exit2.i.i230.i: ; preds = %2008, %condFalse__1.i.i229.i
  %2009 = load i64, i64* %1966, align 8
  %2010 = add nsw i64 %2009, -1
  store i64 %2010, i64* %1966, align 8
  %2011 = icmp slt i64 %2009, 2
  br i1 %2011, label %2012, label %__quantum__rt__array_update_reference_count.exit3.i.i231.i

2012:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i230.i
  tail call void @free(i8* nonnull %1961) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i231.i

__quantum__rt__array_update_reference_count.exit3.i.i231.i: ; preds = %2012, %__quantum__rt__array_update_reference_count.exit2.i.i230.i
  %2013 = load i64, i64* %1995, align 8
  %2014 = add nsw i64 %2013, -1
  store i64 %2014, i64* %1995, align 8
  %2015 = icmp slt i64 %2013, 2
  br i1 %2015, label %2016, label %condContinue__1.i.i233.i

2016:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i231.i
  tail call void @free(i8* nonnull %1990) #2
  br label %condContinue__1.i.i233.i

condContinue__1.i.i233.i:                         ; preds = %2016, %__quantum__rt__array_update_reference_count.exit3.i.i231.i, %1960, %condTrue__1.i.i227.i
  %__qsVar1__newControls__.i.i232.i = phi %Array* [ %temps.i.i219.i, %condTrue__1.i.i227.i ], [ %temps.i.i219.i, %1960 ], [ %2004, %__quantum__rt__array_update_reference_count.exit3.i.i231.i ], [ %2004, %2016 ]
  %2017 = bitcast %Array* %__qsVar1__newControls__.i.i232.i to i8*
  %2018 = getelementptr inbounds i8, i8* %2017, i64 24
  %2019 = bitcast i8* %2018 to i64*
  %2020 = load i64, i64* %2019, align 8
  %2021 = add nsw i64 %2020, 1
  store i64 %2021, i64* %2019, align 8
  %2022 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2023 = bitcast i8* %2022 to i64*
  %2024 = getelementptr inbounds i8, i8* %2022, i64 8
  %2025 = bitcast i8* %2024 to i64*
  %2026 = getelementptr inbounds i8, i8* %2022, i64 16
  %2027 = bitcast i8* %2026 to i64*
  store i64 16, i64* %2023, align 8
  store i64 1, i64* %2025, align 8
  store i64 0, i64* %2027, align 8
  %2028 = getelementptr inbounds i8, i8* %2022, i64 24
  %2029 = bitcast i8* %2028 to %Tuple*
  %2030 = bitcast %Tuple* %2029 to { %Array*, %Qubit* }*
  %2031 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2030, i64 0, i32 0
  %2032 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2030, i64 0, i32 1
  %2033 = getelementptr inbounds i8, i8* %2017, i64 16
  %2034 = bitcast i8* %2033 to i64*
  %2035 = load i64, i64* %2034, align 8
  %2036 = add nsw i64 %2035, 1
  store i64 %2036, i64* %2034, align 8
  %2037 = icmp slt i64 %2035, 0
  br i1 %2037, label %2038, label %__quantum__rt__array_update_reference_count.exit5.i.i234.i

2038:                                             ; preds = %condContinue__1.i.i233.i
  tail call void @free(i8* nonnull %2017) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i234.i

__quantum__rt__array_update_reference_count.exit5.i.i234.i: ; preds = %2038, %condContinue__1.i.i233.i
  store %Array* %__qsVar1__newControls__.i.i232.i, %Array** %2031, align 8
  %2039 = bitcast %Qubit** %2032 to i64*
  store i64 %arg1.i.i217.i, i64* %2039, align 8
  %2040 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %1891, align 8
  %2041 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %2040, i64 0, i64 0
  %2042 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %2041, align 8
  %2043 = load i8*, i8** %1894, align 8
  tail call void %2042(i8* %2043, i8* nonnull %2028, i8* null)
  br i1 %.not.not9.i.i220.i, label %body__2.lr.ph.i.i236.i, label %exit__2.i.i240.i

body__2.lr.ph.i.i236.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i234.i
  %__qsVar0____qsVar0__numPair____11.i.i235.i = add nsw i64 %numControlPairs.i.i218.i, -1
  %2044 = bitcast i8* %controls8.i.i216.i to i64*
  %2045 = bitcast %Array* %temps.i.i219.i to i64*
  %2046 = getelementptr inbounds i8, i8* %controls8.i.i216.i, i64 32
  %2047 = getelementptr inbounds i8, i8* %1925, i64 32
  br label %body__2.i.i239.i

body__2.i.i239.i:                                 ; preds = %body__2.lr.ph.i.i236.i, %exit_quantum_grouping160
  %2048 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i235.i, %body__2.lr.ph.i.i236.i ], [ %2065, %exit_quantum_grouping160 ]
  %2049 = shl nuw i64 %2048, 1
  %2050 = load i64, i64* %2044, align 8
  %2051 = mul nsw i64 %2050, %2049
  %2052 = getelementptr inbounds i8, i8* %2046, i64 %2051
  %2053 = bitcast i8* %2052 to %Qubit**
  %2054 = load %Qubit*, %Qubit** %2053, align 8
  %2055 = or i64 %2049, 1
  %2056 = mul nsw i64 %2055, %2050
  %2057 = getelementptr inbounds i8, i8* %2046, i64 %2056
  %2058 = bitcast i8* %2057 to %Qubit**
  %2059 = load %Qubit*, %Qubit** %2058, align 8
  %2060 = load i64, i64* %2045, align 8
  %2061 = mul nsw i64 %2060, %2048
  %2062 = getelementptr inbounds i8, i8* %2047, i64 %2061
  %2063 = bitcast i8* %2062 to %Qubit**
  %2064 = load %Qubit*, %Qubit** %2063, align 8
  %2065 = add i64 %2048, -1
  %2066 = icmp sgt i64 %2065, -1
  br label %quantum159

quantum159:                                       ; preds = %body__2.i.i239.i
  tail call void @__quantum__qis__h__body(%Qubit* %2064)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2064, %Qubit* %2059)
  tail call void @__quantum__qis__t__body(%Qubit* %2059)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2054, %Qubit* %2059)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2064, %Qubit* %2054)
  tail call void @__quantum__qis__t__adj(%Qubit* %2064)
  tail call void @__quantum__qis__t__body(%Qubit* %2054)
  tail call void @__quantum__qis__t__adj(%Qubit* %2059)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2054, %Qubit* %2059)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2064, %Qubit* %2054)
  tail call void @__quantum__qis__h__body(%Qubit* %2064)
  br label %readout158

readout158:                                       ; preds = %quantum159
  br label %post-classical157

post-classical157:                                ; preds = %readout158
  br label %exit_quantum_grouping160

exit_quantum_grouping160:                         ; preds = %post-classical157
  br i1 %2066, label %body__2.i.i239.i, label %exit__2.i.i240.i

exit__2.i.i240.i:                                 ; preds = %exit_quantum_grouping160, %__quantum__rt__array_update_reference_count.exit5.i.i234.i
  %2067 = load i64, i64* %1927, align 8
  %2068 = add nsw i64 %2067, -1
  store i64 %2068, i64* %1927, align 8
  %2069 = load i64, i64* %2019, align 8
  %2070 = add nsw i64 %2069, -1
  store i64 %2070, i64* %2019, align 8
  %2071 = load i64, i64* %2034, align 8
  %2072 = add nsw i64 %2071, -1
  store i64 %2072, i64* %2034, align 8
  %2073 = icmp slt i64 %2071, 2
  br i1 %2073, label %2074, label %__quantum__rt__array_update_reference_count.exit6.i.i242.i

2074:                                             ; preds = %exit__2.i.i240.i
  tail call void @free(i8* nonnull %2017) #2
  %.pre.i.i241.i = load i64, i64* %2034, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i242.i

__quantum__rt__array_update_reference_count.exit6.i.i242.i: ; preds = %2074, %exit__2.i.i240.i
  %2075 = phi i64 [ %2072, %exit__2.i.i240.i ], [ %.pre.i.i241.i, %2074 ]
  %2076 = add nsw i64 %2075, -1
  store i64 %2076, i64* %2034, align 8
  %2077 = icmp slt i64 %2075, 2
  br i1 %2077, label %2078, label %__quantum__rt__array_update_reference_count.exit7.i.i243.i

2078:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i242.i
  tail call void @free(i8* nonnull %2017) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i243.i

__quantum__rt__array_update_reference_count.exit7.i.i243.i: ; preds = %2078, %__quantum__rt__array_update_reference_count.exit6.i.i242.i
  %2079 = load i64, i64* %2025, align 8
  %2080 = add nsw i64 %2079, -1
  store i64 %2080, i64* %2025, align 8
  %2081 = icmp slt i64 %2079, 2
  br i1 %2081, label %2082, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i244.i

2082:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i243.i
  tail call void @free(i8* nonnull %2022) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i244.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i244.i: ; preds = %2082, %__quantum__rt__array_update_reference_count.exit7.i.i243.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i219.i)
  %2083 = load i32, i32* %1898, align 4
  %2084 = add nsw i32 %2083, -1
  store i32 %2084, i32* %1898, align 4
  %2085 = load i64, i64* %1918, align 8
  %2086 = add nsw i64 %2085, -1
  store i64 %2086, i64* %1918, align 8
  %2087 = load i32, i32* %1896, align 8
  %2088 = add nsw i32 %2087, -1
  store i32 %2088, i32* %1896, align 8
  %2089 = load i64, i64* %1845, align 8
  %2090 = add nsw i64 %2089, -1
  store i64 %2090, i64* %1845, align 8
  %2091 = icmp slt i64 %2089, 2
  br i1 %2091, label %2092, label %__quantum__rt__array_update_reference_count.exit1.i245.i

2092:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i244.i
  tail call void @free(i8* nonnull %1840) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i245.i

__quantum__rt__array_update_reference_count.exit1.i245.i: ; preds = %2092, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i244.i
  %2093 = load i64, i64* %1903, align 8
  %2094 = add nsw i64 %2093, -1
  store i64 %2094, i64* %1903, align 8
  %2095 = icmp slt i64 %2093, 2
  br i1 %2095, label %2096, label %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i

2096:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i245.i
  tail call void @free(i8* nonnull %1900) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i:  ; preds = %2096, %__quantum__rt__array_update_reference_count.exit1.i245.i, %exit_quantum_grouping152, %exit_quantum_grouping148, %exit_quantum_grouping144
  %2097 = load i64, i64* %1847, align 8
  %2098 = add nsw i64 %2097, -1
  store i64 %2098, i64* %1847, align 8
  %2099 = load i64, i64* %1845, align 8
  %2100 = add nsw i64 %2099, -1
  store i64 %2100, i64* %1845, align 8
  %2101 = icmp slt i64 %2099, 2
  br i1 %2101, label %2102, label %Microsoft__Quantum__Canon__CZ__body.exit25.i

2102:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i
  tail call void @free(i8* nonnull %1840) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit25.i

Microsoft__Quantum__Canon__CZ__body.exit25.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.37.exit.i, %2102
  %2103 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2104 = bitcast i8* %2103 to i64*
  %2105 = getelementptr inbounds i8, i8* %2103, i64 8
  %2106 = bitcast i8* %2105 to i64*
  %2107 = getelementptr inbounds i8, i8* %2103, i64 16
  %2108 = bitcast i8* %2107 to i64*
  %2109 = getelementptr inbounds i8, i8* %2103, i64 24
  %2110 = bitcast i8* %2109 to i64*
  store i64 8, i64* %2104, align 8
  store i64 1, i64* %2106, align 8
  store i64 1, i64* %2108, align 8
  store i64 0, i64* %2110, align 8
  %2111 = getelementptr inbounds i8, i8* %2103, i64 32
  %2112 = bitcast i8* %2111 to %Qubit**
  store %Qubit* inttoptr (i64 20 to %Qubit*), %Qubit** %2112, align 8
  %2113 = load i64, i64* %2110, align 8
  %2114 = add nsw i64 %2113, 1
  store i64 %2114, i64* %2110, align 8
  %2115 = load i64, i64* %2106, align 8
  br label %quantum431

quantum431:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit25.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*), %Result* nonnull inttoptr (i64 7 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 19 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  br label %readout430

readout430:                                       ; preds = %quantum431
  %2116 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 7 to %Result*))
  br label %post-classical429

post-classical429:                                ; preds = %readout430
  br label %exit_quantum_grouping432

exit_quantum_grouping432:                         ; preds = %post-classical429
  switch i64 %2115, label %else__1.i250.i [
    i64 0, label %then0__1.i246.i
    i64 1, label %then1__1.i248.i
    i64 2, label %then2__1.i249.i
  ]

then0__1.i246.i:                                  ; preds = %exit_quantum_grouping432
  br label %quantum163

quantum163:                                       ; preds = %then0__1.i246.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout162

readout162:                                       ; preds = %quantum163
  br label %post-classical161

post-classical161:                                ; preds = %readout162
  br label %exit_quantum_grouping164

exit_quantum_grouping164:                         ; preds = %post-classical161
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i

then1__1.i248.i:                                  ; preds = %exit_quantum_grouping432
  %2117 = load %Qubit*, %Qubit** %2112, align 8
  br label %quantum167

quantum167:                                       ; preds = %then1__1.i248.i
  tail call void @__quantum__qis__cz__body(%Qubit* %2117, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout166

readout166:                                       ; preds = %quantum167
  br label %post-classical165

post-classical165:                                ; preds = %readout166
  br label %exit_quantum_grouping168

exit_quantum_grouping168:                         ; preds = %post-classical165
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i

then2__1.i249.i:                                  ; preds = %exit_quantum_grouping432
  %2118 = bitcast i8* %2103 to %Array*
  %2119 = bitcast %Array* %2118 to i64*
  %2120 = load %Qubit*, %Qubit** %2112, align 8
  %2121 = load i64, i64* %2119, align 8
  %2122 = getelementptr inbounds i8, i8* %2103, i64 %2121
  %2123 = getelementptr inbounds i8, i8* %2122, i64 32
  %2124 = bitcast i8* %2123 to %Qubit**
  %2125 = load %Qubit*, %Qubit** %2124, align 8
  %2126 = load %Qubit*, %Qubit** %2112, align 8
  %2127 = load %Qubit*, %Qubit** %2112, align 8
  %2128 = load i64, i64* %2119, align 8
  %2129 = getelementptr inbounds i8, i8* %2103, i64 %2128
  %2130 = getelementptr inbounds i8, i8* %2129, i64 32
  %2131 = bitcast i8* %2130 to %Qubit**
  %2132 = load %Qubit*, %Qubit** %2131, align 8
  %2133 = load i64, i64* %2119, align 8
  %2134 = getelementptr inbounds i8, i8* %2103, i64 %2133
  %2135 = getelementptr inbounds i8, i8* %2134, i64 32
  %2136 = bitcast i8* %2135 to %Qubit**
  %2137 = load %Qubit*, %Qubit** %2136, align 8
  %2138 = load %Qubit*, %Qubit** %2112, align 8
  %2139 = load %Qubit*, %Qubit** %2112, align 8
  %2140 = load i64, i64* %2119, align 8
  %2141 = getelementptr inbounds i8, i8* %2103, i64 %2140
  %2142 = getelementptr inbounds i8, i8* %2141, i64 32
  %2143 = bitcast i8* %2142 to %Qubit**
  %2144 = load %Qubit*, %Qubit** %2143, align 8
  %2145 = load %Qubit*, %Qubit** %2112, align 8
  %2146 = load %Qubit*, %Qubit** %2112, align 8
  %2147 = load i64, i64* %2119, align 8
  %2148 = getelementptr inbounds i8, i8* %2103, i64 %2147
  %2149 = getelementptr inbounds i8, i8* %2148, i64 32
  %2150 = bitcast i8* %2149 to %Qubit**
  %2151 = load %Qubit*, %Qubit** %2150, align 8
  %2152 = load %Qubit*, %Qubit** %2112, align 8
  br label %quantum171

quantum171:                                       ; preds = %then2__1.i249.i
  tail call void @__quantum__qis__t__adj(%Qubit* %2120)
  tail call void @__quantum__qis__t__adj(%Qubit* %2125)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %2126)
  tail call void @__quantum__qis__t__body(%Qubit* %2127)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2132, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %2137, %Qubit* %2138)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %2139)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2144, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %2145)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %2146)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2151, %Qubit* %2152)
  br label %readout170

readout170:                                       ; preds = %quantum171
  br label %post-classical169

post-classical169:                                ; preds = %readout170
  br label %exit_quantum_grouping172

exit_quantum_grouping172:                         ; preds = %post-classical169
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i

else__1.i250.i:                                   ; preds = %exit_quantum_grouping432
  %2153 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %2154 = bitcast i8* %2153 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %2154, align 8
  %2155 = getelementptr inbounds i8, i8* %2153, i64 8
  %2156 = getelementptr inbounds i8, i8* %2153, i64 16
  %2157 = bitcast i8* %2156 to i8**
  %2158 = getelementptr inbounds i8, i8* %2153, i64 24
  %2159 = bitcast i8* %2158 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %2155, i8 0, i64 16, i1 false)
  store i32 1, i32* %2159, align 8
  %2160 = getelementptr inbounds i8, i8* %2153, i64 28
  %2161 = bitcast i8* %2160 to i32*
  store i32 0, i32* %2161, align 4
  %2162 = bitcast i8* %2153 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %2162)
  %2163 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2164 = bitcast i8* %2163 to i64*
  %2165 = getelementptr inbounds i8, i8* %2163, i64 8
  %2166 = bitcast i8* %2165 to i64*
  %2167 = getelementptr inbounds i8, i8* %2163, i64 16
  %2168 = bitcast i8* %2167 to i64*
  store i64 16, i64* %2164, align 8
  store i64 1, i64* %2166, align 8
  store i64 0, i64* %2168, align 8
  %2169 = getelementptr inbounds i8, i8* %2163, i64 24
  %2170 = bitcast i8* %2169 to %Tuple*
  %2171 = bitcast %Tuple* %2170 to { %Array*, %Qubit* }*
  %2172 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2171, i64 0, i32 1
  %2173 = load i64, i64* %2108, align 8
  %2174 = add nsw i64 %2173, 1
  store i64 %2174, i64* %2108, align 8
  %2175 = icmp slt i64 %2173, 0
  br i1 %2175, label %2176, label %__quantum__rt__array_update_reference_count.exit.i256.i

2176:                                             ; preds = %else__1.i250.i
  tail call void @free(i8* nonnull %2103) #2
  br label %__quantum__rt__array_update_reference_count.exit.i256.i

__quantum__rt__array_update_reference_count.exit.i256.i: ; preds = %2176, %else__1.i250.i
  %2177 = bitcast %Tuple* %2170 to i8**
  store i8* %2103, i8** %2177, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %2172, align 8
  %2178 = load i32, i32* %2161, align 4
  %2179 = add nsw i32 %2178, 1
  store i32 %2179, i32* %2161, align 4
  %controls8.i.i251.i = load i8*, i8** %2177, align 8
  %2180 = getelementptr inbounds i8, i8* %controls8.i.i251.i, i64 24
  %2181 = bitcast i8* %2180 to i64*
  %2182 = load i64, i64* %2181, align 8
  %2183 = add nsw i64 %2182, 1
  store i64 %2183, i64* %2181, align 8
  %2184 = bitcast %Qubit** %2172 to i64*
  %arg1.i.i252.i = load i64, i64* %2184, align 8
  %2185 = getelementptr inbounds i8, i8* %controls8.i.i251.i, i64 8
  %2186 = bitcast i8* %2185 to i64*
  %2187 = load i64, i64* %2186, align 8
  %numControlPairs.i.i253.i = sdiv i64 %2187, 2
  %temps.i.i254.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i253.i)
  %2188 = bitcast %Array* %temps.i.i254.i to i8*
  %2189 = getelementptr inbounds i8, i8* %2188, i64 24
  %2190 = bitcast i8* %2189 to i64*
  %2191 = load i64, i64* %2190, align 8
  %2192 = add nsw i64 %2191, 1
  store i64 %2192, i64* %2190, align 8
  %.not.not9.i.i255.i = icmp sgt i64 %2187, 1
  br i1 %.not.not9.i.i255.i, label %body__1.lr.ph.i.i257.i, label %exit__1.i.i261.i

body__1.lr.ph.i.i257.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i256.i
  %2193 = bitcast i8* %controls8.i.i251.i to i64*
  %2194 = bitcast %Array* %temps.i.i254.i to i64*
  %2195 = getelementptr inbounds i8, i8* %controls8.i.i251.i, i64 32
  %2196 = getelementptr inbounds i8, i8* %2188, i64 32
  br label %body__1.i.i260.i

body__1.i.i260.i:                                 ; preds = %body__1.lr.ph.i.i257.i, %exit_quantum_grouping176
  %2197 = phi i64 [ 0, %body__1.lr.ph.i.i257.i ], [ %2214, %exit_quantum_grouping176 ]
  %2198 = shl nuw i64 %2197, 1
  %2199 = load i64, i64* %2193, align 8
  %2200 = mul nsw i64 %2199, %2198
  %2201 = getelementptr inbounds i8, i8* %2195, i64 %2200
  %2202 = bitcast i8* %2201 to %Qubit**
  %2203 = load %Qubit*, %Qubit** %2202, align 8
  %2204 = or i64 %2198, 1
  %2205 = mul nsw i64 %2204, %2199
  %2206 = getelementptr inbounds i8, i8* %2195, i64 %2205
  %2207 = bitcast i8* %2206 to %Qubit**
  %2208 = load %Qubit*, %Qubit** %2207, align 8
  %2209 = load i64, i64* %2194, align 8
  %2210 = mul nsw i64 %2209, %2197
  %2211 = getelementptr inbounds i8, i8* %2196, i64 %2210
  %2212 = bitcast i8* %2211 to %Qubit**
  %2213 = load %Qubit*, %Qubit** %2212, align 8
  %2214 = add nuw nsw i64 %2197, 1
  %2215 = icmp eq i64 %2214, %numControlPairs.i.i253.i
  br label %quantum175

quantum175:                                       ; preds = %body__1.i.i260.i
  tail call void @__quantum__qis__h__body(%Qubit* %2213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2213, %Qubit* %2203)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2203, %Qubit* %2208)
  tail call void @__quantum__qis__t__body(%Qubit* %2208)
  tail call void @__quantum__qis__t__adj(%Qubit* %2203)
  tail call void @__quantum__qis__t__body(%Qubit* %2213)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2213, %Qubit* %2203)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2203, %Qubit* %2208)
  tail call void @__quantum__qis__t__adj(%Qubit* %2208)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2213, %Qubit* %2208)
  tail call void @__quantum__qis__h__body(%Qubit* %2213)
  br label %readout174

readout174:                                       ; preds = %quantum175
  br label %post-classical173

post-classical173:                                ; preds = %readout174
  br label %exit_quantum_grouping176

exit_quantum_grouping176:                         ; preds = %post-classical173
  br i1 %2215, label %exit__1.i.i261.i, label %body__1.i.i260.i

exit__1.i.i261.i:                                 ; preds = %exit_quantum_grouping176, %__quantum__rt__array_update_reference_count.exit.i256.i
  %2216 = and i64 %2187, 1
  %2217 = icmp eq i64 %2216, 0
  br i1 %2217, label %condTrue__1.i.i262.i, label %condFalse__1.i.i264.i

condTrue__1.i.i262.i:                             ; preds = %exit__1.i.i261.i
  %2218 = getelementptr inbounds i8, i8* %2188, i64 16
  %2219 = bitcast i8* %2218 to i64*
  %2220 = load i64, i64* %2219, align 8
  %2221 = add nsw i64 %2220, 1
  store i64 %2221, i64* %2219, align 8
  %2222 = icmp slt i64 %2220, 0
  br i1 %2222, label %2223, label %condContinue__1.i.i268.i

2223:                                             ; preds = %condTrue__1.i.i262.i
  tail call void @free(i8* nonnull %2188) #2
  br label %condContinue__1.i.i268.i

condFalse__1.i.i264.i:                            ; preds = %exit__1.i.i261.i
  %2224 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2225 = bitcast i8* %2224 to i64*
  %2226 = getelementptr inbounds i8, i8* %2224, i64 8
  %2227 = bitcast i8* %2226 to i64*
  %2228 = getelementptr inbounds i8, i8* %2224, i64 16
  %2229 = bitcast i8* %2228 to i64*
  %2230 = getelementptr inbounds i8, i8* %2224, i64 24
  %2231 = bitcast i8* %2230 to i64*
  store i64 8, i64* %2225, align 8
  store i64 1, i64* %2227, align 8
  store i64 1, i64* %2229, align 8
  store i64 0, i64* %2231, align 8
  %2232 = getelementptr inbounds i8, i8* %2224, i64 32
  %2233 = add i64 %2187, -1
  %2234 = bitcast i8* %controls8.i.i251.i to i64*
  %2235 = load i64, i64* %2234, align 8
  %2236 = mul nsw i64 %2235, %2233
  %2237 = getelementptr inbounds i8, i8* %controls8.i.i251.i, i64 %2236
  %2238 = getelementptr inbounds i8, i8* %2237, i64 32
  %2239 = bitcast i8* %2238 to i64*
  %2240 = load i64, i64* %2239, align 8
  %2241 = bitcast i8* %2232 to i64*
  store i64 %2240, i64* %2241, align 8
  %2242 = bitcast %Array* %temps.i.i254.i to i64*
  %2243 = load i64, i64* %2242, align 8
  %2244 = getelementptr inbounds i8, i8* %2188, i64 8
  %2245 = bitcast i8* %2244 to i64*
  %2246 = load i64, i64* %2245, align 8
  %2247 = load i64, i64* %2227, align 8
  %2248 = getelementptr inbounds i8, i8* %2188, i64 32
  %2249 = add nsw i64 %2247, %2246
  %sext.i.i.i263.i = shl i64 %2243, 32
  %2250 = ashr exact i64 %sext.i.i.i263.i, 32
  %2251 = mul nsw i64 %2249, %2250
  %2252 = add i64 %2251, 32
  %2253 = tail call i8* @malloc(i64 %2252) #5
  %2254 = bitcast i8* %2253 to i64*
  %2255 = getelementptr inbounds i8, i8* %2253, i64 8
  %2256 = bitcast i8* %2255 to i64*
  %2257 = getelementptr inbounds i8, i8* %2253, i64 16
  %2258 = bitcast i8* %2257 to i64*
  %2259 = getelementptr inbounds i8, i8* %2253, i64 24
  %2260 = bitcast i8* %2259 to i64*
  store i64 %2250, i64* %2254, align 8
  store i64 %2249, i64* %2256, align 8
  store i64 1, i64* %2258, align 8
  store i64 0, i64* %2260, align 8
  %2261 = getelementptr inbounds i8, i8* %2253, i64 32
  %2262 = mul nsw i64 %2246, %2243
  %2263 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2261, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2261, i8* nonnull align 1 %2248, i64 %2262, i1 false) #2
  %2264 = getelementptr inbounds i8, i8* %2261, i64 %2262
  %2265 = mul nsw i64 %2247, %2243
  %2266 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2264, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2264, i8* nonnull align 1 %2232, i64 %2265, i1 false) #2
  %2267 = bitcast i8* %2253 to %Array*
  %2268 = load i64, i64* %2258, align 8
  %2269 = add nsw i64 %2268, 1
  store i64 %2269, i64* %2258, align 8
  %2270 = icmp slt i64 %2268, 0
  br i1 %2270, label %2271, label %__quantum__rt__array_update_reference_count.exit2.i.i265.i

2271:                                             ; preds = %condFalse__1.i.i264.i
  tail call void @free(i8* nonnull %2253) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i265.i

__quantum__rt__array_update_reference_count.exit2.i.i265.i: ; preds = %2271, %condFalse__1.i.i264.i
  %2272 = load i64, i64* %2229, align 8
  %2273 = add nsw i64 %2272, -1
  store i64 %2273, i64* %2229, align 8
  %2274 = icmp slt i64 %2272, 2
  br i1 %2274, label %2275, label %__quantum__rt__array_update_reference_count.exit3.i.i266.i

2275:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i265.i
  tail call void @free(i8* nonnull %2224) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i266.i

__quantum__rt__array_update_reference_count.exit3.i.i266.i: ; preds = %2275, %__quantum__rt__array_update_reference_count.exit2.i.i265.i
  %2276 = load i64, i64* %2258, align 8
  %2277 = add nsw i64 %2276, -1
  store i64 %2277, i64* %2258, align 8
  %2278 = icmp slt i64 %2276, 2
  br i1 %2278, label %2279, label %condContinue__1.i.i268.i

2279:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i266.i
  tail call void @free(i8* nonnull %2253) #2
  br label %condContinue__1.i.i268.i

condContinue__1.i.i268.i:                         ; preds = %2279, %__quantum__rt__array_update_reference_count.exit3.i.i266.i, %2223, %condTrue__1.i.i262.i
  %__qsVar1__newControls__.i.i267.i = phi %Array* [ %temps.i.i254.i, %condTrue__1.i.i262.i ], [ %temps.i.i254.i, %2223 ], [ %2267, %__quantum__rt__array_update_reference_count.exit3.i.i266.i ], [ %2267, %2279 ]
  %2280 = bitcast %Array* %__qsVar1__newControls__.i.i267.i to i8*
  %2281 = getelementptr inbounds i8, i8* %2280, i64 24
  %2282 = bitcast i8* %2281 to i64*
  %2283 = load i64, i64* %2282, align 8
  %2284 = add nsw i64 %2283, 1
  store i64 %2284, i64* %2282, align 8
  %2285 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2286 = bitcast i8* %2285 to i64*
  %2287 = getelementptr inbounds i8, i8* %2285, i64 8
  %2288 = bitcast i8* %2287 to i64*
  %2289 = getelementptr inbounds i8, i8* %2285, i64 16
  %2290 = bitcast i8* %2289 to i64*
  store i64 16, i64* %2286, align 8
  store i64 1, i64* %2288, align 8
  store i64 0, i64* %2290, align 8
  %2291 = getelementptr inbounds i8, i8* %2285, i64 24
  %2292 = bitcast i8* %2291 to %Tuple*
  %2293 = bitcast %Tuple* %2292 to { %Array*, %Qubit* }*
  %2294 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2293, i64 0, i32 0
  %2295 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2293, i64 0, i32 1
  %2296 = getelementptr inbounds i8, i8* %2280, i64 16
  %2297 = bitcast i8* %2296 to i64*
  %2298 = load i64, i64* %2297, align 8
  %2299 = add nsw i64 %2298, 1
  store i64 %2299, i64* %2297, align 8
  %2300 = icmp slt i64 %2298, 0
  br i1 %2300, label %2301, label %__quantum__rt__array_update_reference_count.exit5.i.i269.i

2301:                                             ; preds = %condContinue__1.i.i268.i
  tail call void @free(i8* nonnull %2280) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i269.i

__quantum__rt__array_update_reference_count.exit5.i.i269.i: ; preds = %2301, %condContinue__1.i.i268.i
  store %Array* %__qsVar1__newControls__.i.i267.i, %Array** %2294, align 8
  %2302 = bitcast %Qubit** %2295 to i64*
  store i64 %arg1.i.i252.i, i64* %2302, align 8
  %2303 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %2154, align 8
  %2304 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %2303, i64 0, i64 0
  %2305 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %2304, align 8
  %2306 = load i8*, i8** %2157, align 8
  tail call void %2305(i8* %2306, i8* nonnull %2291, i8* null)
  br i1 %.not.not9.i.i255.i, label %body__2.lr.ph.i.i271.i, label %exit__2.i.i275.i

body__2.lr.ph.i.i271.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i269.i
  %__qsVar0____qsVar0__numPair____11.i.i270.i = add nsw i64 %numControlPairs.i.i253.i, -1
  %2307 = bitcast i8* %controls8.i.i251.i to i64*
  %2308 = bitcast %Array* %temps.i.i254.i to i64*
  %2309 = getelementptr inbounds i8, i8* %controls8.i.i251.i, i64 32
  %2310 = getelementptr inbounds i8, i8* %2188, i64 32
  br label %body__2.i.i274.i

body__2.i.i274.i:                                 ; preds = %body__2.lr.ph.i.i271.i, %exit_quantum_grouping180
  %2311 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i270.i, %body__2.lr.ph.i.i271.i ], [ %2328, %exit_quantum_grouping180 ]
  %2312 = shl nuw i64 %2311, 1
  %2313 = load i64, i64* %2307, align 8
  %2314 = mul nsw i64 %2313, %2312
  %2315 = getelementptr inbounds i8, i8* %2309, i64 %2314
  %2316 = bitcast i8* %2315 to %Qubit**
  %2317 = load %Qubit*, %Qubit** %2316, align 8
  %2318 = or i64 %2312, 1
  %2319 = mul nsw i64 %2318, %2313
  %2320 = getelementptr inbounds i8, i8* %2309, i64 %2319
  %2321 = bitcast i8* %2320 to %Qubit**
  %2322 = load %Qubit*, %Qubit** %2321, align 8
  %2323 = load i64, i64* %2308, align 8
  %2324 = mul nsw i64 %2323, %2311
  %2325 = getelementptr inbounds i8, i8* %2310, i64 %2324
  %2326 = bitcast i8* %2325 to %Qubit**
  %2327 = load %Qubit*, %Qubit** %2326, align 8
  %2328 = add i64 %2311, -1
  %2329 = icmp sgt i64 %2328, -1
  br label %quantum179

quantum179:                                       ; preds = %body__2.i.i274.i
  tail call void @__quantum__qis__h__body(%Qubit* %2327)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2327, %Qubit* %2322)
  tail call void @__quantum__qis__t__body(%Qubit* %2322)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2317, %Qubit* %2322)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2327, %Qubit* %2317)
  tail call void @__quantum__qis__t__adj(%Qubit* %2327)
  tail call void @__quantum__qis__t__body(%Qubit* %2317)
  tail call void @__quantum__qis__t__adj(%Qubit* %2322)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2317, %Qubit* %2322)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2327, %Qubit* %2317)
  tail call void @__quantum__qis__h__body(%Qubit* %2327)
  br label %readout178

readout178:                                       ; preds = %quantum179
  br label %post-classical177

post-classical177:                                ; preds = %readout178
  br label %exit_quantum_grouping180

exit_quantum_grouping180:                         ; preds = %post-classical177
  br i1 %2329, label %body__2.i.i274.i, label %exit__2.i.i275.i

exit__2.i.i275.i:                                 ; preds = %exit_quantum_grouping180, %__quantum__rt__array_update_reference_count.exit5.i.i269.i
  %2330 = load i64, i64* %2190, align 8
  %2331 = add nsw i64 %2330, -1
  store i64 %2331, i64* %2190, align 8
  %2332 = load i64, i64* %2282, align 8
  %2333 = add nsw i64 %2332, -1
  store i64 %2333, i64* %2282, align 8
  %2334 = load i64, i64* %2297, align 8
  %2335 = add nsw i64 %2334, -1
  store i64 %2335, i64* %2297, align 8
  %2336 = icmp slt i64 %2334, 2
  br i1 %2336, label %2337, label %__quantum__rt__array_update_reference_count.exit6.i.i277.i

2337:                                             ; preds = %exit__2.i.i275.i
  tail call void @free(i8* nonnull %2280) #2
  %.pre.i.i276.i = load i64, i64* %2297, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i277.i

__quantum__rt__array_update_reference_count.exit6.i.i277.i: ; preds = %2337, %exit__2.i.i275.i
  %2338 = phi i64 [ %2335, %exit__2.i.i275.i ], [ %.pre.i.i276.i, %2337 ]
  %2339 = add nsw i64 %2338, -1
  store i64 %2339, i64* %2297, align 8
  %2340 = icmp slt i64 %2338, 2
  br i1 %2340, label %2341, label %__quantum__rt__array_update_reference_count.exit7.i.i278.i

2341:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i277.i
  tail call void @free(i8* nonnull %2280) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i278.i

__quantum__rt__array_update_reference_count.exit7.i.i278.i: ; preds = %2341, %__quantum__rt__array_update_reference_count.exit6.i.i277.i
  %2342 = load i64, i64* %2288, align 8
  %2343 = add nsw i64 %2342, -1
  store i64 %2343, i64* %2288, align 8
  %2344 = icmp slt i64 %2342, 2
  br i1 %2344, label %2345, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i279.i

2345:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i278.i
  tail call void @free(i8* nonnull %2285) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i279.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i279.i: ; preds = %2345, %__quantum__rt__array_update_reference_count.exit7.i.i278.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i254.i)
  %2346 = load i32, i32* %2161, align 4
  %2347 = add nsw i32 %2346, -1
  store i32 %2347, i32* %2161, align 4
  %2348 = load i64, i64* %2181, align 8
  %2349 = add nsw i64 %2348, -1
  store i64 %2349, i64* %2181, align 8
  %2350 = load i32, i32* %2159, align 8
  %2351 = add nsw i32 %2350, -1
  store i32 %2351, i32* %2159, align 8
  %2352 = load i64, i64* %2108, align 8
  %2353 = add nsw i64 %2352, -1
  store i64 %2353, i64* %2108, align 8
  %2354 = icmp slt i64 %2352, 2
  br i1 %2354, label %2355, label %__quantum__rt__array_update_reference_count.exit1.i280.i

2355:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i279.i
  tail call void @free(i8* nonnull %2103) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i280.i

__quantum__rt__array_update_reference_count.exit1.i280.i: ; preds = %2355, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i279.i
  %2356 = load i64, i64* %2166, align 8
  %2357 = add nsw i64 %2356, -1
  store i64 %2357, i64* %2166, align 8
  %2358 = icmp slt i64 %2356, 2
  br i1 %2358, label %2359, label %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i

2359:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i280.i
  tail call void @free(i8* nonnull %2163) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i:  ; preds = %2359, %__quantum__rt__array_update_reference_count.exit1.i280.i, %exit_quantum_grouping172, %exit_quantum_grouping168, %exit_quantum_grouping164
  %2360 = load i64, i64* %2110, align 8
  %2361 = add nsw i64 %2360, -1
  store i64 %2361, i64* %2110, align 8
  %2362 = load i64, i64* %2108, align 8
  %2363 = add nsw i64 %2362, -1
  store i64 %2363, i64* %2108, align 8
  %2364 = icmp slt i64 %2362, 2
  br i1 %2364, label %2365, label %Microsoft__Quantum__Canon__CZ__body.exit26.i

2365:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i
  tail call void @free(i8* nonnull %2103) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit26.i

Microsoft__Quantum__Canon__CZ__body.exit26.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.38.exit.i, %2365
  %2366 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2367 = bitcast i8* %2366 to i64*
  %2368 = getelementptr inbounds i8, i8* %2366, i64 8
  %2369 = bitcast i8* %2368 to i64*
  %2370 = getelementptr inbounds i8, i8* %2366, i64 16
  %2371 = bitcast i8* %2370 to i64*
  %2372 = getelementptr inbounds i8, i8* %2366, i64 24
  %2373 = bitcast i8* %2372 to i64*
  store i64 8, i64* %2367, align 8
  store i64 1, i64* %2369, align 8
  store i64 1, i64* %2371, align 8
  store i64 0, i64* %2373, align 8
  %2374 = getelementptr inbounds i8, i8* %2366, i64 32
  %2375 = bitcast i8* %2374 to %Qubit**
  store %Qubit* inttoptr (i64 21 to %Qubit*), %Qubit** %2375, align 8
  %2376 = load i64, i64* %2373, align 8
  %2377 = add nsw i64 %2376, 1
  store i64 %2377, i64* %2373, align 8
  %2378 = load i64, i64* %2369, align 8
  br label %quantum435

quantum435:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit26.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*), %Result* nonnull inttoptr (i64 8 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 20 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  br label %readout434

readout434:                                       ; preds = %quantum435
  %2379 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 8 to %Result*))
  br label %post-classical433

post-classical433:                                ; preds = %readout434
  br label %exit_quantum_grouping436

exit_quantum_grouping436:                         ; preds = %post-classical433
  switch i64 %2378, label %else__1.i285.i [
    i64 0, label %then0__1.i281.i
    i64 1, label %then1__1.i283.i
    i64 2, label %then2__1.i284.i
  ]

then0__1.i281.i:                                  ; preds = %exit_quantum_grouping436
  br label %quantum183

quantum183:                                       ; preds = %then0__1.i281.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout182

readout182:                                       ; preds = %quantum183
  br label %post-classical181

post-classical181:                                ; preds = %readout182
  br label %exit_quantum_grouping184

exit_quantum_grouping184:                         ; preds = %post-classical181
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i

then1__1.i283.i:                                  ; preds = %exit_quantum_grouping436
  %2380 = load %Qubit*, %Qubit** %2375, align 8
  br label %quantum187

quantum187:                                       ; preds = %then1__1.i283.i
  tail call void @__quantum__qis__cz__body(%Qubit* %2380, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout186

readout186:                                       ; preds = %quantum187
  br label %post-classical185

post-classical185:                                ; preds = %readout186
  br label %exit_quantum_grouping188

exit_quantum_grouping188:                         ; preds = %post-classical185
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i

then2__1.i284.i:                                  ; preds = %exit_quantum_grouping436
  %2381 = bitcast i8* %2366 to %Array*
  %2382 = bitcast %Array* %2381 to i64*
  %2383 = load %Qubit*, %Qubit** %2375, align 8
  %2384 = load i64, i64* %2382, align 8
  %2385 = getelementptr inbounds i8, i8* %2366, i64 %2384
  %2386 = getelementptr inbounds i8, i8* %2385, i64 32
  %2387 = bitcast i8* %2386 to %Qubit**
  %2388 = load %Qubit*, %Qubit** %2387, align 8
  %2389 = load %Qubit*, %Qubit** %2375, align 8
  %2390 = load %Qubit*, %Qubit** %2375, align 8
  %2391 = load i64, i64* %2382, align 8
  %2392 = getelementptr inbounds i8, i8* %2366, i64 %2391
  %2393 = getelementptr inbounds i8, i8* %2392, i64 32
  %2394 = bitcast i8* %2393 to %Qubit**
  %2395 = load %Qubit*, %Qubit** %2394, align 8
  %2396 = load i64, i64* %2382, align 8
  %2397 = getelementptr inbounds i8, i8* %2366, i64 %2396
  %2398 = getelementptr inbounds i8, i8* %2397, i64 32
  %2399 = bitcast i8* %2398 to %Qubit**
  %2400 = load %Qubit*, %Qubit** %2399, align 8
  %2401 = load %Qubit*, %Qubit** %2375, align 8
  %2402 = load %Qubit*, %Qubit** %2375, align 8
  %2403 = load i64, i64* %2382, align 8
  %2404 = getelementptr inbounds i8, i8* %2366, i64 %2403
  %2405 = getelementptr inbounds i8, i8* %2404, i64 32
  %2406 = bitcast i8* %2405 to %Qubit**
  %2407 = load %Qubit*, %Qubit** %2406, align 8
  %2408 = load %Qubit*, %Qubit** %2375, align 8
  %2409 = load %Qubit*, %Qubit** %2375, align 8
  %2410 = load i64, i64* %2382, align 8
  %2411 = getelementptr inbounds i8, i8* %2366, i64 %2410
  %2412 = getelementptr inbounds i8, i8* %2411, i64 32
  %2413 = bitcast i8* %2412 to %Qubit**
  %2414 = load %Qubit*, %Qubit** %2413, align 8
  %2415 = load %Qubit*, %Qubit** %2375, align 8
  br label %quantum191

quantum191:                                       ; preds = %then2__1.i284.i
  tail call void @__quantum__qis__t__adj(%Qubit* %2383)
  tail call void @__quantum__qis__t__adj(%Qubit* %2388)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %2389)
  tail call void @__quantum__qis__t__body(%Qubit* %2390)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2395, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %2400, %Qubit* %2401)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %2402)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2407, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %2408)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %2409)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2414, %Qubit* %2415)
  br label %readout190

readout190:                                       ; preds = %quantum191
  br label %post-classical189

post-classical189:                                ; preds = %readout190
  br label %exit_quantum_grouping192

exit_quantum_grouping192:                         ; preds = %post-classical189
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i

else__1.i285.i:                                   ; preds = %exit_quantum_grouping436
  %2416 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %2417 = bitcast i8* %2416 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %2417, align 8
  %2418 = getelementptr inbounds i8, i8* %2416, i64 8
  %2419 = getelementptr inbounds i8, i8* %2416, i64 16
  %2420 = bitcast i8* %2419 to i8**
  %2421 = getelementptr inbounds i8, i8* %2416, i64 24
  %2422 = bitcast i8* %2421 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %2418, i8 0, i64 16, i1 false)
  store i32 1, i32* %2422, align 8
  %2423 = getelementptr inbounds i8, i8* %2416, i64 28
  %2424 = bitcast i8* %2423 to i32*
  store i32 0, i32* %2424, align 4
  %2425 = bitcast i8* %2416 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %2425)
  %2426 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2427 = bitcast i8* %2426 to i64*
  %2428 = getelementptr inbounds i8, i8* %2426, i64 8
  %2429 = bitcast i8* %2428 to i64*
  %2430 = getelementptr inbounds i8, i8* %2426, i64 16
  %2431 = bitcast i8* %2430 to i64*
  store i64 16, i64* %2427, align 8
  store i64 1, i64* %2429, align 8
  store i64 0, i64* %2431, align 8
  %2432 = getelementptr inbounds i8, i8* %2426, i64 24
  %2433 = bitcast i8* %2432 to %Tuple*
  %2434 = bitcast %Tuple* %2433 to { %Array*, %Qubit* }*
  %2435 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2434, i64 0, i32 1
  %2436 = load i64, i64* %2371, align 8
  %2437 = add nsw i64 %2436, 1
  store i64 %2437, i64* %2371, align 8
  %2438 = icmp slt i64 %2436, 0
  br i1 %2438, label %2439, label %__quantum__rt__array_update_reference_count.exit.i291.i

2439:                                             ; preds = %else__1.i285.i
  tail call void @free(i8* nonnull %2366) #2
  br label %__quantum__rt__array_update_reference_count.exit.i291.i

__quantum__rt__array_update_reference_count.exit.i291.i: ; preds = %2439, %else__1.i285.i
  %2440 = bitcast %Tuple* %2433 to i8**
  store i8* %2366, i8** %2440, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %2435, align 8
  %2441 = load i32, i32* %2424, align 4
  %2442 = add nsw i32 %2441, 1
  store i32 %2442, i32* %2424, align 4
  %controls8.i.i286.i = load i8*, i8** %2440, align 8
  %2443 = getelementptr inbounds i8, i8* %controls8.i.i286.i, i64 24
  %2444 = bitcast i8* %2443 to i64*
  %2445 = load i64, i64* %2444, align 8
  %2446 = add nsw i64 %2445, 1
  store i64 %2446, i64* %2444, align 8
  %2447 = bitcast %Qubit** %2435 to i64*
  %arg1.i.i287.i = load i64, i64* %2447, align 8
  %2448 = getelementptr inbounds i8, i8* %controls8.i.i286.i, i64 8
  %2449 = bitcast i8* %2448 to i64*
  %2450 = load i64, i64* %2449, align 8
  %numControlPairs.i.i288.i = sdiv i64 %2450, 2
  %temps.i.i289.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i288.i)
  %2451 = bitcast %Array* %temps.i.i289.i to i8*
  %2452 = getelementptr inbounds i8, i8* %2451, i64 24
  %2453 = bitcast i8* %2452 to i64*
  %2454 = load i64, i64* %2453, align 8
  %2455 = add nsw i64 %2454, 1
  store i64 %2455, i64* %2453, align 8
  %.not.not9.i.i290.i = icmp sgt i64 %2450, 1
  br i1 %.not.not9.i.i290.i, label %body__1.lr.ph.i.i292.i, label %exit__1.i.i296.i

body__1.lr.ph.i.i292.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i291.i
  %2456 = bitcast i8* %controls8.i.i286.i to i64*
  %2457 = bitcast %Array* %temps.i.i289.i to i64*
  %2458 = getelementptr inbounds i8, i8* %controls8.i.i286.i, i64 32
  %2459 = getelementptr inbounds i8, i8* %2451, i64 32
  br label %body__1.i.i295.i

body__1.i.i295.i:                                 ; preds = %body__1.lr.ph.i.i292.i, %exit_quantum_grouping196
  %2460 = phi i64 [ 0, %body__1.lr.ph.i.i292.i ], [ %2477, %exit_quantum_grouping196 ]
  %2461 = shl nuw i64 %2460, 1
  %2462 = load i64, i64* %2456, align 8
  %2463 = mul nsw i64 %2462, %2461
  %2464 = getelementptr inbounds i8, i8* %2458, i64 %2463
  %2465 = bitcast i8* %2464 to %Qubit**
  %2466 = load %Qubit*, %Qubit** %2465, align 8
  %2467 = or i64 %2461, 1
  %2468 = mul nsw i64 %2467, %2462
  %2469 = getelementptr inbounds i8, i8* %2458, i64 %2468
  %2470 = bitcast i8* %2469 to %Qubit**
  %2471 = load %Qubit*, %Qubit** %2470, align 8
  %2472 = load i64, i64* %2457, align 8
  %2473 = mul nsw i64 %2472, %2460
  %2474 = getelementptr inbounds i8, i8* %2459, i64 %2473
  %2475 = bitcast i8* %2474 to %Qubit**
  %2476 = load %Qubit*, %Qubit** %2475, align 8
  %2477 = add nuw nsw i64 %2460, 1
  %2478 = icmp eq i64 %2477, %numControlPairs.i.i288.i
  br label %quantum195

quantum195:                                       ; preds = %body__1.i.i295.i
  tail call void @__quantum__qis__h__body(%Qubit* %2476)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2476, %Qubit* %2466)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2466, %Qubit* %2471)
  tail call void @__quantum__qis__t__body(%Qubit* %2471)
  tail call void @__quantum__qis__t__adj(%Qubit* %2466)
  tail call void @__quantum__qis__t__body(%Qubit* %2476)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2476, %Qubit* %2466)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2466, %Qubit* %2471)
  tail call void @__quantum__qis__t__adj(%Qubit* %2471)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2476, %Qubit* %2471)
  tail call void @__quantum__qis__h__body(%Qubit* %2476)
  br label %readout194

readout194:                                       ; preds = %quantum195
  br label %post-classical193

post-classical193:                                ; preds = %readout194
  br label %exit_quantum_grouping196

exit_quantum_grouping196:                         ; preds = %post-classical193
  br i1 %2478, label %exit__1.i.i296.i, label %body__1.i.i295.i

exit__1.i.i296.i:                                 ; preds = %exit_quantum_grouping196, %__quantum__rt__array_update_reference_count.exit.i291.i
  %2479 = and i64 %2450, 1
  %2480 = icmp eq i64 %2479, 0
  br i1 %2480, label %condTrue__1.i.i297.i, label %condFalse__1.i.i299.i

condTrue__1.i.i297.i:                             ; preds = %exit__1.i.i296.i
  %2481 = getelementptr inbounds i8, i8* %2451, i64 16
  %2482 = bitcast i8* %2481 to i64*
  %2483 = load i64, i64* %2482, align 8
  %2484 = add nsw i64 %2483, 1
  store i64 %2484, i64* %2482, align 8
  %2485 = icmp slt i64 %2483, 0
  br i1 %2485, label %2486, label %condContinue__1.i.i303.i

2486:                                             ; preds = %condTrue__1.i.i297.i
  tail call void @free(i8* nonnull %2451) #2
  br label %condContinue__1.i.i303.i

condFalse__1.i.i299.i:                            ; preds = %exit__1.i.i296.i
  %2487 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2488 = bitcast i8* %2487 to i64*
  %2489 = getelementptr inbounds i8, i8* %2487, i64 8
  %2490 = bitcast i8* %2489 to i64*
  %2491 = getelementptr inbounds i8, i8* %2487, i64 16
  %2492 = bitcast i8* %2491 to i64*
  %2493 = getelementptr inbounds i8, i8* %2487, i64 24
  %2494 = bitcast i8* %2493 to i64*
  store i64 8, i64* %2488, align 8
  store i64 1, i64* %2490, align 8
  store i64 1, i64* %2492, align 8
  store i64 0, i64* %2494, align 8
  %2495 = getelementptr inbounds i8, i8* %2487, i64 32
  %2496 = add i64 %2450, -1
  %2497 = bitcast i8* %controls8.i.i286.i to i64*
  %2498 = load i64, i64* %2497, align 8
  %2499 = mul nsw i64 %2498, %2496
  %2500 = getelementptr inbounds i8, i8* %controls8.i.i286.i, i64 %2499
  %2501 = getelementptr inbounds i8, i8* %2500, i64 32
  %2502 = bitcast i8* %2501 to i64*
  %2503 = load i64, i64* %2502, align 8
  %2504 = bitcast i8* %2495 to i64*
  store i64 %2503, i64* %2504, align 8
  %2505 = bitcast %Array* %temps.i.i289.i to i64*
  %2506 = load i64, i64* %2505, align 8
  %2507 = getelementptr inbounds i8, i8* %2451, i64 8
  %2508 = bitcast i8* %2507 to i64*
  %2509 = load i64, i64* %2508, align 8
  %2510 = load i64, i64* %2490, align 8
  %2511 = getelementptr inbounds i8, i8* %2451, i64 32
  %2512 = add nsw i64 %2510, %2509
  %sext.i.i.i298.i = shl i64 %2506, 32
  %2513 = ashr exact i64 %sext.i.i.i298.i, 32
  %2514 = mul nsw i64 %2512, %2513
  %2515 = add i64 %2514, 32
  %2516 = tail call i8* @malloc(i64 %2515) #5
  %2517 = bitcast i8* %2516 to i64*
  %2518 = getelementptr inbounds i8, i8* %2516, i64 8
  %2519 = bitcast i8* %2518 to i64*
  %2520 = getelementptr inbounds i8, i8* %2516, i64 16
  %2521 = bitcast i8* %2520 to i64*
  %2522 = getelementptr inbounds i8, i8* %2516, i64 24
  %2523 = bitcast i8* %2522 to i64*
  store i64 %2513, i64* %2517, align 8
  store i64 %2512, i64* %2519, align 8
  store i64 1, i64* %2521, align 8
  store i64 0, i64* %2523, align 8
  %2524 = getelementptr inbounds i8, i8* %2516, i64 32
  %2525 = mul nsw i64 %2509, %2506
  %2526 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2524, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2524, i8* nonnull align 1 %2511, i64 %2525, i1 false) #2
  %2527 = getelementptr inbounds i8, i8* %2524, i64 %2525
  %2528 = mul nsw i64 %2510, %2506
  %2529 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2527, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2527, i8* nonnull align 1 %2495, i64 %2528, i1 false) #2
  %2530 = bitcast i8* %2516 to %Array*
  %2531 = load i64, i64* %2521, align 8
  %2532 = add nsw i64 %2531, 1
  store i64 %2532, i64* %2521, align 8
  %2533 = icmp slt i64 %2531, 0
  br i1 %2533, label %2534, label %__quantum__rt__array_update_reference_count.exit2.i.i300.i

2534:                                             ; preds = %condFalse__1.i.i299.i
  tail call void @free(i8* nonnull %2516) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i300.i

__quantum__rt__array_update_reference_count.exit2.i.i300.i: ; preds = %2534, %condFalse__1.i.i299.i
  %2535 = load i64, i64* %2492, align 8
  %2536 = add nsw i64 %2535, -1
  store i64 %2536, i64* %2492, align 8
  %2537 = icmp slt i64 %2535, 2
  br i1 %2537, label %2538, label %__quantum__rt__array_update_reference_count.exit3.i.i301.i

2538:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i300.i
  tail call void @free(i8* nonnull %2487) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i301.i

__quantum__rt__array_update_reference_count.exit3.i.i301.i: ; preds = %2538, %__quantum__rt__array_update_reference_count.exit2.i.i300.i
  %2539 = load i64, i64* %2521, align 8
  %2540 = add nsw i64 %2539, -1
  store i64 %2540, i64* %2521, align 8
  %2541 = icmp slt i64 %2539, 2
  br i1 %2541, label %2542, label %condContinue__1.i.i303.i

2542:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i301.i
  tail call void @free(i8* nonnull %2516) #2
  br label %condContinue__1.i.i303.i

condContinue__1.i.i303.i:                         ; preds = %2542, %__quantum__rt__array_update_reference_count.exit3.i.i301.i, %2486, %condTrue__1.i.i297.i
  %__qsVar1__newControls__.i.i302.i = phi %Array* [ %temps.i.i289.i, %condTrue__1.i.i297.i ], [ %temps.i.i289.i, %2486 ], [ %2530, %__quantum__rt__array_update_reference_count.exit3.i.i301.i ], [ %2530, %2542 ]
  %2543 = bitcast %Array* %__qsVar1__newControls__.i.i302.i to i8*
  %2544 = getelementptr inbounds i8, i8* %2543, i64 24
  %2545 = bitcast i8* %2544 to i64*
  %2546 = load i64, i64* %2545, align 8
  %2547 = add nsw i64 %2546, 1
  store i64 %2547, i64* %2545, align 8
  %2548 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2549 = bitcast i8* %2548 to i64*
  %2550 = getelementptr inbounds i8, i8* %2548, i64 8
  %2551 = bitcast i8* %2550 to i64*
  %2552 = getelementptr inbounds i8, i8* %2548, i64 16
  %2553 = bitcast i8* %2552 to i64*
  store i64 16, i64* %2549, align 8
  store i64 1, i64* %2551, align 8
  store i64 0, i64* %2553, align 8
  %2554 = getelementptr inbounds i8, i8* %2548, i64 24
  %2555 = bitcast i8* %2554 to %Tuple*
  %2556 = bitcast %Tuple* %2555 to { %Array*, %Qubit* }*
  %2557 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2556, i64 0, i32 0
  %2558 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2556, i64 0, i32 1
  %2559 = getelementptr inbounds i8, i8* %2543, i64 16
  %2560 = bitcast i8* %2559 to i64*
  %2561 = load i64, i64* %2560, align 8
  %2562 = add nsw i64 %2561, 1
  store i64 %2562, i64* %2560, align 8
  %2563 = icmp slt i64 %2561, 0
  br i1 %2563, label %2564, label %__quantum__rt__array_update_reference_count.exit5.i.i304.i

2564:                                             ; preds = %condContinue__1.i.i303.i
  tail call void @free(i8* nonnull %2543) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i304.i

__quantum__rt__array_update_reference_count.exit5.i.i304.i: ; preds = %2564, %condContinue__1.i.i303.i
  store %Array* %__qsVar1__newControls__.i.i302.i, %Array** %2557, align 8
  %2565 = bitcast %Qubit** %2558 to i64*
  store i64 %arg1.i.i287.i, i64* %2565, align 8
  %2566 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %2417, align 8
  %2567 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %2566, i64 0, i64 0
  %2568 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %2567, align 8
  %2569 = load i8*, i8** %2420, align 8
  tail call void %2568(i8* %2569, i8* nonnull %2554, i8* null)
  br i1 %.not.not9.i.i290.i, label %body__2.lr.ph.i.i306.i, label %exit__2.i.i310.i

body__2.lr.ph.i.i306.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i304.i
  %__qsVar0____qsVar0__numPair____11.i.i305.i = add nsw i64 %numControlPairs.i.i288.i, -1
  %2570 = bitcast i8* %controls8.i.i286.i to i64*
  %2571 = bitcast %Array* %temps.i.i289.i to i64*
  %2572 = getelementptr inbounds i8, i8* %controls8.i.i286.i, i64 32
  %2573 = getelementptr inbounds i8, i8* %2451, i64 32
  br label %body__2.i.i309.i

body__2.i.i309.i:                                 ; preds = %body__2.lr.ph.i.i306.i, %exit_quantum_grouping200
  %2574 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i305.i, %body__2.lr.ph.i.i306.i ], [ %2591, %exit_quantum_grouping200 ]
  %2575 = shl nuw i64 %2574, 1
  %2576 = load i64, i64* %2570, align 8
  %2577 = mul nsw i64 %2576, %2575
  %2578 = getelementptr inbounds i8, i8* %2572, i64 %2577
  %2579 = bitcast i8* %2578 to %Qubit**
  %2580 = load %Qubit*, %Qubit** %2579, align 8
  %2581 = or i64 %2575, 1
  %2582 = mul nsw i64 %2581, %2576
  %2583 = getelementptr inbounds i8, i8* %2572, i64 %2582
  %2584 = bitcast i8* %2583 to %Qubit**
  %2585 = load %Qubit*, %Qubit** %2584, align 8
  %2586 = load i64, i64* %2571, align 8
  %2587 = mul nsw i64 %2586, %2574
  %2588 = getelementptr inbounds i8, i8* %2573, i64 %2587
  %2589 = bitcast i8* %2588 to %Qubit**
  %2590 = load %Qubit*, %Qubit** %2589, align 8
  %2591 = add i64 %2574, -1
  %2592 = icmp sgt i64 %2591, -1
  br label %quantum199

quantum199:                                       ; preds = %body__2.i.i309.i
  tail call void @__quantum__qis__h__body(%Qubit* %2590)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2590, %Qubit* %2585)
  tail call void @__quantum__qis__t__body(%Qubit* %2585)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2580, %Qubit* %2585)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2590, %Qubit* %2580)
  tail call void @__quantum__qis__t__adj(%Qubit* %2590)
  tail call void @__quantum__qis__t__body(%Qubit* %2580)
  tail call void @__quantum__qis__t__adj(%Qubit* %2585)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2580, %Qubit* %2585)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2590, %Qubit* %2580)
  tail call void @__quantum__qis__h__body(%Qubit* %2590)
  br label %readout198

readout198:                                       ; preds = %quantum199
  br label %post-classical197

post-classical197:                                ; preds = %readout198
  br label %exit_quantum_grouping200

exit_quantum_grouping200:                         ; preds = %post-classical197
  br i1 %2592, label %body__2.i.i309.i, label %exit__2.i.i310.i

exit__2.i.i310.i:                                 ; preds = %exit_quantum_grouping200, %__quantum__rt__array_update_reference_count.exit5.i.i304.i
  %2593 = load i64, i64* %2453, align 8
  %2594 = add nsw i64 %2593, -1
  store i64 %2594, i64* %2453, align 8
  %2595 = load i64, i64* %2545, align 8
  %2596 = add nsw i64 %2595, -1
  store i64 %2596, i64* %2545, align 8
  %2597 = load i64, i64* %2560, align 8
  %2598 = add nsw i64 %2597, -1
  store i64 %2598, i64* %2560, align 8
  %2599 = icmp slt i64 %2597, 2
  br i1 %2599, label %2600, label %__quantum__rt__array_update_reference_count.exit6.i.i312.i

2600:                                             ; preds = %exit__2.i.i310.i
  tail call void @free(i8* nonnull %2543) #2
  %.pre.i.i311.i = load i64, i64* %2560, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i312.i

__quantum__rt__array_update_reference_count.exit6.i.i312.i: ; preds = %2600, %exit__2.i.i310.i
  %2601 = phi i64 [ %2598, %exit__2.i.i310.i ], [ %.pre.i.i311.i, %2600 ]
  %2602 = add nsw i64 %2601, -1
  store i64 %2602, i64* %2560, align 8
  %2603 = icmp slt i64 %2601, 2
  br i1 %2603, label %2604, label %__quantum__rt__array_update_reference_count.exit7.i.i313.i

2604:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i312.i
  tail call void @free(i8* nonnull %2543) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i313.i

__quantum__rt__array_update_reference_count.exit7.i.i313.i: ; preds = %2604, %__quantum__rt__array_update_reference_count.exit6.i.i312.i
  %2605 = load i64, i64* %2551, align 8
  %2606 = add nsw i64 %2605, -1
  store i64 %2606, i64* %2551, align 8
  %2607 = icmp slt i64 %2605, 2
  br i1 %2607, label %2608, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i314.i

2608:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i313.i
  tail call void @free(i8* nonnull %2548) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i314.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i314.i: ; preds = %2608, %__quantum__rt__array_update_reference_count.exit7.i.i313.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i289.i)
  %2609 = load i32, i32* %2424, align 4
  %2610 = add nsw i32 %2609, -1
  store i32 %2610, i32* %2424, align 4
  %2611 = load i64, i64* %2444, align 8
  %2612 = add nsw i64 %2611, -1
  store i64 %2612, i64* %2444, align 8
  %2613 = load i32, i32* %2422, align 8
  %2614 = add nsw i32 %2613, -1
  store i32 %2614, i32* %2422, align 8
  %2615 = load i64, i64* %2371, align 8
  %2616 = add nsw i64 %2615, -1
  store i64 %2616, i64* %2371, align 8
  %2617 = icmp slt i64 %2615, 2
  br i1 %2617, label %2618, label %__quantum__rt__array_update_reference_count.exit1.i315.i

2618:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i314.i
  tail call void @free(i8* nonnull %2366) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i315.i

__quantum__rt__array_update_reference_count.exit1.i315.i: ; preds = %2618, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i314.i
  %2619 = load i64, i64* %2429, align 8
  %2620 = add nsw i64 %2619, -1
  store i64 %2620, i64* %2429, align 8
  %2621 = icmp slt i64 %2619, 2
  br i1 %2621, label %2622, label %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i

2622:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i315.i
  tail call void @free(i8* nonnull %2426) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i:  ; preds = %2622, %__quantum__rt__array_update_reference_count.exit1.i315.i, %exit_quantum_grouping192, %exit_quantum_grouping188, %exit_quantum_grouping184
  %2623 = load i64, i64* %2373, align 8
  %2624 = add nsw i64 %2623, -1
  store i64 %2624, i64* %2373, align 8
  %2625 = load i64, i64* %2371, align 8
  %2626 = add nsw i64 %2625, -1
  store i64 %2626, i64* %2371, align 8
  %2627 = icmp slt i64 %2625, 2
  br i1 %2627, label %2628, label %Microsoft__Quantum__Canon__CZ__body.exit27.i

2628:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i
  tail call void @free(i8* nonnull %2366) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit27.i

Microsoft__Quantum__Canon__CZ__body.exit27.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.39.exit.i, %2628
  %2629 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2630 = bitcast i8* %2629 to i64*
  %2631 = getelementptr inbounds i8, i8* %2629, i64 8
  %2632 = bitcast i8* %2631 to i64*
  %2633 = getelementptr inbounds i8, i8* %2629, i64 16
  %2634 = bitcast i8* %2633 to i64*
  %2635 = getelementptr inbounds i8, i8* %2629, i64 24
  %2636 = bitcast i8* %2635 to i64*
  store i64 8, i64* %2630, align 8
  store i64 1, i64* %2632, align 8
  store i64 1, i64* %2634, align 8
  store i64 0, i64* %2636, align 8
  %2637 = getelementptr inbounds i8, i8* %2629, i64 32
  %2638 = bitcast i8* %2637 to %Qubit**
  store %Qubit* inttoptr (i64 22 to %Qubit*), %Qubit** %2638, align 8
  %2639 = load i64, i64* %2636, align 8
  %2640 = add nsw i64 %2639, 1
  store i64 %2640, i64* %2636, align 8
  %2641 = load i64, i64* %2632, align 8
  br label %quantum439

quantum439:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit27.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*), %Result* nonnull inttoptr (i64 9 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 21 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__s__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Qubit* null)
  tail call void @__quantum__qis__s__adj(%Qubit* null)
  br label %readout438

readout438:                                       ; preds = %quantum439
  %2642 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 9 to %Result*))
  br label %post-classical437

post-classical437:                                ; preds = %readout438
  br label %exit_quantum_grouping440

exit_quantum_grouping440:                         ; preds = %post-classical437
  switch i64 %2641, label %else__1.i320.i [
    i64 0, label %then0__1.i316.i
    i64 1, label %then1__1.i318.i
    i64 2, label %then2__1.i319.i
  ]

then0__1.i316.i:                                  ; preds = %exit_quantum_grouping440
  br label %quantum203

quantum203:                                       ; preds = %then0__1.i316.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout202

readout202:                                       ; preds = %quantum203
  br label %post-classical201

post-classical201:                                ; preds = %readout202
  br label %exit_quantum_grouping204

exit_quantum_grouping204:                         ; preds = %post-classical201
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i

then1__1.i318.i:                                  ; preds = %exit_quantum_grouping440
  %2643 = load %Qubit*, %Qubit** %2638, align 8
  br label %quantum207

quantum207:                                       ; preds = %then1__1.i318.i
  tail call void @__quantum__qis__cz__body(%Qubit* %2643, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  br label %readout206

readout206:                                       ; preds = %quantum207
  br label %post-classical205

post-classical205:                                ; preds = %readout206
  br label %exit_quantum_grouping208

exit_quantum_grouping208:                         ; preds = %post-classical205
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i

then2__1.i319.i:                                  ; preds = %exit_quantum_grouping440
  %2644 = bitcast i8* %2629 to %Array*
  %2645 = bitcast %Array* %2644 to i64*
  %2646 = load %Qubit*, %Qubit** %2638, align 8
  %2647 = load i64, i64* %2645, align 8
  %2648 = getelementptr inbounds i8, i8* %2629, i64 %2647
  %2649 = getelementptr inbounds i8, i8* %2648, i64 32
  %2650 = bitcast i8* %2649 to %Qubit**
  %2651 = load %Qubit*, %Qubit** %2650, align 8
  %2652 = load %Qubit*, %Qubit** %2638, align 8
  %2653 = load %Qubit*, %Qubit** %2638, align 8
  %2654 = load i64, i64* %2645, align 8
  %2655 = getelementptr inbounds i8, i8* %2629, i64 %2654
  %2656 = getelementptr inbounds i8, i8* %2655, i64 32
  %2657 = bitcast i8* %2656 to %Qubit**
  %2658 = load %Qubit*, %Qubit** %2657, align 8
  %2659 = load i64, i64* %2645, align 8
  %2660 = getelementptr inbounds i8, i8* %2629, i64 %2659
  %2661 = getelementptr inbounds i8, i8* %2660, i64 32
  %2662 = bitcast i8* %2661 to %Qubit**
  %2663 = load %Qubit*, %Qubit** %2662, align 8
  %2664 = load %Qubit*, %Qubit** %2638, align 8
  %2665 = load %Qubit*, %Qubit** %2638, align 8
  %2666 = load i64, i64* %2645, align 8
  %2667 = getelementptr inbounds i8, i8* %2629, i64 %2666
  %2668 = getelementptr inbounds i8, i8* %2667, i64 32
  %2669 = bitcast i8* %2668 to %Qubit**
  %2670 = load %Qubit*, %Qubit** %2669, align 8
  %2671 = load %Qubit*, %Qubit** %2638, align 8
  %2672 = load %Qubit*, %Qubit** %2638, align 8
  %2673 = load i64, i64* %2645, align 8
  %2674 = getelementptr inbounds i8, i8* %2629, i64 %2673
  %2675 = getelementptr inbounds i8, i8* %2674, i64 32
  %2676 = bitcast i8* %2675 to %Qubit**
  %2677 = load %Qubit*, %Qubit** %2676, align 8
  %2678 = load %Qubit*, %Qubit** %2638, align 8
  br label %quantum211

quantum211:                                       ; preds = %then2__1.i319.i
  tail call void @__quantum__qis__t__adj(%Qubit* %2646)
  tail call void @__quantum__qis__t__adj(%Qubit* %2651)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* %2652)
  tail call void @__quantum__qis__t__body(%Qubit* %2653)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2658, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %2663, %Qubit* %2664)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %2665)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2670, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* %2671)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %2672)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2677, %Qubit* %2678)
  br label %readout210

readout210:                                       ; preds = %quantum211
  br label %post-classical209

post-classical209:                                ; preds = %readout210
  br label %exit_quantum_grouping212

exit_quantum_grouping212:                         ; preds = %post-classical209
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i

else__1.i320.i:                                   ; preds = %exit_quantum_grouping440
  %2679 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %2680 = bitcast i8* %2679 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %2680, align 8
  %2681 = getelementptr inbounds i8, i8* %2679, i64 8
  %2682 = getelementptr inbounds i8, i8* %2679, i64 16
  %2683 = bitcast i8* %2682 to i8**
  %2684 = getelementptr inbounds i8, i8* %2679, i64 24
  %2685 = bitcast i8* %2684 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %2681, i8 0, i64 16, i1 false)
  store i32 1, i32* %2685, align 8
  %2686 = getelementptr inbounds i8, i8* %2679, i64 28
  %2687 = bitcast i8* %2686 to i32*
  store i32 0, i32* %2687, align 4
  %2688 = bitcast i8* %2679 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %2688)
  %2689 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2690 = bitcast i8* %2689 to i64*
  %2691 = getelementptr inbounds i8, i8* %2689, i64 8
  %2692 = bitcast i8* %2691 to i64*
  %2693 = getelementptr inbounds i8, i8* %2689, i64 16
  %2694 = bitcast i8* %2693 to i64*
  store i64 16, i64* %2690, align 8
  store i64 1, i64* %2692, align 8
  store i64 0, i64* %2694, align 8
  %2695 = getelementptr inbounds i8, i8* %2689, i64 24
  %2696 = bitcast i8* %2695 to %Tuple*
  %2697 = bitcast %Tuple* %2696 to { %Array*, %Qubit* }*
  %2698 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2697, i64 0, i32 1
  %2699 = load i64, i64* %2634, align 8
  %2700 = add nsw i64 %2699, 1
  store i64 %2700, i64* %2634, align 8
  %2701 = icmp slt i64 %2699, 0
  br i1 %2701, label %2702, label %__quantum__rt__array_update_reference_count.exit.i326.i

2702:                                             ; preds = %else__1.i320.i
  tail call void @free(i8* nonnull %2629) #2
  br label %__quantum__rt__array_update_reference_count.exit.i326.i

__quantum__rt__array_update_reference_count.exit.i326.i: ; preds = %2702, %else__1.i320.i
  %2703 = bitcast %Tuple* %2696 to i8**
  store i8* %2629, i8** %2703, align 8
  store %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit** %2698, align 8
  %2704 = load i32, i32* %2687, align 4
  %2705 = add nsw i32 %2704, 1
  store i32 %2705, i32* %2687, align 4
  %controls8.i.i321.i = load i8*, i8** %2703, align 8
  %2706 = getelementptr inbounds i8, i8* %controls8.i.i321.i, i64 24
  %2707 = bitcast i8* %2706 to i64*
  %2708 = load i64, i64* %2707, align 8
  %2709 = add nsw i64 %2708, 1
  store i64 %2709, i64* %2707, align 8
  %2710 = bitcast %Qubit** %2698 to i64*
  %arg1.i.i322.i = load i64, i64* %2710, align 8
  %2711 = getelementptr inbounds i8, i8* %controls8.i.i321.i, i64 8
  %2712 = bitcast i8* %2711 to i64*
  %2713 = load i64, i64* %2712, align 8
  %numControlPairs.i.i323.i = sdiv i64 %2713, 2
  %temps.i.i324.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i323.i)
  %2714 = bitcast %Array* %temps.i.i324.i to i8*
  %2715 = getelementptr inbounds i8, i8* %2714, i64 24
  %2716 = bitcast i8* %2715 to i64*
  %2717 = load i64, i64* %2716, align 8
  %2718 = add nsw i64 %2717, 1
  store i64 %2718, i64* %2716, align 8
  %.not.not9.i.i325.i = icmp sgt i64 %2713, 1
  br i1 %.not.not9.i.i325.i, label %body__1.lr.ph.i.i327.i, label %exit__1.i.i331.i

body__1.lr.ph.i.i327.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i326.i
  %2719 = bitcast i8* %controls8.i.i321.i to i64*
  %2720 = bitcast %Array* %temps.i.i324.i to i64*
  %2721 = getelementptr inbounds i8, i8* %controls8.i.i321.i, i64 32
  %2722 = getelementptr inbounds i8, i8* %2714, i64 32
  br label %body__1.i.i330.i

body__1.i.i330.i:                                 ; preds = %body__1.lr.ph.i.i327.i, %exit_quantum_grouping216
  %2723 = phi i64 [ 0, %body__1.lr.ph.i.i327.i ], [ %2740, %exit_quantum_grouping216 ]
  %2724 = shl nuw i64 %2723, 1
  %2725 = load i64, i64* %2719, align 8
  %2726 = mul nsw i64 %2725, %2724
  %2727 = getelementptr inbounds i8, i8* %2721, i64 %2726
  %2728 = bitcast i8* %2727 to %Qubit**
  %2729 = load %Qubit*, %Qubit** %2728, align 8
  %2730 = or i64 %2724, 1
  %2731 = mul nsw i64 %2730, %2725
  %2732 = getelementptr inbounds i8, i8* %2721, i64 %2731
  %2733 = bitcast i8* %2732 to %Qubit**
  %2734 = load %Qubit*, %Qubit** %2733, align 8
  %2735 = load i64, i64* %2720, align 8
  %2736 = mul nsw i64 %2735, %2723
  %2737 = getelementptr inbounds i8, i8* %2722, i64 %2736
  %2738 = bitcast i8* %2737 to %Qubit**
  %2739 = load %Qubit*, %Qubit** %2738, align 8
  %2740 = add nuw nsw i64 %2723, 1
  %2741 = icmp eq i64 %2740, %numControlPairs.i.i323.i
  br label %quantum215

quantum215:                                       ; preds = %body__1.i.i330.i
  tail call void @__quantum__qis__h__body(%Qubit* %2739)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2739, %Qubit* %2729)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2729, %Qubit* %2734)
  tail call void @__quantum__qis__t__body(%Qubit* %2734)
  tail call void @__quantum__qis__t__adj(%Qubit* %2729)
  tail call void @__quantum__qis__t__body(%Qubit* %2739)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2739, %Qubit* %2729)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2729, %Qubit* %2734)
  tail call void @__quantum__qis__t__adj(%Qubit* %2734)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2739, %Qubit* %2734)
  tail call void @__quantum__qis__h__body(%Qubit* %2739)
  br label %readout214

readout214:                                       ; preds = %quantum215
  br label %post-classical213

post-classical213:                                ; preds = %readout214
  br label %exit_quantum_grouping216

exit_quantum_grouping216:                         ; preds = %post-classical213
  br i1 %2741, label %exit__1.i.i331.i, label %body__1.i.i330.i

exit__1.i.i331.i:                                 ; preds = %exit_quantum_grouping216, %__quantum__rt__array_update_reference_count.exit.i326.i
  %2742 = and i64 %2713, 1
  %2743 = icmp eq i64 %2742, 0
  br i1 %2743, label %condTrue__1.i.i332.i, label %condFalse__1.i.i334.i

condTrue__1.i.i332.i:                             ; preds = %exit__1.i.i331.i
  %2744 = getelementptr inbounds i8, i8* %2714, i64 16
  %2745 = bitcast i8* %2744 to i64*
  %2746 = load i64, i64* %2745, align 8
  %2747 = add nsw i64 %2746, 1
  store i64 %2747, i64* %2745, align 8
  %2748 = icmp slt i64 %2746, 0
  br i1 %2748, label %2749, label %condContinue__1.i.i338.i

2749:                                             ; preds = %condTrue__1.i.i332.i
  tail call void @free(i8* nonnull %2714) #2
  br label %condContinue__1.i.i338.i

condFalse__1.i.i334.i:                            ; preds = %exit__1.i.i331.i
  %2750 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2751 = bitcast i8* %2750 to i64*
  %2752 = getelementptr inbounds i8, i8* %2750, i64 8
  %2753 = bitcast i8* %2752 to i64*
  %2754 = getelementptr inbounds i8, i8* %2750, i64 16
  %2755 = bitcast i8* %2754 to i64*
  %2756 = getelementptr inbounds i8, i8* %2750, i64 24
  %2757 = bitcast i8* %2756 to i64*
  store i64 8, i64* %2751, align 8
  store i64 1, i64* %2753, align 8
  store i64 1, i64* %2755, align 8
  store i64 0, i64* %2757, align 8
  %2758 = getelementptr inbounds i8, i8* %2750, i64 32
  %2759 = add i64 %2713, -1
  %2760 = bitcast i8* %controls8.i.i321.i to i64*
  %2761 = load i64, i64* %2760, align 8
  %2762 = mul nsw i64 %2761, %2759
  %2763 = getelementptr inbounds i8, i8* %controls8.i.i321.i, i64 %2762
  %2764 = getelementptr inbounds i8, i8* %2763, i64 32
  %2765 = bitcast i8* %2764 to i64*
  %2766 = load i64, i64* %2765, align 8
  %2767 = bitcast i8* %2758 to i64*
  store i64 %2766, i64* %2767, align 8
  %2768 = bitcast %Array* %temps.i.i324.i to i64*
  %2769 = load i64, i64* %2768, align 8
  %2770 = getelementptr inbounds i8, i8* %2714, i64 8
  %2771 = bitcast i8* %2770 to i64*
  %2772 = load i64, i64* %2771, align 8
  %2773 = load i64, i64* %2753, align 8
  %2774 = getelementptr inbounds i8, i8* %2714, i64 32
  %2775 = add nsw i64 %2773, %2772
  %sext.i.i.i333.i = shl i64 %2769, 32
  %2776 = ashr exact i64 %sext.i.i.i333.i, 32
  %2777 = mul nsw i64 %2775, %2776
  %2778 = add i64 %2777, 32
  %2779 = tail call i8* @malloc(i64 %2778) #5
  %2780 = bitcast i8* %2779 to i64*
  %2781 = getelementptr inbounds i8, i8* %2779, i64 8
  %2782 = bitcast i8* %2781 to i64*
  %2783 = getelementptr inbounds i8, i8* %2779, i64 16
  %2784 = bitcast i8* %2783 to i64*
  %2785 = getelementptr inbounds i8, i8* %2779, i64 24
  %2786 = bitcast i8* %2785 to i64*
  store i64 %2776, i64* %2780, align 8
  store i64 %2775, i64* %2782, align 8
  store i64 1, i64* %2784, align 8
  store i64 0, i64* %2786, align 8
  %2787 = getelementptr inbounds i8, i8* %2779, i64 32
  %2788 = mul nsw i64 %2772, %2769
  %2789 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2787, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2787, i8* nonnull align 1 %2774, i64 %2788, i1 false) #2
  %2790 = getelementptr inbounds i8, i8* %2787, i64 %2788
  %2791 = mul nsw i64 %2773, %2769
  %2792 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %2790, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %2790, i8* nonnull align 1 %2758, i64 %2791, i1 false) #2
  %2793 = bitcast i8* %2779 to %Array*
  %2794 = load i64, i64* %2784, align 8
  %2795 = add nsw i64 %2794, 1
  store i64 %2795, i64* %2784, align 8
  %2796 = icmp slt i64 %2794, 0
  br i1 %2796, label %2797, label %__quantum__rt__array_update_reference_count.exit2.i.i335.i

2797:                                             ; preds = %condFalse__1.i.i334.i
  tail call void @free(i8* nonnull %2779) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i335.i

__quantum__rt__array_update_reference_count.exit2.i.i335.i: ; preds = %2797, %condFalse__1.i.i334.i
  %2798 = load i64, i64* %2755, align 8
  %2799 = add nsw i64 %2798, -1
  store i64 %2799, i64* %2755, align 8
  %2800 = icmp slt i64 %2798, 2
  br i1 %2800, label %2801, label %__quantum__rt__array_update_reference_count.exit3.i.i336.i

2801:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i335.i
  tail call void @free(i8* nonnull %2750) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i336.i

__quantum__rt__array_update_reference_count.exit3.i.i336.i: ; preds = %2801, %__quantum__rt__array_update_reference_count.exit2.i.i335.i
  %2802 = load i64, i64* %2784, align 8
  %2803 = add nsw i64 %2802, -1
  store i64 %2803, i64* %2784, align 8
  %2804 = icmp slt i64 %2802, 2
  br i1 %2804, label %2805, label %condContinue__1.i.i338.i

2805:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i336.i
  tail call void @free(i8* nonnull %2779) #2
  br label %condContinue__1.i.i338.i

condContinue__1.i.i338.i:                         ; preds = %2805, %__quantum__rt__array_update_reference_count.exit3.i.i336.i, %2749, %condTrue__1.i.i332.i
  %__qsVar1__newControls__.i.i337.i = phi %Array* [ %temps.i.i324.i, %condTrue__1.i.i332.i ], [ %temps.i.i324.i, %2749 ], [ %2793, %__quantum__rt__array_update_reference_count.exit3.i.i336.i ], [ %2793, %2805 ]
  %2806 = bitcast %Array* %__qsVar1__newControls__.i.i337.i to i8*
  %2807 = getelementptr inbounds i8, i8* %2806, i64 24
  %2808 = bitcast i8* %2807 to i64*
  %2809 = load i64, i64* %2808, align 8
  %2810 = add nsw i64 %2809, 1
  store i64 %2810, i64* %2808, align 8
  %2811 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2812 = bitcast i8* %2811 to i64*
  %2813 = getelementptr inbounds i8, i8* %2811, i64 8
  %2814 = bitcast i8* %2813 to i64*
  %2815 = getelementptr inbounds i8, i8* %2811, i64 16
  %2816 = bitcast i8* %2815 to i64*
  store i64 16, i64* %2812, align 8
  store i64 1, i64* %2814, align 8
  store i64 0, i64* %2816, align 8
  %2817 = getelementptr inbounds i8, i8* %2811, i64 24
  %2818 = bitcast i8* %2817 to %Tuple*
  %2819 = bitcast %Tuple* %2818 to { %Array*, %Qubit* }*
  %2820 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2819, i64 0, i32 0
  %2821 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2819, i64 0, i32 1
  %2822 = getelementptr inbounds i8, i8* %2806, i64 16
  %2823 = bitcast i8* %2822 to i64*
  %2824 = load i64, i64* %2823, align 8
  %2825 = add nsw i64 %2824, 1
  store i64 %2825, i64* %2823, align 8
  %2826 = icmp slt i64 %2824, 0
  br i1 %2826, label %2827, label %__quantum__rt__array_update_reference_count.exit5.i.i339.i

2827:                                             ; preds = %condContinue__1.i.i338.i
  tail call void @free(i8* nonnull %2806) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i339.i

__quantum__rt__array_update_reference_count.exit5.i.i339.i: ; preds = %2827, %condContinue__1.i.i338.i
  store %Array* %__qsVar1__newControls__.i.i337.i, %Array** %2820, align 8
  %2828 = bitcast %Qubit** %2821 to i64*
  store i64 %arg1.i.i322.i, i64* %2828, align 8
  %2829 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %2680, align 8
  %2830 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %2829, i64 0, i64 0
  %2831 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %2830, align 8
  %2832 = load i8*, i8** %2683, align 8
  tail call void %2831(i8* %2832, i8* nonnull %2817, i8* null)
  br i1 %.not.not9.i.i325.i, label %body__2.lr.ph.i.i341.i, label %exit__2.i.i345.i

body__2.lr.ph.i.i341.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i339.i
  %__qsVar0____qsVar0__numPair____11.i.i340.i = add nsw i64 %numControlPairs.i.i323.i, -1
  %2833 = bitcast i8* %controls8.i.i321.i to i64*
  %2834 = bitcast %Array* %temps.i.i324.i to i64*
  %2835 = getelementptr inbounds i8, i8* %controls8.i.i321.i, i64 32
  %2836 = getelementptr inbounds i8, i8* %2714, i64 32
  br label %body__2.i.i344.i

body__2.i.i344.i:                                 ; preds = %body__2.lr.ph.i.i341.i, %exit_quantum_grouping220
  %2837 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i340.i, %body__2.lr.ph.i.i341.i ], [ %2854, %exit_quantum_grouping220 ]
  %2838 = shl nuw i64 %2837, 1
  %2839 = load i64, i64* %2833, align 8
  %2840 = mul nsw i64 %2839, %2838
  %2841 = getelementptr inbounds i8, i8* %2835, i64 %2840
  %2842 = bitcast i8* %2841 to %Qubit**
  %2843 = load %Qubit*, %Qubit** %2842, align 8
  %2844 = or i64 %2838, 1
  %2845 = mul nsw i64 %2844, %2839
  %2846 = getelementptr inbounds i8, i8* %2835, i64 %2845
  %2847 = bitcast i8* %2846 to %Qubit**
  %2848 = load %Qubit*, %Qubit** %2847, align 8
  %2849 = load i64, i64* %2834, align 8
  %2850 = mul nsw i64 %2849, %2837
  %2851 = getelementptr inbounds i8, i8* %2836, i64 %2850
  %2852 = bitcast i8* %2851 to %Qubit**
  %2853 = load %Qubit*, %Qubit** %2852, align 8
  %2854 = add i64 %2837, -1
  %2855 = icmp sgt i64 %2854, -1
  br label %quantum219

quantum219:                                       ; preds = %body__2.i.i344.i
  tail call void @__quantum__qis__h__body(%Qubit* %2853)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2853, %Qubit* %2848)
  tail call void @__quantum__qis__t__body(%Qubit* %2848)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2843, %Qubit* %2848)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2853, %Qubit* %2843)
  tail call void @__quantum__qis__t__adj(%Qubit* %2853)
  tail call void @__quantum__qis__t__body(%Qubit* %2843)
  tail call void @__quantum__qis__t__adj(%Qubit* %2848)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2843, %Qubit* %2848)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2853, %Qubit* %2843)
  tail call void @__quantum__qis__h__body(%Qubit* %2853)
  br label %readout218

readout218:                                       ; preds = %quantum219
  br label %post-classical217

post-classical217:                                ; preds = %readout218
  br label %exit_quantum_grouping220

exit_quantum_grouping220:                         ; preds = %post-classical217
  br i1 %2855, label %body__2.i.i344.i, label %exit__2.i.i345.i

exit__2.i.i345.i:                                 ; preds = %exit_quantum_grouping220, %__quantum__rt__array_update_reference_count.exit5.i.i339.i
  %2856 = load i64, i64* %2716, align 8
  %2857 = add nsw i64 %2856, -1
  store i64 %2857, i64* %2716, align 8
  %2858 = load i64, i64* %2808, align 8
  %2859 = add nsw i64 %2858, -1
  store i64 %2859, i64* %2808, align 8
  %2860 = load i64, i64* %2823, align 8
  %2861 = add nsw i64 %2860, -1
  store i64 %2861, i64* %2823, align 8
  %2862 = icmp slt i64 %2860, 2
  br i1 %2862, label %2863, label %__quantum__rt__array_update_reference_count.exit6.i.i347.i

2863:                                             ; preds = %exit__2.i.i345.i
  tail call void @free(i8* nonnull %2806) #2
  %.pre.i.i346.i = load i64, i64* %2823, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i347.i

__quantum__rt__array_update_reference_count.exit6.i.i347.i: ; preds = %2863, %exit__2.i.i345.i
  %2864 = phi i64 [ %2861, %exit__2.i.i345.i ], [ %.pre.i.i346.i, %2863 ]
  %2865 = add nsw i64 %2864, -1
  store i64 %2865, i64* %2823, align 8
  %2866 = icmp slt i64 %2864, 2
  br i1 %2866, label %2867, label %__quantum__rt__array_update_reference_count.exit7.i.i348.i

2867:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i347.i
  tail call void @free(i8* nonnull %2806) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i348.i

__quantum__rt__array_update_reference_count.exit7.i.i348.i: ; preds = %2867, %__quantum__rt__array_update_reference_count.exit6.i.i347.i
  %2868 = load i64, i64* %2814, align 8
  %2869 = add nsw i64 %2868, -1
  store i64 %2869, i64* %2814, align 8
  %2870 = icmp slt i64 %2868, 2
  br i1 %2870, label %2871, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i349.i

2871:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i348.i
  tail call void @free(i8* nonnull %2811) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i349.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i349.i: ; preds = %2871, %__quantum__rt__array_update_reference_count.exit7.i.i348.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i324.i)
  %2872 = load i32, i32* %2687, align 4
  %2873 = add nsw i32 %2872, -1
  store i32 %2873, i32* %2687, align 4
  %2874 = load i64, i64* %2707, align 8
  %2875 = add nsw i64 %2874, -1
  store i64 %2875, i64* %2707, align 8
  %2876 = load i32, i32* %2685, align 8
  %2877 = add nsw i32 %2876, -1
  store i32 %2877, i32* %2685, align 8
  %2878 = load i64, i64* %2634, align 8
  %2879 = add nsw i64 %2878, -1
  store i64 %2879, i64* %2634, align 8
  %2880 = icmp slt i64 %2878, 2
  br i1 %2880, label %2881, label %__quantum__rt__array_update_reference_count.exit1.i350.i

2881:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i349.i
  tail call void @free(i8* nonnull %2629) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i350.i

__quantum__rt__array_update_reference_count.exit1.i350.i: ; preds = %2881, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i349.i
  %2882 = load i64, i64* %2692, align 8
  %2883 = add nsw i64 %2882, -1
  store i64 %2883, i64* %2692, align 8
  %2884 = icmp slt i64 %2882, 2
  br i1 %2884, label %2885, label %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i

2885:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i350.i
  tail call void @free(i8* nonnull %2689) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i:  ; preds = %2885, %__quantum__rt__array_update_reference_count.exit1.i350.i, %exit_quantum_grouping212, %exit_quantum_grouping208, %exit_quantum_grouping204
  %2886 = load i64, i64* %2636, align 8
  %2887 = add nsw i64 %2886, -1
  store i64 %2887, i64* %2636, align 8
  %2888 = load i64, i64* %2634, align 8
  %2889 = add nsw i64 %2888, -1
  store i64 %2889, i64* %2634, align 8
  %2890 = icmp slt i64 %2888, 2
  br i1 %2890, label %2891, label %Microsoft__Quantum__Canon__CZ__body.exit28.i

2891:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i
  tail call void @free(i8* nonnull %2629) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit28.i

Microsoft__Quantum__Canon__CZ__body.exit28.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.40.exit.i, %2891
  %2892 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2893 = bitcast i8* %2892 to i64*
  %2894 = getelementptr inbounds i8, i8* %2892, i64 8
  %2895 = bitcast i8* %2894 to i64*
  %2896 = getelementptr inbounds i8, i8* %2892, i64 16
  %2897 = bitcast i8* %2896 to i64*
  %2898 = getelementptr inbounds i8, i8* %2892, i64 24
  %2899 = bitcast i8* %2898 to i64*
  store i64 8, i64* %2893, align 8
  store i64 1, i64* %2895, align 8
  store i64 1, i64* %2897, align 8
  store i64 0, i64* %2899, align 8
  %2900 = getelementptr inbounds i8, i8* %2892, i64 32
  %2901 = bitcast i8* %2900 to %Qubit**
  store %Qubit* inttoptr (i64 23 to %Qubit*), %Qubit** %2901, align 8
  %2902 = load i64, i64* %2899, align 8
  %2903 = add nsw i64 %2902, 1
  store i64 %2903, i64* %2899, align 8
  %2904 = load i64, i64* %2895, align 8
  br label %quantum443

quantum443:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit28.i
  tail call void @__quantum__qis__s__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__s__adj(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*), %Result* nonnull inttoptr (i64 10 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 22 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout442

readout442:                                       ; preds = %quantum443
  %2905 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 10 to %Result*))
  br label %post-classical441

post-classical441:                                ; preds = %readout442
  br label %exit_quantum_grouping444

exit_quantum_grouping444:                         ; preds = %post-classical441
  switch i64 %2904, label %else__1.i355.i [
    i64 0, label %then0__1.i351.i
    i64 1, label %then1__1.i353.i
    i64 2, label %then2__1.i354.i
  ]

then0__1.i351.i:                                  ; preds = %exit_quantum_grouping444
  br label %quantum223

quantum223:                                       ; preds = %then0__1.i351.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout222

readout222:                                       ; preds = %quantum223
  br label %post-classical221

post-classical221:                                ; preds = %readout222
  br label %exit_quantum_grouping224

exit_quantum_grouping224:                         ; preds = %post-classical221
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i

then1__1.i353.i:                                  ; preds = %exit_quantum_grouping444
  %2906 = load %Qubit*, %Qubit** %2901, align 8
  br label %quantum227

quantum227:                                       ; preds = %then1__1.i353.i
  tail call void @__quantum__qis__cz__body(%Qubit* %2906, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout226

readout226:                                       ; preds = %quantum227
  br label %post-classical225

post-classical225:                                ; preds = %readout226
  br label %exit_quantum_grouping228

exit_quantum_grouping228:                         ; preds = %post-classical225
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i

then2__1.i354.i:                                  ; preds = %exit_quantum_grouping444
  %2907 = bitcast i8* %2892 to %Array*
  %2908 = bitcast %Array* %2907 to i64*
  %2909 = load %Qubit*, %Qubit** %2901, align 8
  %2910 = load i64, i64* %2908, align 8
  %2911 = getelementptr inbounds i8, i8* %2892, i64 %2910
  %2912 = getelementptr inbounds i8, i8* %2911, i64 32
  %2913 = bitcast i8* %2912 to %Qubit**
  %2914 = load %Qubit*, %Qubit** %2913, align 8
  %2915 = load %Qubit*, %Qubit** %2901, align 8
  %2916 = load %Qubit*, %Qubit** %2901, align 8
  %2917 = load i64, i64* %2908, align 8
  %2918 = getelementptr inbounds i8, i8* %2892, i64 %2917
  %2919 = getelementptr inbounds i8, i8* %2918, i64 32
  %2920 = bitcast i8* %2919 to %Qubit**
  %2921 = load %Qubit*, %Qubit** %2920, align 8
  %2922 = load i64, i64* %2908, align 8
  %2923 = getelementptr inbounds i8, i8* %2892, i64 %2922
  %2924 = getelementptr inbounds i8, i8* %2923, i64 32
  %2925 = bitcast i8* %2924 to %Qubit**
  %2926 = load %Qubit*, %Qubit** %2925, align 8
  %2927 = load %Qubit*, %Qubit** %2901, align 8
  %2928 = load %Qubit*, %Qubit** %2901, align 8
  %2929 = load i64, i64* %2908, align 8
  %2930 = getelementptr inbounds i8, i8* %2892, i64 %2929
  %2931 = getelementptr inbounds i8, i8* %2930, i64 32
  %2932 = bitcast i8* %2931 to %Qubit**
  %2933 = load %Qubit*, %Qubit** %2932, align 8
  %2934 = load %Qubit*, %Qubit** %2901, align 8
  %2935 = load %Qubit*, %Qubit** %2901, align 8
  %2936 = load i64, i64* %2908, align 8
  %2937 = getelementptr inbounds i8, i8* %2892, i64 %2936
  %2938 = getelementptr inbounds i8, i8* %2937, i64 32
  %2939 = bitcast i8* %2938 to %Qubit**
  %2940 = load %Qubit*, %Qubit** %2939, align 8
  %2941 = load %Qubit*, %Qubit** %2901, align 8
  br label %quantum231

quantum231:                                       ; preds = %then2__1.i354.i
  tail call void @__quantum__qis__t__adj(%Qubit* %2909)
  tail call void @__quantum__qis__t__adj(%Qubit* %2914)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %2915)
  tail call void @__quantum__qis__t__body(%Qubit* %2916)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2921, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %2926, %Qubit* %2927)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %2928)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2933, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %2934)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %2935)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2940, %Qubit* %2941)
  br label %readout230

readout230:                                       ; preds = %quantum231
  br label %post-classical229

post-classical229:                                ; preds = %readout230
  br label %exit_quantum_grouping232

exit_quantum_grouping232:                         ; preds = %post-classical229
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i

else__1.i355.i:                                   ; preds = %exit_quantum_grouping444
  %2942 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %2943 = bitcast i8* %2942 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %2943, align 8
  %2944 = getelementptr inbounds i8, i8* %2942, i64 8
  %2945 = getelementptr inbounds i8, i8* %2942, i64 16
  %2946 = bitcast i8* %2945 to i8**
  %2947 = getelementptr inbounds i8, i8* %2942, i64 24
  %2948 = bitcast i8* %2947 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %2944, i8 0, i64 16, i1 false)
  store i32 1, i32* %2948, align 8
  %2949 = getelementptr inbounds i8, i8* %2942, i64 28
  %2950 = bitcast i8* %2949 to i32*
  store i32 0, i32* %2950, align 4
  %2951 = bitcast i8* %2942 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %2951)
  %2952 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %2953 = bitcast i8* %2952 to i64*
  %2954 = getelementptr inbounds i8, i8* %2952, i64 8
  %2955 = bitcast i8* %2954 to i64*
  %2956 = getelementptr inbounds i8, i8* %2952, i64 16
  %2957 = bitcast i8* %2956 to i64*
  store i64 16, i64* %2953, align 8
  store i64 1, i64* %2955, align 8
  store i64 0, i64* %2957, align 8
  %2958 = getelementptr inbounds i8, i8* %2952, i64 24
  %2959 = bitcast i8* %2958 to %Tuple*
  %2960 = bitcast %Tuple* %2959 to { %Array*, %Qubit* }*
  %2961 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %2960, i64 0, i32 1
  %2962 = load i64, i64* %2897, align 8
  %2963 = add nsw i64 %2962, 1
  store i64 %2963, i64* %2897, align 8
  %2964 = icmp slt i64 %2962, 0
  br i1 %2964, label %2965, label %__quantum__rt__array_update_reference_count.exit.i361.i

2965:                                             ; preds = %else__1.i355.i
  tail call void @free(i8* nonnull %2892) #2
  br label %__quantum__rt__array_update_reference_count.exit.i361.i

__quantum__rt__array_update_reference_count.exit.i361.i: ; preds = %2965, %else__1.i355.i
  %2966 = bitcast %Tuple* %2959 to i8**
  store i8* %2892, i8** %2966, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %2961, align 8
  %2967 = load i32, i32* %2950, align 4
  %2968 = add nsw i32 %2967, 1
  store i32 %2968, i32* %2950, align 4
  %controls8.i.i356.i = load i8*, i8** %2966, align 8
  %2969 = getelementptr inbounds i8, i8* %controls8.i.i356.i, i64 24
  %2970 = bitcast i8* %2969 to i64*
  %2971 = load i64, i64* %2970, align 8
  %2972 = add nsw i64 %2971, 1
  store i64 %2972, i64* %2970, align 8
  %2973 = bitcast %Qubit** %2961 to i64*
  %arg1.i.i357.i = load i64, i64* %2973, align 8
  %2974 = getelementptr inbounds i8, i8* %controls8.i.i356.i, i64 8
  %2975 = bitcast i8* %2974 to i64*
  %2976 = load i64, i64* %2975, align 8
  %numControlPairs.i.i358.i = sdiv i64 %2976, 2
  %temps.i.i359.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i358.i)
  %2977 = bitcast %Array* %temps.i.i359.i to i8*
  %2978 = getelementptr inbounds i8, i8* %2977, i64 24
  %2979 = bitcast i8* %2978 to i64*
  %2980 = load i64, i64* %2979, align 8
  %2981 = add nsw i64 %2980, 1
  store i64 %2981, i64* %2979, align 8
  %.not.not9.i.i360.i = icmp sgt i64 %2976, 1
  br i1 %.not.not9.i.i360.i, label %body__1.lr.ph.i.i362.i, label %exit__1.i.i366.i

body__1.lr.ph.i.i362.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit.i361.i
  %2982 = bitcast i8* %controls8.i.i356.i to i64*
  %2983 = bitcast %Array* %temps.i.i359.i to i64*
  %2984 = getelementptr inbounds i8, i8* %controls8.i.i356.i, i64 32
  %2985 = getelementptr inbounds i8, i8* %2977, i64 32
  br label %body__1.i.i365.i

body__1.i.i365.i:                                 ; preds = %body__1.lr.ph.i.i362.i, %exit_quantum_grouping236
  %2986 = phi i64 [ 0, %body__1.lr.ph.i.i362.i ], [ %3003, %exit_quantum_grouping236 ]
  %2987 = shl nuw i64 %2986, 1
  %2988 = load i64, i64* %2982, align 8
  %2989 = mul nsw i64 %2988, %2987
  %2990 = getelementptr inbounds i8, i8* %2984, i64 %2989
  %2991 = bitcast i8* %2990 to %Qubit**
  %2992 = load %Qubit*, %Qubit** %2991, align 8
  %2993 = or i64 %2987, 1
  %2994 = mul nsw i64 %2993, %2988
  %2995 = getelementptr inbounds i8, i8* %2984, i64 %2994
  %2996 = bitcast i8* %2995 to %Qubit**
  %2997 = load %Qubit*, %Qubit** %2996, align 8
  %2998 = load i64, i64* %2983, align 8
  %2999 = mul nsw i64 %2998, %2986
  %3000 = getelementptr inbounds i8, i8* %2985, i64 %2999
  %3001 = bitcast i8* %3000 to %Qubit**
  %3002 = load %Qubit*, %Qubit** %3001, align 8
  %3003 = add nuw nsw i64 %2986, 1
  %3004 = icmp eq i64 %3003, %numControlPairs.i.i358.i
  br label %quantum235

quantum235:                                       ; preds = %body__1.i.i365.i
  tail call void @__quantum__qis__h__body(%Qubit* %3002)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3002, %Qubit* %2992)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2992, %Qubit* %2997)
  tail call void @__quantum__qis__t__body(%Qubit* %2997)
  tail call void @__quantum__qis__t__adj(%Qubit* %2992)
  tail call void @__quantum__qis__t__body(%Qubit* %3002)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3002, %Qubit* %2992)
  tail call void @__quantum__qis__cnot__body(%Qubit* %2992, %Qubit* %2997)
  tail call void @__quantum__qis__t__adj(%Qubit* %2997)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3002, %Qubit* %2997)
  tail call void @__quantum__qis__h__body(%Qubit* %3002)
  br label %readout234

readout234:                                       ; preds = %quantum235
  br label %post-classical233

post-classical233:                                ; preds = %readout234
  br label %exit_quantum_grouping236

exit_quantum_grouping236:                         ; preds = %post-classical233
  br i1 %3004, label %exit__1.i.i366.i, label %body__1.i.i365.i

exit__1.i.i366.i:                                 ; preds = %exit_quantum_grouping236, %__quantum__rt__array_update_reference_count.exit.i361.i
  %3005 = and i64 %2976, 1
  %3006 = icmp eq i64 %3005, 0
  br i1 %3006, label %condTrue__1.i.i367.i, label %condFalse__1.i.i369.i

condTrue__1.i.i367.i:                             ; preds = %exit__1.i.i366.i
  %3007 = getelementptr inbounds i8, i8* %2977, i64 16
  %3008 = bitcast i8* %3007 to i64*
  %3009 = load i64, i64* %3008, align 8
  %3010 = add nsw i64 %3009, 1
  store i64 %3010, i64* %3008, align 8
  %3011 = icmp slt i64 %3009, 0
  br i1 %3011, label %3012, label %condContinue__1.i.i373.i

3012:                                             ; preds = %condTrue__1.i.i367.i
  tail call void @free(i8* nonnull %2977) #2
  br label %condContinue__1.i.i373.i

condFalse__1.i.i369.i:                            ; preds = %exit__1.i.i366.i
  %3013 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3014 = bitcast i8* %3013 to i64*
  %3015 = getelementptr inbounds i8, i8* %3013, i64 8
  %3016 = bitcast i8* %3015 to i64*
  %3017 = getelementptr inbounds i8, i8* %3013, i64 16
  %3018 = bitcast i8* %3017 to i64*
  %3019 = getelementptr inbounds i8, i8* %3013, i64 24
  %3020 = bitcast i8* %3019 to i64*
  store i64 8, i64* %3014, align 8
  store i64 1, i64* %3016, align 8
  store i64 1, i64* %3018, align 8
  store i64 0, i64* %3020, align 8
  %3021 = getelementptr inbounds i8, i8* %3013, i64 32
  %3022 = add i64 %2976, -1
  %3023 = bitcast i8* %controls8.i.i356.i to i64*
  %3024 = load i64, i64* %3023, align 8
  %3025 = mul nsw i64 %3024, %3022
  %3026 = getelementptr inbounds i8, i8* %controls8.i.i356.i, i64 %3025
  %3027 = getelementptr inbounds i8, i8* %3026, i64 32
  %3028 = bitcast i8* %3027 to i64*
  %3029 = load i64, i64* %3028, align 8
  %3030 = bitcast i8* %3021 to i64*
  store i64 %3029, i64* %3030, align 8
  %3031 = bitcast %Array* %temps.i.i359.i to i64*
  %3032 = load i64, i64* %3031, align 8
  %3033 = getelementptr inbounds i8, i8* %2977, i64 8
  %3034 = bitcast i8* %3033 to i64*
  %3035 = load i64, i64* %3034, align 8
  %3036 = load i64, i64* %3016, align 8
  %3037 = getelementptr inbounds i8, i8* %2977, i64 32
  %3038 = add nsw i64 %3036, %3035
  %sext.i.i.i368.i = shl i64 %3032, 32
  %3039 = ashr exact i64 %sext.i.i.i368.i, 32
  %3040 = mul nsw i64 %3038, %3039
  %3041 = add i64 %3040, 32
  %3042 = tail call i8* @malloc(i64 %3041) #5
  %3043 = bitcast i8* %3042 to i64*
  %3044 = getelementptr inbounds i8, i8* %3042, i64 8
  %3045 = bitcast i8* %3044 to i64*
  %3046 = getelementptr inbounds i8, i8* %3042, i64 16
  %3047 = bitcast i8* %3046 to i64*
  %3048 = getelementptr inbounds i8, i8* %3042, i64 24
  %3049 = bitcast i8* %3048 to i64*
  store i64 %3039, i64* %3043, align 8
  store i64 %3038, i64* %3045, align 8
  store i64 1, i64* %3047, align 8
  store i64 0, i64* %3049, align 8
  %3050 = getelementptr inbounds i8, i8* %3042, i64 32
  %3051 = mul nsw i64 %3035, %3032
  %3052 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3050, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3050, i8* nonnull align 1 %3037, i64 %3051, i1 false) #2
  %3053 = getelementptr inbounds i8, i8* %3050, i64 %3051
  %3054 = mul nsw i64 %3036, %3032
  %3055 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3053, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3053, i8* nonnull align 1 %3021, i64 %3054, i1 false) #2
  %3056 = bitcast i8* %3042 to %Array*
  %3057 = load i64, i64* %3047, align 8
  %3058 = add nsw i64 %3057, 1
  store i64 %3058, i64* %3047, align 8
  %3059 = icmp slt i64 %3057, 0
  br i1 %3059, label %3060, label %__quantum__rt__array_update_reference_count.exit2.i.i370.i

3060:                                             ; preds = %condFalse__1.i.i369.i
  tail call void @free(i8* nonnull %3042) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i370.i

__quantum__rt__array_update_reference_count.exit2.i.i370.i: ; preds = %3060, %condFalse__1.i.i369.i
  %3061 = load i64, i64* %3018, align 8
  %3062 = add nsw i64 %3061, -1
  store i64 %3062, i64* %3018, align 8
  %3063 = icmp slt i64 %3061, 2
  br i1 %3063, label %3064, label %__quantum__rt__array_update_reference_count.exit3.i.i371.i

3064:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i370.i
  tail call void @free(i8* nonnull %3013) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i371.i

__quantum__rt__array_update_reference_count.exit3.i.i371.i: ; preds = %3064, %__quantum__rt__array_update_reference_count.exit2.i.i370.i
  %3065 = load i64, i64* %3047, align 8
  %3066 = add nsw i64 %3065, -1
  store i64 %3066, i64* %3047, align 8
  %3067 = icmp slt i64 %3065, 2
  br i1 %3067, label %3068, label %condContinue__1.i.i373.i

3068:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i371.i
  tail call void @free(i8* nonnull %3042) #2
  br label %condContinue__1.i.i373.i

condContinue__1.i.i373.i:                         ; preds = %3068, %__quantum__rt__array_update_reference_count.exit3.i.i371.i, %3012, %condTrue__1.i.i367.i
  %__qsVar1__newControls__.i.i372.i = phi %Array* [ %temps.i.i359.i, %condTrue__1.i.i367.i ], [ %temps.i.i359.i, %3012 ], [ %3056, %__quantum__rt__array_update_reference_count.exit3.i.i371.i ], [ %3056, %3068 ]
  %3069 = bitcast %Array* %__qsVar1__newControls__.i.i372.i to i8*
  %3070 = getelementptr inbounds i8, i8* %3069, i64 24
  %3071 = bitcast i8* %3070 to i64*
  %3072 = load i64, i64* %3071, align 8
  %3073 = add nsw i64 %3072, 1
  store i64 %3073, i64* %3071, align 8
  %3074 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3075 = bitcast i8* %3074 to i64*
  %3076 = getelementptr inbounds i8, i8* %3074, i64 8
  %3077 = bitcast i8* %3076 to i64*
  %3078 = getelementptr inbounds i8, i8* %3074, i64 16
  %3079 = bitcast i8* %3078 to i64*
  store i64 16, i64* %3075, align 8
  store i64 1, i64* %3077, align 8
  store i64 0, i64* %3079, align 8
  %3080 = getelementptr inbounds i8, i8* %3074, i64 24
  %3081 = bitcast i8* %3080 to %Tuple*
  %3082 = bitcast %Tuple* %3081 to { %Array*, %Qubit* }*
  %3083 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3082, i64 0, i32 0
  %3084 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3082, i64 0, i32 1
  %3085 = getelementptr inbounds i8, i8* %3069, i64 16
  %3086 = bitcast i8* %3085 to i64*
  %3087 = load i64, i64* %3086, align 8
  %3088 = add nsw i64 %3087, 1
  store i64 %3088, i64* %3086, align 8
  %3089 = icmp slt i64 %3087, 0
  br i1 %3089, label %3090, label %__quantum__rt__array_update_reference_count.exit5.i.i374.i

3090:                                             ; preds = %condContinue__1.i.i373.i
  tail call void @free(i8* nonnull %3069) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i374.i

__quantum__rt__array_update_reference_count.exit5.i.i374.i: ; preds = %3090, %condContinue__1.i.i373.i
  store %Array* %__qsVar1__newControls__.i.i372.i, %Array** %3083, align 8
  %3091 = bitcast %Qubit** %3084 to i64*
  store i64 %arg1.i.i357.i, i64* %3091, align 8
  %3092 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %2943, align 8
  %3093 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %3092, i64 0, i64 0
  %3094 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %3093, align 8
  %3095 = load i8*, i8** %2946, align 8
  tail call void %3094(i8* %3095, i8* nonnull %3080, i8* null)
  br i1 %.not.not9.i.i360.i, label %body__2.lr.ph.i.i376.i, label %exit__2.i.i380.i

body__2.lr.ph.i.i376.i:                           ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i374.i
  %__qsVar0____qsVar0__numPair____11.i.i375.i = add nsw i64 %numControlPairs.i.i358.i, -1
  %3096 = bitcast i8* %controls8.i.i356.i to i64*
  %3097 = bitcast %Array* %temps.i.i359.i to i64*
  %3098 = getelementptr inbounds i8, i8* %controls8.i.i356.i, i64 32
  %3099 = getelementptr inbounds i8, i8* %2977, i64 32
  br label %body__2.i.i379.i

body__2.i.i379.i:                                 ; preds = %body__2.lr.ph.i.i376.i, %exit_quantum_grouping240
  %3100 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i375.i, %body__2.lr.ph.i.i376.i ], [ %3117, %exit_quantum_grouping240 ]
  %3101 = shl nuw i64 %3100, 1
  %3102 = load i64, i64* %3096, align 8
  %3103 = mul nsw i64 %3102, %3101
  %3104 = getelementptr inbounds i8, i8* %3098, i64 %3103
  %3105 = bitcast i8* %3104 to %Qubit**
  %3106 = load %Qubit*, %Qubit** %3105, align 8
  %3107 = or i64 %3101, 1
  %3108 = mul nsw i64 %3107, %3102
  %3109 = getelementptr inbounds i8, i8* %3098, i64 %3108
  %3110 = bitcast i8* %3109 to %Qubit**
  %3111 = load %Qubit*, %Qubit** %3110, align 8
  %3112 = load i64, i64* %3097, align 8
  %3113 = mul nsw i64 %3112, %3100
  %3114 = getelementptr inbounds i8, i8* %3099, i64 %3113
  %3115 = bitcast i8* %3114 to %Qubit**
  %3116 = load %Qubit*, %Qubit** %3115, align 8
  %3117 = add i64 %3100, -1
  %3118 = icmp sgt i64 %3117, -1
  br label %quantum239

quantum239:                                       ; preds = %body__2.i.i379.i
  tail call void @__quantum__qis__h__body(%Qubit* %3116)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3116, %Qubit* %3111)
  tail call void @__quantum__qis__t__body(%Qubit* %3111)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3106, %Qubit* %3111)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3116, %Qubit* %3106)
  tail call void @__quantum__qis__t__adj(%Qubit* %3116)
  tail call void @__quantum__qis__t__body(%Qubit* %3106)
  tail call void @__quantum__qis__t__adj(%Qubit* %3111)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3106, %Qubit* %3111)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3116, %Qubit* %3106)
  tail call void @__quantum__qis__h__body(%Qubit* %3116)
  br label %readout238

readout238:                                       ; preds = %quantum239
  br label %post-classical237

post-classical237:                                ; preds = %readout238
  br label %exit_quantum_grouping240

exit_quantum_grouping240:                         ; preds = %post-classical237
  br i1 %3118, label %body__2.i.i379.i, label %exit__2.i.i380.i

exit__2.i.i380.i:                                 ; preds = %exit_quantum_grouping240, %__quantum__rt__array_update_reference_count.exit5.i.i374.i
  %3119 = load i64, i64* %2979, align 8
  %3120 = add nsw i64 %3119, -1
  store i64 %3120, i64* %2979, align 8
  %3121 = load i64, i64* %3071, align 8
  %3122 = add nsw i64 %3121, -1
  store i64 %3122, i64* %3071, align 8
  %3123 = load i64, i64* %3086, align 8
  %3124 = add nsw i64 %3123, -1
  store i64 %3124, i64* %3086, align 8
  %3125 = icmp slt i64 %3123, 2
  br i1 %3125, label %3126, label %__quantum__rt__array_update_reference_count.exit6.i.i382.i

3126:                                             ; preds = %exit__2.i.i380.i
  tail call void @free(i8* nonnull %3069) #2
  %.pre.i.i381.i = load i64, i64* %3086, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i382.i

__quantum__rt__array_update_reference_count.exit6.i.i382.i: ; preds = %3126, %exit__2.i.i380.i
  %3127 = phi i64 [ %3124, %exit__2.i.i380.i ], [ %.pre.i.i381.i, %3126 ]
  %3128 = add nsw i64 %3127, -1
  store i64 %3128, i64* %3086, align 8
  %3129 = icmp slt i64 %3127, 2
  br i1 %3129, label %3130, label %__quantum__rt__array_update_reference_count.exit7.i.i383.i

3130:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i382.i
  tail call void @free(i8* nonnull %3069) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i383.i

__quantum__rt__array_update_reference_count.exit7.i.i383.i: ; preds = %3130, %__quantum__rt__array_update_reference_count.exit6.i.i382.i
  %3131 = load i64, i64* %3077, align 8
  %3132 = add nsw i64 %3131, -1
  store i64 %3132, i64* %3077, align 8
  %3133 = icmp slt i64 %3131, 2
  br i1 %3133, label %3134, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i384.i

3134:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i383.i
  tail call void @free(i8* nonnull %3074) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i384.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i384.i: ; preds = %3134, %__quantum__rt__array_update_reference_count.exit7.i.i383.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i359.i)
  %3135 = load i32, i32* %2950, align 4
  %3136 = add nsw i32 %3135, -1
  store i32 %3136, i32* %2950, align 4
  %3137 = load i64, i64* %2970, align 8
  %3138 = add nsw i64 %3137, -1
  store i64 %3138, i64* %2970, align 8
  %3139 = load i32, i32* %2948, align 8
  %3140 = add nsw i32 %3139, -1
  store i32 %3140, i32* %2948, align 8
  %3141 = load i64, i64* %2897, align 8
  %3142 = add nsw i64 %3141, -1
  store i64 %3142, i64* %2897, align 8
  %3143 = icmp slt i64 %3141, 2
  br i1 %3143, label %3144, label %__quantum__rt__array_update_reference_count.exit1.i385.i

3144:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i384.i
  tail call void @free(i8* nonnull %2892) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i385.i

__quantum__rt__array_update_reference_count.exit1.i385.i: ; preds = %3144, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i384.i
  %3145 = load i64, i64* %2955, align 8
  %3146 = add nsw i64 %3145, -1
  store i64 %3146, i64* %2955, align 8
  %3147 = icmp slt i64 %3145, 2
  br i1 %3147, label %3148, label %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i

3148:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i385.i
  tail call void @free(i8* nonnull %2952) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i

Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i:  ; preds = %3148, %__quantum__rt__array_update_reference_count.exit1.i385.i, %exit_quantum_grouping232, %exit_quantum_grouping228, %exit_quantum_grouping224
  %3149 = load i64, i64* %2899, align 8
  %3150 = add nsw i64 %3149, -1
  store i64 %3150, i64* %2899, align 8
  %3151 = load i64, i64* %2897, align 8
  %3152 = add nsw i64 %3151, -1
  store i64 %3152, i64* %2897, align 8
  %3153 = icmp slt i64 %3151, 2
  br i1 %3153, label %3154, label %Microsoft__Quantum__Canon__CZ__body.exit29.i

3154:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i
  tail call void @free(i8* nonnull %2892) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit29.i

Microsoft__Quantum__Canon__CZ__body.exit29.i:     ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.41.exit.i, %3154
  %3155 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3156 = bitcast i8* %3155 to i64*
  %3157 = getelementptr inbounds i8, i8* %3155, i64 8
  %3158 = bitcast i8* %3157 to i64*
  %3159 = getelementptr inbounds i8, i8* %3155, i64 16
  %3160 = bitcast i8* %3159 to i64*
  %3161 = getelementptr inbounds i8, i8* %3155, i64 24
  %3162 = bitcast i8* %3161 to i64*
  store i64 8, i64* %3156, align 8
  store i64 1, i64* %3158, align 8
  store i64 1, i64* %3160, align 8
  store i64 0, i64* %3162, align 8
  %3163 = getelementptr inbounds i8, i8* %3155, i64 32
  %3164 = bitcast i8* %3163 to %Qubit**
  store %Qubit* inttoptr (i64 12 to %Qubit*), %Qubit** %3164, align 8
  %3165 = load i64, i64* %3162, align 8
  %3166 = add nsw i64 %3165, 1
  store i64 %3166, i64* %3162, align 8
  %3167 = load i64, i64* %3158, align 8
  br label %quantum447

quantum447:                                       ; preds = %Microsoft__Quantum__Canon__CZ__body.exit29.i
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*), %Result* nonnull inttoptr (i64 11 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 23 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  br label %readout446

readout446:                                       ; preds = %quantum447
  %3168 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 11 to %Result*))
  br label %post-classical445

post-classical445:                                ; preds = %readout446
  br label %exit_quantum_grouping448

exit_quantum_grouping448:                         ; preds = %post-classical445
  switch i64 %3167, label %else__1.i.i.i [
    i64 0, label %then0__1.i.i.i
    i64 1, label %then1__1.i.i.i
    i64 2, label %then2__1.i.i.i
  ]

then0__1.i.i.i:                                   ; preds = %exit_quantum_grouping448
  br label %quantum243

quantum243:                                       ; preds = %then0__1.i.i.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  br label %readout242

readout242:                                       ; preds = %quantum243
  br label %post-classical241

post-classical241:                                ; preds = %readout242
  br label %exit_quantum_grouping244

exit_quantum_grouping244:                         ; preds = %post-classical241
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i

then1__1.i.i.i:                                   ; preds = %exit_quantum_grouping448
  %3169 = load %Qubit*, %Qubit** %3164, align 8
  br label %quantum247

quantum247:                                       ; preds = %then1__1.i.i.i
  tail call void @__quantum__qis__cz__body(%Qubit* %3169, %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  br label %readout246

readout246:                                       ; preds = %quantum247
  br label %post-classical245

post-classical245:                                ; preds = %readout246
  br label %exit_quantum_grouping248

exit_quantum_grouping248:                         ; preds = %post-classical245
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i

then2__1.i.i.i:                                   ; preds = %exit_quantum_grouping448
  %3170 = bitcast i8* %3155 to %Array*
  %3171 = bitcast %Array* %3170 to i64*
  %3172 = load %Qubit*, %Qubit** %3164, align 8
  %3173 = load i64, i64* %3171, align 8
  %3174 = getelementptr inbounds i8, i8* %3155, i64 %3173
  %3175 = getelementptr inbounds i8, i8* %3174, i64 32
  %3176 = bitcast i8* %3175 to %Qubit**
  %3177 = load %Qubit*, %Qubit** %3176, align 8
  %3178 = load %Qubit*, %Qubit** %3164, align 8
  %3179 = load %Qubit*, %Qubit** %3164, align 8
  %3180 = load i64, i64* %3171, align 8
  %3181 = getelementptr inbounds i8, i8* %3155, i64 %3180
  %3182 = getelementptr inbounds i8, i8* %3181, i64 32
  %3183 = bitcast i8* %3182 to %Qubit**
  %3184 = load %Qubit*, %Qubit** %3183, align 8
  %3185 = load i64, i64* %3171, align 8
  %3186 = getelementptr inbounds i8, i8* %3155, i64 %3185
  %3187 = getelementptr inbounds i8, i8* %3186, i64 32
  %3188 = bitcast i8* %3187 to %Qubit**
  %3189 = load %Qubit*, %Qubit** %3188, align 8
  %3190 = load %Qubit*, %Qubit** %3164, align 8
  %3191 = load %Qubit*, %Qubit** %3164, align 8
  %3192 = load i64, i64* %3171, align 8
  %3193 = getelementptr inbounds i8, i8* %3155, i64 %3192
  %3194 = getelementptr inbounds i8, i8* %3193, i64 32
  %3195 = bitcast i8* %3194 to %Qubit**
  %3196 = load %Qubit*, %Qubit** %3195, align 8
  %3197 = load %Qubit*, %Qubit** %3164, align 8
  %3198 = load %Qubit*, %Qubit** %3164, align 8
  %3199 = load i64, i64* %3171, align 8
  %3200 = getelementptr inbounds i8, i8* %3155, i64 %3199
  %3201 = getelementptr inbounds i8, i8* %3200, i64 32
  %3202 = bitcast i8* %3201 to %Qubit**
  %3203 = load %Qubit*, %Qubit** %3202, align 8
  %3204 = load %Qubit*, %Qubit** %3164, align 8
  br label %quantum251

quantum251:                                       ; preds = %then2__1.i.i.i
  tail call void @__quantum__qis__t__adj(%Qubit* %3172)
  tail call void @__quantum__qis__t__adj(%Qubit* %3177)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Qubit* %3178)
  tail call void @__quantum__qis__t__body(%Qubit* %3179)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3184, %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %3189, %Qubit* %3190)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %3191)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3196, %Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Qubit* %3197)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %3198)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3203, %Qubit* %3204)
  br label %readout250

readout250:                                       ; preds = %quantum251
  br label %post-classical249

post-classical249:                                ; preds = %readout250
  br label %exit_quantum_grouping252

exit_quantum_grouping252:                         ; preds = %post-classical249
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i

else__1.i.i.i:                                    ; preds = %exit_quantum_grouping448
  %3205 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %3206 = bitcast i8* %3205 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %3206, align 8
  %3207 = getelementptr inbounds i8, i8* %3205, i64 8
  %3208 = getelementptr inbounds i8, i8* %3205, i64 16
  %3209 = bitcast i8* %3208 to i8**
  %3210 = getelementptr inbounds i8, i8* %3205, i64 24
  %3211 = bitcast i8* %3210 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %3207, i8 0, i64 16, i1 false)
  store i32 1, i32* %3211, align 8
  %3212 = getelementptr inbounds i8, i8* %3205, i64 28
  %3213 = bitcast i8* %3212 to i32*
  store i32 0, i32* %3213, align 4
  %3214 = bitcast i8* %3205 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %3214)
  %3215 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3216 = bitcast i8* %3215 to i64*
  %3217 = getelementptr inbounds i8, i8* %3215, i64 8
  %3218 = bitcast i8* %3217 to i64*
  %3219 = getelementptr inbounds i8, i8* %3215, i64 16
  %3220 = bitcast i8* %3219 to i64*
  store i64 16, i64* %3216, align 8
  store i64 1, i64* %3218, align 8
  store i64 0, i64* %3220, align 8
  %3221 = getelementptr inbounds i8, i8* %3215, i64 24
  %3222 = bitcast i8* %3221 to %Tuple*
  %3223 = bitcast %Tuple* %3222 to { %Array*, %Qubit* }*
  %3224 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3223, i64 0, i32 1
  %3225 = load i64, i64* %3160, align 8
  %3226 = add nsw i64 %3225, 1
  store i64 %3226, i64* %3160, align 8
  %3227 = icmp slt i64 %3225, 0
  br i1 %3227, label %3228, label %__quantum__rt__array_update_reference_count.exit.i.i.i

3228:                                             ; preds = %else__1.i.i.i
  tail call void @free(i8* nonnull %3155) #2
  br label %__quantum__rt__array_update_reference_count.exit.i.i.i

__quantum__rt__array_update_reference_count.exit.i.i.i: ; preds = %3228, %else__1.i.i.i
  %3229 = bitcast %Tuple* %3222 to i8**
  store i8* %3155, i8** %3229, align 8
  store %Qubit* inttoptr (i64 4 to %Qubit*), %Qubit** %3224, align 8
  %3230 = load i32, i32* %3213, align 4
  %3231 = add nsw i32 %3230, 1
  store i32 %3231, i32* %3213, align 4
  %controls8.i.i.i.i = load i8*, i8** %3229, align 8
  %3232 = getelementptr inbounds i8, i8* %controls8.i.i.i.i, i64 24
  %3233 = bitcast i8* %3232 to i64*
  %3234 = load i64, i64* %3233, align 8
  %3235 = add nsw i64 %3234, 1
  store i64 %3235, i64* %3233, align 8
  %3236 = bitcast %Qubit** %3224 to i64*
  %arg1.i.i.i.i = load i64, i64* %3236, align 8
  %3237 = getelementptr inbounds i8, i8* %controls8.i.i.i.i, i64 8
  %3238 = bitcast i8* %3237 to i64*
  %3239 = load i64, i64* %3238, align 8
  %numControlPairs.i.i.i.i = sdiv i64 %3239, 2
  %temps.i.i.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i.i)
  %3240 = bitcast %Array* %temps.i.i.i.i to i8*
  %3241 = getelementptr inbounds i8, i8* %3240, i64 24
  %3242 = bitcast i8* %3241 to i64*
  %3243 = load i64, i64* %3242, align 8
  %3244 = add nsw i64 %3243, 1
  store i64 %3244, i64* %3242, align 8
  %.not.not9.i.i.i.i = icmp sgt i64 %3239, 1
  br i1 %.not.not9.i.i.i.i, label %body__1.lr.ph.i.i.i.i, label %exit__1.i.i.i.i

body__1.lr.ph.i.i.i.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit.i.i.i
  %3245 = bitcast i8* %controls8.i.i.i.i to i64*
  %3246 = bitcast %Array* %temps.i.i.i.i to i64*
  %3247 = getelementptr inbounds i8, i8* %controls8.i.i.i.i, i64 32
  %3248 = getelementptr inbounds i8, i8* %3240, i64 32
  br label %body__1.i.i.i.i

body__1.i.i.i.i:                                  ; preds = %body__1.lr.ph.i.i.i.i, %exit_quantum_grouping256
  %3249 = phi i64 [ 0, %body__1.lr.ph.i.i.i.i ], [ %3266, %exit_quantum_grouping256 ]
  %3250 = shl nuw i64 %3249, 1
  %3251 = load i64, i64* %3245, align 8
  %3252 = mul nsw i64 %3251, %3250
  %3253 = getelementptr inbounds i8, i8* %3247, i64 %3252
  %3254 = bitcast i8* %3253 to %Qubit**
  %3255 = load %Qubit*, %Qubit** %3254, align 8
  %3256 = or i64 %3250, 1
  %3257 = mul nsw i64 %3256, %3251
  %3258 = getelementptr inbounds i8, i8* %3247, i64 %3257
  %3259 = bitcast i8* %3258 to %Qubit**
  %3260 = load %Qubit*, %Qubit** %3259, align 8
  %3261 = load i64, i64* %3246, align 8
  %3262 = mul nsw i64 %3261, %3249
  %3263 = getelementptr inbounds i8, i8* %3248, i64 %3262
  %3264 = bitcast i8* %3263 to %Qubit**
  %3265 = load %Qubit*, %Qubit** %3264, align 8
  %3266 = add nuw nsw i64 %3249, 1
  %3267 = icmp eq i64 %3266, %numControlPairs.i.i.i.i
  br label %quantum255

quantum255:                                       ; preds = %body__1.i.i.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %3265)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3265, %Qubit* %3255)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3255, %Qubit* %3260)
  tail call void @__quantum__qis__t__body(%Qubit* %3260)
  tail call void @__quantum__qis__t__adj(%Qubit* %3255)
  tail call void @__quantum__qis__t__body(%Qubit* %3265)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3265, %Qubit* %3255)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3255, %Qubit* %3260)
  tail call void @__quantum__qis__t__adj(%Qubit* %3260)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3265, %Qubit* %3260)
  tail call void @__quantum__qis__h__body(%Qubit* %3265)
  br label %readout254

readout254:                                       ; preds = %quantum255
  br label %post-classical253

post-classical253:                                ; preds = %readout254
  br label %exit_quantum_grouping256

exit_quantum_grouping256:                         ; preds = %post-classical253
  br i1 %3267, label %exit__1.i.i.i.i, label %body__1.i.i.i.i

exit__1.i.i.i.i:                                  ; preds = %exit_quantum_grouping256, %__quantum__rt__array_update_reference_count.exit.i.i.i
  %3268 = and i64 %3239, 1
  %3269 = icmp eq i64 %3268, 0
  br i1 %3269, label %condTrue__1.i.i.i.i, label %condFalse__1.i.i.i.i

condTrue__1.i.i.i.i:                              ; preds = %exit__1.i.i.i.i
  %3270 = getelementptr inbounds i8, i8* %3240, i64 16
  %3271 = bitcast i8* %3270 to i64*
  %3272 = load i64, i64* %3271, align 8
  %3273 = add nsw i64 %3272, 1
  store i64 %3273, i64* %3271, align 8
  %3274 = icmp slt i64 %3272, 0
  br i1 %3274, label %3275, label %condContinue__1.i.i.i.i

3275:                                             ; preds = %condTrue__1.i.i.i.i
  tail call void @free(i8* nonnull %3240) #2
  br label %condContinue__1.i.i.i.i

condFalse__1.i.i.i.i:                             ; preds = %exit__1.i.i.i.i
  %3276 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3277 = bitcast i8* %3276 to i64*
  %3278 = getelementptr inbounds i8, i8* %3276, i64 8
  %3279 = bitcast i8* %3278 to i64*
  %3280 = getelementptr inbounds i8, i8* %3276, i64 16
  %3281 = bitcast i8* %3280 to i64*
  %3282 = getelementptr inbounds i8, i8* %3276, i64 24
  %3283 = bitcast i8* %3282 to i64*
  store i64 8, i64* %3277, align 8
  store i64 1, i64* %3279, align 8
  store i64 1, i64* %3281, align 8
  store i64 0, i64* %3283, align 8
  %3284 = getelementptr inbounds i8, i8* %3276, i64 32
  %3285 = add i64 %3239, -1
  %3286 = bitcast i8* %controls8.i.i.i.i to i64*
  %3287 = load i64, i64* %3286, align 8
  %3288 = mul nsw i64 %3287, %3285
  %3289 = getelementptr inbounds i8, i8* %controls8.i.i.i.i, i64 %3288
  %3290 = getelementptr inbounds i8, i8* %3289, i64 32
  %3291 = bitcast i8* %3290 to i64*
  %3292 = load i64, i64* %3291, align 8
  %3293 = bitcast i8* %3284 to i64*
  store i64 %3292, i64* %3293, align 8
  %3294 = bitcast %Array* %temps.i.i.i.i to i64*
  %3295 = load i64, i64* %3294, align 8
  %3296 = getelementptr inbounds i8, i8* %3240, i64 8
  %3297 = bitcast i8* %3296 to i64*
  %3298 = load i64, i64* %3297, align 8
  %3299 = load i64, i64* %3279, align 8
  %3300 = getelementptr inbounds i8, i8* %3240, i64 32
  %3301 = add nsw i64 %3299, %3298
  %sext.i.i.i.i.i = shl i64 %3295, 32
  %3302 = ashr exact i64 %sext.i.i.i.i.i, 32
  %3303 = mul nsw i64 %3301, %3302
  %3304 = add i64 %3303, 32
  %3305 = tail call i8* @malloc(i64 %3304) #5
  %3306 = bitcast i8* %3305 to i64*
  %3307 = getelementptr inbounds i8, i8* %3305, i64 8
  %3308 = bitcast i8* %3307 to i64*
  %3309 = getelementptr inbounds i8, i8* %3305, i64 16
  %3310 = bitcast i8* %3309 to i64*
  %3311 = getelementptr inbounds i8, i8* %3305, i64 24
  %3312 = bitcast i8* %3311 to i64*
  store i64 %3302, i64* %3306, align 8
  store i64 %3301, i64* %3308, align 8
  store i64 1, i64* %3310, align 8
  store i64 0, i64* %3312, align 8
  %3313 = getelementptr inbounds i8, i8* %3305, i64 32
  %3314 = mul nsw i64 %3298, %3295
  %3315 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3313, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3313, i8* nonnull align 1 %3300, i64 %3314, i1 false) #2
  %3316 = getelementptr inbounds i8, i8* %3313, i64 %3314
  %3317 = mul nsw i64 %3299, %3295
  %3318 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3316, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3316, i8* nonnull align 1 %3284, i64 %3317, i1 false) #2
  %3319 = bitcast i8* %3305 to %Array*
  %3320 = load i64, i64* %3310, align 8
  %3321 = add nsw i64 %3320, 1
  store i64 %3321, i64* %3310, align 8
  %3322 = icmp slt i64 %3320, 0
  br i1 %3322, label %3323, label %__quantum__rt__array_update_reference_count.exit2.i.i.i.i

3323:                                             ; preds = %condFalse__1.i.i.i.i
  tail call void @free(i8* nonnull %3305) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i.i.i

__quantum__rt__array_update_reference_count.exit2.i.i.i.i: ; preds = %3323, %condFalse__1.i.i.i.i
  %3324 = load i64, i64* %3281, align 8
  %3325 = add nsw i64 %3324, -1
  store i64 %3325, i64* %3281, align 8
  %3326 = icmp slt i64 %3324, 2
  br i1 %3326, label %3327, label %__quantum__rt__array_update_reference_count.exit3.i.i.i.i

3327:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i.i.i
  tail call void @free(i8* nonnull %3276) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i.i.i

__quantum__rt__array_update_reference_count.exit3.i.i.i.i: ; preds = %3327, %__quantum__rt__array_update_reference_count.exit2.i.i.i.i
  %3328 = load i64, i64* %3310, align 8
  %3329 = add nsw i64 %3328, -1
  store i64 %3329, i64* %3310, align 8
  %3330 = icmp slt i64 %3328, 2
  br i1 %3330, label %3331, label %condContinue__1.i.i.i.i

3331:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i.i.i
  tail call void @free(i8* nonnull %3305) #2
  br label %condContinue__1.i.i.i.i

condContinue__1.i.i.i.i:                          ; preds = %3331, %__quantum__rt__array_update_reference_count.exit3.i.i.i.i, %3275, %condTrue__1.i.i.i.i
  %__qsVar1__newControls__.i.i.i.i = phi %Array* [ %temps.i.i.i.i, %condTrue__1.i.i.i.i ], [ %temps.i.i.i.i, %3275 ], [ %3319, %__quantum__rt__array_update_reference_count.exit3.i.i.i.i ], [ %3319, %3331 ]
  %3332 = bitcast %Array* %__qsVar1__newControls__.i.i.i.i to i8*
  %3333 = getelementptr inbounds i8, i8* %3332, i64 24
  %3334 = bitcast i8* %3333 to i64*
  %3335 = load i64, i64* %3334, align 8
  %3336 = add nsw i64 %3335, 1
  store i64 %3336, i64* %3334, align 8
  %3337 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3338 = bitcast i8* %3337 to i64*
  %3339 = getelementptr inbounds i8, i8* %3337, i64 8
  %3340 = bitcast i8* %3339 to i64*
  %3341 = getelementptr inbounds i8, i8* %3337, i64 16
  %3342 = bitcast i8* %3341 to i64*
  store i64 16, i64* %3338, align 8
  store i64 1, i64* %3340, align 8
  store i64 0, i64* %3342, align 8
  %3343 = getelementptr inbounds i8, i8* %3337, i64 24
  %3344 = bitcast i8* %3343 to %Tuple*
  %3345 = bitcast %Tuple* %3344 to { %Array*, %Qubit* }*
  %3346 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3345, i64 0, i32 0
  %3347 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3345, i64 0, i32 1
  %3348 = getelementptr inbounds i8, i8* %3332, i64 16
  %3349 = bitcast i8* %3348 to i64*
  %3350 = load i64, i64* %3349, align 8
  %3351 = add nsw i64 %3350, 1
  store i64 %3351, i64* %3349, align 8
  %3352 = icmp slt i64 %3350, 0
  br i1 %3352, label %3353, label %__quantum__rt__array_update_reference_count.exit5.i.i.i.i

3353:                                             ; preds = %condContinue__1.i.i.i.i
  tail call void @free(i8* nonnull %3332) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i.i.i

__quantum__rt__array_update_reference_count.exit5.i.i.i.i: ; preds = %3353, %condContinue__1.i.i.i.i
  store %Array* %__qsVar1__newControls__.i.i.i.i, %Array** %3346, align 8
  %3354 = bitcast %Qubit** %3347 to i64*
  store i64 %arg1.i.i.i.i, i64* %3354, align 8
  %3355 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %3206, align 8
  %3356 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %3355, i64 0, i64 0
  %3357 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %3356, align 8
  %3358 = load i8*, i8** %3209, align 8
  tail call void %3357(i8* %3358, i8* nonnull %3343, i8* null)
  br i1 %.not.not9.i.i.i.i, label %body__2.lr.ph.i.i.i.i, label %exit__2.i.i.i.i

body__2.lr.ph.i.i.i.i:                            ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i.i.i
  %__qsVar0____qsVar0__numPair____11.i.i.i.i = add nsw i64 %numControlPairs.i.i.i.i, -1
  %3359 = bitcast i8* %controls8.i.i.i.i to i64*
  %3360 = bitcast %Array* %temps.i.i.i.i to i64*
  %3361 = getelementptr inbounds i8, i8* %controls8.i.i.i.i, i64 32
  %3362 = getelementptr inbounds i8, i8* %3240, i64 32
  br label %body__2.i.i.i.i

body__2.i.i.i.i:                                  ; preds = %body__2.lr.ph.i.i.i.i, %exit_quantum_grouping260
  %3363 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i.i.i, %body__2.lr.ph.i.i.i.i ], [ %3380, %exit_quantum_grouping260 ]
  %3364 = shl nuw i64 %3363, 1
  %3365 = load i64, i64* %3359, align 8
  %3366 = mul nsw i64 %3365, %3364
  %3367 = getelementptr inbounds i8, i8* %3361, i64 %3366
  %3368 = bitcast i8* %3367 to %Qubit**
  %3369 = load %Qubit*, %Qubit** %3368, align 8
  %3370 = or i64 %3364, 1
  %3371 = mul nsw i64 %3370, %3365
  %3372 = getelementptr inbounds i8, i8* %3361, i64 %3371
  %3373 = bitcast i8* %3372 to %Qubit**
  %3374 = load %Qubit*, %Qubit** %3373, align 8
  %3375 = load i64, i64* %3360, align 8
  %3376 = mul nsw i64 %3375, %3363
  %3377 = getelementptr inbounds i8, i8* %3362, i64 %3376
  %3378 = bitcast i8* %3377 to %Qubit**
  %3379 = load %Qubit*, %Qubit** %3378, align 8
  %3380 = add i64 %3363, -1
  %3381 = icmp sgt i64 %3380, -1
  br label %quantum259

quantum259:                                       ; preds = %body__2.i.i.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %3379)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3379, %Qubit* %3374)
  tail call void @__quantum__qis__t__body(%Qubit* %3374)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3369, %Qubit* %3374)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3379, %Qubit* %3369)
  tail call void @__quantum__qis__t__adj(%Qubit* %3379)
  tail call void @__quantum__qis__t__body(%Qubit* %3369)
  tail call void @__quantum__qis__t__adj(%Qubit* %3374)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3369, %Qubit* %3374)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3379, %Qubit* %3369)
  tail call void @__quantum__qis__h__body(%Qubit* %3379)
  br label %readout258

readout258:                                       ; preds = %quantum259
  br label %post-classical257

post-classical257:                                ; preds = %readout258
  br label %exit_quantum_grouping260

exit_quantum_grouping260:                         ; preds = %post-classical257
  br i1 %3381, label %body__2.i.i.i.i, label %exit__2.i.i.i.i

exit__2.i.i.i.i:                                  ; preds = %exit_quantum_grouping260, %__quantum__rt__array_update_reference_count.exit5.i.i.i.i
  %3382 = load i64, i64* %3242, align 8
  %3383 = add nsw i64 %3382, -1
  store i64 %3383, i64* %3242, align 8
  %3384 = load i64, i64* %3334, align 8
  %3385 = add nsw i64 %3384, -1
  store i64 %3385, i64* %3334, align 8
  %3386 = load i64, i64* %3349, align 8
  %3387 = add nsw i64 %3386, -1
  store i64 %3387, i64* %3349, align 8
  %3388 = icmp slt i64 %3386, 2
  br i1 %3388, label %3389, label %__quantum__rt__array_update_reference_count.exit6.i.i.i.i

3389:                                             ; preds = %exit__2.i.i.i.i
  tail call void @free(i8* nonnull %3332) #2
  %.pre.i.i.i.i = load i64, i64* %3349, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i.i.i

__quantum__rt__array_update_reference_count.exit6.i.i.i.i: ; preds = %3389, %exit__2.i.i.i.i
  %3390 = phi i64 [ %3387, %exit__2.i.i.i.i ], [ %.pre.i.i.i.i, %3389 ]
  %3391 = add nsw i64 %3390, -1
  store i64 %3391, i64* %3349, align 8
  %3392 = icmp slt i64 %3390, 2
  br i1 %3392, label %3393, label %__quantum__rt__array_update_reference_count.exit7.i.i.i.i

3393:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i.i.i
  tail call void @free(i8* nonnull %3332) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i.i.i

__quantum__rt__array_update_reference_count.exit7.i.i.i.i: ; preds = %3393, %__quantum__rt__array_update_reference_count.exit6.i.i.i.i
  %3394 = load i64, i64* %3340, align 8
  %3395 = add nsw i64 %3394, -1
  store i64 %3395, i64* %3340, align 8
  %3396 = icmp slt i64 %3394, 2
  br i1 %3396, label %3397, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i.i

3397:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i.i.i
  tail call void @free(i8* nonnull %3337) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i.i: ; preds = %3397, %__quantum__rt__array_update_reference_count.exit7.i.i.i.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i.i.i)
  %3398 = load i32, i32* %3213, align 4
  %3399 = add nsw i32 %3398, -1
  store i32 %3399, i32* %3213, align 4
  %3400 = load i64, i64* %3233, align 8
  %3401 = add nsw i64 %3400, -1
  store i64 %3401, i64* %3233, align 8
  %3402 = load i32, i32* %3211, align 8
  %3403 = add nsw i32 %3402, -1
  store i32 %3403, i32* %3211, align 8
  %3404 = load i64, i64* %3160, align 8
  %3405 = add nsw i64 %3404, -1
  store i64 %3405, i64* %3160, align 8
  %3406 = icmp slt i64 %3404, 2
  br i1 %3406, label %3407, label %__quantum__rt__array_update_reference_count.exit1.i.i.i

3407:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i.i
  tail call void @free(i8* nonnull %3155) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i.i.i

__quantum__rt__array_update_reference_count.exit1.i.i.i: ; preds = %3407, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i.i
  %3408 = load i64, i64* %3218, align 8
  %3409 = add nsw i64 %3408, -1
  store i64 %3409, i64* %3218, align 8
  %3410 = icmp slt i64 %3408, 2
  br i1 %3410, label %3411, label %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i

3411:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i.i.i
  tail call void @free(i8* nonnull %3215) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i: ; preds = %3411, %__quantum__rt__array_update_reference_count.exit1.i.i.i, %exit_quantum_grouping252, %exit_quantum_grouping248, %exit_quantum_grouping244
  %3412 = load i64, i64* %3162, align 8
  %3413 = add nsw i64 %3412, -1
  store i64 %3413, i64* %3162, align 8
  %3414 = load i64, i64* %3160, align 8
  %3415 = add nsw i64 %3414, -1
  store i64 %3415, i64* %3160, align 8
  %3416 = icmp slt i64 %3414, 2
  br i1 %3416, label %3417, label %Microsoft__Quantum__Canon__CZ__body.exit.i.i

3417:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i
  tail call void @free(i8* nonnull %3155) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit.i.i

Microsoft__Quantum__Canon__CZ__body.exit.i.i:     ; preds = %3417, %Microsoft__Quantum__Intrinsic__Z__ctl.43.exit.i.i
  %3418 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3419 = bitcast i8* %3418 to i64*
  %3420 = getelementptr inbounds i8, i8* %3418, i64 8
  %3421 = bitcast i8* %3420 to i64*
  %3422 = getelementptr inbounds i8, i8* %3418, i64 16
  %3423 = bitcast i8* %3422 to i64*
  %3424 = getelementptr inbounds i8, i8* %3418, i64 24
  %3425 = bitcast i8* %3424 to i64*
  store i64 8, i64* %3419, align 8
  store i64 1, i64* %3421, align 8
  store i64 1, i64* %3423, align 8
  store i64 0, i64* %3425, align 8
  %3426 = getelementptr inbounds i8, i8* %3418, i64 32
  %3427 = bitcast i8* %3426 to %Qubit**
  store %Qubit* inttoptr (i64 12 to %Qubit*), %Qubit** %3427, align 8
  %3428 = load i64, i64* %3425, align 8
  %3429 = add nsw i64 %3428, 1
  store i64 %3429, i64* %3425, align 8
  %3430 = load i64, i64* %3421, align 8
  switch i64 %3430, label %else__1.i5.i.i [
    i64 0, label %then0__1.i1.i.i
    i64 1, label %then1__1.i3.i.i
    i64 2, label %then2__1.i4.i.i
  ]

then0__1.i1.i.i:                                  ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i.i
  br label %quantum263

quantum263:                                       ; preds = %then0__1.i1.i.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout262

readout262:                                       ; preds = %quantum263
  br label %post-classical261

post-classical261:                                ; preds = %readout262
  br label %exit_quantum_grouping264

exit_quantum_grouping264:                         ; preds = %post-classical261
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i

then1__1.i3.i.i:                                  ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i.i
  %3431 = load %Qubit*, %Qubit** %3427, align 8
  br label %quantum267

quantum267:                                       ; preds = %then1__1.i3.i.i
  tail call void @__quantum__qis__cz__body(%Qubit* %3431, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  br label %readout266

readout266:                                       ; preds = %quantum267
  br label %post-classical265

post-classical265:                                ; preds = %readout266
  br label %exit_quantum_grouping268

exit_quantum_grouping268:                         ; preds = %post-classical265
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i

then2__1.i4.i.i:                                  ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i.i
  %3432 = bitcast i8* %3418 to %Array*
  %3433 = bitcast %Array* %3432 to i64*
  %3434 = load %Qubit*, %Qubit** %3427, align 8
  %3435 = load i64, i64* %3433, align 8
  %3436 = getelementptr inbounds i8, i8* %3418, i64 %3435
  %3437 = getelementptr inbounds i8, i8* %3436, i64 32
  %3438 = bitcast i8* %3437 to %Qubit**
  %3439 = load %Qubit*, %Qubit** %3438, align 8
  %3440 = load %Qubit*, %Qubit** %3427, align 8
  %3441 = load %Qubit*, %Qubit** %3427, align 8
  %3442 = load i64, i64* %3433, align 8
  %3443 = getelementptr inbounds i8, i8* %3418, i64 %3442
  %3444 = getelementptr inbounds i8, i8* %3443, i64 32
  %3445 = bitcast i8* %3444 to %Qubit**
  %3446 = load %Qubit*, %Qubit** %3445, align 8
  %3447 = load i64, i64* %3433, align 8
  %3448 = getelementptr inbounds i8, i8* %3418, i64 %3447
  %3449 = getelementptr inbounds i8, i8* %3448, i64 32
  %3450 = bitcast i8* %3449 to %Qubit**
  %3451 = load %Qubit*, %Qubit** %3450, align 8
  %3452 = load %Qubit*, %Qubit** %3427, align 8
  %3453 = load %Qubit*, %Qubit** %3427, align 8
  %3454 = load i64, i64* %3433, align 8
  %3455 = getelementptr inbounds i8, i8* %3418, i64 %3454
  %3456 = getelementptr inbounds i8, i8* %3455, i64 32
  %3457 = bitcast i8* %3456 to %Qubit**
  %3458 = load %Qubit*, %Qubit** %3457, align 8
  %3459 = load %Qubit*, %Qubit** %3427, align 8
  %3460 = load %Qubit*, %Qubit** %3427, align 8
  %3461 = load i64, i64* %3433, align 8
  %3462 = getelementptr inbounds i8, i8* %3418, i64 %3461
  %3463 = getelementptr inbounds i8, i8* %3462, i64 32
  %3464 = bitcast i8* %3463 to %Qubit**
  %3465 = load %Qubit*, %Qubit** %3464, align 8
  %3466 = load %Qubit*, %Qubit** %3427, align 8
  br label %quantum271

quantum271:                                       ; preds = %then2__1.i4.i.i
  tail call void @__quantum__qis__t__adj(%Qubit* %3434)
  tail call void @__quantum__qis__t__adj(%Qubit* %3439)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %3440)
  tail call void @__quantum__qis__t__body(%Qubit* %3441)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3446, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %3451, %Qubit* %3452)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %3453)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3458, %Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Qubit* %3459)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %3460)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3465, %Qubit* %3466)
  br label %readout270

readout270:                                       ; preds = %quantum271
  br label %post-classical269

post-classical269:                                ; preds = %readout270
  br label %exit_quantum_grouping272

exit_quantum_grouping272:                         ; preds = %post-classical269
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i

else__1.i5.i.i:                                   ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i.i
  %3467 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %3468 = bitcast i8* %3467 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %3468, align 8
  %3469 = getelementptr inbounds i8, i8* %3467, i64 8
  %3470 = getelementptr inbounds i8, i8* %3467, i64 16
  %3471 = bitcast i8* %3470 to i8**
  %3472 = getelementptr inbounds i8, i8* %3467, i64 24
  %3473 = bitcast i8* %3472 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %3469, i8 0, i64 16, i1 false)
  store i32 1, i32* %3473, align 8
  %3474 = getelementptr inbounds i8, i8* %3467, i64 28
  %3475 = bitcast i8* %3474 to i32*
  store i32 0, i32* %3475, align 4
  %3476 = bitcast i8* %3467 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %3476)
  %3477 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3478 = bitcast i8* %3477 to i64*
  %3479 = getelementptr inbounds i8, i8* %3477, i64 8
  %3480 = bitcast i8* %3479 to i64*
  %3481 = getelementptr inbounds i8, i8* %3477, i64 16
  %3482 = bitcast i8* %3481 to i64*
  store i64 16, i64* %3478, align 8
  store i64 1, i64* %3480, align 8
  store i64 0, i64* %3482, align 8
  %3483 = getelementptr inbounds i8, i8* %3477, i64 24
  %3484 = bitcast i8* %3483 to %Tuple*
  %3485 = bitcast %Tuple* %3484 to { %Array*, %Qubit* }*
  %3486 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3485, i64 0, i32 1
  %3487 = load i64, i64* %3423, align 8
  %3488 = add nsw i64 %3487, 1
  store i64 %3488, i64* %3423, align 8
  %3489 = icmp slt i64 %3487, 0
  br i1 %3489, label %3490, label %__quantum__rt__array_update_reference_count.exit.i11.i.i

3490:                                             ; preds = %else__1.i5.i.i
  tail call void @free(i8* nonnull %3418) #2
  br label %__quantum__rt__array_update_reference_count.exit.i11.i.i

__quantum__rt__array_update_reference_count.exit.i11.i.i: ; preds = %3490, %else__1.i5.i.i
  %3491 = bitcast %Tuple* %3484 to i8**
  store i8* %3418, i8** %3491, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %3486, align 8
  %3492 = load i32, i32* %3475, align 4
  %3493 = add nsw i32 %3492, 1
  store i32 %3493, i32* %3475, align 4
  %controls8.i.i6.i.i = load i8*, i8** %3491, align 8
  %3494 = getelementptr inbounds i8, i8* %controls8.i.i6.i.i, i64 24
  %3495 = bitcast i8* %3494 to i64*
  %3496 = load i64, i64* %3495, align 8
  %3497 = add nsw i64 %3496, 1
  store i64 %3497, i64* %3495, align 8
  %3498 = bitcast %Qubit** %3486 to i64*
  %arg1.i.i7.i.i = load i64, i64* %3498, align 8
  %3499 = getelementptr inbounds i8, i8* %controls8.i.i6.i.i, i64 8
  %3500 = bitcast i8* %3499 to i64*
  %3501 = load i64, i64* %3500, align 8
  %numControlPairs.i.i8.i.i = sdiv i64 %3501, 2
  %temps.i.i9.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i8.i.i)
  %3502 = bitcast %Array* %temps.i.i9.i.i to i8*
  %3503 = getelementptr inbounds i8, i8* %3502, i64 24
  %3504 = bitcast i8* %3503 to i64*
  %3505 = load i64, i64* %3504, align 8
  %3506 = add nsw i64 %3505, 1
  store i64 %3506, i64* %3504, align 8
  %.not.not9.i.i10.i.i = icmp sgt i64 %3501, 1
  br i1 %.not.not9.i.i10.i.i, label %body__1.lr.ph.i.i12.i.i, label %exit__1.i.i16.i.i

body__1.lr.ph.i.i12.i.i:                          ; preds = %__quantum__rt__array_update_reference_count.exit.i11.i.i
  %3507 = bitcast i8* %controls8.i.i6.i.i to i64*
  %3508 = bitcast %Array* %temps.i.i9.i.i to i64*
  %3509 = getelementptr inbounds i8, i8* %controls8.i.i6.i.i, i64 32
  %3510 = getelementptr inbounds i8, i8* %3502, i64 32
  br label %body__1.i.i15.i.i

body__1.i.i15.i.i:                                ; preds = %body__1.lr.ph.i.i12.i.i, %exit_quantum_grouping276
  %3511 = phi i64 [ 0, %body__1.lr.ph.i.i12.i.i ], [ %3528, %exit_quantum_grouping276 ]
  %3512 = shl nuw i64 %3511, 1
  %3513 = load i64, i64* %3507, align 8
  %3514 = mul nsw i64 %3513, %3512
  %3515 = getelementptr inbounds i8, i8* %3509, i64 %3514
  %3516 = bitcast i8* %3515 to %Qubit**
  %3517 = load %Qubit*, %Qubit** %3516, align 8
  %3518 = or i64 %3512, 1
  %3519 = mul nsw i64 %3518, %3513
  %3520 = getelementptr inbounds i8, i8* %3509, i64 %3519
  %3521 = bitcast i8* %3520 to %Qubit**
  %3522 = load %Qubit*, %Qubit** %3521, align 8
  %3523 = load i64, i64* %3508, align 8
  %3524 = mul nsw i64 %3523, %3511
  %3525 = getelementptr inbounds i8, i8* %3510, i64 %3524
  %3526 = bitcast i8* %3525 to %Qubit**
  %3527 = load %Qubit*, %Qubit** %3526, align 8
  %3528 = add nuw nsw i64 %3511, 1
  %3529 = icmp eq i64 %3528, %numControlPairs.i.i8.i.i
  br label %quantum275

quantum275:                                       ; preds = %body__1.i.i15.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %3527)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3527, %Qubit* %3517)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3517, %Qubit* %3522)
  tail call void @__quantum__qis__t__body(%Qubit* %3522)
  tail call void @__quantum__qis__t__adj(%Qubit* %3517)
  tail call void @__quantum__qis__t__body(%Qubit* %3527)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3527, %Qubit* %3517)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3517, %Qubit* %3522)
  tail call void @__quantum__qis__t__adj(%Qubit* %3522)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3527, %Qubit* %3522)
  tail call void @__quantum__qis__h__body(%Qubit* %3527)
  br label %readout274

readout274:                                       ; preds = %quantum275
  br label %post-classical273

post-classical273:                                ; preds = %readout274
  br label %exit_quantum_grouping276

exit_quantum_grouping276:                         ; preds = %post-classical273
  br i1 %3529, label %exit__1.i.i16.i.i, label %body__1.i.i15.i.i

exit__1.i.i16.i.i:                                ; preds = %exit_quantum_grouping276, %__quantum__rt__array_update_reference_count.exit.i11.i.i
  %3530 = and i64 %3501, 1
  %3531 = icmp eq i64 %3530, 0
  br i1 %3531, label %condTrue__1.i.i17.i.i, label %condFalse__1.i.i19.i.i

condTrue__1.i.i17.i.i:                            ; preds = %exit__1.i.i16.i.i
  %3532 = getelementptr inbounds i8, i8* %3502, i64 16
  %3533 = bitcast i8* %3532 to i64*
  %3534 = load i64, i64* %3533, align 8
  %3535 = add nsw i64 %3534, 1
  store i64 %3535, i64* %3533, align 8
  %3536 = icmp slt i64 %3534, 0
  br i1 %3536, label %3537, label %condContinue__1.i.i23.i.i

3537:                                             ; preds = %condTrue__1.i.i17.i.i
  tail call void @free(i8* nonnull %3502) #2
  br label %condContinue__1.i.i23.i.i

condFalse__1.i.i19.i.i:                           ; preds = %exit__1.i.i16.i.i
  %3538 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3539 = bitcast i8* %3538 to i64*
  %3540 = getelementptr inbounds i8, i8* %3538, i64 8
  %3541 = bitcast i8* %3540 to i64*
  %3542 = getelementptr inbounds i8, i8* %3538, i64 16
  %3543 = bitcast i8* %3542 to i64*
  %3544 = getelementptr inbounds i8, i8* %3538, i64 24
  %3545 = bitcast i8* %3544 to i64*
  store i64 8, i64* %3539, align 8
  store i64 1, i64* %3541, align 8
  store i64 1, i64* %3543, align 8
  store i64 0, i64* %3545, align 8
  %3546 = getelementptr inbounds i8, i8* %3538, i64 32
  %3547 = add i64 %3501, -1
  %3548 = bitcast i8* %controls8.i.i6.i.i to i64*
  %3549 = load i64, i64* %3548, align 8
  %3550 = mul nsw i64 %3549, %3547
  %3551 = getelementptr inbounds i8, i8* %controls8.i.i6.i.i, i64 %3550
  %3552 = getelementptr inbounds i8, i8* %3551, i64 32
  %3553 = bitcast i8* %3552 to i64*
  %3554 = load i64, i64* %3553, align 8
  %3555 = bitcast i8* %3546 to i64*
  store i64 %3554, i64* %3555, align 8
  %3556 = bitcast %Array* %temps.i.i9.i.i to i64*
  %3557 = load i64, i64* %3556, align 8
  %3558 = getelementptr inbounds i8, i8* %3502, i64 8
  %3559 = bitcast i8* %3558 to i64*
  %3560 = load i64, i64* %3559, align 8
  %3561 = load i64, i64* %3541, align 8
  %3562 = getelementptr inbounds i8, i8* %3502, i64 32
  %3563 = add nsw i64 %3561, %3560
  %sext.i.i.i18.i.i = shl i64 %3557, 32
  %3564 = ashr exact i64 %sext.i.i.i18.i.i, 32
  %3565 = mul nsw i64 %3563, %3564
  %3566 = add i64 %3565, 32
  %3567 = tail call i8* @malloc(i64 %3566) #5
  %3568 = bitcast i8* %3567 to i64*
  %3569 = getelementptr inbounds i8, i8* %3567, i64 8
  %3570 = bitcast i8* %3569 to i64*
  %3571 = getelementptr inbounds i8, i8* %3567, i64 16
  %3572 = bitcast i8* %3571 to i64*
  %3573 = getelementptr inbounds i8, i8* %3567, i64 24
  %3574 = bitcast i8* %3573 to i64*
  store i64 %3564, i64* %3568, align 8
  store i64 %3563, i64* %3570, align 8
  store i64 1, i64* %3572, align 8
  store i64 0, i64* %3574, align 8
  %3575 = getelementptr inbounds i8, i8* %3567, i64 32
  %3576 = mul nsw i64 %3560, %3557
  %3577 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3575, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3575, i8* nonnull align 1 %3562, i64 %3576, i1 false) #2
  %3578 = getelementptr inbounds i8, i8* %3575, i64 %3576
  %3579 = mul nsw i64 %3561, %3557
  %3580 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3578, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3578, i8* nonnull align 1 %3546, i64 %3579, i1 false) #2
  %3581 = bitcast i8* %3567 to %Array*
  %3582 = load i64, i64* %3572, align 8
  %3583 = add nsw i64 %3582, 1
  store i64 %3583, i64* %3572, align 8
  %3584 = icmp slt i64 %3582, 0
  br i1 %3584, label %3585, label %__quantum__rt__array_update_reference_count.exit2.i.i20.i.i

3585:                                             ; preds = %condFalse__1.i.i19.i.i
  tail call void @free(i8* nonnull %3567) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i20.i.i

__quantum__rt__array_update_reference_count.exit2.i.i20.i.i: ; preds = %3585, %condFalse__1.i.i19.i.i
  %3586 = load i64, i64* %3543, align 8
  %3587 = add nsw i64 %3586, -1
  store i64 %3587, i64* %3543, align 8
  %3588 = icmp slt i64 %3586, 2
  br i1 %3588, label %3589, label %__quantum__rt__array_update_reference_count.exit3.i.i21.i.i

3589:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i20.i.i
  tail call void @free(i8* nonnull %3538) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i21.i.i

__quantum__rt__array_update_reference_count.exit3.i.i21.i.i: ; preds = %3589, %__quantum__rt__array_update_reference_count.exit2.i.i20.i.i
  %3590 = load i64, i64* %3572, align 8
  %3591 = add nsw i64 %3590, -1
  store i64 %3591, i64* %3572, align 8
  %3592 = icmp slt i64 %3590, 2
  br i1 %3592, label %3593, label %condContinue__1.i.i23.i.i

3593:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i21.i.i
  tail call void @free(i8* nonnull %3567) #2
  br label %condContinue__1.i.i23.i.i

condContinue__1.i.i23.i.i:                        ; preds = %3593, %__quantum__rt__array_update_reference_count.exit3.i.i21.i.i, %3537, %condTrue__1.i.i17.i.i
  %__qsVar1__newControls__.i.i22.i.i = phi %Array* [ %temps.i.i9.i.i, %condTrue__1.i.i17.i.i ], [ %temps.i.i9.i.i, %3537 ], [ %3581, %__quantum__rt__array_update_reference_count.exit3.i.i21.i.i ], [ %3581, %3593 ]
  %3594 = bitcast %Array* %__qsVar1__newControls__.i.i22.i.i to i8*
  %3595 = getelementptr inbounds i8, i8* %3594, i64 24
  %3596 = bitcast i8* %3595 to i64*
  %3597 = load i64, i64* %3596, align 8
  %3598 = add nsw i64 %3597, 1
  store i64 %3598, i64* %3596, align 8
  %3599 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3600 = bitcast i8* %3599 to i64*
  %3601 = getelementptr inbounds i8, i8* %3599, i64 8
  %3602 = bitcast i8* %3601 to i64*
  %3603 = getelementptr inbounds i8, i8* %3599, i64 16
  %3604 = bitcast i8* %3603 to i64*
  store i64 16, i64* %3600, align 8
  store i64 1, i64* %3602, align 8
  store i64 0, i64* %3604, align 8
  %3605 = getelementptr inbounds i8, i8* %3599, i64 24
  %3606 = bitcast i8* %3605 to %Tuple*
  %3607 = bitcast %Tuple* %3606 to { %Array*, %Qubit* }*
  %3608 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3607, i64 0, i32 0
  %3609 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3607, i64 0, i32 1
  %3610 = getelementptr inbounds i8, i8* %3594, i64 16
  %3611 = bitcast i8* %3610 to i64*
  %3612 = load i64, i64* %3611, align 8
  %3613 = add nsw i64 %3612, 1
  store i64 %3613, i64* %3611, align 8
  %3614 = icmp slt i64 %3612, 0
  br i1 %3614, label %3615, label %__quantum__rt__array_update_reference_count.exit5.i.i24.i.i

3615:                                             ; preds = %condContinue__1.i.i23.i.i
  tail call void @free(i8* nonnull %3594) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i24.i.i

__quantum__rt__array_update_reference_count.exit5.i.i24.i.i: ; preds = %3615, %condContinue__1.i.i23.i.i
  store %Array* %__qsVar1__newControls__.i.i22.i.i, %Array** %3608, align 8
  %3616 = bitcast %Qubit** %3609 to i64*
  store i64 %arg1.i.i7.i.i, i64* %3616, align 8
  %3617 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %3468, align 8
  %3618 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %3617, i64 0, i64 0
  %3619 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %3618, align 8
  %3620 = load i8*, i8** %3471, align 8
  tail call void %3619(i8* %3620, i8* nonnull %3605, i8* null)
  br i1 %.not.not9.i.i10.i.i, label %body__2.lr.ph.i.i26.i.i, label %exit__2.i.i30.i.i

body__2.lr.ph.i.i26.i.i:                          ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i24.i.i
  %__qsVar0____qsVar0__numPair____11.i.i25.i.i = add nsw i64 %numControlPairs.i.i8.i.i, -1
  %3621 = bitcast i8* %controls8.i.i6.i.i to i64*
  %3622 = bitcast %Array* %temps.i.i9.i.i to i64*
  %3623 = getelementptr inbounds i8, i8* %controls8.i.i6.i.i, i64 32
  %3624 = getelementptr inbounds i8, i8* %3502, i64 32
  br label %body__2.i.i29.i.i

body__2.i.i29.i.i:                                ; preds = %body__2.lr.ph.i.i26.i.i, %exit_quantum_grouping280
  %3625 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i25.i.i, %body__2.lr.ph.i.i26.i.i ], [ %3642, %exit_quantum_grouping280 ]
  %3626 = shl nuw i64 %3625, 1
  %3627 = load i64, i64* %3621, align 8
  %3628 = mul nsw i64 %3627, %3626
  %3629 = getelementptr inbounds i8, i8* %3623, i64 %3628
  %3630 = bitcast i8* %3629 to %Qubit**
  %3631 = load %Qubit*, %Qubit** %3630, align 8
  %3632 = or i64 %3626, 1
  %3633 = mul nsw i64 %3632, %3627
  %3634 = getelementptr inbounds i8, i8* %3623, i64 %3633
  %3635 = bitcast i8* %3634 to %Qubit**
  %3636 = load %Qubit*, %Qubit** %3635, align 8
  %3637 = load i64, i64* %3622, align 8
  %3638 = mul nsw i64 %3637, %3625
  %3639 = getelementptr inbounds i8, i8* %3624, i64 %3638
  %3640 = bitcast i8* %3639 to %Qubit**
  %3641 = load %Qubit*, %Qubit** %3640, align 8
  %3642 = add i64 %3625, -1
  %3643 = icmp sgt i64 %3642, -1
  br label %quantum279

quantum279:                                       ; preds = %body__2.i.i29.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %3641)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3641, %Qubit* %3636)
  tail call void @__quantum__qis__t__body(%Qubit* %3636)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3631, %Qubit* %3636)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3641, %Qubit* %3631)
  tail call void @__quantum__qis__t__adj(%Qubit* %3641)
  tail call void @__quantum__qis__t__body(%Qubit* %3631)
  tail call void @__quantum__qis__t__adj(%Qubit* %3636)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3631, %Qubit* %3636)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3641, %Qubit* %3631)
  tail call void @__quantum__qis__h__body(%Qubit* %3641)
  br label %readout278

readout278:                                       ; preds = %quantum279
  br label %post-classical277

post-classical277:                                ; preds = %readout278
  br label %exit_quantum_grouping280

exit_quantum_grouping280:                         ; preds = %post-classical277
  br i1 %3643, label %body__2.i.i29.i.i, label %exit__2.i.i30.i.i

exit__2.i.i30.i.i:                                ; preds = %exit_quantum_grouping280, %__quantum__rt__array_update_reference_count.exit5.i.i24.i.i
  %3644 = load i64, i64* %3504, align 8
  %3645 = add nsw i64 %3644, -1
  store i64 %3645, i64* %3504, align 8
  %3646 = load i64, i64* %3596, align 8
  %3647 = add nsw i64 %3646, -1
  store i64 %3647, i64* %3596, align 8
  %3648 = load i64, i64* %3611, align 8
  %3649 = add nsw i64 %3648, -1
  store i64 %3649, i64* %3611, align 8
  %3650 = icmp slt i64 %3648, 2
  br i1 %3650, label %3651, label %__quantum__rt__array_update_reference_count.exit6.i.i32.i.i

3651:                                             ; preds = %exit__2.i.i30.i.i
  tail call void @free(i8* nonnull %3594) #2
  %.pre.i.i31.i.i = load i64, i64* %3611, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i32.i.i

__quantum__rt__array_update_reference_count.exit6.i.i32.i.i: ; preds = %3651, %exit__2.i.i30.i.i
  %3652 = phi i64 [ %3649, %exit__2.i.i30.i.i ], [ %.pre.i.i31.i.i, %3651 ]
  %3653 = add nsw i64 %3652, -1
  store i64 %3653, i64* %3611, align 8
  %3654 = icmp slt i64 %3652, 2
  br i1 %3654, label %3655, label %__quantum__rt__array_update_reference_count.exit7.i.i33.i.i

3655:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i32.i.i
  tail call void @free(i8* nonnull %3594) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i33.i.i

__quantum__rt__array_update_reference_count.exit7.i.i33.i.i: ; preds = %3655, %__quantum__rt__array_update_reference_count.exit6.i.i32.i.i
  %3656 = load i64, i64* %3602, align 8
  %3657 = add nsw i64 %3656, -1
  store i64 %3657, i64* %3602, align 8
  %3658 = icmp slt i64 %3656, 2
  br i1 %3658, label %3659, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i.i

3659:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i33.i.i
  tail call void @free(i8* nonnull %3599) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i.i: ; preds = %3659, %__quantum__rt__array_update_reference_count.exit7.i.i33.i.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i9.i.i)
  %3660 = load i32, i32* %3475, align 4
  %3661 = add nsw i32 %3660, -1
  store i32 %3661, i32* %3475, align 4
  %3662 = load i64, i64* %3495, align 8
  %3663 = add nsw i64 %3662, -1
  store i64 %3663, i64* %3495, align 8
  %3664 = load i32, i32* %3473, align 8
  %3665 = add nsw i32 %3664, -1
  store i32 %3665, i32* %3473, align 8
  %3666 = load i64, i64* %3423, align 8
  %3667 = add nsw i64 %3666, -1
  store i64 %3667, i64* %3423, align 8
  %3668 = icmp slt i64 %3666, 2
  br i1 %3668, label %3669, label %__quantum__rt__array_update_reference_count.exit1.i35.i.i

3669:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i.i
  tail call void @free(i8* nonnull %3418) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i35.i.i

__quantum__rt__array_update_reference_count.exit1.i35.i.i: ; preds = %3669, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i.i
  %3670 = load i64, i64* %3480, align 8
  %3671 = add nsw i64 %3670, -1
  store i64 %3671, i64* %3480, align 8
  %3672 = icmp slt i64 %3670, 2
  br i1 %3672, label %3673, label %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i

3673:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i35.i.i
  tail call void @free(i8* nonnull %3477) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i: ; preds = %3673, %__quantum__rt__array_update_reference_count.exit1.i35.i.i, %exit_quantum_grouping272, %exit_quantum_grouping268, %exit_quantum_grouping264
  %3674 = load i64, i64* %3425, align 8
  %3675 = add nsw i64 %3674, -1
  store i64 %3675, i64* %3425, align 8
  %3676 = load i64, i64* %3423, align 8
  %3677 = add nsw i64 %3676, -1
  store i64 %3677, i64* %3423, align 8
  %3678 = icmp slt i64 %3676, 2
  br i1 %3678, label %3679, label %ConstArrayReduction__Meas2__body.42.exit.i

3679:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i
  tail call void @free(i8* nonnull %3418) #2
  br label %ConstArrayReduction__Meas2__body.42.exit.i

ConstArrayReduction__Meas2__body.42.exit.i:       ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.44.exit.i.i, %3679
  %3680 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3681 = bitcast i8* %3680 to i64*
  %3682 = getelementptr inbounds i8, i8* %3680, i64 8
  %3683 = bitcast i8* %3682 to i64*
  %3684 = getelementptr inbounds i8, i8* %3680, i64 16
  %3685 = bitcast i8* %3684 to i64*
  %3686 = getelementptr inbounds i8, i8* %3680, i64 24
  %3687 = bitcast i8* %3686 to i64*
  store i64 8, i64* %3681, align 8
  store i64 1, i64* %3683, align 8
  store i64 1, i64* %3685, align 8
  store i64 0, i64* %3687, align 8
  %3688 = getelementptr inbounds i8, i8* %3680, i64 32
  %3689 = bitcast i8* %3688 to %Qubit**
  store %Qubit* inttoptr (i64 13 to %Qubit*), %Qubit** %3689, align 8
  %3690 = load i64, i64* %3687, align 8
  %3691 = add nsw i64 %3690, 1
  store i64 %3691, i64* %3687, align 8
  %3692 = load i64, i64* %3683, align 8
  br label %quantum451

quantum451:                                       ; preds = %ConstArrayReduction__Meas2__body.42.exit.i
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*), %Result* nonnull inttoptr (i64 12 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 12 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  br label %readout450

readout450:                                       ; preds = %quantum451
  %3693 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 12 to %Result*))
  br label %post-classical449

post-classical449:                                ; preds = %readout450
  br label %exit_quantum_grouping452

exit_quantum_grouping452:                         ; preds = %post-classical449
  switch i64 %3692, label %else__1.i.i390.i [
    i64 0, label %then0__1.i.i386.i
    i64 1, label %then1__1.i.i388.i
    i64 2, label %then2__1.i.i389.i
  ]

then0__1.i.i386.i:                                ; preds = %exit_quantum_grouping452
  br label %quantum283

quantum283:                                       ; preds = %then0__1.i.i386.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout282

readout282:                                       ; preds = %quantum283
  br label %post-classical281

post-classical281:                                ; preds = %readout282
  br label %exit_quantum_grouping284

exit_quantum_grouping284:                         ; preds = %post-classical281
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i

then1__1.i.i388.i:                                ; preds = %exit_quantum_grouping452
  %3694 = load %Qubit*, %Qubit** %3689, align 8
  br label %quantum287

quantum287:                                       ; preds = %then1__1.i.i388.i
  tail call void @__quantum__qis__cz__body(%Qubit* %3694, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  br label %readout286

readout286:                                       ; preds = %quantum287
  br label %post-classical285

post-classical285:                                ; preds = %readout286
  br label %exit_quantum_grouping288

exit_quantum_grouping288:                         ; preds = %post-classical285
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i

then2__1.i.i389.i:                                ; preds = %exit_quantum_grouping452
  %3695 = bitcast i8* %3680 to %Array*
  %3696 = bitcast %Array* %3695 to i64*
  %3697 = load %Qubit*, %Qubit** %3689, align 8
  %3698 = load i64, i64* %3696, align 8
  %3699 = getelementptr inbounds i8, i8* %3680, i64 %3698
  %3700 = getelementptr inbounds i8, i8* %3699, i64 32
  %3701 = bitcast i8* %3700 to %Qubit**
  %3702 = load %Qubit*, %Qubit** %3701, align 8
  %3703 = load %Qubit*, %Qubit** %3689, align 8
  %3704 = load %Qubit*, %Qubit** %3689, align 8
  %3705 = load i64, i64* %3696, align 8
  %3706 = getelementptr inbounds i8, i8* %3680, i64 %3705
  %3707 = getelementptr inbounds i8, i8* %3706, i64 32
  %3708 = bitcast i8* %3707 to %Qubit**
  %3709 = load %Qubit*, %Qubit** %3708, align 8
  %3710 = load i64, i64* %3696, align 8
  %3711 = getelementptr inbounds i8, i8* %3680, i64 %3710
  %3712 = getelementptr inbounds i8, i8* %3711, i64 32
  %3713 = bitcast i8* %3712 to %Qubit**
  %3714 = load %Qubit*, %Qubit** %3713, align 8
  %3715 = load %Qubit*, %Qubit** %3689, align 8
  %3716 = load %Qubit*, %Qubit** %3689, align 8
  %3717 = load i64, i64* %3696, align 8
  %3718 = getelementptr inbounds i8, i8* %3680, i64 %3717
  %3719 = getelementptr inbounds i8, i8* %3718, i64 32
  %3720 = bitcast i8* %3719 to %Qubit**
  %3721 = load %Qubit*, %Qubit** %3720, align 8
  %3722 = load %Qubit*, %Qubit** %3689, align 8
  %3723 = load %Qubit*, %Qubit** %3689, align 8
  %3724 = load i64, i64* %3696, align 8
  %3725 = getelementptr inbounds i8, i8* %3680, i64 %3724
  %3726 = getelementptr inbounds i8, i8* %3725, i64 32
  %3727 = bitcast i8* %3726 to %Qubit**
  %3728 = load %Qubit*, %Qubit** %3727, align 8
  %3729 = load %Qubit*, %Qubit** %3689, align 8
  br label %quantum291

quantum291:                                       ; preds = %then2__1.i.i389.i
  tail call void @__quantum__qis__t__adj(%Qubit* %3697)
  tail call void @__quantum__qis__t__adj(%Qubit* %3702)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %3703)
  tail call void @__quantum__qis__t__body(%Qubit* %3704)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3709, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %3714, %Qubit* %3715)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %3716)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3721, %Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Qubit* %3722)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %3723)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3728, %Qubit* %3729)
  br label %readout290

readout290:                                       ; preds = %quantum291
  br label %post-classical289

post-classical289:                                ; preds = %readout290
  br label %exit_quantum_grouping292

exit_quantum_grouping292:                         ; preds = %post-classical289
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i

else__1.i.i390.i:                                 ; preds = %exit_quantum_grouping452
  %3730 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %3731 = bitcast i8* %3730 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %3731, align 8
  %3732 = getelementptr inbounds i8, i8* %3730, i64 8
  %3733 = getelementptr inbounds i8, i8* %3730, i64 16
  %3734 = bitcast i8* %3733 to i8**
  %3735 = getelementptr inbounds i8, i8* %3730, i64 24
  %3736 = bitcast i8* %3735 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %3732, i8 0, i64 16, i1 false)
  store i32 1, i32* %3736, align 8
  %3737 = getelementptr inbounds i8, i8* %3730, i64 28
  %3738 = bitcast i8* %3737 to i32*
  store i32 0, i32* %3738, align 4
  %3739 = bitcast i8* %3730 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %3739)
  %3740 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3741 = bitcast i8* %3740 to i64*
  %3742 = getelementptr inbounds i8, i8* %3740, i64 8
  %3743 = bitcast i8* %3742 to i64*
  %3744 = getelementptr inbounds i8, i8* %3740, i64 16
  %3745 = bitcast i8* %3744 to i64*
  store i64 16, i64* %3741, align 8
  store i64 1, i64* %3743, align 8
  store i64 0, i64* %3745, align 8
  %3746 = getelementptr inbounds i8, i8* %3740, i64 24
  %3747 = bitcast i8* %3746 to %Tuple*
  %3748 = bitcast %Tuple* %3747 to { %Array*, %Qubit* }*
  %3749 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3748, i64 0, i32 1
  %3750 = load i64, i64* %3685, align 8
  %3751 = add nsw i64 %3750, 1
  store i64 %3751, i64* %3685, align 8
  %3752 = icmp slt i64 %3750, 0
  br i1 %3752, label %3753, label %__quantum__rt__array_update_reference_count.exit.i.i396.i

3753:                                             ; preds = %else__1.i.i390.i
  tail call void @free(i8* nonnull %3680) #2
  br label %__quantum__rt__array_update_reference_count.exit.i.i396.i

__quantum__rt__array_update_reference_count.exit.i.i396.i: ; preds = %3753, %else__1.i.i390.i
  %3754 = bitcast %Tuple* %3747 to i8**
  store i8* %3680, i8** %3754, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %3749, align 8
  %3755 = load i32, i32* %3738, align 4
  %3756 = add nsw i32 %3755, 1
  store i32 %3756, i32* %3738, align 4
  %controls8.i.i.i391.i = load i8*, i8** %3754, align 8
  %3757 = getelementptr inbounds i8, i8* %controls8.i.i.i391.i, i64 24
  %3758 = bitcast i8* %3757 to i64*
  %3759 = load i64, i64* %3758, align 8
  %3760 = add nsw i64 %3759, 1
  store i64 %3760, i64* %3758, align 8
  %3761 = bitcast %Qubit** %3749 to i64*
  %arg1.i.i.i392.i = load i64, i64* %3761, align 8
  %3762 = getelementptr inbounds i8, i8* %controls8.i.i.i391.i, i64 8
  %3763 = bitcast i8* %3762 to i64*
  %3764 = load i64, i64* %3763, align 8
  %numControlPairs.i.i.i393.i = sdiv i64 %3764, 2
  %temps.i.i.i394.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i393.i)
  %3765 = bitcast %Array* %temps.i.i.i394.i to i8*
  %3766 = getelementptr inbounds i8, i8* %3765, i64 24
  %3767 = bitcast i8* %3766 to i64*
  %3768 = load i64, i64* %3767, align 8
  %3769 = add nsw i64 %3768, 1
  store i64 %3769, i64* %3767, align 8
  %.not.not9.i.i.i395.i = icmp sgt i64 %3764, 1
  br i1 %.not.not9.i.i.i395.i, label %body__1.lr.ph.i.i.i397.i, label %exit__1.i.i.i401.i

body__1.lr.ph.i.i.i397.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit.i.i396.i
  %3770 = bitcast i8* %controls8.i.i.i391.i to i64*
  %3771 = bitcast %Array* %temps.i.i.i394.i to i64*
  %3772 = getelementptr inbounds i8, i8* %controls8.i.i.i391.i, i64 32
  %3773 = getelementptr inbounds i8, i8* %3765, i64 32
  br label %body__1.i.i.i400.i

body__1.i.i.i400.i:                               ; preds = %body__1.lr.ph.i.i.i397.i, %exit_quantum_grouping296
  %3774 = phi i64 [ 0, %body__1.lr.ph.i.i.i397.i ], [ %3791, %exit_quantum_grouping296 ]
  %3775 = shl nuw i64 %3774, 1
  %3776 = load i64, i64* %3770, align 8
  %3777 = mul nsw i64 %3776, %3775
  %3778 = getelementptr inbounds i8, i8* %3772, i64 %3777
  %3779 = bitcast i8* %3778 to %Qubit**
  %3780 = load %Qubit*, %Qubit** %3779, align 8
  %3781 = or i64 %3775, 1
  %3782 = mul nsw i64 %3781, %3776
  %3783 = getelementptr inbounds i8, i8* %3772, i64 %3782
  %3784 = bitcast i8* %3783 to %Qubit**
  %3785 = load %Qubit*, %Qubit** %3784, align 8
  %3786 = load i64, i64* %3771, align 8
  %3787 = mul nsw i64 %3786, %3774
  %3788 = getelementptr inbounds i8, i8* %3773, i64 %3787
  %3789 = bitcast i8* %3788 to %Qubit**
  %3790 = load %Qubit*, %Qubit** %3789, align 8
  %3791 = add nuw nsw i64 %3774, 1
  %3792 = icmp eq i64 %3791, %numControlPairs.i.i.i393.i
  br label %quantum295

quantum295:                                       ; preds = %body__1.i.i.i400.i
  tail call void @__quantum__qis__h__body(%Qubit* %3790)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3790, %Qubit* %3780)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3780, %Qubit* %3785)
  tail call void @__quantum__qis__t__body(%Qubit* %3785)
  tail call void @__quantum__qis__t__adj(%Qubit* %3780)
  tail call void @__quantum__qis__t__body(%Qubit* %3790)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3790, %Qubit* %3780)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3780, %Qubit* %3785)
  tail call void @__quantum__qis__t__adj(%Qubit* %3785)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3790, %Qubit* %3785)
  tail call void @__quantum__qis__h__body(%Qubit* %3790)
  br label %readout294

readout294:                                       ; preds = %quantum295
  br label %post-classical293

post-classical293:                                ; preds = %readout294
  br label %exit_quantum_grouping296

exit_quantum_grouping296:                         ; preds = %post-classical293
  br i1 %3792, label %exit__1.i.i.i401.i, label %body__1.i.i.i400.i

exit__1.i.i.i401.i:                               ; preds = %exit_quantum_grouping296, %__quantum__rt__array_update_reference_count.exit.i.i396.i
  %3793 = and i64 %3764, 1
  %3794 = icmp eq i64 %3793, 0
  br i1 %3794, label %condTrue__1.i.i.i402.i, label %condFalse__1.i.i.i404.i

condTrue__1.i.i.i402.i:                           ; preds = %exit__1.i.i.i401.i
  %3795 = getelementptr inbounds i8, i8* %3765, i64 16
  %3796 = bitcast i8* %3795 to i64*
  %3797 = load i64, i64* %3796, align 8
  %3798 = add nsw i64 %3797, 1
  store i64 %3798, i64* %3796, align 8
  %3799 = icmp slt i64 %3797, 0
  br i1 %3799, label %3800, label %condContinue__1.i.i.i408.i

3800:                                             ; preds = %condTrue__1.i.i.i402.i
  tail call void @free(i8* nonnull %3765) #2
  br label %condContinue__1.i.i.i408.i

condFalse__1.i.i.i404.i:                          ; preds = %exit__1.i.i.i401.i
  %3801 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3802 = bitcast i8* %3801 to i64*
  %3803 = getelementptr inbounds i8, i8* %3801, i64 8
  %3804 = bitcast i8* %3803 to i64*
  %3805 = getelementptr inbounds i8, i8* %3801, i64 16
  %3806 = bitcast i8* %3805 to i64*
  %3807 = getelementptr inbounds i8, i8* %3801, i64 24
  %3808 = bitcast i8* %3807 to i64*
  store i64 8, i64* %3802, align 8
  store i64 1, i64* %3804, align 8
  store i64 1, i64* %3806, align 8
  store i64 0, i64* %3808, align 8
  %3809 = getelementptr inbounds i8, i8* %3801, i64 32
  %3810 = add i64 %3764, -1
  %3811 = bitcast i8* %controls8.i.i.i391.i to i64*
  %3812 = load i64, i64* %3811, align 8
  %3813 = mul nsw i64 %3812, %3810
  %3814 = getelementptr inbounds i8, i8* %controls8.i.i.i391.i, i64 %3813
  %3815 = getelementptr inbounds i8, i8* %3814, i64 32
  %3816 = bitcast i8* %3815 to i64*
  %3817 = load i64, i64* %3816, align 8
  %3818 = bitcast i8* %3809 to i64*
  store i64 %3817, i64* %3818, align 8
  %3819 = bitcast %Array* %temps.i.i.i394.i to i64*
  %3820 = load i64, i64* %3819, align 8
  %3821 = getelementptr inbounds i8, i8* %3765, i64 8
  %3822 = bitcast i8* %3821 to i64*
  %3823 = load i64, i64* %3822, align 8
  %3824 = load i64, i64* %3804, align 8
  %3825 = getelementptr inbounds i8, i8* %3765, i64 32
  %3826 = add nsw i64 %3824, %3823
  %sext.i.i.i.i403.i = shl i64 %3820, 32
  %3827 = ashr exact i64 %sext.i.i.i.i403.i, 32
  %3828 = mul nsw i64 %3826, %3827
  %3829 = add i64 %3828, 32
  %3830 = tail call i8* @malloc(i64 %3829) #5
  %3831 = bitcast i8* %3830 to i64*
  %3832 = getelementptr inbounds i8, i8* %3830, i64 8
  %3833 = bitcast i8* %3832 to i64*
  %3834 = getelementptr inbounds i8, i8* %3830, i64 16
  %3835 = bitcast i8* %3834 to i64*
  %3836 = getelementptr inbounds i8, i8* %3830, i64 24
  %3837 = bitcast i8* %3836 to i64*
  store i64 %3827, i64* %3831, align 8
  store i64 %3826, i64* %3833, align 8
  store i64 1, i64* %3835, align 8
  store i64 0, i64* %3837, align 8
  %3838 = getelementptr inbounds i8, i8* %3830, i64 32
  %3839 = mul nsw i64 %3823, %3820
  %3840 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3838, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3838, i8* nonnull align 1 %3825, i64 %3839, i1 false) #2
  %3841 = getelementptr inbounds i8, i8* %3838, i64 %3839
  %3842 = mul nsw i64 %3824, %3820
  %3843 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %3841, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %3841, i8* nonnull align 1 %3809, i64 %3842, i1 false) #2
  %3844 = bitcast i8* %3830 to %Array*
  %3845 = load i64, i64* %3835, align 8
  %3846 = add nsw i64 %3845, 1
  store i64 %3846, i64* %3835, align 8
  %3847 = icmp slt i64 %3845, 0
  br i1 %3847, label %3848, label %__quantum__rt__array_update_reference_count.exit2.i.i.i405.i

3848:                                             ; preds = %condFalse__1.i.i.i404.i
  tail call void @free(i8* nonnull %3830) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i.i405.i

__quantum__rt__array_update_reference_count.exit2.i.i.i405.i: ; preds = %3848, %condFalse__1.i.i.i404.i
  %3849 = load i64, i64* %3806, align 8
  %3850 = add nsw i64 %3849, -1
  store i64 %3850, i64* %3806, align 8
  %3851 = icmp slt i64 %3849, 2
  br i1 %3851, label %3852, label %__quantum__rt__array_update_reference_count.exit3.i.i.i406.i

3852:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i.i405.i
  tail call void @free(i8* nonnull %3801) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i.i406.i

__quantum__rt__array_update_reference_count.exit3.i.i.i406.i: ; preds = %3852, %__quantum__rt__array_update_reference_count.exit2.i.i.i405.i
  %3853 = load i64, i64* %3835, align 8
  %3854 = add nsw i64 %3853, -1
  store i64 %3854, i64* %3835, align 8
  %3855 = icmp slt i64 %3853, 2
  br i1 %3855, label %3856, label %condContinue__1.i.i.i408.i

3856:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i.i406.i
  tail call void @free(i8* nonnull %3830) #2
  br label %condContinue__1.i.i.i408.i

condContinue__1.i.i.i408.i:                       ; preds = %3856, %__quantum__rt__array_update_reference_count.exit3.i.i.i406.i, %3800, %condTrue__1.i.i.i402.i
  %__qsVar1__newControls__.i.i.i407.i = phi %Array* [ %temps.i.i.i394.i, %condTrue__1.i.i.i402.i ], [ %temps.i.i.i394.i, %3800 ], [ %3844, %__quantum__rt__array_update_reference_count.exit3.i.i.i406.i ], [ %3844, %3856 ]
  %3857 = bitcast %Array* %__qsVar1__newControls__.i.i.i407.i to i8*
  %3858 = getelementptr inbounds i8, i8* %3857, i64 24
  %3859 = bitcast i8* %3858 to i64*
  %3860 = load i64, i64* %3859, align 8
  %3861 = add nsw i64 %3860, 1
  store i64 %3861, i64* %3859, align 8
  %3862 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3863 = bitcast i8* %3862 to i64*
  %3864 = getelementptr inbounds i8, i8* %3862, i64 8
  %3865 = bitcast i8* %3864 to i64*
  %3866 = getelementptr inbounds i8, i8* %3862, i64 16
  %3867 = bitcast i8* %3866 to i64*
  store i64 16, i64* %3863, align 8
  store i64 1, i64* %3865, align 8
  store i64 0, i64* %3867, align 8
  %3868 = getelementptr inbounds i8, i8* %3862, i64 24
  %3869 = bitcast i8* %3868 to %Tuple*
  %3870 = bitcast %Tuple* %3869 to { %Array*, %Qubit* }*
  %3871 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3870, i64 0, i32 0
  %3872 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %3870, i64 0, i32 1
  %3873 = getelementptr inbounds i8, i8* %3857, i64 16
  %3874 = bitcast i8* %3873 to i64*
  %3875 = load i64, i64* %3874, align 8
  %3876 = add nsw i64 %3875, 1
  store i64 %3876, i64* %3874, align 8
  %3877 = icmp slt i64 %3875, 0
  br i1 %3877, label %3878, label %__quantum__rt__array_update_reference_count.exit5.i.i.i409.i

3878:                                             ; preds = %condContinue__1.i.i.i408.i
  tail call void @free(i8* nonnull %3857) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i.i409.i

__quantum__rt__array_update_reference_count.exit5.i.i.i409.i: ; preds = %3878, %condContinue__1.i.i.i408.i
  store %Array* %__qsVar1__newControls__.i.i.i407.i, %Array** %3871, align 8
  %3879 = bitcast %Qubit** %3872 to i64*
  store i64 %arg1.i.i.i392.i, i64* %3879, align 8
  %3880 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %3731, align 8
  %3881 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %3880, i64 0, i64 0
  %3882 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %3881, align 8
  %3883 = load i8*, i8** %3734, align 8
  tail call void %3882(i8* %3883, i8* nonnull %3868, i8* null)
  br i1 %.not.not9.i.i.i395.i, label %body__2.lr.ph.i.i.i411.i, label %exit__2.i.i.i415.i

body__2.lr.ph.i.i.i411.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i.i409.i
  %__qsVar0____qsVar0__numPair____11.i.i.i410.i = add nsw i64 %numControlPairs.i.i.i393.i, -1
  %3884 = bitcast i8* %controls8.i.i.i391.i to i64*
  %3885 = bitcast %Array* %temps.i.i.i394.i to i64*
  %3886 = getelementptr inbounds i8, i8* %controls8.i.i.i391.i, i64 32
  %3887 = getelementptr inbounds i8, i8* %3765, i64 32
  br label %body__2.i.i.i414.i

body__2.i.i.i414.i:                               ; preds = %body__2.lr.ph.i.i.i411.i, %exit_quantum_grouping300
  %3888 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i.i410.i, %body__2.lr.ph.i.i.i411.i ], [ %3905, %exit_quantum_grouping300 ]
  %3889 = shl nuw i64 %3888, 1
  %3890 = load i64, i64* %3884, align 8
  %3891 = mul nsw i64 %3890, %3889
  %3892 = getelementptr inbounds i8, i8* %3886, i64 %3891
  %3893 = bitcast i8* %3892 to %Qubit**
  %3894 = load %Qubit*, %Qubit** %3893, align 8
  %3895 = or i64 %3889, 1
  %3896 = mul nsw i64 %3895, %3890
  %3897 = getelementptr inbounds i8, i8* %3886, i64 %3896
  %3898 = bitcast i8* %3897 to %Qubit**
  %3899 = load %Qubit*, %Qubit** %3898, align 8
  %3900 = load i64, i64* %3885, align 8
  %3901 = mul nsw i64 %3900, %3888
  %3902 = getelementptr inbounds i8, i8* %3887, i64 %3901
  %3903 = bitcast i8* %3902 to %Qubit**
  %3904 = load %Qubit*, %Qubit** %3903, align 8
  %3905 = add i64 %3888, -1
  %3906 = icmp sgt i64 %3905, -1
  br label %quantum299

quantum299:                                       ; preds = %body__2.i.i.i414.i
  tail call void @__quantum__qis__h__body(%Qubit* %3904)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3904, %Qubit* %3899)
  tail call void @__quantum__qis__t__body(%Qubit* %3899)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3894, %Qubit* %3899)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3904, %Qubit* %3894)
  tail call void @__quantum__qis__t__adj(%Qubit* %3904)
  tail call void @__quantum__qis__t__body(%Qubit* %3894)
  tail call void @__quantum__qis__t__adj(%Qubit* %3899)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3894, %Qubit* %3899)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3904, %Qubit* %3894)
  tail call void @__quantum__qis__h__body(%Qubit* %3904)
  br label %readout298

readout298:                                       ; preds = %quantum299
  br label %post-classical297

post-classical297:                                ; preds = %readout298
  br label %exit_quantum_grouping300

exit_quantum_grouping300:                         ; preds = %post-classical297
  br i1 %3906, label %body__2.i.i.i414.i, label %exit__2.i.i.i415.i

exit__2.i.i.i415.i:                               ; preds = %exit_quantum_grouping300, %__quantum__rt__array_update_reference_count.exit5.i.i.i409.i
  %3907 = load i64, i64* %3767, align 8
  %3908 = add nsw i64 %3907, -1
  store i64 %3908, i64* %3767, align 8
  %3909 = load i64, i64* %3859, align 8
  %3910 = add nsw i64 %3909, -1
  store i64 %3910, i64* %3859, align 8
  %3911 = load i64, i64* %3874, align 8
  %3912 = add nsw i64 %3911, -1
  store i64 %3912, i64* %3874, align 8
  %3913 = icmp slt i64 %3911, 2
  br i1 %3913, label %3914, label %__quantum__rt__array_update_reference_count.exit6.i.i.i417.i

3914:                                             ; preds = %exit__2.i.i.i415.i
  tail call void @free(i8* nonnull %3857) #2
  %.pre.i.i.i416.i = load i64, i64* %3874, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i.i417.i

__quantum__rt__array_update_reference_count.exit6.i.i.i417.i: ; preds = %3914, %exit__2.i.i.i415.i
  %3915 = phi i64 [ %3912, %exit__2.i.i.i415.i ], [ %.pre.i.i.i416.i, %3914 ]
  %3916 = add nsw i64 %3915, -1
  store i64 %3916, i64* %3874, align 8
  %3917 = icmp slt i64 %3915, 2
  br i1 %3917, label %3918, label %__quantum__rt__array_update_reference_count.exit7.i.i.i418.i

3918:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i.i417.i
  tail call void @free(i8* nonnull %3857) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i.i418.i

__quantum__rt__array_update_reference_count.exit7.i.i.i418.i: ; preds = %3918, %__quantum__rt__array_update_reference_count.exit6.i.i.i417.i
  %3919 = load i64, i64* %3865, align 8
  %3920 = add nsw i64 %3919, -1
  store i64 %3920, i64* %3865, align 8
  %3921 = icmp slt i64 %3919, 2
  br i1 %3921, label %3922, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i419.i

3922:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i.i418.i
  tail call void @free(i8* nonnull %3862) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i419.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i419.i: ; preds = %3922, %__quantum__rt__array_update_reference_count.exit7.i.i.i418.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i.i394.i)
  %3923 = load i32, i32* %3738, align 4
  %3924 = add nsw i32 %3923, -1
  store i32 %3924, i32* %3738, align 4
  %3925 = load i64, i64* %3758, align 8
  %3926 = add nsw i64 %3925, -1
  store i64 %3926, i64* %3758, align 8
  %3927 = load i32, i32* %3736, align 8
  %3928 = add nsw i32 %3927, -1
  store i32 %3928, i32* %3736, align 8
  %3929 = load i64, i64* %3685, align 8
  %3930 = add nsw i64 %3929, -1
  store i64 %3930, i64* %3685, align 8
  %3931 = icmp slt i64 %3929, 2
  br i1 %3931, label %3932, label %__quantum__rt__array_update_reference_count.exit1.i.i420.i

3932:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i419.i
  tail call void @free(i8* nonnull %3680) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i.i420.i

__quantum__rt__array_update_reference_count.exit1.i.i420.i: ; preds = %3932, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i419.i
  %3933 = load i64, i64* %3743, align 8
  %3934 = add nsw i64 %3933, -1
  store i64 %3934, i64* %3743, align 8
  %3935 = icmp slt i64 %3933, 2
  br i1 %3935, label %3936, label %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i

3936:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i.i420.i
  tail call void @free(i8* nonnull %3740) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i: ; preds = %3936, %__quantum__rt__array_update_reference_count.exit1.i.i420.i, %exit_quantum_grouping292, %exit_quantum_grouping288, %exit_quantum_grouping284
  %3937 = load i64, i64* %3687, align 8
  %3938 = add nsw i64 %3937, -1
  store i64 %3938, i64* %3687, align 8
  %3939 = load i64, i64* %3685, align 8
  %3940 = add nsw i64 %3939, -1
  store i64 %3940, i64* %3685, align 8
  %3941 = icmp slt i64 %3939, 2
  br i1 %3941, label %3942, label %Microsoft__Quantum__Canon__CZ__body.exit.i421.i

3942:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i
  tail call void @free(i8* nonnull %3680) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit.i421.i

Microsoft__Quantum__Canon__CZ__body.exit.i421.i:  ; preds = %3942, %Microsoft__Quantum__Intrinsic__Z__ctl.46.exit.i.i
  %3943 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %3944 = bitcast i8* %3943 to i64*
  %3945 = getelementptr inbounds i8, i8* %3943, i64 8
  %3946 = bitcast i8* %3945 to i64*
  %3947 = getelementptr inbounds i8, i8* %3943, i64 16
  %3948 = bitcast i8* %3947 to i64*
  %3949 = getelementptr inbounds i8, i8* %3943, i64 24
  %3950 = bitcast i8* %3949 to i64*
  store i64 8, i64* %3944, align 8
  store i64 1, i64* %3946, align 8
  store i64 1, i64* %3948, align 8
  store i64 0, i64* %3950, align 8
  %3951 = getelementptr inbounds i8, i8* %3943, i64 32
  %3952 = bitcast i8* %3951 to %Qubit**
  store %Qubit* inttoptr (i64 13 to %Qubit*), %Qubit** %3952, align 8
  %3953 = load i64, i64* %3950, align 8
  %3954 = add nsw i64 %3953, 1
  store i64 %3954, i64* %3950, align 8
  %3955 = load i64, i64* %3946, align 8
  switch i64 %3955, label %else__1.i5.i426.i [
    i64 0, label %then0__1.i1.i422.i
    i64 1, label %then1__1.i3.i424.i
    i64 2, label %then2__1.i4.i425.i
  ]

then0__1.i1.i422.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i421.i
  br label %quantum303

quantum303:                                       ; preds = %then0__1.i1.i422.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  br label %readout302

readout302:                                       ; preds = %quantum303
  br label %post-classical301

post-classical301:                                ; preds = %readout302
  br label %exit_quantum_grouping304

exit_quantum_grouping304:                         ; preds = %post-classical301
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i

then1__1.i3.i424.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i421.i
  %3956 = load %Qubit*, %Qubit** %3952, align 8
  br label %quantum307

quantum307:                                       ; preds = %then1__1.i3.i424.i
  tail call void @__quantum__qis__cz__body(%Qubit* %3956, %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  br label %readout306

readout306:                                       ; preds = %quantum307
  br label %post-classical305

post-classical305:                                ; preds = %readout306
  br label %exit_quantum_grouping308

exit_quantum_grouping308:                         ; preds = %post-classical305
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i

then2__1.i4.i425.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i421.i
  %3957 = bitcast i8* %3943 to %Array*
  %3958 = bitcast %Array* %3957 to i64*
  %3959 = load %Qubit*, %Qubit** %3952, align 8
  %3960 = load i64, i64* %3958, align 8
  %3961 = getelementptr inbounds i8, i8* %3943, i64 %3960
  %3962 = getelementptr inbounds i8, i8* %3961, i64 32
  %3963 = bitcast i8* %3962 to %Qubit**
  %3964 = load %Qubit*, %Qubit** %3963, align 8
  %3965 = load %Qubit*, %Qubit** %3952, align 8
  %3966 = load %Qubit*, %Qubit** %3952, align 8
  %3967 = load i64, i64* %3958, align 8
  %3968 = getelementptr inbounds i8, i8* %3943, i64 %3967
  %3969 = getelementptr inbounds i8, i8* %3968, i64 32
  %3970 = bitcast i8* %3969 to %Qubit**
  %3971 = load %Qubit*, %Qubit** %3970, align 8
  %3972 = load i64, i64* %3958, align 8
  %3973 = getelementptr inbounds i8, i8* %3943, i64 %3972
  %3974 = getelementptr inbounds i8, i8* %3973, i64 32
  %3975 = bitcast i8* %3974 to %Qubit**
  %3976 = load %Qubit*, %Qubit** %3975, align 8
  %3977 = load %Qubit*, %Qubit** %3952, align 8
  %3978 = load %Qubit*, %Qubit** %3952, align 8
  %3979 = load i64, i64* %3958, align 8
  %3980 = getelementptr inbounds i8, i8* %3943, i64 %3979
  %3981 = getelementptr inbounds i8, i8* %3980, i64 32
  %3982 = bitcast i8* %3981 to %Qubit**
  %3983 = load %Qubit*, %Qubit** %3982, align 8
  %3984 = load %Qubit*, %Qubit** %3952, align 8
  %3985 = load %Qubit*, %Qubit** %3952, align 8
  %3986 = load i64, i64* %3958, align 8
  %3987 = getelementptr inbounds i8, i8* %3943, i64 %3986
  %3988 = getelementptr inbounds i8, i8* %3987, i64 32
  %3989 = bitcast i8* %3988 to %Qubit**
  %3990 = load %Qubit*, %Qubit** %3989, align 8
  %3991 = load %Qubit*, %Qubit** %3952, align 8
  br label %quantum311

quantum311:                                       ; preds = %then2__1.i4.i425.i
  tail call void @__quantum__qis__t__adj(%Qubit* %3959)
  tail call void @__quantum__qis__t__adj(%Qubit* %3964)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*), %Qubit* %3965)
  tail call void @__quantum__qis__t__body(%Qubit* %3966)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3971, %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %3976, %Qubit* %3977)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %3978)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3983, %Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*), %Qubit* %3984)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %3985)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3990, %Qubit* %3991)
  br label %readout310

readout310:                                       ; preds = %quantum311
  br label %post-classical309

post-classical309:                                ; preds = %readout310
  br label %exit_quantum_grouping312

exit_quantum_grouping312:                         ; preds = %post-classical309
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i

else__1.i5.i426.i:                                ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i421.i
  %3992 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %3993 = bitcast i8* %3992 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %3993, align 8
  %3994 = getelementptr inbounds i8, i8* %3992, i64 8
  %3995 = getelementptr inbounds i8, i8* %3992, i64 16
  %3996 = bitcast i8* %3995 to i8**
  %3997 = getelementptr inbounds i8, i8* %3992, i64 24
  %3998 = bitcast i8* %3997 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %3994, i8 0, i64 16, i1 false)
  store i32 1, i32* %3998, align 8
  %3999 = getelementptr inbounds i8, i8* %3992, i64 28
  %4000 = bitcast i8* %3999 to i32*
  store i32 0, i32* %4000, align 4
  %4001 = bitcast i8* %3992 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %4001)
  %4002 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4003 = bitcast i8* %4002 to i64*
  %4004 = getelementptr inbounds i8, i8* %4002, i64 8
  %4005 = bitcast i8* %4004 to i64*
  %4006 = getelementptr inbounds i8, i8* %4002, i64 16
  %4007 = bitcast i8* %4006 to i64*
  store i64 16, i64* %4003, align 8
  store i64 1, i64* %4005, align 8
  store i64 0, i64* %4007, align 8
  %4008 = getelementptr inbounds i8, i8* %4002, i64 24
  %4009 = bitcast i8* %4008 to %Tuple*
  %4010 = bitcast %Tuple* %4009 to { %Array*, %Qubit* }*
  %4011 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4010, i64 0, i32 1
  %4012 = load i64, i64* %3948, align 8
  %4013 = add nsw i64 %4012, 1
  store i64 %4013, i64* %3948, align 8
  %4014 = icmp slt i64 %4012, 0
  br i1 %4014, label %4015, label %__quantum__rt__array_update_reference_count.exit.i11.i432.i

4015:                                             ; preds = %else__1.i5.i426.i
  tail call void @free(i8* nonnull %3943) #2
  br label %__quantum__rt__array_update_reference_count.exit.i11.i432.i

__quantum__rt__array_update_reference_count.exit.i11.i432.i: ; preds = %4015, %else__1.i5.i426.i
  %4016 = bitcast %Tuple* %4009 to i8**
  store i8* %3943, i8** %4016, align 8
  store %Qubit* inttoptr (i64 7 to %Qubit*), %Qubit** %4011, align 8
  %4017 = load i32, i32* %4000, align 4
  %4018 = add nsw i32 %4017, 1
  store i32 %4018, i32* %4000, align 4
  %controls8.i.i6.i427.i = load i8*, i8** %4016, align 8
  %4019 = getelementptr inbounds i8, i8* %controls8.i.i6.i427.i, i64 24
  %4020 = bitcast i8* %4019 to i64*
  %4021 = load i64, i64* %4020, align 8
  %4022 = add nsw i64 %4021, 1
  store i64 %4022, i64* %4020, align 8
  %4023 = bitcast %Qubit** %4011 to i64*
  %arg1.i.i7.i428.i = load i64, i64* %4023, align 8
  %4024 = getelementptr inbounds i8, i8* %controls8.i.i6.i427.i, i64 8
  %4025 = bitcast i8* %4024 to i64*
  %4026 = load i64, i64* %4025, align 8
  %numControlPairs.i.i8.i429.i = sdiv i64 %4026, 2
  %temps.i.i9.i430.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i8.i429.i)
  %4027 = bitcast %Array* %temps.i.i9.i430.i to i8*
  %4028 = getelementptr inbounds i8, i8* %4027, i64 24
  %4029 = bitcast i8* %4028 to i64*
  %4030 = load i64, i64* %4029, align 8
  %4031 = add nsw i64 %4030, 1
  store i64 %4031, i64* %4029, align 8
  %.not.not9.i.i10.i431.i = icmp sgt i64 %4026, 1
  br i1 %.not.not9.i.i10.i431.i, label %body__1.lr.ph.i.i12.i433.i, label %exit__1.i.i16.i437.i

body__1.lr.ph.i.i12.i433.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit.i11.i432.i
  %4032 = bitcast i8* %controls8.i.i6.i427.i to i64*
  %4033 = bitcast %Array* %temps.i.i9.i430.i to i64*
  %4034 = getelementptr inbounds i8, i8* %controls8.i.i6.i427.i, i64 32
  %4035 = getelementptr inbounds i8, i8* %4027, i64 32
  br label %body__1.i.i15.i436.i

body__1.i.i15.i436.i:                             ; preds = %body__1.lr.ph.i.i12.i433.i, %exit_quantum_grouping316
  %4036 = phi i64 [ 0, %body__1.lr.ph.i.i12.i433.i ], [ %4053, %exit_quantum_grouping316 ]
  %4037 = shl nuw i64 %4036, 1
  %4038 = load i64, i64* %4032, align 8
  %4039 = mul nsw i64 %4038, %4037
  %4040 = getelementptr inbounds i8, i8* %4034, i64 %4039
  %4041 = bitcast i8* %4040 to %Qubit**
  %4042 = load %Qubit*, %Qubit** %4041, align 8
  %4043 = or i64 %4037, 1
  %4044 = mul nsw i64 %4043, %4038
  %4045 = getelementptr inbounds i8, i8* %4034, i64 %4044
  %4046 = bitcast i8* %4045 to %Qubit**
  %4047 = load %Qubit*, %Qubit** %4046, align 8
  %4048 = load i64, i64* %4033, align 8
  %4049 = mul nsw i64 %4048, %4036
  %4050 = getelementptr inbounds i8, i8* %4035, i64 %4049
  %4051 = bitcast i8* %4050 to %Qubit**
  %4052 = load %Qubit*, %Qubit** %4051, align 8
  %4053 = add nuw nsw i64 %4036, 1
  %4054 = icmp eq i64 %4053, %numControlPairs.i.i8.i429.i
  br label %quantum315

quantum315:                                       ; preds = %body__1.i.i15.i436.i
  tail call void @__quantum__qis__h__body(%Qubit* %4052)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4052, %Qubit* %4042)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4042, %Qubit* %4047)
  tail call void @__quantum__qis__t__body(%Qubit* %4047)
  tail call void @__quantum__qis__t__adj(%Qubit* %4042)
  tail call void @__quantum__qis__t__body(%Qubit* %4052)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4052, %Qubit* %4042)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4042, %Qubit* %4047)
  tail call void @__quantum__qis__t__adj(%Qubit* %4047)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4052, %Qubit* %4047)
  tail call void @__quantum__qis__h__body(%Qubit* %4052)
  br label %readout314

readout314:                                       ; preds = %quantum315
  br label %post-classical313

post-classical313:                                ; preds = %readout314
  br label %exit_quantum_grouping316

exit_quantum_grouping316:                         ; preds = %post-classical313
  br i1 %4054, label %exit__1.i.i16.i437.i, label %body__1.i.i15.i436.i

exit__1.i.i16.i437.i:                             ; preds = %exit_quantum_grouping316, %__quantum__rt__array_update_reference_count.exit.i11.i432.i
  %4055 = and i64 %4026, 1
  %4056 = icmp eq i64 %4055, 0
  br i1 %4056, label %condTrue__1.i.i17.i438.i, label %condFalse__1.i.i19.i440.i

condTrue__1.i.i17.i438.i:                         ; preds = %exit__1.i.i16.i437.i
  %4057 = getelementptr inbounds i8, i8* %4027, i64 16
  %4058 = bitcast i8* %4057 to i64*
  %4059 = load i64, i64* %4058, align 8
  %4060 = add nsw i64 %4059, 1
  store i64 %4060, i64* %4058, align 8
  %4061 = icmp slt i64 %4059, 0
  br i1 %4061, label %4062, label %condContinue__1.i.i23.i444.i

4062:                                             ; preds = %condTrue__1.i.i17.i438.i
  tail call void @free(i8* nonnull %4027) #2
  br label %condContinue__1.i.i23.i444.i

condFalse__1.i.i19.i440.i:                        ; preds = %exit__1.i.i16.i437.i
  %4063 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4064 = bitcast i8* %4063 to i64*
  %4065 = getelementptr inbounds i8, i8* %4063, i64 8
  %4066 = bitcast i8* %4065 to i64*
  %4067 = getelementptr inbounds i8, i8* %4063, i64 16
  %4068 = bitcast i8* %4067 to i64*
  %4069 = getelementptr inbounds i8, i8* %4063, i64 24
  %4070 = bitcast i8* %4069 to i64*
  store i64 8, i64* %4064, align 8
  store i64 1, i64* %4066, align 8
  store i64 1, i64* %4068, align 8
  store i64 0, i64* %4070, align 8
  %4071 = getelementptr inbounds i8, i8* %4063, i64 32
  %4072 = add i64 %4026, -1
  %4073 = bitcast i8* %controls8.i.i6.i427.i to i64*
  %4074 = load i64, i64* %4073, align 8
  %4075 = mul nsw i64 %4074, %4072
  %4076 = getelementptr inbounds i8, i8* %controls8.i.i6.i427.i, i64 %4075
  %4077 = getelementptr inbounds i8, i8* %4076, i64 32
  %4078 = bitcast i8* %4077 to i64*
  %4079 = load i64, i64* %4078, align 8
  %4080 = bitcast i8* %4071 to i64*
  store i64 %4079, i64* %4080, align 8
  %4081 = bitcast %Array* %temps.i.i9.i430.i to i64*
  %4082 = load i64, i64* %4081, align 8
  %4083 = getelementptr inbounds i8, i8* %4027, i64 8
  %4084 = bitcast i8* %4083 to i64*
  %4085 = load i64, i64* %4084, align 8
  %4086 = load i64, i64* %4066, align 8
  %4087 = getelementptr inbounds i8, i8* %4027, i64 32
  %4088 = add nsw i64 %4086, %4085
  %sext.i.i.i18.i439.i = shl i64 %4082, 32
  %4089 = ashr exact i64 %sext.i.i.i18.i439.i, 32
  %4090 = mul nsw i64 %4088, %4089
  %4091 = add i64 %4090, 32
  %4092 = tail call i8* @malloc(i64 %4091) #5
  %4093 = bitcast i8* %4092 to i64*
  %4094 = getelementptr inbounds i8, i8* %4092, i64 8
  %4095 = bitcast i8* %4094 to i64*
  %4096 = getelementptr inbounds i8, i8* %4092, i64 16
  %4097 = bitcast i8* %4096 to i64*
  %4098 = getelementptr inbounds i8, i8* %4092, i64 24
  %4099 = bitcast i8* %4098 to i64*
  store i64 %4089, i64* %4093, align 8
  store i64 %4088, i64* %4095, align 8
  store i64 1, i64* %4097, align 8
  store i64 0, i64* %4099, align 8
  %4100 = getelementptr inbounds i8, i8* %4092, i64 32
  %4101 = mul nsw i64 %4085, %4082
  %4102 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4100, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4100, i8* nonnull align 1 %4087, i64 %4101, i1 false) #2
  %4103 = getelementptr inbounds i8, i8* %4100, i64 %4101
  %4104 = mul nsw i64 %4086, %4082
  %4105 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4103, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4103, i8* nonnull align 1 %4071, i64 %4104, i1 false) #2
  %4106 = bitcast i8* %4092 to %Array*
  %4107 = load i64, i64* %4097, align 8
  %4108 = add nsw i64 %4107, 1
  store i64 %4108, i64* %4097, align 8
  %4109 = icmp slt i64 %4107, 0
  br i1 %4109, label %4110, label %__quantum__rt__array_update_reference_count.exit2.i.i20.i441.i

4110:                                             ; preds = %condFalse__1.i.i19.i440.i
  tail call void @free(i8* nonnull %4092) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i20.i441.i

__quantum__rt__array_update_reference_count.exit2.i.i20.i441.i: ; preds = %4110, %condFalse__1.i.i19.i440.i
  %4111 = load i64, i64* %4068, align 8
  %4112 = add nsw i64 %4111, -1
  store i64 %4112, i64* %4068, align 8
  %4113 = icmp slt i64 %4111, 2
  br i1 %4113, label %4114, label %__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i

4114:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i20.i441.i
  tail call void @free(i8* nonnull %4063) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i

__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i: ; preds = %4114, %__quantum__rt__array_update_reference_count.exit2.i.i20.i441.i
  %4115 = load i64, i64* %4097, align 8
  %4116 = add nsw i64 %4115, -1
  store i64 %4116, i64* %4097, align 8
  %4117 = icmp slt i64 %4115, 2
  br i1 %4117, label %4118, label %condContinue__1.i.i23.i444.i

4118:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i
  tail call void @free(i8* nonnull %4092) #2
  br label %condContinue__1.i.i23.i444.i

condContinue__1.i.i23.i444.i:                     ; preds = %4118, %__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i, %4062, %condTrue__1.i.i17.i438.i
  %__qsVar1__newControls__.i.i22.i443.i = phi %Array* [ %temps.i.i9.i430.i, %condTrue__1.i.i17.i438.i ], [ %temps.i.i9.i430.i, %4062 ], [ %4106, %__quantum__rt__array_update_reference_count.exit3.i.i21.i442.i ], [ %4106, %4118 ]
  %4119 = bitcast %Array* %__qsVar1__newControls__.i.i22.i443.i to i8*
  %4120 = getelementptr inbounds i8, i8* %4119, i64 24
  %4121 = bitcast i8* %4120 to i64*
  %4122 = load i64, i64* %4121, align 8
  %4123 = add nsw i64 %4122, 1
  store i64 %4123, i64* %4121, align 8
  %4124 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4125 = bitcast i8* %4124 to i64*
  %4126 = getelementptr inbounds i8, i8* %4124, i64 8
  %4127 = bitcast i8* %4126 to i64*
  %4128 = getelementptr inbounds i8, i8* %4124, i64 16
  %4129 = bitcast i8* %4128 to i64*
  store i64 16, i64* %4125, align 8
  store i64 1, i64* %4127, align 8
  store i64 0, i64* %4129, align 8
  %4130 = getelementptr inbounds i8, i8* %4124, i64 24
  %4131 = bitcast i8* %4130 to %Tuple*
  %4132 = bitcast %Tuple* %4131 to { %Array*, %Qubit* }*
  %4133 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4132, i64 0, i32 0
  %4134 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4132, i64 0, i32 1
  %4135 = getelementptr inbounds i8, i8* %4119, i64 16
  %4136 = bitcast i8* %4135 to i64*
  %4137 = load i64, i64* %4136, align 8
  %4138 = add nsw i64 %4137, 1
  store i64 %4138, i64* %4136, align 8
  %4139 = icmp slt i64 %4137, 0
  br i1 %4139, label %4140, label %__quantum__rt__array_update_reference_count.exit5.i.i24.i445.i

4140:                                             ; preds = %condContinue__1.i.i23.i444.i
  tail call void @free(i8* nonnull %4119) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i24.i445.i

__quantum__rt__array_update_reference_count.exit5.i.i24.i445.i: ; preds = %4140, %condContinue__1.i.i23.i444.i
  store %Array* %__qsVar1__newControls__.i.i22.i443.i, %Array** %4133, align 8
  %4141 = bitcast %Qubit** %4134 to i64*
  store i64 %arg1.i.i7.i428.i, i64* %4141, align 8
  %4142 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %3993, align 8
  %4143 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %4142, i64 0, i64 0
  %4144 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %4143, align 8
  %4145 = load i8*, i8** %3996, align 8
  tail call void %4144(i8* %4145, i8* nonnull %4130, i8* null)
  br i1 %.not.not9.i.i10.i431.i, label %body__2.lr.ph.i.i26.i447.i, label %exit__2.i.i30.i451.i

body__2.lr.ph.i.i26.i447.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i24.i445.i
  %__qsVar0____qsVar0__numPair____11.i.i25.i446.i = add nsw i64 %numControlPairs.i.i8.i429.i, -1
  %4146 = bitcast i8* %controls8.i.i6.i427.i to i64*
  %4147 = bitcast %Array* %temps.i.i9.i430.i to i64*
  %4148 = getelementptr inbounds i8, i8* %controls8.i.i6.i427.i, i64 32
  %4149 = getelementptr inbounds i8, i8* %4027, i64 32
  br label %body__2.i.i29.i450.i

body__2.i.i29.i450.i:                             ; preds = %body__2.lr.ph.i.i26.i447.i, %exit_quantum_grouping320
  %4150 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i25.i446.i, %body__2.lr.ph.i.i26.i447.i ], [ %4167, %exit_quantum_grouping320 ]
  %4151 = shl nuw i64 %4150, 1
  %4152 = load i64, i64* %4146, align 8
  %4153 = mul nsw i64 %4152, %4151
  %4154 = getelementptr inbounds i8, i8* %4148, i64 %4153
  %4155 = bitcast i8* %4154 to %Qubit**
  %4156 = load %Qubit*, %Qubit** %4155, align 8
  %4157 = or i64 %4151, 1
  %4158 = mul nsw i64 %4157, %4152
  %4159 = getelementptr inbounds i8, i8* %4148, i64 %4158
  %4160 = bitcast i8* %4159 to %Qubit**
  %4161 = load %Qubit*, %Qubit** %4160, align 8
  %4162 = load i64, i64* %4147, align 8
  %4163 = mul nsw i64 %4162, %4150
  %4164 = getelementptr inbounds i8, i8* %4149, i64 %4163
  %4165 = bitcast i8* %4164 to %Qubit**
  %4166 = load %Qubit*, %Qubit** %4165, align 8
  %4167 = add i64 %4150, -1
  %4168 = icmp sgt i64 %4167, -1
  br label %quantum319

quantum319:                                       ; preds = %body__2.i.i29.i450.i
  tail call void @__quantum__qis__h__body(%Qubit* %4166)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4166, %Qubit* %4161)
  tail call void @__quantum__qis__t__body(%Qubit* %4161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4156, %Qubit* %4161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4166, %Qubit* %4156)
  tail call void @__quantum__qis__t__adj(%Qubit* %4166)
  tail call void @__quantum__qis__t__body(%Qubit* %4156)
  tail call void @__quantum__qis__t__adj(%Qubit* %4161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4156, %Qubit* %4161)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4166, %Qubit* %4156)
  tail call void @__quantum__qis__h__body(%Qubit* %4166)
  br label %readout318

readout318:                                       ; preds = %quantum319
  br label %post-classical317

post-classical317:                                ; preds = %readout318
  br label %exit_quantum_grouping320

exit_quantum_grouping320:                         ; preds = %post-classical317
  br i1 %4168, label %body__2.i.i29.i450.i, label %exit__2.i.i30.i451.i

exit__2.i.i30.i451.i:                             ; preds = %exit_quantum_grouping320, %__quantum__rt__array_update_reference_count.exit5.i.i24.i445.i
  %4169 = load i64, i64* %4029, align 8
  %4170 = add nsw i64 %4169, -1
  store i64 %4170, i64* %4029, align 8
  %4171 = load i64, i64* %4121, align 8
  %4172 = add nsw i64 %4171, -1
  store i64 %4172, i64* %4121, align 8
  %4173 = load i64, i64* %4136, align 8
  %4174 = add nsw i64 %4173, -1
  store i64 %4174, i64* %4136, align 8
  %4175 = icmp slt i64 %4173, 2
  br i1 %4175, label %4176, label %__quantum__rt__array_update_reference_count.exit6.i.i32.i453.i

4176:                                             ; preds = %exit__2.i.i30.i451.i
  tail call void @free(i8* nonnull %4119) #2
  %.pre.i.i31.i452.i = load i64, i64* %4136, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i32.i453.i

__quantum__rt__array_update_reference_count.exit6.i.i32.i453.i: ; preds = %4176, %exit__2.i.i30.i451.i
  %4177 = phi i64 [ %4174, %exit__2.i.i30.i451.i ], [ %.pre.i.i31.i452.i, %4176 ]
  %4178 = add nsw i64 %4177, -1
  store i64 %4178, i64* %4136, align 8
  %4179 = icmp slt i64 %4177, 2
  br i1 %4179, label %4180, label %__quantum__rt__array_update_reference_count.exit7.i.i33.i454.i

4180:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i32.i453.i
  tail call void @free(i8* nonnull %4119) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i33.i454.i

__quantum__rt__array_update_reference_count.exit7.i.i33.i454.i: ; preds = %4180, %__quantum__rt__array_update_reference_count.exit6.i.i32.i453.i
  %4181 = load i64, i64* %4127, align 8
  %4182 = add nsw i64 %4181, -1
  store i64 %4182, i64* %4127, align 8
  %4183 = icmp slt i64 %4181, 2
  br i1 %4183, label %4184, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i455.i

4184:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i33.i454.i
  tail call void @free(i8* nonnull %4124) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i455.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i455.i: ; preds = %4184, %__quantum__rt__array_update_reference_count.exit7.i.i33.i454.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i9.i430.i)
  %4185 = load i32, i32* %4000, align 4
  %4186 = add nsw i32 %4185, -1
  store i32 %4186, i32* %4000, align 4
  %4187 = load i64, i64* %4020, align 8
  %4188 = add nsw i64 %4187, -1
  store i64 %4188, i64* %4020, align 8
  %4189 = load i32, i32* %3998, align 8
  %4190 = add nsw i32 %4189, -1
  store i32 %4190, i32* %3998, align 8
  %4191 = load i64, i64* %3948, align 8
  %4192 = add nsw i64 %4191, -1
  store i64 %4192, i64* %3948, align 8
  %4193 = icmp slt i64 %4191, 2
  br i1 %4193, label %4194, label %__quantum__rt__array_update_reference_count.exit1.i35.i456.i

4194:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i455.i
  tail call void @free(i8* nonnull %3943) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i35.i456.i

__quantum__rt__array_update_reference_count.exit1.i35.i456.i: ; preds = %4194, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i455.i
  %4195 = load i64, i64* %4005, align 8
  %4196 = add nsw i64 %4195, -1
  store i64 %4196, i64* %4005, align 8
  %4197 = icmp slt i64 %4195, 2
  br i1 %4197, label %4198, label %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i

4198:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i35.i456.i
  tail call void @free(i8* nonnull %4002) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i: ; preds = %4198, %__quantum__rt__array_update_reference_count.exit1.i35.i456.i, %exit_quantum_grouping312, %exit_quantum_grouping308, %exit_quantum_grouping304
  %4199 = load i64, i64* %3950, align 8
  %4200 = add nsw i64 %4199, -1
  store i64 %4200, i64* %3950, align 8
  %4201 = load i64, i64* %3948, align 8
  %4202 = add nsw i64 %4201, -1
  store i64 %4202, i64* %3948, align 8
  %4203 = icmp slt i64 %4201, 2
  br i1 %4203, label %4204, label %ConstArrayReduction__Meas2__body.45.exit.i

4204:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i
  tail call void @free(i8* nonnull %3943) #2
  br label %ConstArrayReduction__Meas2__body.45.exit.i

ConstArrayReduction__Meas2__body.45.exit.i:       ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.47.exit.i.i, %4204
  %4205 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4206 = bitcast i8* %4205 to i64*
  %4207 = getelementptr inbounds i8, i8* %4205, i64 8
  %4208 = bitcast i8* %4207 to i64*
  %4209 = getelementptr inbounds i8, i8* %4205, i64 16
  %4210 = bitcast i8* %4209 to i64*
  %4211 = getelementptr inbounds i8, i8* %4205, i64 24
  %4212 = bitcast i8* %4211 to i64*
  store i64 8, i64* %4206, align 8
  store i64 1, i64* %4208, align 8
  store i64 1, i64* %4210, align 8
  store i64 0, i64* %4212, align 8
  %4213 = getelementptr inbounds i8, i8* %4205, i64 32
  %4214 = bitcast i8* %4213 to %Qubit**
  store %Qubit* inttoptr (i64 14 to %Qubit*), %Qubit** %4214, align 8
  %4215 = load i64, i64* %4212, align 8
  %4216 = add nsw i64 %4215, 1
  store i64 %4216, i64* %4212, align 8
  %4217 = load i64, i64* %4208, align 8
  br label %quantum455

quantum455:                                       ; preds = %ConstArrayReduction__Meas2__body.45.exit.i
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*), %Result* nonnull inttoptr (i64 13 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 13 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  br label %readout454

readout454:                                       ; preds = %quantum455
  %4218 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 13 to %Result*))
  br label %post-classical453

post-classical453:                                ; preds = %readout454
  br label %exit_quantum_grouping456

exit_quantum_grouping456:                         ; preds = %post-classical453
  switch i64 %4217, label %else__1.i.i461.i [
    i64 0, label %then0__1.i.i457.i
    i64 1, label %then1__1.i.i459.i
    i64 2, label %then2__1.i.i460.i
  ]

then0__1.i.i457.i:                                ; preds = %exit_quantum_grouping456
  br label %quantum323

quantum323:                                       ; preds = %then0__1.i.i457.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  br label %readout322

readout322:                                       ; preds = %quantum323
  br label %post-classical321

post-classical321:                                ; preds = %readout322
  br label %exit_quantum_grouping324

exit_quantum_grouping324:                         ; preds = %post-classical321
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i

then1__1.i.i459.i:                                ; preds = %exit_quantum_grouping456
  %4219 = load %Qubit*, %Qubit** %4214, align 8
  br label %quantum327

quantum327:                                       ; preds = %then1__1.i.i459.i
  tail call void @__quantum__qis__cz__body(%Qubit* %4219, %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  br label %readout326

readout326:                                       ; preds = %quantum327
  br label %post-classical325

post-classical325:                                ; preds = %readout326
  br label %exit_quantum_grouping328

exit_quantum_grouping328:                         ; preds = %post-classical325
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i

then2__1.i.i460.i:                                ; preds = %exit_quantum_grouping456
  %4220 = bitcast i8* %4205 to %Array*
  %4221 = bitcast %Array* %4220 to i64*
  %4222 = load %Qubit*, %Qubit** %4214, align 8
  %4223 = load i64, i64* %4221, align 8
  %4224 = getelementptr inbounds i8, i8* %4205, i64 %4223
  %4225 = getelementptr inbounds i8, i8* %4224, i64 32
  %4226 = bitcast i8* %4225 to %Qubit**
  %4227 = load %Qubit*, %Qubit** %4226, align 8
  %4228 = load %Qubit*, %Qubit** %4214, align 8
  %4229 = load %Qubit*, %Qubit** %4214, align 8
  %4230 = load i64, i64* %4221, align 8
  %4231 = getelementptr inbounds i8, i8* %4205, i64 %4230
  %4232 = getelementptr inbounds i8, i8* %4231, i64 32
  %4233 = bitcast i8* %4232 to %Qubit**
  %4234 = load %Qubit*, %Qubit** %4233, align 8
  %4235 = load i64, i64* %4221, align 8
  %4236 = getelementptr inbounds i8, i8* %4205, i64 %4235
  %4237 = getelementptr inbounds i8, i8* %4236, i64 32
  %4238 = bitcast i8* %4237 to %Qubit**
  %4239 = load %Qubit*, %Qubit** %4238, align 8
  %4240 = load %Qubit*, %Qubit** %4214, align 8
  %4241 = load %Qubit*, %Qubit** %4214, align 8
  %4242 = load i64, i64* %4221, align 8
  %4243 = getelementptr inbounds i8, i8* %4205, i64 %4242
  %4244 = getelementptr inbounds i8, i8* %4243, i64 32
  %4245 = bitcast i8* %4244 to %Qubit**
  %4246 = load %Qubit*, %Qubit** %4245, align 8
  %4247 = load %Qubit*, %Qubit** %4214, align 8
  %4248 = load %Qubit*, %Qubit** %4214, align 8
  %4249 = load i64, i64* %4221, align 8
  %4250 = getelementptr inbounds i8, i8* %4205, i64 %4249
  %4251 = getelementptr inbounds i8, i8* %4250, i64 32
  %4252 = bitcast i8* %4251 to %Qubit**
  %4253 = load %Qubit*, %Qubit** %4252, align 8
  %4254 = load %Qubit*, %Qubit** %4214, align 8
  br label %quantum331

quantum331:                                       ; preds = %then2__1.i.i460.i
  tail call void @__quantum__qis__t__adj(%Qubit* %4222)
  tail call void @__quantum__qis__t__adj(%Qubit* %4227)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*), %Qubit* %4228)
  tail call void @__quantum__qis__t__body(%Qubit* %4229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4234, %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %4239, %Qubit* %4240)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %4241)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4246, %Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*), %Qubit* %4247)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %4248)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4253, %Qubit* %4254)
  br label %readout330

readout330:                                       ; preds = %quantum331
  br label %post-classical329

post-classical329:                                ; preds = %readout330
  br label %exit_quantum_grouping332

exit_quantum_grouping332:                         ; preds = %post-classical329
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i

else__1.i.i461.i:                                 ; preds = %exit_quantum_grouping456
  %4255 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %4256 = bitcast i8* %4255 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %4256, align 8
  %4257 = getelementptr inbounds i8, i8* %4255, i64 8
  %4258 = getelementptr inbounds i8, i8* %4255, i64 16
  %4259 = bitcast i8* %4258 to i8**
  %4260 = getelementptr inbounds i8, i8* %4255, i64 24
  %4261 = bitcast i8* %4260 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %4257, i8 0, i64 16, i1 false)
  store i32 1, i32* %4261, align 8
  %4262 = getelementptr inbounds i8, i8* %4255, i64 28
  %4263 = bitcast i8* %4262 to i32*
  store i32 0, i32* %4263, align 4
  %4264 = bitcast i8* %4255 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %4264)
  %4265 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4266 = bitcast i8* %4265 to i64*
  %4267 = getelementptr inbounds i8, i8* %4265, i64 8
  %4268 = bitcast i8* %4267 to i64*
  %4269 = getelementptr inbounds i8, i8* %4265, i64 16
  %4270 = bitcast i8* %4269 to i64*
  store i64 16, i64* %4266, align 8
  store i64 1, i64* %4268, align 8
  store i64 0, i64* %4270, align 8
  %4271 = getelementptr inbounds i8, i8* %4265, i64 24
  %4272 = bitcast i8* %4271 to %Tuple*
  %4273 = bitcast %Tuple* %4272 to { %Array*, %Qubit* }*
  %4274 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4273, i64 0, i32 1
  %4275 = load i64, i64* %4210, align 8
  %4276 = add nsw i64 %4275, 1
  store i64 %4276, i64* %4210, align 8
  %4277 = icmp slt i64 %4275, 0
  br i1 %4277, label %4278, label %__quantum__rt__array_update_reference_count.exit.i.i467.i

4278:                                             ; preds = %else__1.i.i461.i
  tail call void @free(i8* nonnull %4205) #2
  br label %__quantum__rt__array_update_reference_count.exit.i.i467.i

__quantum__rt__array_update_reference_count.exit.i.i467.i: ; preds = %4278, %else__1.i.i461.i
  %4279 = bitcast %Tuple* %4272 to i8**
  store i8* %4205, i8** %4279, align 8
  store %Qubit* inttoptr (i64 8 to %Qubit*), %Qubit** %4274, align 8
  %4280 = load i32, i32* %4263, align 4
  %4281 = add nsw i32 %4280, 1
  store i32 %4281, i32* %4263, align 4
  %controls8.i.i.i462.i = load i8*, i8** %4279, align 8
  %4282 = getelementptr inbounds i8, i8* %controls8.i.i.i462.i, i64 24
  %4283 = bitcast i8* %4282 to i64*
  %4284 = load i64, i64* %4283, align 8
  %4285 = add nsw i64 %4284, 1
  store i64 %4285, i64* %4283, align 8
  %4286 = bitcast %Qubit** %4274 to i64*
  %arg1.i.i.i463.i = load i64, i64* %4286, align 8
  %4287 = getelementptr inbounds i8, i8* %controls8.i.i.i462.i, i64 8
  %4288 = bitcast i8* %4287 to i64*
  %4289 = load i64, i64* %4288, align 8
  %numControlPairs.i.i.i464.i = sdiv i64 %4289, 2
  %temps.i.i.i465.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i464.i)
  %4290 = bitcast %Array* %temps.i.i.i465.i to i8*
  %4291 = getelementptr inbounds i8, i8* %4290, i64 24
  %4292 = bitcast i8* %4291 to i64*
  %4293 = load i64, i64* %4292, align 8
  %4294 = add nsw i64 %4293, 1
  store i64 %4294, i64* %4292, align 8
  %.not.not9.i.i.i466.i = icmp sgt i64 %4289, 1
  br i1 %.not.not9.i.i.i466.i, label %body__1.lr.ph.i.i.i468.i, label %exit__1.i.i.i472.i

body__1.lr.ph.i.i.i468.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit.i.i467.i
  %4295 = bitcast i8* %controls8.i.i.i462.i to i64*
  %4296 = bitcast %Array* %temps.i.i.i465.i to i64*
  %4297 = getelementptr inbounds i8, i8* %controls8.i.i.i462.i, i64 32
  %4298 = getelementptr inbounds i8, i8* %4290, i64 32
  br label %body__1.i.i.i471.i

body__1.i.i.i471.i:                               ; preds = %body__1.lr.ph.i.i.i468.i, %exit_quantum_grouping336
  %4299 = phi i64 [ 0, %body__1.lr.ph.i.i.i468.i ], [ %4316, %exit_quantum_grouping336 ]
  %4300 = shl nuw i64 %4299, 1
  %4301 = load i64, i64* %4295, align 8
  %4302 = mul nsw i64 %4301, %4300
  %4303 = getelementptr inbounds i8, i8* %4297, i64 %4302
  %4304 = bitcast i8* %4303 to %Qubit**
  %4305 = load %Qubit*, %Qubit** %4304, align 8
  %4306 = or i64 %4300, 1
  %4307 = mul nsw i64 %4306, %4301
  %4308 = getelementptr inbounds i8, i8* %4297, i64 %4307
  %4309 = bitcast i8* %4308 to %Qubit**
  %4310 = load %Qubit*, %Qubit** %4309, align 8
  %4311 = load i64, i64* %4296, align 8
  %4312 = mul nsw i64 %4311, %4299
  %4313 = getelementptr inbounds i8, i8* %4298, i64 %4312
  %4314 = bitcast i8* %4313 to %Qubit**
  %4315 = load %Qubit*, %Qubit** %4314, align 8
  %4316 = add nuw nsw i64 %4299, 1
  %4317 = icmp eq i64 %4316, %numControlPairs.i.i.i464.i
  br label %quantum335

quantum335:                                       ; preds = %body__1.i.i.i471.i
  tail call void @__quantum__qis__h__body(%Qubit* %4315)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4315, %Qubit* %4305)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4305, %Qubit* %4310)
  tail call void @__quantum__qis__t__body(%Qubit* %4310)
  tail call void @__quantum__qis__t__adj(%Qubit* %4305)
  tail call void @__quantum__qis__t__body(%Qubit* %4315)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4315, %Qubit* %4305)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4305, %Qubit* %4310)
  tail call void @__quantum__qis__t__adj(%Qubit* %4310)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4315, %Qubit* %4310)
  tail call void @__quantum__qis__h__body(%Qubit* %4315)
  br label %readout334

readout334:                                       ; preds = %quantum335
  br label %post-classical333

post-classical333:                                ; preds = %readout334
  br label %exit_quantum_grouping336

exit_quantum_grouping336:                         ; preds = %post-classical333
  br i1 %4317, label %exit__1.i.i.i472.i, label %body__1.i.i.i471.i

exit__1.i.i.i472.i:                               ; preds = %exit_quantum_grouping336, %__quantum__rt__array_update_reference_count.exit.i.i467.i
  %4318 = and i64 %4289, 1
  %4319 = icmp eq i64 %4318, 0
  br i1 %4319, label %condTrue__1.i.i.i473.i, label %condFalse__1.i.i.i475.i

condTrue__1.i.i.i473.i:                           ; preds = %exit__1.i.i.i472.i
  %4320 = getelementptr inbounds i8, i8* %4290, i64 16
  %4321 = bitcast i8* %4320 to i64*
  %4322 = load i64, i64* %4321, align 8
  %4323 = add nsw i64 %4322, 1
  store i64 %4323, i64* %4321, align 8
  %4324 = icmp slt i64 %4322, 0
  br i1 %4324, label %4325, label %condContinue__1.i.i.i479.i

4325:                                             ; preds = %condTrue__1.i.i.i473.i
  tail call void @free(i8* nonnull %4290) #2
  br label %condContinue__1.i.i.i479.i

condFalse__1.i.i.i475.i:                          ; preds = %exit__1.i.i.i472.i
  %4326 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4327 = bitcast i8* %4326 to i64*
  %4328 = getelementptr inbounds i8, i8* %4326, i64 8
  %4329 = bitcast i8* %4328 to i64*
  %4330 = getelementptr inbounds i8, i8* %4326, i64 16
  %4331 = bitcast i8* %4330 to i64*
  %4332 = getelementptr inbounds i8, i8* %4326, i64 24
  %4333 = bitcast i8* %4332 to i64*
  store i64 8, i64* %4327, align 8
  store i64 1, i64* %4329, align 8
  store i64 1, i64* %4331, align 8
  store i64 0, i64* %4333, align 8
  %4334 = getelementptr inbounds i8, i8* %4326, i64 32
  %4335 = add i64 %4289, -1
  %4336 = bitcast i8* %controls8.i.i.i462.i to i64*
  %4337 = load i64, i64* %4336, align 8
  %4338 = mul nsw i64 %4337, %4335
  %4339 = getelementptr inbounds i8, i8* %controls8.i.i.i462.i, i64 %4338
  %4340 = getelementptr inbounds i8, i8* %4339, i64 32
  %4341 = bitcast i8* %4340 to i64*
  %4342 = load i64, i64* %4341, align 8
  %4343 = bitcast i8* %4334 to i64*
  store i64 %4342, i64* %4343, align 8
  %4344 = bitcast %Array* %temps.i.i.i465.i to i64*
  %4345 = load i64, i64* %4344, align 8
  %4346 = getelementptr inbounds i8, i8* %4290, i64 8
  %4347 = bitcast i8* %4346 to i64*
  %4348 = load i64, i64* %4347, align 8
  %4349 = load i64, i64* %4329, align 8
  %4350 = getelementptr inbounds i8, i8* %4290, i64 32
  %4351 = add nsw i64 %4349, %4348
  %sext.i.i.i.i474.i = shl i64 %4345, 32
  %4352 = ashr exact i64 %sext.i.i.i.i474.i, 32
  %4353 = mul nsw i64 %4351, %4352
  %4354 = add i64 %4353, 32
  %4355 = tail call i8* @malloc(i64 %4354) #5
  %4356 = bitcast i8* %4355 to i64*
  %4357 = getelementptr inbounds i8, i8* %4355, i64 8
  %4358 = bitcast i8* %4357 to i64*
  %4359 = getelementptr inbounds i8, i8* %4355, i64 16
  %4360 = bitcast i8* %4359 to i64*
  %4361 = getelementptr inbounds i8, i8* %4355, i64 24
  %4362 = bitcast i8* %4361 to i64*
  store i64 %4352, i64* %4356, align 8
  store i64 %4351, i64* %4358, align 8
  store i64 1, i64* %4360, align 8
  store i64 0, i64* %4362, align 8
  %4363 = getelementptr inbounds i8, i8* %4355, i64 32
  %4364 = mul nsw i64 %4348, %4345
  %4365 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4363, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4363, i8* nonnull align 1 %4350, i64 %4364, i1 false) #2
  %4366 = getelementptr inbounds i8, i8* %4363, i64 %4364
  %4367 = mul nsw i64 %4349, %4345
  %4368 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4366, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4366, i8* nonnull align 1 %4334, i64 %4367, i1 false) #2
  %4369 = bitcast i8* %4355 to %Array*
  %4370 = load i64, i64* %4360, align 8
  %4371 = add nsw i64 %4370, 1
  store i64 %4371, i64* %4360, align 8
  %4372 = icmp slt i64 %4370, 0
  br i1 %4372, label %4373, label %__quantum__rt__array_update_reference_count.exit2.i.i.i476.i

4373:                                             ; preds = %condFalse__1.i.i.i475.i
  tail call void @free(i8* nonnull %4355) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i.i476.i

__quantum__rt__array_update_reference_count.exit2.i.i.i476.i: ; preds = %4373, %condFalse__1.i.i.i475.i
  %4374 = load i64, i64* %4331, align 8
  %4375 = add nsw i64 %4374, -1
  store i64 %4375, i64* %4331, align 8
  %4376 = icmp slt i64 %4374, 2
  br i1 %4376, label %4377, label %__quantum__rt__array_update_reference_count.exit3.i.i.i477.i

4377:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i.i476.i
  tail call void @free(i8* nonnull %4326) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i.i477.i

__quantum__rt__array_update_reference_count.exit3.i.i.i477.i: ; preds = %4377, %__quantum__rt__array_update_reference_count.exit2.i.i.i476.i
  %4378 = load i64, i64* %4360, align 8
  %4379 = add nsw i64 %4378, -1
  store i64 %4379, i64* %4360, align 8
  %4380 = icmp slt i64 %4378, 2
  br i1 %4380, label %4381, label %condContinue__1.i.i.i479.i

4381:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i.i477.i
  tail call void @free(i8* nonnull %4355) #2
  br label %condContinue__1.i.i.i479.i

condContinue__1.i.i.i479.i:                       ; preds = %4381, %__quantum__rt__array_update_reference_count.exit3.i.i.i477.i, %4325, %condTrue__1.i.i.i473.i
  %__qsVar1__newControls__.i.i.i478.i = phi %Array* [ %temps.i.i.i465.i, %condTrue__1.i.i.i473.i ], [ %temps.i.i.i465.i, %4325 ], [ %4369, %__quantum__rt__array_update_reference_count.exit3.i.i.i477.i ], [ %4369, %4381 ]
  %4382 = bitcast %Array* %__qsVar1__newControls__.i.i.i478.i to i8*
  %4383 = getelementptr inbounds i8, i8* %4382, i64 24
  %4384 = bitcast i8* %4383 to i64*
  %4385 = load i64, i64* %4384, align 8
  %4386 = add nsw i64 %4385, 1
  store i64 %4386, i64* %4384, align 8
  %4387 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4388 = bitcast i8* %4387 to i64*
  %4389 = getelementptr inbounds i8, i8* %4387, i64 8
  %4390 = bitcast i8* %4389 to i64*
  %4391 = getelementptr inbounds i8, i8* %4387, i64 16
  %4392 = bitcast i8* %4391 to i64*
  store i64 16, i64* %4388, align 8
  store i64 1, i64* %4390, align 8
  store i64 0, i64* %4392, align 8
  %4393 = getelementptr inbounds i8, i8* %4387, i64 24
  %4394 = bitcast i8* %4393 to %Tuple*
  %4395 = bitcast %Tuple* %4394 to { %Array*, %Qubit* }*
  %4396 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4395, i64 0, i32 0
  %4397 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4395, i64 0, i32 1
  %4398 = getelementptr inbounds i8, i8* %4382, i64 16
  %4399 = bitcast i8* %4398 to i64*
  %4400 = load i64, i64* %4399, align 8
  %4401 = add nsw i64 %4400, 1
  store i64 %4401, i64* %4399, align 8
  %4402 = icmp slt i64 %4400, 0
  br i1 %4402, label %4403, label %__quantum__rt__array_update_reference_count.exit5.i.i.i480.i

4403:                                             ; preds = %condContinue__1.i.i.i479.i
  tail call void @free(i8* nonnull %4382) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i.i480.i

__quantum__rt__array_update_reference_count.exit5.i.i.i480.i: ; preds = %4403, %condContinue__1.i.i.i479.i
  store %Array* %__qsVar1__newControls__.i.i.i478.i, %Array** %4396, align 8
  %4404 = bitcast %Qubit** %4397 to i64*
  store i64 %arg1.i.i.i463.i, i64* %4404, align 8
  %4405 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %4256, align 8
  %4406 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %4405, i64 0, i64 0
  %4407 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %4406, align 8
  %4408 = load i8*, i8** %4259, align 8
  tail call void %4407(i8* %4408, i8* nonnull %4393, i8* null)
  br i1 %.not.not9.i.i.i466.i, label %body__2.lr.ph.i.i.i482.i, label %exit__2.i.i.i486.i

body__2.lr.ph.i.i.i482.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i.i480.i
  %__qsVar0____qsVar0__numPair____11.i.i.i481.i = add nsw i64 %numControlPairs.i.i.i464.i, -1
  %4409 = bitcast i8* %controls8.i.i.i462.i to i64*
  %4410 = bitcast %Array* %temps.i.i.i465.i to i64*
  %4411 = getelementptr inbounds i8, i8* %controls8.i.i.i462.i, i64 32
  %4412 = getelementptr inbounds i8, i8* %4290, i64 32
  br label %body__2.i.i.i485.i

body__2.i.i.i485.i:                               ; preds = %body__2.lr.ph.i.i.i482.i, %exit_quantum_grouping340
  %4413 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i.i481.i, %body__2.lr.ph.i.i.i482.i ], [ %4430, %exit_quantum_grouping340 ]
  %4414 = shl nuw i64 %4413, 1
  %4415 = load i64, i64* %4409, align 8
  %4416 = mul nsw i64 %4415, %4414
  %4417 = getelementptr inbounds i8, i8* %4411, i64 %4416
  %4418 = bitcast i8* %4417 to %Qubit**
  %4419 = load %Qubit*, %Qubit** %4418, align 8
  %4420 = or i64 %4414, 1
  %4421 = mul nsw i64 %4420, %4415
  %4422 = getelementptr inbounds i8, i8* %4411, i64 %4421
  %4423 = bitcast i8* %4422 to %Qubit**
  %4424 = load %Qubit*, %Qubit** %4423, align 8
  %4425 = load i64, i64* %4410, align 8
  %4426 = mul nsw i64 %4425, %4413
  %4427 = getelementptr inbounds i8, i8* %4412, i64 %4426
  %4428 = bitcast i8* %4427 to %Qubit**
  %4429 = load %Qubit*, %Qubit** %4428, align 8
  %4430 = add i64 %4413, -1
  %4431 = icmp sgt i64 %4430, -1
  br label %quantum339

quantum339:                                       ; preds = %body__2.i.i.i485.i
  tail call void @__quantum__qis__h__body(%Qubit* %4429)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4429, %Qubit* %4424)
  tail call void @__quantum__qis__t__body(%Qubit* %4424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4419, %Qubit* %4424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4429, %Qubit* %4419)
  tail call void @__quantum__qis__t__adj(%Qubit* %4429)
  tail call void @__quantum__qis__t__body(%Qubit* %4419)
  tail call void @__quantum__qis__t__adj(%Qubit* %4424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4419, %Qubit* %4424)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4429, %Qubit* %4419)
  tail call void @__quantum__qis__h__body(%Qubit* %4429)
  br label %readout338

readout338:                                       ; preds = %quantum339
  br label %post-classical337

post-classical337:                                ; preds = %readout338
  br label %exit_quantum_grouping340

exit_quantum_grouping340:                         ; preds = %post-classical337
  br i1 %4431, label %body__2.i.i.i485.i, label %exit__2.i.i.i486.i

exit__2.i.i.i486.i:                               ; preds = %exit_quantum_grouping340, %__quantum__rt__array_update_reference_count.exit5.i.i.i480.i
  %4432 = load i64, i64* %4292, align 8
  %4433 = add nsw i64 %4432, -1
  store i64 %4433, i64* %4292, align 8
  %4434 = load i64, i64* %4384, align 8
  %4435 = add nsw i64 %4434, -1
  store i64 %4435, i64* %4384, align 8
  %4436 = load i64, i64* %4399, align 8
  %4437 = add nsw i64 %4436, -1
  store i64 %4437, i64* %4399, align 8
  %4438 = icmp slt i64 %4436, 2
  br i1 %4438, label %4439, label %__quantum__rt__array_update_reference_count.exit6.i.i.i488.i

4439:                                             ; preds = %exit__2.i.i.i486.i
  tail call void @free(i8* nonnull %4382) #2
  %.pre.i.i.i487.i = load i64, i64* %4399, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i.i488.i

__quantum__rt__array_update_reference_count.exit6.i.i.i488.i: ; preds = %4439, %exit__2.i.i.i486.i
  %4440 = phi i64 [ %4437, %exit__2.i.i.i486.i ], [ %.pre.i.i.i487.i, %4439 ]
  %4441 = add nsw i64 %4440, -1
  store i64 %4441, i64* %4399, align 8
  %4442 = icmp slt i64 %4440, 2
  br i1 %4442, label %4443, label %__quantum__rt__array_update_reference_count.exit7.i.i.i489.i

4443:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i.i488.i
  tail call void @free(i8* nonnull %4382) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i.i489.i

__quantum__rt__array_update_reference_count.exit7.i.i.i489.i: ; preds = %4443, %__quantum__rt__array_update_reference_count.exit6.i.i.i488.i
  %4444 = load i64, i64* %4390, align 8
  %4445 = add nsw i64 %4444, -1
  store i64 %4445, i64* %4390, align 8
  %4446 = icmp slt i64 %4444, 2
  br i1 %4446, label %4447, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i490.i

4447:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i.i489.i
  tail call void @free(i8* nonnull %4387) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i490.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i490.i: ; preds = %4447, %__quantum__rt__array_update_reference_count.exit7.i.i.i489.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i.i465.i)
  %4448 = load i32, i32* %4263, align 4
  %4449 = add nsw i32 %4448, -1
  store i32 %4449, i32* %4263, align 4
  %4450 = load i64, i64* %4283, align 8
  %4451 = add nsw i64 %4450, -1
  store i64 %4451, i64* %4283, align 8
  %4452 = load i32, i32* %4261, align 8
  %4453 = add nsw i32 %4452, -1
  store i32 %4453, i32* %4261, align 8
  %4454 = load i64, i64* %4210, align 8
  %4455 = add nsw i64 %4454, -1
  store i64 %4455, i64* %4210, align 8
  %4456 = icmp slt i64 %4454, 2
  br i1 %4456, label %4457, label %__quantum__rt__array_update_reference_count.exit1.i.i491.i

4457:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i490.i
  tail call void @free(i8* nonnull %4205) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i.i491.i

__quantum__rt__array_update_reference_count.exit1.i.i491.i: ; preds = %4457, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i490.i
  %4458 = load i64, i64* %4268, align 8
  %4459 = add nsw i64 %4458, -1
  store i64 %4459, i64* %4268, align 8
  %4460 = icmp slt i64 %4458, 2
  br i1 %4460, label %4461, label %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i

4461:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i.i491.i
  tail call void @free(i8* nonnull %4265) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i: ; preds = %4461, %__quantum__rt__array_update_reference_count.exit1.i.i491.i, %exit_quantum_grouping332, %exit_quantum_grouping328, %exit_quantum_grouping324
  %4462 = load i64, i64* %4212, align 8
  %4463 = add nsw i64 %4462, -1
  store i64 %4463, i64* %4212, align 8
  %4464 = load i64, i64* %4210, align 8
  %4465 = add nsw i64 %4464, -1
  store i64 %4465, i64* %4210, align 8
  %4466 = icmp slt i64 %4464, 2
  br i1 %4466, label %4467, label %Microsoft__Quantum__Canon__CZ__body.exit.i492.i

4467:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i
  tail call void @free(i8* nonnull %4205) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit.i492.i

Microsoft__Quantum__Canon__CZ__body.exit.i492.i:  ; preds = %4467, %Microsoft__Quantum__Intrinsic__Z__ctl.49.exit.i.i
  %4468 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4469 = bitcast i8* %4468 to i64*
  %4470 = getelementptr inbounds i8, i8* %4468, i64 8
  %4471 = bitcast i8* %4470 to i64*
  %4472 = getelementptr inbounds i8, i8* %4468, i64 16
  %4473 = bitcast i8* %4472 to i64*
  %4474 = getelementptr inbounds i8, i8* %4468, i64 24
  %4475 = bitcast i8* %4474 to i64*
  store i64 8, i64* %4469, align 8
  store i64 1, i64* %4471, align 8
  store i64 1, i64* %4473, align 8
  store i64 0, i64* %4475, align 8
  %4476 = getelementptr inbounds i8, i8* %4468, i64 32
  %4477 = bitcast i8* %4476 to %Qubit**
  store %Qubit* inttoptr (i64 14 to %Qubit*), %Qubit** %4477, align 8
  %4478 = load i64, i64* %4475, align 8
  %4479 = add nsw i64 %4478, 1
  store i64 %4479, i64* %4475, align 8
  %4480 = load i64, i64* %4471, align 8
  switch i64 %4480, label %else__1.i5.i497.i [
    i64 0, label %then0__1.i1.i493.i
    i64 1, label %then1__1.i3.i495.i
    i64 2, label %then2__1.i4.i496.i
  ]

then0__1.i1.i493.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i492.i
  br label %quantum343

quantum343:                                       ; preds = %then0__1.i1.i493.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout342

readout342:                                       ; preds = %quantum343
  br label %post-classical341

post-classical341:                                ; preds = %readout342
  br label %exit_quantum_grouping344

exit_quantum_grouping344:                         ; preds = %post-classical341
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i

then1__1.i3.i495.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i492.i
  %4481 = load %Qubit*, %Qubit** %4477, align 8
  br label %quantum347

quantum347:                                       ; preds = %then1__1.i3.i495.i
  tail call void @__quantum__qis__cz__body(%Qubit* %4481, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  br label %readout346

readout346:                                       ; preds = %quantum347
  br label %post-classical345

post-classical345:                                ; preds = %readout346
  br label %exit_quantum_grouping348

exit_quantum_grouping348:                         ; preds = %post-classical345
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i

then2__1.i4.i496.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i492.i
  %4482 = bitcast i8* %4468 to %Array*
  %4483 = bitcast %Array* %4482 to i64*
  %4484 = load %Qubit*, %Qubit** %4477, align 8
  %4485 = load i64, i64* %4483, align 8
  %4486 = getelementptr inbounds i8, i8* %4468, i64 %4485
  %4487 = getelementptr inbounds i8, i8* %4486, i64 32
  %4488 = bitcast i8* %4487 to %Qubit**
  %4489 = load %Qubit*, %Qubit** %4488, align 8
  %4490 = load %Qubit*, %Qubit** %4477, align 8
  %4491 = load %Qubit*, %Qubit** %4477, align 8
  %4492 = load i64, i64* %4483, align 8
  %4493 = getelementptr inbounds i8, i8* %4468, i64 %4492
  %4494 = getelementptr inbounds i8, i8* %4493, i64 32
  %4495 = bitcast i8* %4494 to %Qubit**
  %4496 = load %Qubit*, %Qubit** %4495, align 8
  %4497 = load i64, i64* %4483, align 8
  %4498 = getelementptr inbounds i8, i8* %4468, i64 %4497
  %4499 = getelementptr inbounds i8, i8* %4498, i64 32
  %4500 = bitcast i8* %4499 to %Qubit**
  %4501 = load %Qubit*, %Qubit** %4500, align 8
  %4502 = load %Qubit*, %Qubit** %4477, align 8
  %4503 = load %Qubit*, %Qubit** %4477, align 8
  %4504 = load i64, i64* %4483, align 8
  %4505 = getelementptr inbounds i8, i8* %4468, i64 %4504
  %4506 = getelementptr inbounds i8, i8* %4505, i64 32
  %4507 = bitcast i8* %4506 to %Qubit**
  %4508 = load %Qubit*, %Qubit** %4507, align 8
  %4509 = load %Qubit*, %Qubit** %4477, align 8
  %4510 = load %Qubit*, %Qubit** %4477, align 8
  %4511 = load i64, i64* %4483, align 8
  %4512 = getelementptr inbounds i8, i8* %4468, i64 %4511
  %4513 = getelementptr inbounds i8, i8* %4512, i64 32
  %4514 = bitcast i8* %4513 to %Qubit**
  %4515 = load %Qubit*, %Qubit** %4514, align 8
  %4516 = load %Qubit*, %Qubit** %4477, align 8
  br label %quantum351

quantum351:                                       ; preds = %then2__1.i4.i496.i
  tail call void @__quantum__qis__t__adj(%Qubit* %4484)
  tail call void @__quantum__qis__t__adj(%Qubit* %4489)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %4490)
  tail call void @__quantum__qis__t__body(%Qubit* %4491)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4496, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %4501, %Qubit* %4502)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %4503)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4508, %Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Qubit* %4509)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %4510)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4515, %Qubit* %4516)
  br label %readout350

readout350:                                       ; preds = %quantum351
  br label %post-classical349

post-classical349:                                ; preds = %readout350
  br label %exit_quantum_grouping352

exit_quantum_grouping352:                         ; preds = %post-classical349
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i

else__1.i5.i497.i:                                ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i492.i
  %4517 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %4518 = bitcast i8* %4517 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %4518, align 8
  %4519 = getelementptr inbounds i8, i8* %4517, i64 8
  %4520 = getelementptr inbounds i8, i8* %4517, i64 16
  %4521 = bitcast i8* %4520 to i8**
  %4522 = getelementptr inbounds i8, i8* %4517, i64 24
  %4523 = bitcast i8* %4522 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %4519, i8 0, i64 16, i1 false)
  store i32 1, i32* %4523, align 8
  %4524 = getelementptr inbounds i8, i8* %4517, i64 28
  %4525 = bitcast i8* %4524 to i32*
  store i32 0, i32* %4525, align 4
  %4526 = bitcast i8* %4517 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %4526)
  %4527 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4528 = bitcast i8* %4527 to i64*
  %4529 = getelementptr inbounds i8, i8* %4527, i64 8
  %4530 = bitcast i8* %4529 to i64*
  %4531 = getelementptr inbounds i8, i8* %4527, i64 16
  %4532 = bitcast i8* %4531 to i64*
  store i64 16, i64* %4528, align 8
  store i64 1, i64* %4530, align 8
  store i64 0, i64* %4532, align 8
  %4533 = getelementptr inbounds i8, i8* %4527, i64 24
  %4534 = bitcast i8* %4533 to %Tuple*
  %4535 = bitcast %Tuple* %4534 to { %Array*, %Qubit* }*
  %4536 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4535, i64 0, i32 1
  %4537 = load i64, i64* %4473, align 8
  %4538 = add nsw i64 %4537, 1
  store i64 %4538, i64* %4473, align 8
  %4539 = icmp slt i64 %4537, 0
  br i1 %4539, label %4540, label %__quantum__rt__array_update_reference_count.exit.i11.i503.i

4540:                                             ; preds = %else__1.i5.i497.i
  tail call void @free(i8* nonnull %4468) #2
  br label %__quantum__rt__array_update_reference_count.exit.i11.i503.i

__quantum__rt__array_update_reference_count.exit.i11.i503.i: ; preds = %4540, %else__1.i5.i497.i
  %4541 = bitcast %Tuple* %4534 to i8**
  store i8* %4468, i8** %4541, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %4536, align 8
  %4542 = load i32, i32* %4525, align 4
  %4543 = add nsw i32 %4542, 1
  store i32 %4543, i32* %4525, align 4
  %controls8.i.i6.i498.i = load i8*, i8** %4541, align 8
  %4544 = getelementptr inbounds i8, i8* %controls8.i.i6.i498.i, i64 24
  %4545 = bitcast i8* %4544 to i64*
  %4546 = load i64, i64* %4545, align 8
  %4547 = add nsw i64 %4546, 1
  store i64 %4547, i64* %4545, align 8
  %4548 = bitcast %Qubit** %4536 to i64*
  %arg1.i.i7.i499.i = load i64, i64* %4548, align 8
  %4549 = getelementptr inbounds i8, i8* %controls8.i.i6.i498.i, i64 8
  %4550 = bitcast i8* %4549 to i64*
  %4551 = load i64, i64* %4550, align 8
  %numControlPairs.i.i8.i500.i = sdiv i64 %4551, 2
  %temps.i.i9.i501.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i8.i500.i)
  %4552 = bitcast %Array* %temps.i.i9.i501.i to i8*
  %4553 = getelementptr inbounds i8, i8* %4552, i64 24
  %4554 = bitcast i8* %4553 to i64*
  %4555 = load i64, i64* %4554, align 8
  %4556 = add nsw i64 %4555, 1
  store i64 %4556, i64* %4554, align 8
  %.not.not9.i.i10.i502.i = icmp sgt i64 %4551, 1
  br i1 %.not.not9.i.i10.i502.i, label %body__1.lr.ph.i.i12.i504.i, label %exit__1.i.i16.i508.i

body__1.lr.ph.i.i12.i504.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit.i11.i503.i
  %4557 = bitcast i8* %controls8.i.i6.i498.i to i64*
  %4558 = bitcast %Array* %temps.i.i9.i501.i to i64*
  %4559 = getelementptr inbounds i8, i8* %controls8.i.i6.i498.i, i64 32
  %4560 = getelementptr inbounds i8, i8* %4552, i64 32
  br label %body__1.i.i15.i507.i

body__1.i.i15.i507.i:                             ; preds = %body__1.lr.ph.i.i12.i504.i, %exit_quantum_grouping356
  %4561 = phi i64 [ 0, %body__1.lr.ph.i.i12.i504.i ], [ %4578, %exit_quantum_grouping356 ]
  %4562 = shl nuw i64 %4561, 1
  %4563 = load i64, i64* %4557, align 8
  %4564 = mul nsw i64 %4563, %4562
  %4565 = getelementptr inbounds i8, i8* %4559, i64 %4564
  %4566 = bitcast i8* %4565 to %Qubit**
  %4567 = load %Qubit*, %Qubit** %4566, align 8
  %4568 = or i64 %4562, 1
  %4569 = mul nsw i64 %4568, %4563
  %4570 = getelementptr inbounds i8, i8* %4559, i64 %4569
  %4571 = bitcast i8* %4570 to %Qubit**
  %4572 = load %Qubit*, %Qubit** %4571, align 8
  %4573 = load i64, i64* %4558, align 8
  %4574 = mul nsw i64 %4573, %4561
  %4575 = getelementptr inbounds i8, i8* %4560, i64 %4574
  %4576 = bitcast i8* %4575 to %Qubit**
  %4577 = load %Qubit*, %Qubit** %4576, align 8
  %4578 = add nuw nsw i64 %4561, 1
  %4579 = icmp eq i64 %4578, %numControlPairs.i.i8.i500.i
  br label %quantum355

quantum355:                                       ; preds = %body__1.i.i15.i507.i
  tail call void @__quantum__qis__h__body(%Qubit* %4577)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4577, %Qubit* %4567)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4567, %Qubit* %4572)
  tail call void @__quantum__qis__t__body(%Qubit* %4572)
  tail call void @__quantum__qis__t__adj(%Qubit* %4567)
  tail call void @__quantum__qis__t__body(%Qubit* %4577)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4577, %Qubit* %4567)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4567, %Qubit* %4572)
  tail call void @__quantum__qis__t__adj(%Qubit* %4572)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4577, %Qubit* %4572)
  tail call void @__quantum__qis__h__body(%Qubit* %4577)
  br label %readout354

readout354:                                       ; preds = %quantum355
  br label %post-classical353

post-classical353:                                ; preds = %readout354
  br label %exit_quantum_grouping356

exit_quantum_grouping356:                         ; preds = %post-classical353
  br i1 %4579, label %exit__1.i.i16.i508.i, label %body__1.i.i15.i507.i

exit__1.i.i16.i508.i:                             ; preds = %exit_quantum_grouping356, %__quantum__rt__array_update_reference_count.exit.i11.i503.i
  %4580 = and i64 %4551, 1
  %4581 = icmp eq i64 %4580, 0
  br i1 %4581, label %condTrue__1.i.i17.i509.i, label %condFalse__1.i.i19.i511.i

condTrue__1.i.i17.i509.i:                         ; preds = %exit__1.i.i16.i508.i
  %4582 = getelementptr inbounds i8, i8* %4552, i64 16
  %4583 = bitcast i8* %4582 to i64*
  %4584 = load i64, i64* %4583, align 8
  %4585 = add nsw i64 %4584, 1
  store i64 %4585, i64* %4583, align 8
  %4586 = icmp slt i64 %4584, 0
  br i1 %4586, label %4587, label %condContinue__1.i.i23.i515.i

4587:                                             ; preds = %condTrue__1.i.i17.i509.i
  tail call void @free(i8* nonnull %4552) #2
  br label %condContinue__1.i.i23.i515.i

condFalse__1.i.i19.i511.i:                        ; preds = %exit__1.i.i16.i508.i
  %4588 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4589 = bitcast i8* %4588 to i64*
  %4590 = getelementptr inbounds i8, i8* %4588, i64 8
  %4591 = bitcast i8* %4590 to i64*
  %4592 = getelementptr inbounds i8, i8* %4588, i64 16
  %4593 = bitcast i8* %4592 to i64*
  %4594 = getelementptr inbounds i8, i8* %4588, i64 24
  %4595 = bitcast i8* %4594 to i64*
  store i64 8, i64* %4589, align 8
  store i64 1, i64* %4591, align 8
  store i64 1, i64* %4593, align 8
  store i64 0, i64* %4595, align 8
  %4596 = getelementptr inbounds i8, i8* %4588, i64 32
  %4597 = add i64 %4551, -1
  %4598 = bitcast i8* %controls8.i.i6.i498.i to i64*
  %4599 = load i64, i64* %4598, align 8
  %4600 = mul nsw i64 %4599, %4597
  %4601 = getelementptr inbounds i8, i8* %controls8.i.i6.i498.i, i64 %4600
  %4602 = getelementptr inbounds i8, i8* %4601, i64 32
  %4603 = bitcast i8* %4602 to i64*
  %4604 = load i64, i64* %4603, align 8
  %4605 = bitcast i8* %4596 to i64*
  store i64 %4604, i64* %4605, align 8
  %4606 = bitcast %Array* %temps.i.i9.i501.i to i64*
  %4607 = load i64, i64* %4606, align 8
  %4608 = getelementptr inbounds i8, i8* %4552, i64 8
  %4609 = bitcast i8* %4608 to i64*
  %4610 = load i64, i64* %4609, align 8
  %4611 = load i64, i64* %4591, align 8
  %4612 = getelementptr inbounds i8, i8* %4552, i64 32
  %4613 = add nsw i64 %4611, %4610
  %sext.i.i.i18.i510.i = shl i64 %4607, 32
  %4614 = ashr exact i64 %sext.i.i.i18.i510.i, 32
  %4615 = mul nsw i64 %4613, %4614
  %4616 = add i64 %4615, 32
  %4617 = tail call i8* @malloc(i64 %4616) #5
  %4618 = bitcast i8* %4617 to i64*
  %4619 = getelementptr inbounds i8, i8* %4617, i64 8
  %4620 = bitcast i8* %4619 to i64*
  %4621 = getelementptr inbounds i8, i8* %4617, i64 16
  %4622 = bitcast i8* %4621 to i64*
  %4623 = getelementptr inbounds i8, i8* %4617, i64 24
  %4624 = bitcast i8* %4623 to i64*
  store i64 %4614, i64* %4618, align 8
  store i64 %4613, i64* %4620, align 8
  store i64 1, i64* %4622, align 8
  store i64 0, i64* %4624, align 8
  %4625 = getelementptr inbounds i8, i8* %4617, i64 32
  %4626 = mul nsw i64 %4610, %4607
  %4627 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4625, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4625, i8* nonnull align 1 %4612, i64 %4626, i1 false) #2
  %4628 = getelementptr inbounds i8, i8* %4625, i64 %4626
  %4629 = mul nsw i64 %4611, %4607
  %4630 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4628, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4628, i8* nonnull align 1 %4596, i64 %4629, i1 false) #2
  %4631 = bitcast i8* %4617 to %Array*
  %4632 = load i64, i64* %4622, align 8
  %4633 = add nsw i64 %4632, 1
  store i64 %4633, i64* %4622, align 8
  %4634 = icmp slt i64 %4632, 0
  br i1 %4634, label %4635, label %__quantum__rt__array_update_reference_count.exit2.i.i20.i512.i

4635:                                             ; preds = %condFalse__1.i.i19.i511.i
  tail call void @free(i8* nonnull %4617) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i20.i512.i

__quantum__rt__array_update_reference_count.exit2.i.i20.i512.i: ; preds = %4635, %condFalse__1.i.i19.i511.i
  %4636 = load i64, i64* %4593, align 8
  %4637 = add nsw i64 %4636, -1
  store i64 %4637, i64* %4593, align 8
  %4638 = icmp slt i64 %4636, 2
  br i1 %4638, label %4639, label %__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i

4639:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i20.i512.i
  tail call void @free(i8* nonnull %4588) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i

__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i: ; preds = %4639, %__quantum__rt__array_update_reference_count.exit2.i.i20.i512.i
  %4640 = load i64, i64* %4622, align 8
  %4641 = add nsw i64 %4640, -1
  store i64 %4641, i64* %4622, align 8
  %4642 = icmp slt i64 %4640, 2
  br i1 %4642, label %4643, label %condContinue__1.i.i23.i515.i

4643:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i
  tail call void @free(i8* nonnull %4617) #2
  br label %condContinue__1.i.i23.i515.i

condContinue__1.i.i23.i515.i:                     ; preds = %4643, %__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i, %4587, %condTrue__1.i.i17.i509.i
  %__qsVar1__newControls__.i.i22.i514.i = phi %Array* [ %temps.i.i9.i501.i, %condTrue__1.i.i17.i509.i ], [ %temps.i.i9.i501.i, %4587 ], [ %4631, %__quantum__rt__array_update_reference_count.exit3.i.i21.i513.i ], [ %4631, %4643 ]
  %4644 = bitcast %Array* %__qsVar1__newControls__.i.i22.i514.i to i8*
  %4645 = getelementptr inbounds i8, i8* %4644, i64 24
  %4646 = bitcast i8* %4645 to i64*
  %4647 = load i64, i64* %4646, align 8
  %4648 = add nsw i64 %4647, 1
  store i64 %4648, i64* %4646, align 8
  %4649 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4650 = bitcast i8* %4649 to i64*
  %4651 = getelementptr inbounds i8, i8* %4649, i64 8
  %4652 = bitcast i8* %4651 to i64*
  %4653 = getelementptr inbounds i8, i8* %4649, i64 16
  %4654 = bitcast i8* %4653 to i64*
  store i64 16, i64* %4650, align 8
  store i64 1, i64* %4652, align 8
  store i64 0, i64* %4654, align 8
  %4655 = getelementptr inbounds i8, i8* %4649, i64 24
  %4656 = bitcast i8* %4655 to %Tuple*
  %4657 = bitcast %Tuple* %4656 to { %Array*, %Qubit* }*
  %4658 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4657, i64 0, i32 0
  %4659 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4657, i64 0, i32 1
  %4660 = getelementptr inbounds i8, i8* %4644, i64 16
  %4661 = bitcast i8* %4660 to i64*
  %4662 = load i64, i64* %4661, align 8
  %4663 = add nsw i64 %4662, 1
  store i64 %4663, i64* %4661, align 8
  %4664 = icmp slt i64 %4662, 0
  br i1 %4664, label %4665, label %__quantum__rt__array_update_reference_count.exit5.i.i24.i516.i

4665:                                             ; preds = %condContinue__1.i.i23.i515.i
  tail call void @free(i8* nonnull %4644) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i24.i516.i

__quantum__rt__array_update_reference_count.exit5.i.i24.i516.i: ; preds = %4665, %condContinue__1.i.i23.i515.i
  store %Array* %__qsVar1__newControls__.i.i22.i514.i, %Array** %4658, align 8
  %4666 = bitcast %Qubit** %4659 to i64*
  store i64 %arg1.i.i7.i499.i, i64* %4666, align 8
  %4667 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %4518, align 8
  %4668 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %4667, i64 0, i64 0
  %4669 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %4668, align 8
  %4670 = load i8*, i8** %4521, align 8
  tail call void %4669(i8* %4670, i8* nonnull %4655, i8* null)
  br i1 %.not.not9.i.i10.i502.i, label %body__2.lr.ph.i.i26.i518.i, label %exit__2.i.i30.i522.i

body__2.lr.ph.i.i26.i518.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i24.i516.i
  %__qsVar0____qsVar0__numPair____11.i.i25.i517.i = add nsw i64 %numControlPairs.i.i8.i500.i, -1
  %4671 = bitcast i8* %controls8.i.i6.i498.i to i64*
  %4672 = bitcast %Array* %temps.i.i9.i501.i to i64*
  %4673 = getelementptr inbounds i8, i8* %controls8.i.i6.i498.i, i64 32
  %4674 = getelementptr inbounds i8, i8* %4552, i64 32
  br label %body__2.i.i29.i521.i

body__2.i.i29.i521.i:                             ; preds = %body__2.lr.ph.i.i26.i518.i, %exit_quantum_grouping360
  %4675 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i25.i517.i, %body__2.lr.ph.i.i26.i518.i ], [ %4692, %exit_quantum_grouping360 ]
  %4676 = shl nuw i64 %4675, 1
  %4677 = load i64, i64* %4671, align 8
  %4678 = mul nsw i64 %4677, %4676
  %4679 = getelementptr inbounds i8, i8* %4673, i64 %4678
  %4680 = bitcast i8* %4679 to %Qubit**
  %4681 = load %Qubit*, %Qubit** %4680, align 8
  %4682 = or i64 %4676, 1
  %4683 = mul nsw i64 %4682, %4677
  %4684 = getelementptr inbounds i8, i8* %4673, i64 %4683
  %4685 = bitcast i8* %4684 to %Qubit**
  %4686 = load %Qubit*, %Qubit** %4685, align 8
  %4687 = load i64, i64* %4672, align 8
  %4688 = mul nsw i64 %4687, %4675
  %4689 = getelementptr inbounds i8, i8* %4674, i64 %4688
  %4690 = bitcast i8* %4689 to %Qubit**
  %4691 = load %Qubit*, %Qubit** %4690, align 8
  %4692 = add i64 %4675, -1
  %4693 = icmp sgt i64 %4692, -1
  br label %quantum359

quantum359:                                       ; preds = %body__2.i.i29.i521.i
  tail call void @__quantum__qis__h__body(%Qubit* %4691)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4691, %Qubit* %4686)
  tail call void @__quantum__qis__t__body(%Qubit* %4686)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4681, %Qubit* %4686)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4691, %Qubit* %4681)
  tail call void @__quantum__qis__t__adj(%Qubit* %4691)
  tail call void @__quantum__qis__t__body(%Qubit* %4681)
  tail call void @__quantum__qis__t__adj(%Qubit* %4686)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4681, %Qubit* %4686)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4691, %Qubit* %4681)
  tail call void @__quantum__qis__h__body(%Qubit* %4691)
  br label %readout358

readout358:                                       ; preds = %quantum359
  br label %post-classical357

post-classical357:                                ; preds = %readout358
  br label %exit_quantum_grouping360

exit_quantum_grouping360:                         ; preds = %post-classical357
  br i1 %4693, label %body__2.i.i29.i521.i, label %exit__2.i.i30.i522.i

exit__2.i.i30.i522.i:                             ; preds = %exit_quantum_grouping360, %__quantum__rt__array_update_reference_count.exit5.i.i24.i516.i
  %4694 = load i64, i64* %4554, align 8
  %4695 = add nsw i64 %4694, -1
  store i64 %4695, i64* %4554, align 8
  %4696 = load i64, i64* %4646, align 8
  %4697 = add nsw i64 %4696, -1
  store i64 %4697, i64* %4646, align 8
  %4698 = load i64, i64* %4661, align 8
  %4699 = add nsw i64 %4698, -1
  store i64 %4699, i64* %4661, align 8
  %4700 = icmp slt i64 %4698, 2
  br i1 %4700, label %4701, label %__quantum__rt__array_update_reference_count.exit6.i.i32.i524.i

4701:                                             ; preds = %exit__2.i.i30.i522.i
  tail call void @free(i8* nonnull %4644) #2
  %.pre.i.i31.i523.i = load i64, i64* %4661, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i32.i524.i

__quantum__rt__array_update_reference_count.exit6.i.i32.i524.i: ; preds = %4701, %exit__2.i.i30.i522.i
  %4702 = phi i64 [ %4699, %exit__2.i.i30.i522.i ], [ %.pre.i.i31.i523.i, %4701 ]
  %4703 = add nsw i64 %4702, -1
  store i64 %4703, i64* %4661, align 8
  %4704 = icmp slt i64 %4702, 2
  br i1 %4704, label %4705, label %__quantum__rt__array_update_reference_count.exit7.i.i33.i525.i

4705:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i32.i524.i
  tail call void @free(i8* nonnull %4644) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i33.i525.i

__quantum__rt__array_update_reference_count.exit7.i.i33.i525.i: ; preds = %4705, %__quantum__rt__array_update_reference_count.exit6.i.i32.i524.i
  %4706 = load i64, i64* %4652, align 8
  %4707 = add nsw i64 %4706, -1
  store i64 %4707, i64* %4652, align 8
  %4708 = icmp slt i64 %4706, 2
  br i1 %4708, label %4709, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i526.i

4709:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i33.i525.i
  tail call void @free(i8* nonnull %4649) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i526.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i526.i: ; preds = %4709, %__quantum__rt__array_update_reference_count.exit7.i.i33.i525.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i9.i501.i)
  %4710 = load i32, i32* %4525, align 4
  %4711 = add nsw i32 %4710, -1
  store i32 %4711, i32* %4525, align 4
  %4712 = load i64, i64* %4545, align 8
  %4713 = add nsw i64 %4712, -1
  store i64 %4713, i64* %4545, align 8
  %4714 = load i32, i32* %4523, align 8
  %4715 = add nsw i32 %4714, -1
  store i32 %4715, i32* %4523, align 8
  %4716 = load i64, i64* %4473, align 8
  %4717 = add nsw i64 %4716, -1
  store i64 %4717, i64* %4473, align 8
  %4718 = icmp slt i64 %4716, 2
  br i1 %4718, label %4719, label %__quantum__rt__array_update_reference_count.exit1.i35.i527.i

4719:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i526.i
  tail call void @free(i8* nonnull %4468) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i35.i527.i

__quantum__rt__array_update_reference_count.exit1.i35.i527.i: ; preds = %4719, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i526.i
  %4720 = load i64, i64* %4530, align 8
  %4721 = add nsw i64 %4720, -1
  store i64 %4721, i64* %4530, align 8
  %4722 = icmp slt i64 %4720, 2
  br i1 %4722, label %4723, label %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i

4723:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i35.i527.i
  tail call void @free(i8* nonnull %4527) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i: ; preds = %4723, %__quantum__rt__array_update_reference_count.exit1.i35.i527.i, %exit_quantum_grouping352, %exit_quantum_grouping348, %exit_quantum_grouping344
  %4724 = load i64, i64* %4475, align 8
  %4725 = add nsw i64 %4724, -1
  store i64 %4725, i64* %4475, align 8
  %4726 = load i64, i64* %4473, align 8
  %4727 = add nsw i64 %4726, -1
  store i64 %4727, i64* %4473, align 8
  %4728 = icmp slt i64 %4726, 2
  br i1 %4728, label %4729, label %ConstArrayReduction__Meas2__body.48.exit.i

4729:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i
  tail call void @free(i8* nonnull %4468) #2
  br label %ConstArrayReduction__Meas2__body.48.exit.i

ConstArrayReduction__Meas2__body.48.exit.i:       ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.50.exit.i.i, %4729
  %4730 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4731 = bitcast i8* %4730 to i64*
  %4732 = getelementptr inbounds i8, i8* %4730, i64 8
  %4733 = bitcast i8* %4732 to i64*
  %4734 = getelementptr inbounds i8, i8* %4730, i64 16
  %4735 = bitcast i8* %4734 to i64*
  %4736 = getelementptr inbounds i8, i8* %4730, i64 24
  %4737 = bitcast i8* %4736 to i64*
  store i64 8, i64* %4731, align 8
  store i64 1, i64* %4733, align 8
  store i64 1, i64* %4735, align 8
  store i64 0, i64* %4737, align 8
  %4738 = getelementptr inbounds i8, i8* %4730, i64 32
  %4739 = bitcast i8* %4738 to %Qubit**
  store %Qubit* inttoptr (i64 15 to %Qubit*), %Qubit** %4739, align 8
  %4740 = load i64, i64* %4737, align 8
  %4741 = add nsw i64 %4740, 1
  store i64 %4741, i64* %4737, align 8
  %4742 = load i64, i64* %4733, align 8
  br label %quantum459

quantum459:                                       ; preds = %ConstArrayReduction__Meas2__body.48.exit.i
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*), %Result* nonnull inttoptr (i64 14 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 14 to %Qubit*))
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  br label %readout458

readout458:                                       ; preds = %quantum459
  %4743 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 14 to %Result*))
  br label %post-classical457

post-classical457:                                ; preds = %readout458
  br label %exit_quantum_grouping460

exit_quantum_grouping460:                         ; preds = %post-classical457
  switch i64 %4742, label %else__1.i.i532.i [
    i64 0, label %then0__1.i.i528.i
    i64 1, label %then1__1.i.i530.i
    i64 2, label %then2__1.i.i531.i
  ]

then0__1.i.i528.i:                                ; preds = %exit_quantum_grouping460
  br label %quantum363

quantum363:                                       ; preds = %then0__1.i.i528.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout362

readout362:                                       ; preds = %quantum363
  br label %post-classical361

post-classical361:                                ; preds = %readout362
  br label %exit_quantum_grouping364

exit_quantum_grouping364:                         ; preds = %post-classical361
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i

then1__1.i.i530.i:                                ; preds = %exit_quantum_grouping460
  %4744 = load %Qubit*, %Qubit** %4739, align 8
  br label %quantum367

quantum367:                                       ; preds = %then1__1.i.i530.i
  tail call void @__quantum__qis__cz__body(%Qubit* %4744, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %readout366

readout366:                                       ; preds = %quantum367
  br label %post-classical365

post-classical365:                                ; preds = %readout366
  br label %exit_quantum_grouping368

exit_quantum_grouping368:                         ; preds = %post-classical365
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i

then2__1.i.i531.i:                                ; preds = %exit_quantum_grouping460
  %4745 = bitcast i8* %4730 to %Array*
  %4746 = bitcast %Array* %4745 to i64*
  %4747 = load %Qubit*, %Qubit** %4739, align 8
  %4748 = load i64, i64* %4746, align 8
  %4749 = getelementptr inbounds i8, i8* %4730, i64 %4748
  %4750 = getelementptr inbounds i8, i8* %4749, i64 32
  %4751 = bitcast i8* %4750 to %Qubit**
  %4752 = load %Qubit*, %Qubit** %4751, align 8
  %4753 = load %Qubit*, %Qubit** %4739, align 8
  %4754 = load %Qubit*, %Qubit** %4739, align 8
  %4755 = load i64, i64* %4746, align 8
  %4756 = getelementptr inbounds i8, i8* %4730, i64 %4755
  %4757 = getelementptr inbounds i8, i8* %4756, i64 32
  %4758 = bitcast i8* %4757 to %Qubit**
  %4759 = load %Qubit*, %Qubit** %4758, align 8
  %4760 = load i64, i64* %4746, align 8
  %4761 = getelementptr inbounds i8, i8* %4730, i64 %4760
  %4762 = getelementptr inbounds i8, i8* %4761, i64 32
  %4763 = bitcast i8* %4762 to %Qubit**
  %4764 = load %Qubit*, %Qubit** %4763, align 8
  %4765 = load %Qubit*, %Qubit** %4739, align 8
  %4766 = load %Qubit*, %Qubit** %4739, align 8
  %4767 = load i64, i64* %4746, align 8
  %4768 = getelementptr inbounds i8, i8* %4730, i64 %4767
  %4769 = getelementptr inbounds i8, i8* %4768, i64 32
  %4770 = bitcast i8* %4769 to %Qubit**
  %4771 = load %Qubit*, %Qubit** %4770, align 8
  %4772 = load %Qubit*, %Qubit** %4739, align 8
  %4773 = load %Qubit*, %Qubit** %4739, align 8
  %4774 = load i64, i64* %4746, align 8
  %4775 = getelementptr inbounds i8, i8* %4730, i64 %4774
  %4776 = getelementptr inbounds i8, i8* %4775, i64 32
  %4777 = bitcast i8* %4776 to %Qubit**
  %4778 = load %Qubit*, %Qubit** %4777, align 8
  %4779 = load %Qubit*, %Qubit** %4739, align 8
  br label %quantum371

quantum371:                                       ; preds = %then2__1.i.i531.i
  tail call void @__quantum__qis__t__adj(%Qubit* %4747)
  tail call void @__quantum__qis__t__adj(%Qubit* %4752)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %4753)
  tail call void @__quantum__qis__t__body(%Qubit* %4754)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4759, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %4764, %Qubit* %4765)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %4766)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4771, %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* %4772)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %4773)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4778, %Qubit* %4779)
  br label %readout370

readout370:                                       ; preds = %quantum371
  br label %post-classical369

post-classical369:                                ; preds = %readout370
  br label %exit_quantum_grouping372

exit_quantum_grouping372:                         ; preds = %post-classical369
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i

else__1.i.i532.i:                                 ; preds = %exit_quantum_grouping460
  %4780 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %4781 = bitcast i8* %4780 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %4781, align 8
  %4782 = getelementptr inbounds i8, i8* %4780, i64 8
  %4783 = getelementptr inbounds i8, i8* %4780, i64 16
  %4784 = bitcast i8* %4783 to i8**
  %4785 = getelementptr inbounds i8, i8* %4780, i64 24
  %4786 = bitcast i8* %4785 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %4782, i8 0, i64 16, i1 false)
  store i32 1, i32* %4786, align 8
  %4787 = getelementptr inbounds i8, i8* %4780, i64 28
  %4788 = bitcast i8* %4787 to i32*
  store i32 0, i32* %4788, align 4
  %4789 = bitcast i8* %4780 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %4789)
  %4790 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4791 = bitcast i8* %4790 to i64*
  %4792 = getelementptr inbounds i8, i8* %4790, i64 8
  %4793 = bitcast i8* %4792 to i64*
  %4794 = getelementptr inbounds i8, i8* %4790, i64 16
  %4795 = bitcast i8* %4794 to i64*
  store i64 16, i64* %4791, align 8
  store i64 1, i64* %4793, align 8
  store i64 0, i64* %4795, align 8
  %4796 = getelementptr inbounds i8, i8* %4790, i64 24
  %4797 = bitcast i8* %4796 to %Tuple*
  %4798 = bitcast %Tuple* %4797 to { %Array*, %Qubit* }*
  %4799 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4798, i64 0, i32 1
  %4800 = load i64, i64* %4735, align 8
  %4801 = add nsw i64 %4800, 1
  store i64 %4801, i64* %4735, align 8
  %4802 = icmp slt i64 %4800, 0
  br i1 %4802, label %4803, label %__quantum__rt__array_update_reference_count.exit.i.i538.i

4803:                                             ; preds = %else__1.i.i532.i
  tail call void @free(i8* nonnull %4730) #2
  br label %__quantum__rt__array_update_reference_count.exit.i.i538.i

__quantum__rt__array_update_reference_count.exit.i.i538.i: ; preds = %4803, %else__1.i.i532.i
  %4804 = bitcast %Tuple* %4797 to i8**
  store i8* %4730, i8** %4804, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %4799, align 8
  %4805 = load i32, i32* %4788, align 4
  %4806 = add nsw i32 %4805, 1
  store i32 %4806, i32* %4788, align 4
  %controls8.i.i.i533.i = load i8*, i8** %4804, align 8
  %4807 = getelementptr inbounds i8, i8* %controls8.i.i.i533.i, i64 24
  %4808 = bitcast i8* %4807 to i64*
  %4809 = load i64, i64* %4808, align 8
  %4810 = add nsw i64 %4809, 1
  store i64 %4810, i64* %4808, align 8
  %4811 = bitcast %Qubit** %4799 to i64*
  %arg1.i.i.i534.i = load i64, i64* %4811, align 8
  %4812 = getelementptr inbounds i8, i8* %controls8.i.i.i533.i, i64 8
  %4813 = bitcast i8* %4812 to i64*
  %4814 = load i64, i64* %4813, align 8
  %numControlPairs.i.i.i535.i = sdiv i64 %4814, 2
  %temps.i.i.i536.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i.i535.i)
  %4815 = bitcast %Array* %temps.i.i.i536.i to i8*
  %4816 = getelementptr inbounds i8, i8* %4815, i64 24
  %4817 = bitcast i8* %4816 to i64*
  %4818 = load i64, i64* %4817, align 8
  %4819 = add nsw i64 %4818, 1
  store i64 %4819, i64* %4817, align 8
  %.not.not9.i.i.i537.i = icmp sgt i64 %4814, 1
  br i1 %.not.not9.i.i.i537.i, label %body__1.lr.ph.i.i.i539.i, label %exit__1.i.i.i543.i

body__1.lr.ph.i.i.i539.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit.i.i538.i
  %4820 = bitcast i8* %controls8.i.i.i533.i to i64*
  %4821 = bitcast %Array* %temps.i.i.i536.i to i64*
  %4822 = getelementptr inbounds i8, i8* %controls8.i.i.i533.i, i64 32
  %4823 = getelementptr inbounds i8, i8* %4815, i64 32
  br label %body__1.i.i.i542.i

body__1.i.i.i542.i:                               ; preds = %body__1.lr.ph.i.i.i539.i, %exit_quantum_grouping376
  %4824 = phi i64 [ 0, %body__1.lr.ph.i.i.i539.i ], [ %4841, %exit_quantum_grouping376 ]
  %4825 = shl nuw i64 %4824, 1
  %4826 = load i64, i64* %4820, align 8
  %4827 = mul nsw i64 %4826, %4825
  %4828 = getelementptr inbounds i8, i8* %4822, i64 %4827
  %4829 = bitcast i8* %4828 to %Qubit**
  %4830 = load %Qubit*, %Qubit** %4829, align 8
  %4831 = or i64 %4825, 1
  %4832 = mul nsw i64 %4831, %4826
  %4833 = getelementptr inbounds i8, i8* %4822, i64 %4832
  %4834 = bitcast i8* %4833 to %Qubit**
  %4835 = load %Qubit*, %Qubit** %4834, align 8
  %4836 = load i64, i64* %4821, align 8
  %4837 = mul nsw i64 %4836, %4824
  %4838 = getelementptr inbounds i8, i8* %4823, i64 %4837
  %4839 = bitcast i8* %4838 to %Qubit**
  %4840 = load %Qubit*, %Qubit** %4839, align 8
  %4841 = add nuw nsw i64 %4824, 1
  %4842 = icmp eq i64 %4841, %numControlPairs.i.i.i535.i
  br label %quantum375

quantum375:                                       ; preds = %body__1.i.i.i542.i
  tail call void @__quantum__qis__h__body(%Qubit* %4840)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4840, %Qubit* %4830)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4830, %Qubit* %4835)
  tail call void @__quantum__qis__t__body(%Qubit* %4835)
  tail call void @__quantum__qis__t__adj(%Qubit* %4830)
  tail call void @__quantum__qis__t__body(%Qubit* %4840)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4840, %Qubit* %4830)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4830, %Qubit* %4835)
  tail call void @__quantum__qis__t__adj(%Qubit* %4835)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4840, %Qubit* %4835)
  tail call void @__quantum__qis__h__body(%Qubit* %4840)
  br label %readout374

readout374:                                       ; preds = %quantum375
  br label %post-classical373

post-classical373:                                ; preds = %readout374
  br label %exit_quantum_grouping376

exit_quantum_grouping376:                         ; preds = %post-classical373
  br i1 %4842, label %exit__1.i.i.i543.i, label %body__1.i.i.i542.i

exit__1.i.i.i543.i:                               ; preds = %exit_quantum_grouping376, %__quantum__rt__array_update_reference_count.exit.i.i538.i
  %4843 = and i64 %4814, 1
  %4844 = icmp eq i64 %4843, 0
  br i1 %4844, label %condTrue__1.i.i.i544.i, label %condFalse__1.i.i.i546.i

condTrue__1.i.i.i544.i:                           ; preds = %exit__1.i.i.i543.i
  %4845 = getelementptr inbounds i8, i8* %4815, i64 16
  %4846 = bitcast i8* %4845 to i64*
  %4847 = load i64, i64* %4846, align 8
  %4848 = add nsw i64 %4847, 1
  store i64 %4848, i64* %4846, align 8
  %4849 = icmp slt i64 %4847, 0
  br i1 %4849, label %4850, label %condContinue__1.i.i.i550.i

4850:                                             ; preds = %condTrue__1.i.i.i544.i
  tail call void @free(i8* nonnull %4815) #2
  br label %condContinue__1.i.i.i550.i

condFalse__1.i.i.i546.i:                          ; preds = %exit__1.i.i.i543.i
  %4851 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4852 = bitcast i8* %4851 to i64*
  %4853 = getelementptr inbounds i8, i8* %4851, i64 8
  %4854 = bitcast i8* %4853 to i64*
  %4855 = getelementptr inbounds i8, i8* %4851, i64 16
  %4856 = bitcast i8* %4855 to i64*
  %4857 = getelementptr inbounds i8, i8* %4851, i64 24
  %4858 = bitcast i8* %4857 to i64*
  store i64 8, i64* %4852, align 8
  store i64 1, i64* %4854, align 8
  store i64 1, i64* %4856, align 8
  store i64 0, i64* %4858, align 8
  %4859 = getelementptr inbounds i8, i8* %4851, i64 32
  %4860 = add i64 %4814, -1
  %4861 = bitcast i8* %controls8.i.i.i533.i to i64*
  %4862 = load i64, i64* %4861, align 8
  %4863 = mul nsw i64 %4862, %4860
  %4864 = getelementptr inbounds i8, i8* %controls8.i.i.i533.i, i64 %4863
  %4865 = getelementptr inbounds i8, i8* %4864, i64 32
  %4866 = bitcast i8* %4865 to i64*
  %4867 = load i64, i64* %4866, align 8
  %4868 = bitcast i8* %4859 to i64*
  store i64 %4867, i64* %4868, align 8
  %4869 = bitcast %Array* %temps.i.i.i536.i to i64*
  %4870 = load i64, i64* %4869, align 8
  %4871 = getelementptr inbounds i8, i8* %4815, i64 8
  %4872 = bitcast i8* %4871 to i64*
  %4873 = load i64, i64* %4872, align 8
  %4874 = load i64, i64* %4854, align 8
  %4875 = getelementptr inbounds i8, i8* %4815, i64 32
  %4876 = add nsw i64 %4874, %4873
  %sext.i.i.i.i545.i = shl i64 %4870, 32
  %4877 = ashr exact i64 %sext.i.i.i.i545.i, 32
  %4878 = mul nsw i64 %4876, %4877
  %4879 = add i64 %4878, 32
  %4880 = tail call i8* @malloc(i64 %4879) #5
  %4881 = bitcast i8* %4880 to i64*
  %4882 = getelementptr inbounds i8, i8* %4880, i64 8
  %4883 = bitcast i8* %4882 to i64*
  %4884 = getelementptr inbounds i8, i8* %4880, i64 16
  %4885 = bitcast i8* %4884 to i64*
  %4886 = getelementptr inbounds i8, i8* %4880, i64 24
  %4887 = bitcast i8* %4886 to i64*
  store i64 %4877, i64* %4881, align 8
  store i64 %4876, i64* %4883, align 8
  store i64 1, i64* %4885, align 8
  store i64 0, i64* %4887, align 8
  %4888 = getelementptr inbounds i8, i8* %4880, i64 32
  %4889 = mul nsw i64 %4873, %4870
  %4890 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4888, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4888, i8* nonnull align 1 %4875, i64 %4889, i1 false) #2
  %4891 = getelementptr inbounds i8, i8* %4888, i64 %4889
  %4892 = mul nsw i64 %4874, %4870
  %4893 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %4891, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4891, i8* nonnull align 1 %4859, i64 %4892, i1 false) #2
  %4894 = bitcast i8* %4880 to %Array*
  %4895 = load i64, i64* %4885, align 8
  %4896 = add nsw i64 %4895, 1
  store i64 %4896, i64* %4885, align 8
  %4897 = icmp slt i64 %4895, 0
  br i1 %4897, label %4898, label %__quantum__rt__array_update_reference_count.exit2.i.i.i547.i

4898:                                             ; preds = %condFalse__1.i.i.i546.i
  tail call void @free(i8* nonnull %4880) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i.i547.i

__quantum__rt__array_update_reference_count.exit2.i.i.i547.i: ; preds = %4898, %condFalse__1.i.i.i546.i
  %4899 = load i64, i64* %4856, align 8
  %4900 = add nsw i64 %4899, -1
  store i64 %4900, i64* %4856, align 8
  %4901 = icmp slt i64 %4899, 2
  br i1 %4901, label %4902, label %__quantum__rt__array_update_reference_count.exit3.i.i.i548.i

4902:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i.i547.i
  tail call void @free(i8* nonnull %4851) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i.i548.i

__quantum__rt__array_update_reference_count.exit3.i.i.i548.i: ; preds = %4902, %__quantum__rt__array_update_reference_count.exit2.i.i.i547.i
  %4903 = load i64, i64* %4885, align 8
  %4904 = add nsw i64 %4903, -1
  store i64 %4904, i64* %4885, align 8
  %4905 = icmp slt i64 %4903, 2
  br i1 %4905, label %4906, label %condContinue__1.i.i.i550.i

4906:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i.i548.i
  tail call void @free(i8* nonnull %4880) #2
  br label %condContinue__1.i.i.i550.i

condContinue__1.i.i.i550.i:                       ; preds = %4906, %__quantum__rt__array_update_reference_count.exit3.i.i.i548.i, %4850, %condTrue__1.i.i.i544.i
  %__qsVar1__newControls__.i.i.i549.i = phi %Array* [ %temps.i.i.i536.i, %condTrue__1.i.i.i544.i ], [ %temps.i.i.i536.i, %4850 ], [ %4894, %__quantum__rt__array_update_reference_count.exit3.i.i.i548.i ], [ %4894, %4906 ]
  %4907 = bitcast %Array* %__qsVar1__newControls__.i.i.i549.i to i8*
  %4908 = getelementptr inbounds i8, i8* %4907, i64 24
  %4909 = bitcast i8* %4908 to i64*
  %4910 = load i64, i64* %4909, align 8
  %4911 = add nsw i64 %4910, 1
  store i64 %4911, i64* %4909, align 8
  %4912 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4913 = bitcast i8* %4912 to i64*
  %4914 = getelementptr inbounds i8, i8* %4912, i64 8
  %4915 = bitcast i8* %4914 to i64*
  %4916 = getelementptr inbounds i8, i8* %4912, i64 16
  %4917 = bitcast i8* %4916 to i64*
  store i64 16, i64* %4913, align 8
  store i64 1, i64* %4915, align 8
  store i64 0, i64* %4917, align 8
  %4918 = getelementptr inbounds i8, i8* %4912, i64 24
  %4919 = bitcast i8* %4918 to %Tuple*
  %4920 = bitcast %Tuple* %4919 to { %Array*, %Qubit* }*
  %4921 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4920, i64 0, i32 0
  %4922 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %4920, i64 0, i32 1
  %4923 = getelementptr inbounds i8, i8* %4907, i64 16
  %4924 = bitcast i8* %4923 to i64*
  %4925 = load i64, i64* %4924, align 8
  %4926 = add nsw i64 %4925, 1
  store i64 %4926, i64* %4924, align 8
  %4927 = icmp slt i64 %4925, 0
  br i1 %4927, label %4928, label %__quantum__rt__array_update_reference_count.exit5.i.i.i551.i

4928:                                             ; preds = %condContinue__1.i.i.i550.i
  tail call void @free(i8* nonnull %4907) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i.i551.i

__quantum__rt__array_update_reference_count.exit5.i.i.i551.i: ; preds = %4928, %condContinue__1.i.i.i550.i
  store %Array* %__qsVar1__newControls__.i.i.i549.i, %Array** %4921, align 8
  %4929 = bitcast %Qubit** %4922 to i64*
  store i64 %arg1.i.i.i534.i, i64* %4929, align 8
  %4930 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %4781, align 8
  %4931 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %4930, i64 0, i64 0
  %4932 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %4931, align 8
  %4933 = load i8*, i8** %4784, align 8
  tail call void %4932(i8* %4933, i8* nonnull %4918, i8* null)
  br i1 %.not.not9.i.i.i537.i, label %body__2.lr.ph.i.i.i553.i, label %exit__2.i.i.i557.i

body__2.lr.ph.i.i.i553.i:                         ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i.i551.i
  %__qsVar0____qsVar0__numPair____11.i.i.i552.i = add nsw i64 %numControlPairs.i.i.i535.i, -1
  %4934 = bitcast i8* %controls8.i.i.i533.i to i64*
  %4935 = bitcast %Array* %temps.i.i.i536.i to i64*
  %4936 = getelementptr inbounds i8, i8* %controls8.i.i.i533.i, i64 32
  %4937 = getelementptr inbounds i8, i8* %4815, i64 32
  br label %body__2.i.i.i556.i

body__2.i.i.i556.i:                               ; preds = %body__2.lr.ph.i.i.i553.i, %exit_quantum_grouping380
  %4938 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i.i552.i, %body__2.lr.ph.i.i.i553.i ], [ %4955, %exit_quantum_grouping380 ]
  %4939 = shl nuw i64 %4938, 1
  %4940 = load i64, i64* %4934, align 8
  %4941 = mul nsw i64 %4940, %4939
  %4942 = getelementptr inbounds i8, i8* %4936, i64 %4941
  %4943 = bitcast i8* %4942 to %Qubit**
  %4944 = load %Qubit*, %Qubit** %4943, align 8
  %4945 = or i64 %4939, 1
  %4946 = mul nsw i64 %4945, %4940
  %4947 = getelementptr inbounds i8, i8* %4936, i64 %4946
  %4948 = bitcast i8* %4947 to %Qubit**
  %4949 = load %Qubit*, %Qubit** %4948, align 8
  %4950 = load i64, i64* %4935, align 8
  %4951 = mul nsw i64 %4950, %4938
  %4952 = getelementptr inbounds i8, i8* %4937, i64 %4951
  %4953 = bitcast i8* %4952 to %Qubit**
  %4954 = load %Qubit*, %Qubit** %4953, align 8
  %4955 = add i64 %4938, -1
  %4956 = icmp sgt i64 %4955, -1
  br label %quantum379

quantum379:                                       ; preds = %body__2.i.i.i556.i
  tail call void @__quantum__qis__h__body(%Qubit* %4954)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4954, %Qubit* %4949)
  tail call void @__quantum__qis__t__body(%Qubit* %4949)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4944, %Qubit* %4949)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4954, %Qubit* %4944)
  tail call void @__quantum__qis__t__adj(%Qubit* %4954)
  tail call void @__quantum__qis__t__body(%Qubit* %4944)
  tail call void @__quantum__qis__t__adj(%Qubit* %4949)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4944, %Qubit* %4949)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4954, %Qubit* %4944)
  tail call void @__quantum__qis__h__body(%Qubit* %4954)
  br label %readout378

readout378:                                       ; preds = %quantum379
  br label %post-classical377

post-classical377:                                ; preds = %readout378
  br label %exit_quantum_grouping380

exit_quantum_grouping380:                         ; preds = %post-classical377
  br i1 %4956, label %body__2.i.i.i556.i, label %exit__2.i.i.i557.i

exit__2.i.i.i557.i:                               ; preds = %exit_quantum_grouping380, %__quantum__rt__array_update_reference_count.exit5.i.i.i551.i
  %4957 = load i64, i64* %4817, align 8
  %4958 = add nsw i64 %4957, -1
  store i64 %4958, i64* %4817, align 8
  %4959 = load i64, i64* %4909, align 8
  %4960 = add nsw i64 %4959, -1
  store i64 %4960, i64* %4909, align 8
  %4961 = load i64, i64* %4924, align 8
  %4962 = add nsw i64 %4961, -1
  store i64 %4962, i64* %4924, align 8
  %4963 = icmp slt i64 %4961, 2
  br i1 %4963, label %4964, label %__quantum__rt__array_update_reference_count.exit6.i.i.i559.i

4964:                                             ; preds = %exit__2.i.i.i557.i
  tail call void @free(i8* nonnull %4907) #2
  %.pre.i.i.i558.i = load i64, i64* %4924, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i.i559.i

__quantum__rt__array_update_reference_count.exit6.i.i.i559.i: ; preds = %4964, %exit__2.i.i.i557.i
  %4965 = phi i64 [ %4962, %exit__2.i.i.i557.i ], [ %.pre.i.i.i558.i, %4964 ]
  %4966 = add nsw i64 %4965, -1
  store i64 %4966, i64* %4924, align 8
  %4967 = icmp slt i64 %4965, 2
  br i1 %4967, label %4968, label %__quantum__rt__array_update_reference_count.exit7.i.i.i560.i

4968:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i.i559.i
  tail call void @free(i8* nonnull %4907) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i.i560.i

__quantum__rt__array_update_reference_count.exit7.i.i.i560.i: ; preds = %4968, %__quantum__rt__array_update_reference_count.exit6.i.i.i559.i
  %4969 = load i64, i64* %4915, align 8
  %4970 = add nsw i64 %4969, -1
  store i64 %4970, i64* %4915, align 8
  %4971 = icmp slt i64 %4969, 2
  br i1 %4971, label %4972, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i561.i

4972:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i.i560.i
  tail call void @free(i8* nonnull %4912) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i561.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i561.i: ; preds = %4972, %__quantum__rt__array_update_reference_count.exit7.i.i.i560.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i.i536.i)
  %4973 = load i32, i32* %4788, align 4
  %4974 = add nsw i32 %4973, -1
  store i32 %4974, i32* %4788, align 4
  %4975 = load i64, i64* %4808, align 8
  %4976 = add nsw i64 %4975, -1
  store i64 %4976, i64* %4808, align 8
  %4977 = load i32, i32* %4786, align 8
  %4978 = add nsw i32 %4977, -1
  store i32 %4978, i32* %4786, align 8
  %4979 = load i64, i64* %4735, align 8
  %4980 = add nsw i64 %4979, -1
  store i64 %4980, i64* %4735, align 8
  %4981 = icmp slt i64 %4979, 2
  br i1 %4981, label %4982, label %__quantum__rt__array_update_reference_count.exit1.i.i562.i

4982:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i561.i
  tail call void @free(i8* nonnull %4730) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i.i562.i

__quantum__rt__array_update_reference_count.exit1.i.i562.i: ; preds = %4982, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i.i561.i
  %4983 = load i64, i64* %4793, align 8
  %4984 = add nsw i64 %4983, -1
  store i64 %4984, i64* %4793, align 8
  %4985 = icmp slt i64 %4983, 2
  br i1 %4985, label %4986, label %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i

4986:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i.i562.i
  tail call void @free(i8* nonnull %4790) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i: ; preds = %4986, %__quantum__rt__array_update_reference_count.exit1.i.i562.i, %exit_quantum_grouping372, %exit_quantum_grouping368, %exit_quantum_grouping364
  %4987 = load i64, i64* %4737, align 8
  %4988 = add nsw i64 %4987, -1
  store i64 %4988, i64* %4737, align 8
  %4989 = load i64, i64* %4735, align 8
  %4990 = add nsw i64 %4989, -1
  store i64 %4990, i64* %4735, align 8
  %4991 = icmp slt i64 %4989, 2
  br i1 %4991, label %4992, label %Microsoft__Quantum__Canon__CZ__body.exit.i563.i

4992:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i
  tail call void @free(i8* nonnull %4730) #2
  br label %Microsoft__Quantum__Canon__CZ__body.exit.i563.i

Microsoft__Quantum__Canon__CZ__body.exit.i563.i:  ; preds = %4992, %Microsoft__Quantum__Intrinsic__Z__ctl.52.exit.i.i
  %4993 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %4994 = bitcast i8* %4993 to i64*
  %4995 = getelementptr inbounds i8, i8* %4993, i64 8
  %4996 = bitcast i8* %4995 to i64*
  %4997 = getelementptr inbounds i8, i8* %4993, i64 16
  %4998 = bitcast i8* %4997 to i64*
  %4999 = getelementptr inbounds i8, i8* %4993, i64 24
  %5000 = bitcast i8* %4999 to i64*
  store i64 8, i64* %4994, align 8
  store i64 1, i64* %4996, align 8
  store i64 1, i64* %4998, align 8
  store i64 0, i64* %5000, align 8
  %5001 = getelementptr inbounds i8, i8* %4993, i64 32
  %5002 = bitcast i8* %5001 to %Qubit**
  store %Qubit* inttoptr (i64 15 to %Qubit*), %Qubit** %5002, align 8
  %5003 = load i64, i64* %5000, align 8
  %5004 = add nsw i64 %5003, 1
  store i64 %5004, i64* %5000, align 8
  %5005 = load i64, i64* %4996, align 8
  switch i64 %5005, label %else__1.i5.i568.i [
    i64 0, label %then0__1.i1.i564.i
    i64 1, label %then1__1.i3.i566.i
    i64 2, label %then2__1.i4.i567.i
  ]

then0__1.i1.i564.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i563.i
  br label %quantum383

quantum383:                                       ; preds = %then0__1.i1.i564.i
  tail call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  br label %readout382

readout382:                                       ; preds = %quantum383
  br label %post-classical381

post-classical381:                                ; preds = %readout382
  br label %exit_quantum_grouping384

exit_quantum_grouping384:                         ; preds = %post-classical381
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i

then1__1.i3.i566.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i563.i
  %5006 = load %Qubit*, %Qubit** %5002, align 8
  br label %quantum387

quantum387:                                       ; preds = %then1__1.i3.i566.i
  tail call void @__quantum__qis__cz__body(%Qubit* %5006, %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  br label %readout386

readout386:                                       ; preds = %quantum387
  br label %post-classical385

post-classical385:                                ; preds = %readout386
  br label %exit_quantum_grouping388

exit_quantum_grouping388:                         ; preds = %post-classical385
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i

then2__1.i4.i567.i:                               ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i563.i
  %5007 = bitcast i8* %4993 to %Array*
  %5008 = bitcast %Array* %5007 to i64*
  %5009 = load %Qubit*, %Qubit** %5002, align 8
  %5010 = load i64, i64* %5008, align 8
  %5011 = getelementptr inbounds i8, i8* %4993, i64 %5010
  %5012 = getelementptr inbounds i8, i8* %5011, i64 32
  %5013 = bitcast i8* %5012 to %Qubit**
  %5014 = load %Qubit*, %Qubit** %5013, align 8
  %5015 = load %Qubit*, %Qubit** %5002, align 8
  %5016 = load %Qubit*, %Qubit** %5002, align 8
  %5017 = load i64, i64* %5008, align 8
  %5018 = getelementptr inbounds i8, i8* %4993, i64 %5017
  %5019 = getelementptr inbounds i8, i8* %5018, i64 32
  %5020 = bitcast i8* %5019 to %Qubit**
  %5021 = load %Qubit*, %Qubit** %5020, align 8
  %5022 = load i64, i64* %5008, align 8
  %5023 = getelementptr inbounds i8, i8* %4993, i64 %5022
  %5024 = getelementptr inbounds i8, i8* %5023, i64 32
  %5025 = bitcast i8* %5024 to %Qubit**
  %5026 = load %Qubit*, %Qubit** %5025, align 8
  %5027 = load %Qubit*, %Qubit** %5002, align 8
  %5028 = load %Qubit*, %Qubit** %5002, align 8
  %5029 = load i64, i64* %5008, align 8
  %5030 = getelementptr inbounds i8, i8* %4993, i64 %5029
  %5031 = getelementptr inbounds i8, i8* %5030, i64 32
  %5032 = bitcast i8* %5031 to %Qubit**
  %5033 = load %Qubit*, %Qubit** %5032, align 8
  %5034 = load %Qubit*, %Qubit** %5002, align 8
  %5035 = load %Qubit*, %Qubit** %5002, align 8
  %5036 = load i64, i64* %5008, align 8
  %5037 = getelementptr inbounds i8, i8* %4993, i64 %5036
  %5038 = getelementptr inbounds i8, i8* %5037, i64 32
  %5039 = bitcast i8* %5038 to %Qubit**
  %5040 = load %Qubit*, %Qubit** %5039, align 8
  %5041 = load %Qubit*, %Qubit** %5002, align 8
  br label %quantum391

quantum391:                                       ; preds = %then2__1.i4.i567.i
  tail call void @__quantum__qis__t__adj(%Qubit* %5009)
  tail call void @__quantum__qis__t__adj(%Qubit* %5014)
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Qubit* %5015)
  tail call void @__quantum__qis__t__body(%Qubit* %5016)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5021, %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* %5026, %Qubit* %5027)
  tail call void @__quantum__qis__t__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__t__adj(%Qubit* %5028)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5033, %Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Qubit* %5034)
  tail call void @__quantum__qis__t__adj(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__t__body(%Qubit* %5035)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5040, %Qubit* %5041)
  br label %readout390

readout390:                                       ; preds = %quantum391
  br label %post-classical389

post-classical389:                                ; preds = %readout390
  br label %exit_quantum_grouping392

exit_quantum_grouping392:                         ; preds = %post-classical389
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i

else__1.i5.i568.i:                                ; preds = %Microsoft__Quantum__Canon__CZ__body.exit.i563.i
  %5042 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %5043 = bitcast i8* %5042 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %5043, align 8
  %5044 = getelementptr inbounds i8, i8* %5042, i64 8
  %5045 = getelementptr inbounds i8, i8* %5042, i64 16
  %5046 = bitcast i8* %5045 to i8**
  %5047 = getelementptr inbounds i8, i8* %5042, i64 24
  %5048 = bitcast i8* %5047 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %5044, i8 0, i64 16, i1 false)
  store i32 1, i32* %5048, align 8
  %5049 = getelementptr inbounds i8, i8* %5042, i64 28
  %5050 = bitcast i8* %5049 to i32*
  store i32 0, i32* %5050, align 4
  %5051 = bitcast i8* %5042 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %5051)
  %5052 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %5053 = bitcast i8* %5052 to i64*
  %5054 = getelementptr inbounds i8, i8* %5052, i64 8
  %5055 = bitcast i8* %5054 to i64*
  %5056 = getelementptr inbounds i8, i8* %5052, i64 16
  %5057 = bitcast i8* %5056 to i64*
  store i64 16, i64* %5053, align 8
  store i64 1, i64* %5055, align 8
  store i64 0, i64* %5057, align 8
  %5058 = getelementptr inbounds i8, i8* %5052, i64 24
  %5059 = bitcast i8* %5058 to %Tuple*
  %5060 = bitcast %Tuple* %5059 to { %Array*, %Qubit* }*
  %5061 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %5060, i64 0, i32 1
  %5062 = load i64, i64* %4998, align 8
  %5063 = add nsw i64 %5062, 1
  store i64 %5063, i64* %4998, align 8
  %5064 = icmp slt i64 %5062, 0
  br i1 %5064, label %5065, label %__quantum__rt__array_update_reference_count.exit.i11.i574.i

5065:                                             ; preds = %else__1.i5.i568.i
  tail call void @free(i8* nonnull %4993) #2
  br label %__quantum__rt__array_update_reference_count.exit.i11.i574.i

__quantum__rt__array_update_reference_count.exit.i11.i574.i: ; preds = %5065, %else__1.i5.i568.i
  %5066 = bitcast %Tuple* %5059 to i8**
  store i8* %4993, i8** %5066, align 8
  store %Qubit* inttoptr (i64 3 to %Qubit*), %Qubit** %5061, align 8
  %5067 = load i32, i32* %5050, align 4
  %5068 = add nsw i32 %5067, 1
  store i32 %5068, i32* %5050, align 4
  %controls8.i.i6.i569.i = load i8*, i8** %5066, align 8
  %5069 = getelementptr inbounds i8, i8* %controls8.i.i6.i569.i, i64 24
  %5070 = bitcast i8* %5069 to i64*
  %5071 = load i64, i64* %5070, align 8
  %5072 = add nsw i64 %5071, 1
  store i64 %5072, i64* %5070, align 8
  %5073 = bitcast %Qubit** %5061 to i64*
  %arg1.i.i7.i570.i = load i64, i64* %5073, align 8
  %5074 = getelementptr inbounds i8, i8* %controls8.i.i6.i569.i, i64 8
  %5075 = bitcast i8* %5074 to i64*
  %5076 = load i64, i64* %5075, align 8
  %numControlPairs.i.i8.i571.i = sdiv i64 %5076, 2
  %temps.i.i9.i572.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i8.i571.i)
  %5077 = bitcast %Array* %temps.i.i9.i572.i to i8*
  %5078 = getelementptr inbounds i8, i8* %5077, i64 24
  %5079 = bitcast i8* %5078 to i64*
  %5080 = load i64, i64* %5079, align 8
  %5081 = add nsw i64 %5080, 1
  store i64 %5081, i64* %5079, align 8
  %.not.not9.i.i10.i573.i = icmp sgt i64 %5076, 1
  br i1 %.not.not9.i.i10.i573.i, label %body__1.lr.ph.i.i12.i575.i, label %exit__1.i.i16.i579.i

body__1.lr.ph.i.i12.i575.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit.i11.i574.i
  %5082 = bitcast i8* %controls8.i.i6.i569.i to i64*
  %5083 = bitcast %Array* %temps.i.i9.i572.i to i64*
  %5084 = getelementptr inbounds i8, i8* %controls8.i.i6.i569.i, i64 32
  %5085 = getelementptr inbounds i8, i8* %5077, i64 32
  br label %body__1.i.i15.i578.i

body__1.i.i15.i578.i:                             ; preds = %body__1.lr.ph.i.i12.i575.i, %exit_quantum_grouping396
  %5086 = phi i64 [ 0, %body__1.lr.ph.i.i12.i575.i ], [ %5103, %exit_quantum_grouping396 ]
  %5087 = shl nuw i64 %5086, 1
  %5088 = load i64, i64* %5082, align 8
  %5089 = mul nsw i64 %5088, %5087
  %5090 = getelementptr inbounds i8, i8* %5084, i64 %5089
  %5091 = bitcast i8* %5090 to %Qubit**
  %5092 = load %Qubit*, %Qubit** %5091, align 8
  %5093 = or i64 %5087, 1
  %5094 = mul nsw i64 %5093, %5088
  %5095 = getelementptr inbounds i8, i8* %5084, i64 %5094
  %5096 = bitcast i8* %5095 to %Qubit**
  %5097 = load %Qubit*, %Qubit** %5096, align 8
  %5098 = load i64, i64* %5083, align 8
  %5099 = mul nsw i64 %5098, %5086
  %5100 = getelementptr inbounds i8, i8* %5085, i64 %5099
  %5101 = bitcast i8* %5100 to %Qubit**
  %5102 = load %Qubit*, %Qubit** %5101, align 8
  %5103 = add nuw nsw i64 %5086, 1
  %5104 = icmp eq i64 %5103, %numControlPairs.i.i8.i571.i
  br label %quantum395

quantum395:                                       ; preds = %body__1.i.i15.i578.i
  tail call void @__quantum__qis__h__body(%Qubit* %5102)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5102, %Qubit* %5092)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5092, %Qubit* %5097)
  tail call void @__quantum__qis__t__body(%Qubit* %5097)
  tail call void @__quantum__qis__t__adj(%Qubit* %5092)
  tail call void @__quantum__qis__t__body(%Qubit* %5102)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5102, %Qubit* %5092)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5092, %Qubit* %5097)
  tail call void @__quantum__qis__t__adj(%Qubit* %5097)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5102, %Qubit* %5097)
  tail call void @__quantum__qis__h__body(%Qubit* %5102)
  br label %readout394

readout394:                                       ; preds = %quantum395
  br label %post-classical393

post-classical393:                                ; preds = %readout394
  br label %exit_quantum_grouping396

exit_quantum_grouping396:                         ; preds = %post-classical393
  br i1 %5104, label %exit__1.i.i16.i579.i, label %body__1.i.i15.i578.i

exit__1.i.i16.i579.i:                             ; preds = %exit_quantum_grouping396, %__quantum__rt__array_update_reference_count.exit.i11.i574.i
  %5105 = and i64 %5076, 1
  %5106 = icmp eq i64 %5105, 0
  br i1 %5106, label %condTrue__1.i.i17.i580.i, label %condFalse__1.i.i19.i582.i

condTrue__1.i.i17.i580.i:                         ; preds = %exit__1.i.i16.i579.i
  %5107 = getelementptr inbounds i8, i8* %5077, i64 16
  %5108 = bitcast i8* %5107 to i64*
  %5109 = load i64, i64* %5108, align 8
  %5110 = add nsw i64 %5109, 1
  store i64 %5110, i64* %5108, align 8
  %5111 = icmp slt i64 %5109, 0
  br i1 %5111, label %5112, label %condContinue__1.i.i23.i586.i

5112:                                             ; preds = %condTrue__1.i.i17.i580.i
  tail call void @free(i8* nonnull %5077) #2
  br label %condContinue__1.i.i23.i586.i

condFalse__1.i.i19.i582.i:                        ; preds = %exit__1.i.i16.i579.i
  %5113 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %5114 = bitcast i8* %5113 to i64*
  %5115 = getelementptr inbounds i8, i8* %5113, i64 8
  %5116 = bitcast i8* %5115 to i64*
  %5117 = getelementptr inbounds i8, i8* %5113, i64 16
  %5118 = bitcast i8* %5117 to i64*
  %5119 = getelementptr inbounds i8, i8* %5113, i64 24
  %5120 = bitcast i8* %5119 to i64*
  store i64 8, i64* %5114, align 8
  store i64 1, i64* %5116, align 8
  store i64 1, i64* %5118, align 8
  store i64 0, i64* %5120, align 8
  %5121 = getelementptr inbounds i8, i8* %5113, i64 32
  %5122 = add i64 %5076, -1
  %5123 = bitcast i8* %controls8.i.i6.i569.i to i64*
  %5124 = load i64, i64* %5123, align 8
  %5125 = mul nsw i64 %5124, %5122
  %5126 = getelementptr inbounds i8, i8* %controls8.i.i6.i569.i, i64 %5125
  %5127 = getelementptr inbounds i8, i8* %5126, i64 32
  %5128 = bitcast i8* %5127 to i64*
  %5129 = load i64, i64* %5128, align 8
  %5130 = bitcast i8* %5121 to i64*
  store i64 %5129, i64* %5130, align 8
  %5131 = bitcast %Array* %temps.i.i9.i572.i to i64*
  %5132 = load i64, i64* %5131, align 8
  %5133 = getelementptr inbounds i8, i8* %5077, i64 8
  %5134 = bitcast i8* %5133 to i64*
  %5135 = load i64, i64* %5134, align 8
  %5136 = load i64, i64* %5116, align 8
  %5137 = getelementptr inbounds i8, i8* %5077, i64 32
  %5138 = add nsw i64 %5136, %5135
  %sext.i.i.i18.i581.i = shl i64 %5132, 32
  %5139 = ashr exact i64 %sext.i.i.i18.i581.i, 32
  %5140 = mul nsw i64 %5138, %5139
  %5141 = add i64 %5140, 32
  %5142 = tail call i8* @malloc(i64 %5141) #5
  %5143 = bitcast i8* %5142 to i64*
  %5144 = getelementptr inbounds i8, i8* %5142, i64 8
  %5145 = bitcast i8* %5144 to i64*
  %5146 = getelementptr inbounds i8, i8* %5142, i64 16
  %5147 = bitcast i8* %5146 to i64*
  %5148 = getelementptr inbounds i8, i8* %5142, i64 24
  %5149 = bitcast i8* %5148 to i64*
  store i64 %5139, i64* %5143, align 8
  store i64 %5138, i64* %5145, align 8
  store i64 1, i64* %5147, align 8
  store i64 0, i64* %5149, align 8
  %5150 = getelementptr inbounds i8, i8* %5142, i64 32
  %5151 = mul nsw i64 %5135, %5132
  %5152 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %5150, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %5150, i8* nonnull align 1 %5137, i64 %5151, i1 false) #2
  %5153 = getelementptr inbounds i8, i8* %5150, i64 %5151
  %5154 = mul nsw i64 %5136, %5132
  %5155 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %5153, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %5153, i8* nonnull align 1 %5121, i64 %5154, i1 false) #2
  %5156 = bitcast i8* %5142 to %Array*
  %5157 = load i64, i64* %5147, align 8
  %5158 = add nsw i64 %5157, 1
  store i64 %5158, i64* %5147, align 8
  %5159 = icmp slt i64 %5157, 0
  br i1 %5159, label %5160, label %__quantum__rt__array_update_reference_count.exit2.i.i20.i583.i

5160:                                             ; preds = %condFalse__1.i.i19.i582.i
  tail call void @free(i8* nonnull %5142) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i20.i583.i

__quantum__rt__array_update_reference_count.exit2.i.i20.i583.i: ; preds = %5160, %condFalse__1.i.i19.i582.i
  %5161 = load i64, i64* %5118, align 8
  %5162 = add nsw i64 %5161, -1
  store i64 %5162, i64* %5118, align 8
  %5163 = icmp slt i64 %5161, 2
  br i1 %5163, label %5164, label %__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i

5164:                                             ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i20.i583.i
  tail call void @free(i8* nonnull %5113) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i

__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i: ; preds = %5164, %__quantum__rt__array_update_reference_count.exit2.i.i20.i583.i
  %5165 = load i64, i64* %5147, align 8
  %5166 = add nsw i64 %5165, -1
  store i64 %5166, i64* %5147, align 8
  %5167 = icmp slt i64 %5165, 2
  br i1 %5167, label %5168, label %condContinue__1.i.i23.i586.i

5168:                                             ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i
  tail call void @free(i8* nonnull %5142) #2
  br label %condContinue__1.i.i23.i586.i

condContinue__1.i.i23.i586.i:                     ; preds = %5168, %__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i, %5112, %condTrue__1.i.i17.i580.i
  %__qsVar1__newControls__.i.i22.i585.i = phi %Array* [ %temps.i.i9.i572.i, %condTrue__1.i.i17.i580.i ], [ %temps.i.i9.i572.i, %5112 ], [ %5156, %__quantum__rt__array_update_reference_count.exit3.i.i21.i584.i ], [ %5156, %5168 ]
  %5169 = bitcast %Array* %__qsVar1__newControls__.i.i22.i585.i to i8*
  %5170 = getelementptr inbounds i8, i8* %5169, i64 24
  %5171 = bitcast i8* %5170 to i64*
  %5172 = load i64, i64* %5171, align 8
  %5173 = add nsw i64 %5172, 1
  store i64 %5173, i64* %5171, align 8
  %5174 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %5175 = bitcast i8* %5174 to i64*
  %5176 = getelementptr inbounds i8, i8* %5174, i64 8
  %5177 = bitcast i8* %5176 to i64*
  %5178 = getelementptr inbounds i8, i8* %5174, i64 16
  %5179 = bitcast i8* %5178 to i64*
  store i64 16, i64* %5175, align 8
  store i64 1, i64* %5177, align 8
  store i64 0, i64* %5179, align 8
  %5180 = getelementptr inbounds i8, i8* %5174, i64 24
  %5181 = bitcast i8* %5180 to %Tuple*
  %5182 = bitcast %Tuple* %5181 to { %Array*, %Qubit* }*
  %5183 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %5182, i64 0, i32 0
  %5184 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %5182, i64 0, i32 1
  %5185 = getelementptr inbounds i8, i8* %5169, i64 16
  %5186 = bitcast i8* %5185 to i64*
  %5187 = load i64, i64* %5186, align 8
  %5188 = add nsw i64 %5187, 1
  store i64 %5188, i64* %5186, align 8
  %5189 = icmp slt i64 %5187, 0
  br i1 %5189, label %5190, label %__quantum__rt__array_update_reference_count.exit5.i.i24.i587.i

5190:                                             ; preds = %condContinue__1.i.i23.i586.i
  tail call void @free(i8* nonnull %5169) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i24.i587.i

__quantum__rt__array_update_reference_count.exit5.i.i24.i587.i: ; preds = %5190, %condContinue__1.i.i23.i586.i
  store %Array* %__qsVar1__newControls__.i.i22.i585.i, %Array** %5183, align 8
  %5191 = bitcast %Qubit** %5184 to i64*
  store i64 %arg1.i.i7.i570.i, i64* %5191, align 8
  %5192 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %5043, align 8
  %5193 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %5192, i64 0, i64 0
  %5194 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %5193, align 8
  %5195 = load i8*, i8** %5046, align 8
  tail call void %5194(i8* %5195, i8* nonnull %5180, i8* null)
  br i1 %.not.not9.i.i10.i573.i, label %body__2.lr.ph.i.i26.i589.i, label %exit__2.i.i30.i593.i

body__2.lr.ph.i.i26.i589.i:                       ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i24.i587.i
  %__qsVar0____qsVar0__numPair____11.i.i25.i588.i = add nsw i64 %numControlPairs.i.i8.i571.i, -1
  %5196 = bitcast i8* %controls8.i.i6.i569.i to i64*
  %5197 = bitcast %Array* %temps.i.i9.i572.i to i64*
  %5198 = getelementptr inbounds i8, i8* %controls8.i.i6.i569.i, i64 32
  %5199 = getelementptr inbounds i8, i8* %5077, i64 32
  br label %body__2.i.i29.i592.i

body__2.i.i29.i592.i:                             ; preds = %body__2.lr.ph.i.i26.i589.i, %exit_quantum_grouping400
  %5200 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i25.i588.i, %body__2.lr.ph.i.i26.i589.i ], [ %5217, %exit_quantum_grouping400 ]
  %5201 = shl nuw i64 %5200, 1
  %5202 = load i64, i64* %5196, align 8
  %5203 = mul nsw i64 %5202, %5201
  %5204 = getelementptr inbounds i8, i8* %5198, i64 %5203
  %5205 = bitcast i8* %5204 to %Qubit**
  %5206 = load %Qubit*, %Qubit** %5205, align 8
  %5207 = or i64 %5201, 1
  %5208 = mul nsw i64 %5207, %5202
  %5209 = getelementptr inbounds i8, i8* %5198, i64 %5208
  %5210 = bitcast i8* %5209 to %Qubit**
  %5211 = load %Qubit*, %Qubit** %5210, align 8
  %5212 = load i64, i64* %5197, align 8
  %5213 = mul nsw i64 %5212, %5200
  %5214 = getelementptr inbounds i8, i8* %5199, i64 %5213
  %5215 = bitcast i8* %5214 to %Qubit**
  %5216 = load %Qubit*, %Qubit** %5215, align 8
  %5217 = add i64 %5200, -1
  %5218 = icmp sgt i64 %5217, -1
  br label %quantum399

quantum399:                                       ; preds = %body__2.i.i29.i592.i
  tail call void @__quantum__qis__h__body(%Qubit* %5216)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5216, %Qubit* %5211)
  tail call void @__quantum__qis__t__body(%Qubit* %5211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5206, %Qubit* %5211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5216, %Qubit* %5206)
  tail call void @__quantum__qis__t__adj(%Qubit* %5216)
  tail call void @__quantum__qis__t__body(%Qubit* %5206)
  tail call void @__quantum__qis__t__adj(%Qubit* %5211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5206, %Qubit* %5211)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5216, %Qubit* %5206)
  tail call void @__quantum__qis__h__body(%Qubit* %5216)
  br label %readout398

readout398:                                       ; preds = %quantum399
  br label %post-classical397

post-classical397:                                ; preds = %readout398
  br label %exit_quantum_grouping400

exit_quantum_grouping400:                         ; preds = %post-classical397
  br i1 %5218, label %body__2.i.i29.i592.i, label %exit__2.i.i30.i593.i

exit__2.i.i30.i593.i:                             ; preds = %exit_quantum_grouping400, %__quantum__rt__array_update_reference_count.exit5.i.i24.i587.i
  %5219 = load i64, i64* %5079, align 8
  %5220 = add nsw i64 %5219, -1
  store i64 %5220, i64* %5079, align 8
  %5221 = load i64, i64* %5171, align 8
  %5222 = add nsw i64 %5221, -1
  store i64 %5222, i64* %5171, align 8
  %5223 = load i64, i64* %5186, align 8
  %5224 = add nsw i64 %5223, -1
  store i64 %5224, i64* %5186, align 8
  %5225 = icmp slt i64 %5223, 2
  br i1 %5225, label %5226, label %__quantum__rt__array_update_reference_count.exit6.i.i32.i595.i

5226:                                             ; preds = %exit__2.i.i30.i593.i
  tail call void @free(i8* nonnull %5169) #2
  %.pre.i.i31.i594.i = load i64, i64* %5186, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i32.i595.i

__quantum__rt__array_update_reference_count.exit6.i.i32.i595.i: ; preds = %5226, %exit__2.i.i30.i593.i
  %5227 = phi i64 [ %5224, %exit__2.i.i30.i593.i ], [ %.pre.i.i31.i594.i, %5226 ]
  %5228 = add nsw i64 %5227, -1
  store i64 %5228, i64* %5186, align 8
  %5229 = icmp slt i64 %5227, 2
  br i1 %5229, label %5230, label %__quantum__rt__array_update_reference_count.exit7.i.i33.i596.i

5230:                                             ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i32.i595.i
  tail call void @free(i8* nonnull %5169) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i33.i596.i

__quantum__rt__array_update_reference_count.exit7.i.i33.i596.i: ; preds = %5230, %__quantum__rt__array_update_reference_count.exit6.i.i32.i595.i
  %5231 = load i64, i64* %5177, align 8
  %5232 = add nsw i64 %5231, -1
  store i64 %5232, i64* %5177, align 8
  %5233 = icmp slt i64 %5231, 2
  br i1 %5233, label %5234, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i597.i

5234:                                             ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i33.i596.i
  tail call void @free(i8* nonnull %5174) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i597.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i597.i: ; preds = %5234, %__quantum__rt__array_update_reference_count.exit7.i.i33.i596.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i9.i572.i)
  %5235 = load i32, i32* %5050, align 4
  %5236 = add nsw i32 %5235, -1
  store i32 %5236, i32* %5050, align 4
  %5237 = load i64, i64* %5070, align 8
  %5238 = add nsw i64 %5237, -1
  store i64 %5238, i64* %5070, align 8
  %5239 = load i32, i32* %5048, align 8
  %5240 = add nsw i32 %5239, -1
  store i32 %5240, i32* %5048, align 8
  %5241 = load i64, i64* %4998, align 8
  %5242 = add nsw i64 %5241, -1
  store i64 %5242, i64* %4998, align 8
  %5243 = icmp slt i64 %5241, 2
  br i1 %5243, label %5244, label %__quantum__rt__array_update_reference_count.exit1.i35.i598.i

5244:                                             ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i597.i
  tail call void @free(i8* nonnull %4993) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i35.i598.i

__quantum__rt__array_update_reference_count.exit1.i35.i598.i: ; preds = %5244, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i34.i597.i
  %5245 = load i64, i64* %5055, align 8
  %5246 = add nsw i64 %5245, -1
  store i64 %5246, i64* %5055, align 8
  %5247 = icmp slt i64 %5245, 2
  br i1 %5247, label %5248, label %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i

5248:                                             ; preds = %__quantum__rt__array_update_reference_count.exit1.i35.i598.i
  tail call void @free(i8* nonnull %5052) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i

Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i: ; preds = %5248, %__quantum__rt__array_update_reference_count.exit1.i35.i598.i, %exit_quantum_grouping392, %exit_quantum_grouping388, %exit_quantum_grouping384
  %5249 = load i64, i64* %5000, align 8
  %5250 = add nsw i64 %5249, -1
  store i64 %5250, i64* %5000, align 8
  %5251 = load i64, i64* %4998, align 8
  %5252 = add nsw i64 %5251, -1
  store i64 %5252, i64* %4998, align 8
  %5253 = icmp slt i64 %5251, 2
  br i1 %5253, label %5254, label %ConstArrayReduction__Main__body.29.exit

5254:                                             ; preds = %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i
  tail call void @free(i8* nonnull %4993) #2
  br label %ConstArrayReduction__Main__body.29.exit

ConstArrayReduction__Main__body.29.exit:          ; preds = %5254, %Microsoft__Quantum__Intrinsic__Z__ctl.53.exit.i.i
  %5255 = xor i1 %4743, true
  %5256 = zext i1 %5255 to i64
  %5257 = xor i1 %4218, true
  %5258 = zext i1 %5257 to i64
  %5259 = xor i1 %3693, true
  %5260 = zext i1 %5259 to i64
  %5261 = xor i1 %538, true
  %5262 = zext i1 %5261 to i64
  %5263 = xor i1 %275, true
  %5264 = zext i1 %5263 to i64
  %5265 = add nuw nsw i64 %5262, %5264
  %5266 = xor i1 %801, true
  %5267 = zext i1 %5266 to i64
  %5268 = add nuw nsw i64 %5265, %5267
  %5269 = xor i1 %1064, true
  %5270 = zext i1 %5269 to i64
  %5271 = add nuw nsw i64 %5268, %5270
  %5272 = xor i1 %1327, true
  %5273 = zext i1 %5272 to i64
  %5274 = add nuw nsw i64 %5271, %5273
  %5275 = xor i1 %1590, true
  %5276 = zext i1 %5275 to i64
  %5277 = add nuw nsw i64 %5274, %5276
  %5278 = xor i1 %1853, true
  %5279 = zext i1 %5278 to i64
  %5280 = add nuw nsw i64 %5277, %5279
  %5281 = xor i1 %2116, true
  %5282 = zext i1 %5281 to i64
  %5283 = add nuw nsw i64 %5280, %5282
  %5284 = xor i1 %2379, true
  %5285 = zext i1 %5284 to i64
  %5286 = add nuw nsw i64 %5283, %5285
  %5287 = xor i1 %2642, true
  %5288 = zext i1 %5287 to i64
  %5289 = add nuw nsw i64 %5286, %5288
  %5290 = xor i1 %2905, true
  %5291 = zext i1 %5290 to i64
  %5292 = add nuw nsw i64 %5289, %5291
  %5293 = xor i1 %3168, true
  %5294 = zext i1 %5293 to i64
  %5295 = add nuw nsw i64 %5292, %5294
  %5296 = add nuw nsw i64 %5295, %5260
  %5297 = add nuw nsw i64 %5296, %5258
  %5298 = add nuw nsw i64 %5297, %5256
  br label %quantum463

quantum463:                                       ; preds = %ConstArrayReduction__Main__body.29.exit
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*), %Result* nonnull inttoptr (i64 15 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 15 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Result* nonnull inttoptr (i64 16 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*), %Result* nonnull inttoptr (i64 17 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Result* nonnull inttoptr (i64 18 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 19 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* nonnull inttoptr (i64 20 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Result* nonnull inttoptr (i64 21 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*), %Result* nonnull inttoptr (i64 22 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*), %Result* nonnull inttoptr (i64 23 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 7 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 8 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 9 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 10 to %Qubit*))
  tail call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 11 to %Qubit*))
  br label %readout462

readout462:                                       ; preds = %quantum463
  %5299 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 15 to %Result*))
  %5300 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 16 to %Result*))
  %5301 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 17 to %Result*))
  %5302 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 18 to %Result*))
  %5303 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 19 to %Result*))
  %5304 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 20 to %Result*))
  %5305 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 21 to %Result*))
  %5306 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 22 to %Result*))
  %5307 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 23 to %Result*))
  br label %post-classical461

post-classical461:                                ; preds = %readout462
  %5308 = xor i1 %5299, true
  %5309 = zext i1 %5308 to i64
  %5310 = xor i1 %5300, true
  %5311 = zext i1 %5310 to i64
  %5312 = xor i1 %5301, true
  %5313 = zext i1 %5312 to i64
  %5314 = xor i1 %5302, true
  %5315 = zext i1 %5314 to i64
  %5316 = xor i1 %5303, true
  %5317 = zext i1 %5316 to i64
  %5318 = xor i1 %5304, true
  %5319 = zext i1 %5318 to i64
  %5320 = xor i1 %5305, true
  %5321 = zext i1 %5320 to i64
  %5322 = xor i1 %5306, true
  %5323 = zext i1 %5322 to i64
  %5324 = xor i1 %5307, true
  %5325 = zext i1 %5324 to i64
  %5326 = add nuw nsw i64 %5298, %5309
  %5327 = add nuw nsw i64 %5326, %5311
  %5328 = add nuw nsw i64 %5327, %5313
  %5329 = add nuw nsw i64 %5328, %5315
  %5330 = add nuw nsw i64 %5329, %5317
  %5331 = add nuw nsw i64 %5330, %5319
  %5332 = add nuw nsw i64 %5331, %5321
  %5333 = add nuw nsw i64 %5332, %5323
  %5334 = add nuw nsw i64 %5333, %5325
  br label %exit_quantum_grouping464

exit_quantum_grouping464:                         ; preds = %post-classical461
  ret i64 %5334
}

declare void @__quantum__qis__reset__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__z__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cz__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__rt__callable_make_controlled(%Callable*) local_unnamed_addr

declare %Array* @__quantum__rt__qubit_allocate_array(i64) local_unnamed_addr

declare void @__quantum__rt__qubit_release_array(%Array*) local_unnamed_addr

define internal void @Microsoft__Quantum__Intrinsic__Z__body__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to %Qubit**
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %entry
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
  %1 = load %Qubit*, %Qubit** %0, align 8
  br label %quantum

quantum:                                          ; preds = %entry
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
  %5 = bitcast %Array* %3 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 24
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = add nsw i64 %8, 1
  store i64 %9, i64* %7, align 8
  %10 = getelementptr inbounds i8, i8* %5, i64 8
  %11 = bitcast i8* %10 to i64*
  %12 = load i64, i64* %11, align 8
  switch i64 %12, label %else__1.i [
    i64 0, label %then0__1.i
    i64 1, label %then1__1.i
    i64 2, label %then2__1.i
  ]

then0__1.i:                                       ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %then0__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

then1__1.i:                                       ; preds = %entry
  %13 = getelementptr inbounds i8, i8* %5, i64 32
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  br label %quantum3

quantum3:                                         ; preds = %then1__1.i
  tail call void @__quantum__qis__cz__body(%Qubit* %15, %Qubit* %4)
  br label %readout2

readout2:                                         ; preds = %quantum3
  br label %post-classical1

post-classical1:                                  ; preds = %readout2
  br label %exit_quantum_grouping4

exit_quantum_grouping4:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

then2__1.i:                                       ; preds = %entry
  %16 = bitcast %Array* %3 to i64*
  %17 = getelementptr inbounds i8, i8* %5, i64 32
  %18 = bitcast i8* %17 to %Qubit**
  %19 = load %Qubit*, %Qubit** %18, align 8
  %20 = load i64, i64* %16, align 8
  %21 = getelementptr inbounds i8, i8* %5, i64 %20
  %22 = getelementptr inbounds i8, i8* %21, i64 32
  %23 = bitcast i8* %22 to %Qubit**
  %24 = load %Qubit*, %Qubit** %23, align 8
  %25 = load %Qubit*, %Qubit** %18, align 8
  %26 = load %Qubit*, %Qubit** %18, align 8
  %27 = load i64, i64* %16, align 8
  %28 = getelementptr inbounds i8, i8* %5, i64 %27
  %29 = getelementptr inbounds i8, i8* %28, i64 32
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  %32 = load i64, i64* %16, align 8
  %33 = getelementptr inbounds i8, i8* %5, i64 %32
  %34 = getelementptr inbounds i8, i8* %33, i64 32
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  %37 = load %Qubit*, %Qubit** %18, align 8
  %38 = load %Qubit*, %Qubit** %18, align 8
  %39 = load i64, i64* %16, align 8
  %40 = getelementptr inbounds i8, i8* %5, i64 %39
  %41 = getelementptr inbounds i8, i8* %40, i64 32
  %42 = bitcast i8* %41 to %Qubit**
  %43 = load %Qubit*, %Qubit** %42, align 8
  %44 = load %Qubit*, %Qubit** %18, align 8
  %45 = load %Qubit*, %Qubit** %18, align 8
  %46 = load i64, i64* %16, align 8
  %47 = getelementptr inbounds i8, i8* %5, i64 %46
  %48 = getelementptr inbounds i8, i8* %47, i64 32
  %49 = bitcast i8* %48 to %Qubit**
  %50 = load %Qubit*, %Qubit** %49, align 8
  %51 = load %Qubit*, %Qubit** %18, align 8
  br label %quantum7

quantum7:                                         ; preds = %then2__1.i
  tail call void @__quantum__qis__t__adj(%Qubit* %19)
  tail call void @__quantum__qis__t__adj(%Qubit* %24)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %25)
  tail call void @__quantum__qis__t__body(%Qubit* %26)
  tail call void @__quantum__qis__cnot__body(%Qubit* %31, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %36, %Qubit* %37)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %38)
  tail call void @__quantum__qis__cnot__body(%Qubit* %43, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %44)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %45)
  tail call void @__quantum__qis__cnot__body(%Qubit* %50, %Qubit* %51)
  br label %readout6

readout6:                                         ; preds = %quantum7
  br label %post-classical5

post-classical5:                                  ; preds = %readout6
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical5
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %entry
  %52 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %53 = bitcast i8* %52 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %53, align 8
  %54 = getelementptr inbounds i8, i8* %52, i64 8
  %55 = getelementptr inbounds i8, i8* %52, i64 16
  %56 = bitcast i8* %55 to i8**
  %57 = getelementptr inbounds i8, i8* %52, i64 24
  %58 = bitcast i8* %57 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %54, i8 0, i64 16, i1 false)
  store i32 1, i32* %58, align 8
  %59 = getelementptr inbounds i8, i8* %52, i64 28
  %60 = bitcast i8* %59 to i32*
  store i32 0, i32* %60, align 4
  %61 = bitcast i8* %52 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %61)
  %62 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %63 = bitcast i8* %62 to i64*
  %64 = getelementptr inbounds i8, i8* %62, i64 8
  %65 = bitcast i8* %64 to i64*
  %66 = getelementptr inbounds i8, i8* %62, i64 16
  %67 = bitcast i8* %66 to i64*
  store i64 16, i64* %63, align 8
  store i64 1, i64* %65, align 8
  store i64 0, i64* %67, align 8
  %68 = getelementptr inbounds i8, i8* %62, i64 24
  %69 = bitcast i8* %68 to %Tuple*
  %70 = bitcast %Tuple* %69 to { %Array*, %Qubit* }*
  %71 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %70, i64 0, i32 0
  %72 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %70, i64 0, i32 1
  %73 = getelementptr inbounds i8, i8* %5, i64 16
  %74 = bitcast i8* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = add nsw i64 %75, 1
  store i64 %76, i64* %74, align 8
  %77 = icmp slt i64 %75, 0
  br i1 %77, label %78, label %__quantum__rt__array_update_reference_count.exit.i

78:                                               ; preds = %else__1.i
  tail call void @free(i8* nonnull %5) #2
  br label %__quantum__rt__array_update_reference_count.exit.i

__quantum__rt__array_update_reference_count.exit.i: ; preds = %78, %else__1.i
  store %Array* %3, %Array** %71, align 8
  store %Qubit* %4, %Qubit** %72, align 8
  %79 = load i32, i32* %60, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %60, align 4
  %81 = bitcast %Tuple* %69 to i8**
  %controls8.i.i = load i8*, i8** %81, align 8
  %82 = getelementptr inbounds i8, i8* %controls8.i.i, i64 24
  %83 = bitcast i8* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = add nsw i64 %84, 1
  store i64 %85, i64* %83, align 8
  %86 = bitcast %Qubit** %72 to i64*
  %arg1.i.i = load i64, i64* %86, align 8
  %87 = getelementptr inbounds i8, i8* %controls8.i.i, i64 8
  %88 = bitcast i8* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %numControlPairs.i.i = sdiv i64 %89, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  %90 = bitcast %Array* %temps.i.i to i8*
  %91 = getelementptr inbounds i8, i8* %90, i64 24
  %92 = bitcast i8* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %92, align 8
  %.not.not9.i.i = icmp sgt i64 %89, 1
  br i1 %.not.not9.i.i, label %body__1.lr.ph.i.i, label %exit__1.i.i

body__1.lr.ph.i.i:                                ; preds = %__quantum__rt__array_update_reference_count.exit.i
  %95 = bitcast i8* %controls8.i.i to i64*
  %96 = bitcast %Array* %temps.i.i to i64*
  %97 = getelementptr inbounds i8, i8* %controls8.i.i, i64 32
  %98 = getelementptr inbounds i8, i8* %90, i64 32
  br label %body__1.i.i

body__1.i.i:                                      ; preds = %body__1.lr.ph.i.i, %exit_quantum_grouping12
  %99 = phi i64 [ 0, %body__1.lr.ph.i.i ], [ %116, %exit_quantum_grouping12 ]
  %100 = shl nuw i64 %99, 1
  %101 = load i64, i64* %95, align 8
  %102 = mul nsw i64 %101, %100
  %103 = getelementptr inbounds i8, i8* %97, i64 %102
  %104 = bitcast i8* %103 to %Qubit**
  %105 = load %Qubit*, %Qubit** %104, align 8
  %106 = or i64 %100, 1
  %107 = mul nsw i64 %106, %101
  %108 = getelementptr inbounds i8, i8* %97, i64 %107
  %109 = bitcast i8* %108 to %Qubit**
  %110 = load %Qubit*, %Qubit** %109, align 8
  %111 = load i64, i64* %96, align 8
  %112 = mul nsw i64 %111, %99
  %113 = getelementptr inbounds i8, i8* %98, i64 %112
  %114 = bitcast i8* %113 to %Qubit**
  %115 = load %Qubit*, %Qubit** %114, align 8
  %116 = add nuw nsw i64 %99, 1
  %117 = icmp eq i64 %116, %numControlPairs.i.i
  br label %quantum11

quantum11:                                        ; preds = %body__1.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %115)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %105)
  tail call void @__quantum__qis__cnot__body(%Qubit* %105, %Qubit* %110)
  tail call void @__quantum__qis__t__body(%Qubit* %110)
  tail call void @__quantum__qis__t__adj(%Qubit* %105)
  tail call void @__quantum__qis__t__body(%Qubit* %115)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %105)
  tail call void @__quantum__qis__cnot__body(%Qubit* %105, %Qubit* %110)
  tail call void @__quantum__qis__t__adj(%Qubit* %110)
  tail call void @__quantum__qis__cnot__body(%Qubit* %115, %Qubit* %110)
  tail call void @__quantum__qis__h__body(%Qubit* %115)
  br label %readout10

readout10:                                        ; preds = %quantum11
  br label %post-classical9

post-classical9:                                  ; preds = %readout10
  br label %exit_quantum_grouping12

exit_quantum_grouping12:                          ; preds = %post-classical9
  br i1 %117, label %exit__1.i.i, label %body__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping12, %__quantum__rt__array_update_reference_count.exit.i
  %118 = and i64 %89, 1
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  %120 = getelementptr inbounds i8, i8* %90, i64 16
  %121 = bitcast i8* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = add nsw i64 %122, 1
  store i64 %123, i64* %121, align 8
  %124 = icmp slt i64 %122, 0
  br i1 %124, label %125, label %condContinue__1.i.i

125:                                              ; preds = %condTrue__1.i.i
  tail call void @free(i8* nonnull %90) #2
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %126 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %127 = bitcast i8* %126 to i64*
  %128 = getelementptr inbounds i8, i8* %126, i64 8
  %129 = bitcast i8* %128 to i64*
  %130 = getelementptr inbounds i8, i8* %126, i64 16
  %131 = bitcast i8* %130 to i64*
  %132 = getelementptr inbounds i8, i8* %126, i64 24
  %133 = bitcast i8* %132 to i64*
  store i64 8, i64* %127, align 8
  store i64 1, i64* %129, align 8
  store i64 1, i64* %131, align 8
  store i64 0, i64* %133, align 8
  %134 = getelementptr inbounds i8, i8* %126, i64 32
  %135 = add i64 %89, -1
  %136 = bitcast i8* %controls8.i.i to i64*
  %137 = load i64, i64* %136, align 8
  %138 = mul nsw i64 %137, %135
  %139 = getelementptr inbounds i8, i8* %controls8.i.i, i64 %138
  %140 = getelementptr inbounds i8, i8* %139, i64 32
  %141 = bitcast i8* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = bitcast i8* %134 to i64*
  store i64 %142, i64* %143, align 8
  %144 = bitcast %Array* %temps.i.i to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds i8, i8* %90, i64 8
  %147 = bitcast i8* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = load i64, i64* %129, align 8
  %150 = getelementptr inbounds i8, i8* %90, i64 32
  %151 = add nsw i64 %149, %148
  %sext.i.i.i = shl i64 %145, 32
  %152 = ashr exact i64 %sext.i.i.i, 32
  %153 = mul nsw i64 %151, %152
  %154 = add i64 %153, 32
  %155 = tail call i8* @malloc(i64 %154) #5
  %156 = bitcast i8* %155 to i64*
  %157 = getelementptr inbounds i8, i8* %155, i64 8
  %158 = bitcast i8* %157 to i64*
  %159 = getelementptr inbounds i8, i8* %155, i64 16
  %160 = bitcast i8* %159 to i64*
  %161 = getelementptr inbounds i8, i8* %155, i64 24
  %162 = bitcast i8* %161 to i64*
  store i64 %152, i64* %156, align 8
  store i64 %151, i64* %158, align 8
  store i64 1, i64* %160, align 8
  store i64 0, i64* %162, align 8
  %163 = getelementptr inbounds i8, i8* %155, i64 32
  %164 = mul nsw i64 %148, %145
  %165 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %163, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %163, i8* nonnull align 1 %150, i64 %164, i1 false) #2
  %166 = getelementptr inbounds i8, i8* %163, i64 %164
  %167 = mul nsw i64 %149, %145
  %168 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %166, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %166, i8* nonnull align 1 %134, i64 %167, i1 false) #2
  %169 = bitcast i8* %155 to %Array*
  %170 = load i64, i64* %160, align 8
  %171 = add nsw i64 %170, 1
  store i64 %171, i64* %160, align 8
  %172 = icmp slt i64 %170, 0
  br i1 %172, label %173, label %__quantum__rt__array_update_reference_count.exit2.i.i

173:                                              ; preds = %condFalse__1.i.i
  tail call void @free(i8* nonnull %155) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i

__quantum__rt__array_update_reference_count.exit2.i.i: ; preds = %173, %condFalse__1.i.i
  %174 = load i64, i64* %131, align 8
  %175 = add nsw i64 %174, -1
  store i64 %175, i64* %131, align 8
  %176 = icmp slt i64 %174, 2
  br i1 %176, label %177, label %__quantum__rt__array_update_reference_count.exit3.i.i

177:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i
  tail call void @free(i8* nonnull %126) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i

__quantum__rt__array_update_reference_count.exit3.i.i: ; preds = %177, %__quantum__rt__array_update_reference_count.exit2.i.i
  %178 = load i64, i64* %160, align 8
  %179 = add nsw i64 %178, -1
  store i64 %179, i64* %160, align 8
  %180 = icmp slt i64 %178, 2
  br i1 %180, label %181, label %condContinue__1.i.i

181:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i
  tail call void @free(i8* nonnull %155) #2
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %181, %__quantum__rt__array_update_reference_count.exit3.i.i, %125, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %temps.i.i, %125 ], [ %169, %__quantum__rt__array_update_reference_count.exit3.i.i ], [ %169, %181 ]
  %182 = bitcast %Array* %__qsVar1__newControls__.i.i to i8*
  %183 = getelementptr inbounds i8, i8* %182, i64 24
  %184 = bitcast i8* %183 to i64*
  %185 = load i64, i64* %184, align 8
  %186 = add nsw i64 %185, 1
  store i64 %186, i64* %184, align 8
  %187 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %188 = bitcast i8* %187 to i64*
  %189 = getelementptr inbounds i8, i8* %187, i64 8
  %190 = bitcast i8* %189 to i64*
  %191 = getelementptr inbounds i8, i8* %187, i64 16
  %192 = bitcast i8* %191 to i64*
  store i64 16, i64* %188, align 8
  store i64 1, i64* %190, align 8
  store i64 0, i64* %192, align 8
  %193 = getelementptr inbounds i8, i8* %187, i64 24
  %194 = bitcast i8* %193 to %Tuple*
  %195 = bitcast %Tuple* %194 to { %Array*, %Qubit* }*
  %196 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %195, i64 0, i32 0
  %197 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %195, i64 0, i32 1
  %198 = getelementptr inbounds i8, i8* %182, i64 16
  %199 = bitcast i8* %198 to i64*
  %200 = load i64, i64* %199, align 8
  %201 = add nsw i64 %200, 1
  store i64 %201, i64* %199, align 8
  %202 = icmp slt i64 %200, 0
  br i1 %202, label %203, label %__quantum__rt__array_update_reference_count.exit5.i.i

203:                                              ; preds = %condContinue__1.i.i
  tail call void @free(i8* nonnull %182) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i

__quantum__rt__array_update_reference_count.exit5.i.i: ; preds = %203, %condContinue__1.i.i
  store %Array* %__qsVar1__newControls__.i.i, %Array** %196, align 8
  %204 = bitcast %Qubit** %197 to i64*
  store i64 %arg1.i.i, i64* %204, align 8
  %205 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %53, align 8
  %206 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %205, i64 0, i64 0
  %207 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %206, align 8
  %208 = load i8*, i8** %56, align 8
  tail call void %207(i8* %208, i8* nonnull %193, i8* null)
  br i1 %.not.not9.i.i, label %body__2.lr.ph.i.i, label %exit__2.i.i

body__2.lr.ph.i.i:                                ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i
  %__qsVar0____qsVar0__numPair____11.i.i = add nsw i64 %numControlPairs.i.i, -1
  %209 = bitcast i8* %controls8.i.i to i64*
  %210 = bitcast %Array* %temps.i.i to i64*
  %211 = getelementptr inbounds i8, i8* %controls8.i.i, i64 32
  %212 = getelementptr inbounds i8, i8* %90, i64 32
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.lr.ph.i.i, %exit_quantum_grouping16
  %213 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i, %body__2.lr.ph.i.i ], [ %230, %exit_quantum_grouping16 ]
  %214 = shl nuw i64 %213, 1
  %215 = load i64, i64* %209, align 8
  %216 = mul nsw i64 %215, %214
  %217 = getelementptr inbounds i8, i8* %211, i64 %216
  %218 = bitcast i8* %217 to %Qubit**
  %219 = load %Qubit*, %Qubit** %218, align 8
  %220 = or i64 %214, 1
  %221 = mul nsw i64 %220, %215
  %222 = getelementptr inbounds i8, i8* %211, i64 %221
  %223 = bitcast i8* %222 to %Qubit**
  %224 = load %Qubit*, %Qubit** %223, align 8
  %225 = load i64, i64* %210, align 8
  %226 = mul nsw i64 %225, %213
  %227 = getelementptr inbounds i8, i8* %212, i64 %226
  %228 = bitcast i8* %227 to %Qubit**
  %229 = load %Qubit*, %Qubit** %228, align 8
  %230 = add i64 %213, -1
  %231 = icmp sgt i64 %230, -1
  br label %quantum15

quantum15:                                        ; preds = %body__2.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %229, %Qubit* %224)
  tail call void @__quantum__qis__t__body(%Qubit* %224)
  tail call void @__quantum__qis__cnot__body(%Qubit* %219, %Qubit* %224)
  tail call void @__quantum__qis__cnot__body(%Qubit* %229, %Qubit* %219)
  tail call void @__quantum__qis__t__adj(%Qubit* %229)
  tail call void @__quantum__qis__t__body(%Qubit* %219)
  tail call void @__quantum__qis__t__adj(%Qubit* %224)
  tail call void @__quantum__qis__cnot__body(%Qubit* %219, %Qubit* %224)
  tail call void @__quantum__qis__cnot__body(%Qubit* %229, %Qubit* %219)
  tail call void @__quantum__qis__h__body(%Qubit* %229)
  br label %readout14

readout14:                                        ; preds = %quantum15
  br label %post-classical13

post-classical13:                                 ; preds = %readout14
  br label %exit_quantum_grouping16

exit_quantum_grouping16:                          ; preds = %post-classical13
  br i1 %231, label %body__2.i.i, label %exit__2.i.i

exit__2.i.i:                                      ; preds = %exit_quantum_grouping16, %__quantum__rt__array_update_reference_count.exit5.i.i
  %232 = load i64, i64* %92, align 8
  %233 = add nsw i64 %232, -1
  store i64 %233, i64* %92, align 8
  %234 = load i64, i64* %184, align 8
  %235 = add nsw i64 %234, -1
  store i64 %235, i64* %184, align 8
  %236 = load i64, i64* %199, align 8
  %237 = add nsw i64 %236, -1
  store i64 %237, i64* %199, align 8
  %238 = icmp slt i64 %236, 2
  br i1 %238, label %239, label %__quantum__rt__array_update_reference_count.exit6.i.i

239:                                              ; preds = %exit__2.i.i
  tail call void @free(i8* nonnull %182) #2
  %.pre.i.i = load i64, i64* %199, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i

__quantum__rt__array_update_reference_count.exit6.i.i: ; preds = %239, %exit__2.i.i
  %240 = phi i64 [ %237, %exit__2.i.i ], [ %.pre.i.i, %239 ]
  %241 = add nsw i64 %240, -1
  store i64 %241, i64* %199, align 8
  %242 = icmp slt i64 %240, 2
  br i1 %242, label %243, label %__quantum__rt__array_update_reference_count.exit7.i.i

243:                                              ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i
  tail call void @free(i8* nonnull %182) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i

__quantum__rt__array_update_reference_count.exit7.i.i: ; preds = %243, %__quantum__rt__array_update_reference_count.exit6.i.i
  %244 = load i64, i64* %190, align 8
  %245 = add nsw i64 %244, -1
  store i64 %245, i64* %190, align 8
  %246 = icmp slt i64 %244, 2
  br i1 %246, label %247, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i

247:                                              ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i
  tail call void @free(i8* nonnull %187) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %247, %__quantum__rt__array_update_reference_count.exit7.i.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i)
  %248 = load i32, i32* %60, align 4
  %249 = add nsw i32 %248, -1
  store i32 %249, i32* %60, align 4
  %250 = load i64, i64* %83, align 8
  %251 = add nsw i64 %250, -1
  store i64 %251, i64* %83, align 8
  %252 = load i32, i32* %58, align 8
  %253 = add nsw i32 %252, -1
  store i32 %253, i32* %58, align 8
  %254 = load i64, i64* %74, align 8
  %255 = add nsw i64 %254, -1
  store i64 %255, i64* %74, align 8
  %256 = icmp slt i64 %254, 2
  br i1 %256, label %257, label %__quantum__rt__array_update_reference_count.exit1.i

257:                                              ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @free(i8* nonnull %5) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i

__quantum__rt__array_update_reference_count.exit1.i: ; preds = %257, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i
  %258 = load i64, i64* %65, align 8
  %259 = add nsw i64 %258, -1
  store i64 %259, i64* %65, align 8
  %260 = icmp slt i64 %258, 2
  br i1 %260, label %261, label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

261:                                              ; preds = %__quantum__rt__array_update_reference_count.exit1.i
  tail call void @free(i8* nonnull %62) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping4, %exit_quantum_grouping8, %__quantum__rt__array_update_reference_count.exit1.i, %261
  %262 = load i64, i64* %7, align 8
  %263 = add nsw i64 %262, -1
  store i64 %263, i64* %7, align 8
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Z__ctladj__wrapper(%Tuple* nocapture readnone %capture-tuple, %Tuple* nocapture readonly %arg-tuple, %Tuple* nocapture readnone %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Array*, %Qubit* }*
  %1 = bitcast %Tuple* %arg-tuple to %Array**
  %2 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %0, i64 0, i32 1
  %3 = load %Array*, %Array** %1, align 8
  %4 = load %Qubit*, %Qubit** %2, align 8
  %5 = bitcast %Array* %3 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 24
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = add nsw i64 %8, 1
  store i64 %9, i64* %7, align 8
  %10 = bitcast %Array* %3 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 24
  %12 = bitcast i8* %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = add nsw i64 %13, 1
  store i64 %14, i64* %12, align 8
  %15 = getelementptr inbounds i8, i8* %10, i64 8
  %16 = bitcast i8* %15 to i64*
  %17 = load i64, i64* %16, align 8
  switch i64 %17, label %else__1.i [
    i64 0, label %then0__1.i
    i64 1, label %then1__1.i
    i64 2, label %then2__1.i
  ]

then0__1.i:                                       ; preds = %entry
  br label %quantum

quantum:                                          ; preds = %then0__1.i
  tail call void @__quantum__qis__z__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  br label %post-classical

post-classical:                                   ; preds = %readout
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

then1__1.i:                                       ; preds = %entry
  %18 = getelementptr inbounds i8, i8* %10, i64 32
  %19 = bitcast i8* %18 to %Qubit**
  %20 = load %Qubit*, %Qubit** %19, align 8
  br label %quantum3

quantum3:                                         ; preds = %then1__1.i
  tail call void @__quantum__qis__cz__body(%Qubit* %20, %Qubit* %4)
  br label %readout2

readout2:                                         ; preds = %quantum3
  br label %post-classical1

post-classical1:                                  ; preds = %readout2
  br label %exit_quantum_grouping4

exit_quantum_grouping4:                           ; preds = %post-classical1
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

then2__1.i:                                       ; preds = %entry
  %21 = bitcast %Array* %3 to i64*
  %22 = getelementptr inbounds i8, i8* %10, i64 32
  %23 = bitcast i8* %22 to %Qubit**
  %24 = load %Qubit*, %Qubit** %23, align 8
  %25 = load i64, i64* %21, align 8
  %26 = getelementptr inbounds i8, i8* %10, i64 %25
  %27 = getelementptr inbounds i8, i8* %26, i64 32
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  %30 = load %Qubit*, %Qubit** %23, align 8
  %31 = load %Qubit*, %Qubit** %23, align 8
  %32 = load i64, i64* %21, align 8
  %33 = getelementptr inbounds i8, i8* %10, i64 %32
  %34 = getelementptr inbounds i8, i8* %33, i64 32
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  %37 = load i64, i64* %21, align 8
  %38 = getelementptr inbounds i8, i8* %10, i64 %37
  %39 = getelementptr inbounds i8, i8* %38, i64 32
  %40 = bitcast i8* %39 to %Qubit**
  %41 = load %Qubit*, %Qubit** %40, align 8
  %42 = load %Qubit*, %Qubit** %23, align 8
  %43 = load %Qubit*, %Qubit** %23, align 8
  %44 = load i64, i64* %21, align 8
  %45 = getelementptr inbounds i8, i8* %10, i64 %44
  %46 = getelementptr inbounds i8, i8* %45, i64 32
  %47 = bitcast i8* %46 to %Qubit**
  %48 = load %Qubit*, %Qubit** %47, align 8
  %49 = load %Qubit*, %Qubit** %23, align 8
  %50 = load %Qubit*, %Qubit** %23, align 8
  %51 = load i64, i64* %21, align 8
  %52 = getelementptr inbounds i8, i8* %10, i64 %51
  %53 = getelementptr inbounds i8, i8* %52, i64 32
  %54 = bitcast i8* %53 to %Qubit**
  %55 = load %Qubit*, %Qubit** %54, align 8
  %56 = load %Qubit*, %Qubit** %23, align 8
  br label %quantum7

quantum7:                                         ; preds = %then2__1.i
  tail call void @__quantum__qis__t__adj(%Qubit* %24)
  tail call void @__quantum__qis__t__adj(%Qubit* %29)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %30)
  tail call void @__quantum__qis__t__body(%Qubit* %31)
  tail call void @__quantum__qis__cnot__body(%Qubit* %36, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %41, %Qubit* %42)
  tail call void @__quantum__qis__t__body(%Qubit* %4)
  tail call void @__quantum__qis__t__adj(%Qubit* %43)
  tail call void @__quantum__qis__cnot__body(%Qubit* %48, %Qubit* %4)
  tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %49)
  tail call void @__quantum__qis__t__adj(%Qubit* %4)
  tail call void @__quantum__qis__t__body(%Qubit* %50)
  tail call void @__quantum__qis__cnot__body(%Qubit* %55, %Qubit* %56)
  br label %readout6

readout6:                                         ; preds = %quantum7
  br label %post-classical5

post-classical5:                                  ; preds = %readout6
  br label %exit_quantum_grouping8

exit_quantum_grouping8:                           ; preds = %post-classical5
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

else__1.i:                                        ; preds = %entry
  %57 = tail call dereferenceable_or_null(32) i8* @malloc(i64 32) #5
  %58 = bitcast i8* %57 to [4 x void (i8*, i8*, i8*)*]**
  store [4 x void (i8*, i8*, i8*)*]* bitcast ([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Intrinsic__Z to [4 x void (i8*, i8*, i8*)*]*), [4 x void (i8*, i8*, i8*)*]** %58, align 8
  %59 = getelementptr inbounds i8, i8* %57, i64 8
  %60 = getelementptr inbounds i8, i8* %57, i64 16
  %61 = bitcast i8* %60 to i8**
  %62 = getelementptr inbounds i8, i8* %57, i64 24
  %63 = bitcast i8* %62 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %59, i8 0, i64 16, i1 false)
  store i32 1, i32* %63, align 8
  %64 = getelementptr inbounds i8, i8* %57, i64 28
  %65 = bitcast i8* %64 to i32*
  store i32 0, i32* %65, align 4
  %66 = bitcast i8* %57 to %Callable*
  tail call void @__quantum__rt__callable_make_controlled(%Callable* %66)
  %67 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %68 = bitcast i8* %67 to i64*
  %69 = getelementptr inbounds i8, i8* %67, i64 8
  %70 = bitcast i8* %69 to i64*
  %71 = getelementptr inbounds i8, i8* %67, i64 16
  %72 = bitcast i8* %71 to i64*
  store i64 16, i64* %68, align 8
  store i64 1, i64* %70, align 8
  store i64 0, i64* %72, align 8
  %73 = getelementptr inbounds i8, i8* %67, i64 24
  %74 = bitcast i8* %73 to %Tuple*
  %75 = bitcast %Tuple* %74 to { %Array*, %Qubit* }*
  %76 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 0
  %77 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %75, i64 0, i32 1
  %78 = getelementptr inbounds i8, i8* %10, i64 16
  %79 = bitcast i8* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = add nsw i64 %80, 1
  store i64 %81, i64* %79, align 8
  %82 = icmp slt i64 %80, 0
  br i1 %82, label %83, label %__quantum__rt__array_update_reference_count.exit.i

83:                                               ; preds = %else__1.i
  tail call void @free(i8* nonnull %10) #2
  br label %__quantum__rt__array_update_reference_count.exit.i

__quantum__rt__array_update_reference_count.exit.i: ; preds = %83, %else__1.i
  store %Array* %3, %Array** %76, align 8
  store %Qubit* %4, %Qubit** %77, align 8
  %84 = load i32, i32* %65, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %65, align 4
  %86 = bitcast %Tuple* %74 to i8**
  %controls8.i.i = load i8*, i8** %86, align 8
  %87 = getelementptr inbounds i8, i8* %controls8.i.i, i64 24
  %88 = bitcast i8* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = add nsw i64 %89, 1
  store i64 %90, i64* %88, align 8
  %91 = bitcast %Qubit** %77 to i64*
  %arg1.i.i = load i64, i64* %91, align 8
  %92 = getelementptr inbounds i8, i8* %controls8.i.i, i64 8
  %93 = bitcast i8* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %numControlPairs.i.i = sdiv i64 %94, 2
  %temps.i.i = tail call %Array* @__quantum__rt__qubit_allocate_array(i64 %numControlPairs.i.i)
  %95 = bitcast %Array* %temps.i.i to i8*
  %96 = getelementptr inbounds i8, i8* %95, i64 24
  %97 = bitcast i8* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = add nsw i64 %98, 1
  store i64 %99, i64* %97, align 8
  %.not.not9.i.i = icmp sgt i64 %94, 1
  br i1 %.not.not9.i.i, label %body__1.lr.ph.i.i, label %exit__1.i.i

body__1.lr.ph.i.i:                                ; preds = %__quantum__rt__array_update_reference_count.exit.i
  %100 = bitcast i8* %controls8.i.i to i64*
  %101 = bitcast %Array* %temps.i.i to i64*
  %102 = getelementptr inbounds i8, i8* %controls8.i.i, i64 32
  %103 = getelementptr inbounds i8, i8* %95, i64 32
  br label %body__1.i.i

body__1.i.i:                                      ; preds = %body__1.lr.ph.i.i, %exit_quantum_grouping12
  %104 = phi i64 [ 0, %body__1.lr.ph.i.i ], [ %121, %exit_quantum_grouping12 ]
  %105 = shl nuw i64 %104, 1
  %106 = load i64, i64* %100, align 8
  %107 = mul nsw i64 %106, %105
  %108 = getelementptr inbounds i8, i8* %102, i64 %107
  %109 = bitcast i8* %108 to %Qubit**
  %110 = load %Qubit*, %Qubit** %109, align 8
  %111 = or i64 %105, 1
  %112 = mul nsw i64 %111, %106
  %113 = getelementptr inbounds i8, i8* %102, i64 %112
  %114 = bitcast i8* %113 to %Qubit**
  %115 = load %Qubit*, %Qubit** %114, align 8
  %116 = load i64, i64* %101, align 8
  %117 = mul nsw i64 %116, %104
  %118 = getelementptr inbounds i8, i8* %103, i64 %117
  %119 = bitcast i8* %118 to %Qubit**
  %120 = load %Qubit*, %Qubit** %119, align 8
  %121 = add nuw nsw i64 %104, 1
  %122 = icmp eq i64 %121, %numControlPairs.i.i
  br label %quantum11

quantum11:                                        ; preds = %body__1.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %120, %Qubit* %110)
  tail call void @__quantum__qis__cnot__body(%Qubit* %110, %Qubit* %115)
  tail call void @__quantum__qis__t__body(%Qubit* %115)
  tail call void @__quantum__qis__t__adj(%Qubit* %110)
  tail call void @__quantum__qis__t__body(%Qubit* %120)
  tail call void @__quantum__qis__cnot__body(%Qubit* %120, %Qubit* %110)
  tail call void @__quantum__qis__cnot__body(%Qubit* %110, %Qubit* %115)
  tail call void @__quantum__qis__t__adj(%Qubit* %115)
  tail call void @__quantum__qis__cnot__body(%Qubit* %120, %Qubit* %115)
  tail call void @__quantum__qis__h__body(%Qubit* %120)
  br label %readout10

readout10:                                        ; preds = %quantum11
  br label %post-classical9

post-classical9:                                  ; preds = %readout10
  br label %exit_quantum_grouping12

exit_quantum_grouping12:                          ; preds = %post-classical9
  br i1 %122, label %exit__1.i.i, label %body__1.i.i

exit__1.i.i:                                      ; preds = %exit_quantum_grouping12, %__quantum__rt__array_update_reference_count.exit.i
  %123 = and i64 %94, 1
  %124 = icmp eq i64 %123, 0
  br i1 %124, label %condTrue__1.i.i, label %condFalse__1.i.i

condTrue__1.i.i:                                  ; preds = %exit__1.i.i
  %125 = getelementptr inbounds i8, i8* %95, i64 16
  %126 = bitcast i8* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = add nsw i64 %127, 1
  store i64 %128, i64* %126, align 8
  %129 = icmp slt i64 %127, 0
  br i1 %129, label %130, label %condContinue__1.i.i

130:                                              ; preds = %condTrue__1.i.i
  tail call void @free(i8* nonnull %95) #2
  br label %condContinue__1.i.i

condFalse__1.i.i:                                 ; preds = %exit__1.i.i
  %131 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %132 = bitcast i8* %131 to i64*
  %133 = getelementptr inbounds i8, i8* %131, i64 8
  %134 = bitcast i8* %133 to i64*
  %135 = getelementptr inbounds i8, i8* %131, i64 16
  %136 = bitcast i8* %135 to i64*
  %137 = getelementptr inbounds i8, i8* %131, i64 24
  %138 = bitcast i8* %137 to i64*
  store i64 8, i64* %132, align 8
  store i64 1, i64* %134, align 8
  store i64 1, i64* %136, align 8
  store i64 0, i64* %138, align 8
  %139 = getelementptr inbounds i8, i8* %131, i64 32
  %140 = add i64 %94, -1
  %141 = bitcast i8* %controls8.i.i to i64*
  %142 = load i64, i64* %141, align 8
  %143 = mul nsw i64 %142, %140
  %144 = getelementptr inbounds i8, i8* %controls8.i.i, i64 %143
  %145 = getelementptr inbounds i8, i8* %144, i64 32
  %146 = bitcast i8* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = bitcast i8* %139 to i64*
  store i64 %147, i64* %148, align 8
  %149 = bitcast %Array* %temps.i.i to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds i8, i8* %95, i64 8
  %152 = bitcast i8* %151 to i64*
  %153 = load i64, i64* %152, align 8
  %154 = load i64, i64* %134, align 8
  %155 = getelementptr inbounds i8, i8* %95, i64 32
  %156 = add nsw i64 %154, %153
  %sext.i.i.i = shl i64 %150, 32
  %157 = ashr exact i64 %sext.i.i.i, 32
  %158 = mul nsw i64 %156, %157
  %159 = add i64 %158, 32
  %160 = tail call i8* @malloc(i64 %159) #5
  %161 = bitcast i8* %160 to i64*
  %162 = getelementptr inbounds i8, i8* %160, i64 8
  %163 = bitcast i8* %162 to i64*
  %164 = getelementptr inbounds i8, i8* %160, i64 16
  %165 = bitcast i8* %164 to i64*
  %166 = getelementptr inbounds i8, i8* %160, i64 24
  %167 = bitcast i8* %166 to i64*
  store i64 %157, i64* %161, align 8
  store i64 %156, i64* %163, align 8
  store i64 1, i64* %165, align 8
  store i64 0, i64* %167, align 8
  %168 = getelementptr inbounds i8, i8* %160, i64 32
  %169 = mul nsw i64 %153, %150
  %170 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %168, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %168, i8* nonnull align 1 %155, i64 %169, i1 false) #2
  %171 = getelementptr inbounds i8, i8* %168, i64 %169
  %172 = mul nsw i64 %154, %150
  %173 = tail call i64 @llvm.objectsize.i64.p0i8(i8* nonnull %171, i1 false, i1 true, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %171, i8* nonnull align 1 %139, i64 %172, i1 false) #2
  %174 = bitcast i8* %160 to %Array*
  %175 = load i64, i64* %165, align 8
  %176 = add nsw i64 %175, 1
  store i64 %176, i64* %165, align 8
  %177 = icmp slt i64 %175, 0
  br i1 %177, label %178, label %__quantum__rt__array_update_reference_count.exit2.i.i

178:                                              ; preds = %condFalse__1.i.i
  tail call void @free(i8* nonnull %160) #2
  br label %__quantum__rt__array_update_reference_count.exit2.i.i

__quantum__rt__array_update_reference_count.exit2.i.i: ; preds = %178, %condFalse__1.i.i
  %179 = load i64, i64* %136, align 8
  %180 = add nsw i64 %179, -1
  store i64 %180, i64* %136, align 8
  %181 = icmp slt i64 %179, 2
  br i1 %181, label %182, label %__quantum__rt__array_update_reference_count.exit3.i.i

182:                                              ; preds = %__quantum__rt__array_update_reference_count.exit2.i.i
  tail call void @free(i8* nonnull %131) #2
  br label %__quantum__rt__array_update_reference_count.exit3.i.i

__quantum__rt__array_update_reference_count.exit3.i.i: ; preds = %182, %__quantum__rt__array_update_reference_count.exit2.i.i
  %183 = load i64, i64* %165, align 8
  %184 = add nsw i64 %183, -1
  store i64 %184, i64* %165, align 8
  %185 = icmp slt i64 %183, 2
  br i1 %185, label %186, label %condContinue__1.i.i

186:                                              ; preds = %__quantum__rt__array_update_reference_count.exit3.i.i
  tail call void @free(i8* nonnull %160) #2
  br label %condContinue__1.i.i

condContinue__1.i.i:                              ; preds = %186, %__quantum__rt__array_update_reference_count.exit3.i.i, %130, %condTrue__1.i.i
  %__qsVar1__newControls__.i.i = phi %Array* [ %temps.i.i, %condTrue__1.i.i ], [ %temps.i.i, %130 ], [ %174, %__quantum__rt__array_update_reference_count.exit3.i.i ], [ %174, %186 ]
  %187 = bitcast %Array* %__qsVar1__newControls__.i.i to i8*
  %188 = getelementptr inbounds i8, i8* %187, i64 24
  %189 = bitcast i8* %188 to i64*
  %190 = load i64, i64* %189, align 8
  %191 = add nsw i64 %190, 1
  store i64 %191, i64* %189, align 8
  %192 = tail call dereferenceable_or_null(40) i8* @malloc(i64 40) #5
  %193 = bitcast i8* %192 to i64*
  %194 = getelementptr inbounds i8, i8* %192, i64 8
  %195 = bitcast i8* %194 to i64*
  %196 = getelementptr inbounds i8, i8* %192, i64 16
  %197 = bitcast i8* %196 to i64*
  store i64 16, i64* %193, align 8
  store i64 1, i64* %195, align 8
  store i64 0, i64* %197, align 8
  %198 = getelementptr inbounds i8, i8* %192, i64 24
  %199 = bitcast i8* %198 to %Tuple*
  %200 = bitcast %Tuple* %199 to { %Array*, %Qubit* }*
  %201 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %200, i64 0, i32 0
  %202 = getelementptr inbounds { %Array*, %Qubit* }, { %Array*, %Qubit* }* %200, i64 0, i32 1
  %203 = getelementptr inbounds i8, i8* %187, i64 16
  %204 = bitcast i8* %203 to i64*
  %205 = load i64, i64* %204, align 8
  %206 = add nsw i64 %205, 1
  store i64 %206, i64* %204, align 8
  %207 = icmp slt i64 %205, 0
  br i1 %207, label %208, label %__quantum__rt__array_update_reference_count.exit5.i.i

208:                                              ; preds = %condContinue__1.i.i
  tail call void @free(i8* nonnull %187) #2
  br label %__quantum__rt__array_update_reference_count.exit5.i.i

__quantum__rt__array_update_reference_count.exit5.i.i: ; preds = %208, %condContinue__1.i.i
  store %Array* %__qsVar1__newControls__.i.i, %Array** %201, align 8
  %209 = bitcast %Qubit** %202 to i64*
  store i64 %arg1.i.i, i64* %209, align 8
  %210 = load [4 x void (i8*, i8*, i8*)*]*, [4 x void (i8*, i8*, i8*)*]** %58, align 8
  %211 = getelementptr inbounds [4 x void (i8*, i8*, i8*)*], [4 x void (i8*, i8*, i8*)*]* %210, i64 0, i64 0
  %212 = load void (i8*, i8*, i8*)*, void (i8*, i8*, i8*)** %211, align 8
  %213 = load i8*, i8** %61, align 8
  tail call void %212(i8* %213, i8* nonnull %198, i8* null)
  br i1 %.not.not9.i.i, label %body__2.lr.ph.i.i, label %exit__2.i.i

body__2.lr.ph.i.i:                                ; preds = %__quantum__rt__array_update_reference_count.exit5.i.i
  %__qsVar0____qsVar0__numPair____11.i.i = add nsw i64 %numControlPairs.i.i, -1
  %214 = bitcast i8* %controls8.i.i to i64*
  %215 = bitcast %Array* %temps.i.i to i64*
  %216 = getelementptr inbounds i8, i8* %controls8.i.i, i64 32
  %217 = getelementptr inbounds i8, i8* %95, i64 32
  br label %body__2.i.i

body__2.i.i:                                      ; preds = %body__2.lr.ph.i.i, %exit_quantum_grouping16
  %218 = phi i64 [ %__qsVar0____qsVar0__numPair____11.i.i, %body__2.lr.ph.i.i ], [ %235, %exit_quantum_grouping16 ]
  %219 = shl nuw i64 %218, 1
  %220 = load i64, i64* %214, align 8
  %221 = mul nsw i64 %220, %219
  %222 = getelementptr inbounds i8, i8* %216, i64 %221
  %223 = bitcast i8* %222 to %Qubit**
  %224 = load %Qubit*, %Qubit** %223, align 8
  %225 = or i64 %219, 1
  %226 = mul nsw i64 %225, %220
  %227 = getelementptr inbounds i8, i8* %216, i64 %226
  %228 = bitcast i8* %227 to %Qubit**
  %229 = load %Qubit*, %Qubit** %228, align 8
  %230 = load i64, i64* %215, align 8
  %231 = mul nsw i64 %230, %218
  %232 = getelementptr inbounds i8, i8* %217, i64 %231
  %233 = bitcast i8* %232 to %Qubit**
  %234 = load %Qubit*, %Qubit** %233, align 8
  %235 = add i64 %218, -1
  %236 = icmp sgt i64 %235, -1
  br label %quantum15

quantum15:                                        ; preds = %body__2.i.i
  tail call void @__quantum__qis__h__body(%Qubit* %234)
  tail call void @__quantum__qis__cnot__body(%Qubit* %234, %Qubit* %229)
  tail call void @__quantum__qis__t__body(%Qubit* %229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %224, %Qubit* %229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %234, %Qubit* %224)
  tail call void @__quantum__qis__t__adj(%Qubit* %234)
  tail call void @__quantum__qis__t__body(%Qubit* %224)
  tail call void @__quantum__qis__t__adj(%Qubit* %229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %224, %Qubit* %229)
  tail call void @__quantum__qis__cnot__body(%Qubit* %234, %Qubit* %224)
  tail call void @__quantum__qis__h__body(%Qubit* %234)
  br label %readout14

readout14:                                        ; preds = %quantum15
  br label %post-classical13

post-classical13:                                 ; preds = %readout14
  br label %exit_quantum_grouping16

exit_quantum_grouping16:                          ; preds = %post-classical13
  br i1 %236, label %body__2.i.i, label %exit__2.i.i

exit__2.i.i:                                      ; preds = %exit_quantum_grouping16, %__quantum__rt__array_update_reference_count.exit5.i.i
  %237 = load i64, i64* %97, align 8
  %238 = add nsw i64 %237, -1
  store i64 %238, i64* %97, align 8
  %239 = load i64, i64* %189, align 8
  %240 = add nsw i64 %239, -1
  store i64 %240, i64* %189, align 8
  %241 = load i64, i64* %204, align 8
  %242 = add nsw i64 %241, -1
  store i64 %242, i64* %204, align 8
  %243 = icmp slt i64 %241, 2
  br i1 %243, label %244, label %__quantum__rt__array_update_reference_count.exit6.i.i

244:                                              ; preds = %exit__2.i.i
  tail call void @free(i8* nonnull %187) #2
  %.pre.i.i = load i64, i64* %204, align 8
  br label %__quantum__rt__array_update_reference_count.exit6.i.i

__quantum__rt__array_update_reference_count.exit6.i.i: ; preds = %244, %exit__2.i.i
  %245 = phi i64 [ %242, %exit__2.i.i ], [ %.pre.i.i, %244 ]
  %246 = add nsw i64 %245, -1
  store i64 %246, i64* %204, align 8
  %247 = icmp slt i64 %245, 2
  br i1 %247, label %248, label %__quantum__rt__array_update_reference_count.exit7.i.i

248:                                              ; preds = %__quantum__rt__array_update_reference_count.exit6.i.i
  tail call void @free(i8* nonnull %187) #2
  br label %__quantum__rt__array_update_reference_count.exit7.i.i

__quantum__rt__array_update_reference_count.exit7.i.i: ; preds = %248, %__quantum__rt__array_update_reference_count.exit6.i.i
  %249 = load i64, i64* %195, align 8
  %250 = add nsw i64 %249, -1
  store i64 %250, i64* %195, align 8
  %251 = icmp slt i64 %249, 2
  br i1 %251, label %252, label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i

252:                                              ; preds = %__quantum__rt__array_update_reference_count.exit7.i.i
  tail call void @free(i8* nonnull %192) #2
  br label %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i

Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i: ; preds = %252, %__quantum__rt__array_update_reference_count.exit7.i.i
  tail call void @__quantum__rt__qubit_release_array(%Array* nonnull %temps.i.i)
  %253 = load i32, i32* %65, align 4
  %254 = add nsw i32 %253, -1
  store i32 %254, i32* %65, align 4
  %255 = load i64, i64* %88, align 8
  %256 = add nsw i64 %255, -1
  store i64 %256, i64* %88, align 8
  %257 = load i32, i32* %63, align 8
  %258 = add nsw i32 %257, -1
  store i32 %258, i32* %63, align 8
  %259 = load i64, i64* %79, align 8
  %260 = add nsw i64 %259, -1
  store i64 %260, i64* %79, align 8
  %261 = icmp slt i64 %259, 2
  br i1 %261, label %262, label %__quantum__rt__array_update_reference_count.exit1.i

262:                                              ; preds = %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i
  tail call void @free(i8* nonnull %10) #2
  br label %__quantum__rt__array_update_reference_count.exit1.i

__quantum__rt__array_update_reference_count.exit1.i: ; preds = %262, %Microsoft__Quantum__Intrinsic___26acdebbfdfe4106a1c0329ac8da397a___QsRef23__ApplyWithLessControlsA____body.exit.i
  %263 = load i64, i64* %70, align 8
  %264 = add nsw i64 %263, -1
  store i64 %264, i64* %70, align 8
  %265 = icmp slt i64 %263, 2
  br i1 %265, label %266, label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

266:                                              ; preds = %__quantum__rt__array_update_reference_count.exit1.i
  tail call void @free(i8* nonnull %67) #2
  br label %Microsoft__Quantum__Intrinsic__Z__ctl.exit

Microsoft__Quantum__Intrinsic__Z__ctl.exit:       ; preds = %exit_quantum_grouping, %exit_quantum_grouping4, %exit_quantum_grouping8, %__quantum__rt__array_update_reference_count.exit1.i, %266
  %267 = load i64, i64* %12, align 8
  %268 = add nsw i64 %267, -1
  store i64 %268, i64* %12, align 8
  %269 = load i64, i64* %7, align 8
  %270 = add nsw i64 %269, -1
  store i64 %270, i64* %7, align 8
  ret void
}

declare void @__quantum__qis__t__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__t__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__adj(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__s__body(%Qubit*) local_unnamed_addr

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*) local_unnamed_addr

declare void @__quantum__qis__h__body(%Qubit*) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64 @llvm.objectsize.i64.p0i8(i8*, i1, i1, i1)

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare void @__quantum__qis__mz__body(%Qubit*, %Result*) local_unnamed_addr

declare i1 @__quantum__qis__read_result__body(%Result*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="24" "requiredResults"="24" }
attributes #1 = { nofree nounwind }
attributes #2 = { nounwind }
attributes #3 = { argmemonly nounwind willreturn writeonly }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind allocsize(0) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"Homebrew clang version 11.1.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}

