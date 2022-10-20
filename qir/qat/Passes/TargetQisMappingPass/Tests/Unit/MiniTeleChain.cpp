// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

#include <functional>

using namespace microsoft::quantum;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
{
    IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareOpaque("Qubit");
    ir_manip->declareOpaque("Result");
    ir_manip->declareOpaque("Array");
    ir_manip->declareOpaque("Tuple");
    ir_manip->declareOpaque("Range");
    ir_manip->declareOpaque("Callable");
    ir_manip->declareOpaque("String");

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");

    ir_manip->declareFunction("%Array* @__quantum__rt__qubit_allocate_array(i64)");
    ir_manip->declareFunction("void @__quantum__rt__array_update_alias_count(%Array*, i32)");
    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("void @__quantum__qis__z__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__message(%String*)");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release_array(%Array*)");
    ir_manip->declareFunction("%String* @__quantum__rt__result_to_string(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__string_update_reference_count(%String*, i32)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(TargetQisMappingPass, TeleportChain)
{
    auto                 ir_manip = newIrManip(R"script(
  %leftMessage.i = call %Qubit* @__quantum__rt__qubit_allocate()
  %rightMessage.i = call %Qubit* @__quantum__rt__qubit_allocate()
  %leftPreshared.i = call %Array* @__quantum__rt__qubit_allocate_array(i64 2)
  call void @__quantum__rt__array_update_alias_count(%Array* %leftPreshared.i, i32 1)
  %rightPreshared.i = call %Array* @__quantum__rt__qubit_allocate_array(i64 2)
  call void @__quantum__rt__array_update_alias_count(%Array* %rightPreshared.i, i32 1)
  call void @__quantum__qis__h__body(%Qubit* %leftMessage.i)
  call void @__quantum__qis__cnot__body(%Qubit* %leftMessage.i, %Qubit* %rightMessage.i)
  %0 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %leftPreshared.i, i64 0)
  %1 = bitcast i8* %0 to %Qubit**
  %2 = load %Qubit*, %Qubit** %1, align 8
  %3 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 0)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  call void @__quantum__qis__h__body(%Qubit* %2)
  call void @__quantum__qis__cnot__body(%Qubit* %2, %Qubit* %5)
  %6 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %leftPreshared.i, i64 1)
  %7 = bitcast i8* %6 to %Qubit**
  %8 = load %Qubit*, %Qubit** %7, align 8
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 1)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  call void @__quantum__qis__h__body(%Qubit* %8)
  call void @__quantum__qis__cnot__body(%Qubit* %8, %Qubit* %11)
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %leftPreshared.i, i64 0)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 0)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  call void @__quantum__qis__cnot__body(%Qubit* %rightMessage.i, %Qubit* %14)
  call void @__quantum__qis__h__body(%Qubit* %rightMessage.i)
  %result.i.i.i.i = call %Result* @__quantum__qis__m__body(%Qubit* %rightMessage.i)
  call void @__quantum__qis__reset__body(%Qubit* %rightMessage.i)
  %18 = call %Result* @__quantum__rt__result_get_one()
  %19 = call i1 @__quantum__rt__result_equal(%Result* %result.i.i.i.i, %Result* %18)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i.i.i, i32 -1)
  br i1 %19, label %then0__1.i.i.i, label %continue__1.i.i.i

then0__1.i.i.i:                                   ; preds = %entry
  call void @__quantum__qis__z__body(%Qubit* %17)
  br label %continue__1.i.i.i

continue__1.i.i.i:                                ; preds = %then0__1.i.i.i, %entry
  %result.i1.i.i.i = call %Result* @__quantum__qis__m__body(%Qubit* %14)
  call void @__quantum__qis__reset__body(%Qubit* %14)
  %20 = call %Result* @__quantum__rt__result_get_one()
  %21 = call i1 @__quantum__rt__result_equal(%Result* %result.i1.i.i.i, %Result* %20)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i1.i.i.i, i32 -1)
  br i1 %21, label %then0__2.i.i.i, label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i

then0__2.i.i.i:                                   ; preds = %continue__1.i.i.i
  call void @__quantum__qis__x__body(%Qubit* %17)
  br label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i

TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i: ; preds = %then0__2.i.i.i, %continue__1.i.i.i
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 0)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = load %Qubit*, %Qubit** %23, align 8
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %leftPreshared.i, i64 1)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  %28 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 1)
  %29 = bitcast i8* %28 to %Qubit**
  %30 = load %Qubit*, %Qubit** %29, align 8
  call void @__quantum__qis__cnot__body(%Qubit* %24, %Qubit* %27)
  call void @__quantum__qis__h__body(%Qubit* %24)
  %result.i.i.i1.i = call %Result* @__quantum__qis__m__body(%Qubit* %24)
  call void @__quantum__qis__reset__body(%Qubit* %24)
  %31 = call %Result* @__quantum__rt__result_get_one()
  %32 = call i1 @__quantum__rt__result_equal(%Result* %result.i.i.i1.i, %Result* %31)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i.i1.i, i32 -1)
  br i1 %32, label %then0__1.i.i2.i, label %continue__1.i.i4.i

then0__1.i.i2.i:                                  ; preds = %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i
  call void @__quantum__qis__z__body(%Qubit* %30)
  br label %continue__1.i.i4.i

continue__1.i.i4.i:                               ; preds = %then0__1.i.i2.i, %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i
  %result.i1.i.i3.i = call %Result* @__quantum__qis__m__body(%Qubit* %27)
  call void @__quantum__qis__reset__body(%Qubit* %27)
  %33 = call %Result* @__quantum__rt__result_get_one()
  %34 = call i1 @__quantum__rt__result_equal(%Result* %result.i1.i.i3.i, %Result* %33)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i1.i.i3.i, i32 -1)
  br i1 %34, label %then0__2.i.i5.i, label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.1.exit

then0__2.i.i5.i:                                  ; preds = %continue__1.i.i4.i
  call void @__quantum__qis__x__body(%Qubit* %30)
  br label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.1.exit

TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.1.exit: ; preds = %continue__1.i.i4.i, %then0__2.i.i5.i
  %result.i.i = call %Result* @__quantum__qis__m__body(%Qubit* %leftMessage.i)
  call void @__quantum__qis__reset__body(%Qubit* %leftMessage.i)
  %35 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %rightPreshared.i, i64 1)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = load %Qubit*, %Qubit** %36, align 8
  %result.i1.i = call %Result* @__quantum__qis__m__body(%Qubit* %37)
  call void @__quantum__qis__reset__body(%Qubit* %37)
  call void @__quantum__rt__array_update_alias_count(%Array* %leftPreshared.i, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %rightPreshared.i, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %leftMessage.i)
  call void @__quantum__rt__qubit_release(%Qubit* %rightMessage.i)
  call void @__quantum__rt__qubit_release_array(%Array* %leftPreshared.i)
  call void @__quantum__rt__qubit_release_array(%Array* %rightPreshared.i)
  %38 = call %String* @__quantum__rt__result_to_string(%Result* %result.i1.i)
  call void @__quantum__rt__message(%String* %38)
  call void @__quantum__rt__result_update_reference_count(%Result* %result.i1.i, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %38, i32 -1)
  )script");
    ConfigurationManager configuration_manager;
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager);

    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        // clang-format off
"call void @__quantum__qis__h__body(%Qubit* null)",
"call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
"call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
"call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Qubit* nonnull inttoptr (i64 4 to %Qubit*))",
"call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))",
"call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Qubit* nonnull inttoptr (i64 5 to %Qubit*))",
"call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
"call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
"call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* null)",
"call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
"%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
"br i1 %0, label %then0__1.i.i.i, label %continue__1.i.i.i",
        // clang-format on
    }));

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        // clang-format off
      "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))",
      "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
      "%1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))",
      "br i1 %1, label %then0__2.i.i.i, label %TeleportChain__TeleportQubitUsingPresharedEntanglement__body.2.exit.i",
        // clang-format on

    }));

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        // clang-format off
      "call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Qubit* nonnull inttoptr (i64 3 to %Qubit*))",
      "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))",
      "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))",
      "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*))",
      "%2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))",
      "br i1 %2, label %then0__1.i.i2.i, label %continue__1.i.i4.i",
        // clang-format on
    }));

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        // clang-format off
"call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Result* nonnull inttoptr (i64 3 to %Result*))",
"call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*))",
"%3 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 3 to %Result*))",
"br i1 %3, label %then0__2.i.i5.i, label %TeleportChain__DemonstrateTeleportationUsingPresharedEntanglement__body.1.exit",
        // clang-format on
    }));
}
