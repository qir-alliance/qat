; ModuleID = 'combined.ll'
source_filename = "qat-link"

%Array = type opaque
%Qubit = type opaque

define void @Microsoft__Quantum__Samples__Test__Interop() local_unnamed_addr #0 {
entry:
  %0 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 20)
  %1 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to %Qubit**
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 7)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 8)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 9)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 10)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 11)
  %24 = bitcast i8* %23 to %Qubit**
  %25 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 12)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 13)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 14)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 15)
  %32 = bitcast i8* %31 to %Qubit**
  %33 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 16)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 17)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 18)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 19)
  %40 = bitcast i8* %39 to %Qubit**
  %41 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %44 = bitcast i8* %43 to %Qubit**
  %45 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %46 = bitcast i8* %45 to %Qubit**
  %47 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %50 = bitcast i8* %49 to %Qubit**
  %51 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %54 = bitcast i8* %53 to %Qubit**
  %55 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 7)
  %56 = bitcast i8* %55 to %Qubit**
  %57 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 9)
  %58 = bitcast i8* %57 to %Qubit**
  %59 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 10)
  %60 = bitcast i8* %59 to %Qubit**
  %61 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 11)
  %62 = bitcast i8* %61 to %Qubit**
  %63 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 12)
  %64 = bitcast i8* %63 to %Qubit**
  %65 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 13)
  %66 = bitcast i8* %65 to %Qubit**
  %67 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 14)
  %68 = bitcast i8* %67 to %Qubit**
  %69 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 15)
  %70 = bitcast i8* %69 to %Qubit**
  %71 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 16)
  %72 = bitcast i8* %71 to %Qubit**
  %73 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 17)
  %74 = bitcast i8* %73 to %Qubit**
  %75 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 19)
  %76 = bitcast i8* %75 to %Qubit**
  %77 = load %Qubit*, %Qubit** %42, align 8
  %78 = load %Qubit*, %Qubit** %44, align 8
  %79 = load %Qubit*, %Qubit** %46, align 8
  %80 = load %Qubit*, %Qubit** %48, align 8
  %81 = load %Qubit*, %Qubit** %50, align 8
  %82 = load %Qubit*, %Qubit** %52, align 8
  %83 = load %Qubit*, %Qubit** %54, align 8
  %84 = load %Qubit*, %Qubit** %56, align 8
  %85 = load %Qubit*, %Qubit** %58, align 8
  %86 = load %Qubit*, %Qubit** %60, align 8
  %87 = load %Qubit*, %Qubit** %62, align 8
  %88 = load %Qubit*, %Qubit** %64, align 8
  %89 = load %Qubit*, %Qubit** %66, align 8
  %90 = load %Qubit*, %Qubit** %68, align 8
  %91 = load %Qubit*, %Qubit** %70, align 8
  %92 = load %Qubit*, %Qubit** %72, align 8
  %93 = load %Qubit*, %Qubit** %74, align 8
  %94 = load %Qubit*, %Qubit** %76, align 8
  store %Qubit* null, %Qubit** %2, align 8
  store %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit** %4, align 8
  store %Qubit* inttoptr (i64 2 to %Qubit*), %Qubit** %6, align 8
  store %Qubit* inttoptr (i64 3 to %Qubit*), %Qubit** %8, align 8
  store %Qubit* inttoptr (i64 4 to %Qubit*), %Qubit** %10, align 8
  store %Qubit* inttoptr (i64 5 to %Qubit*), %Qubit** %12, align 8
  store %Qubit* inttoptr (i64 6 to %Qubit*), %Qubit** %14, align 8
  store %Qubit* inttoptr (i64 7 to %Qubit*), %Qubit** %16, align 8
  store %Qubit* inttoptr (i64 8 to %Qubit*), %Qubit** %18, align 8
  store %Qubit* inttoptr (i64 9 to %Qubit*), %Qubit** %20, align 8
  store %Qubit* inttoptr (i64 10 to %Qubit*), %Qubit** %22, align 8
  store %Qubit* inttoptr (i64 11 to %Qubit*), %Qubit** %24, align 8
  store %Qubit* inttoptr (i64 12 to %Qubit*), %Qubit** %26, align 8
  store %Qubit* inttoptr (i64 13 to %Qubit*), %Qubit** %28, align 8
  store %Qubit* inttoptr (i64 14 to %Qubit*), %Qubit** %30, align 8
  store %Qubit* inttoptr (i64 15 to %Qubit*), %Qubit** %32, align 8
  store %Qubit* inttoptr (i64 16 to %Qubit*), %Qubit** %34, align 8
  store %Qubit* inttoptr (i64 17 to %Qubit*), %Qubit** %36, align 8
  store %Qubit* inttoptr (i64 18 to %Qubit*), %Qubit** %38, align 8
  store %Qubit* inttoptr (i64 19 to %Qubit*), %Qubit** %40, align 8
  tail call void @__quantum__qis__x__body(%Qubit* %77)
  tail call void @__quantum__qis__x__body(%Qubit* %78)
  tail call void @__quantum__qis__x__body(%Qubit* %79)
  tail call void @__quantum__qis__x__body(%Qubit* %80)
  tail call void @__quantum__qis__x__body(%Qubit* %81)
  tail call void @__quantum__qis__x__body(%Qubit* %82)
  tail call void @__quantum__qis__x__body(%Qubit* %83)
  tail call void @__quantum__qis__x__body(%Qubit* %84)
  tail call void @__quantum__qis__x__body(%Qubit* %85)
  tail call void @__quantum__qis__x__body(%Qubit* %86)
  tail call void @__quantum__qis__x__body(%Qubit* %87)
  tail call void @__quantum__qis__x__body(%Qubit* %88)
  tail call void @__quantum__qis__x__body(%Qubit* %89)
  tail call void @__quantum__qis__x__body(%Qubit* %90)
  tail call void @__quantum__qis__x__body(%Qubit* %91)
  tail call void @__quantum__qis__x__body(%Qubit* %92)
  tail call void @__quantum__qis__x__body(%Qubit* %93)
  tail call void @__quantum__qis__x__body(%Qubit* %94)
  ret void
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64) local_unnamed_addr

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64) local_unnamed_addr

declare void @__quantum__qis__x__body(%Qubit*) local_unnamed_addr

attributes #0 = { "InteropFriendly" "requiredQubits"="20" "requiredResults"="0" }
