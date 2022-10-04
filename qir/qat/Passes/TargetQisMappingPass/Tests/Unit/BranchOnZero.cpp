// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"
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

    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @send_message()");
    ir_manip->declareFunction("void @bye_message()");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(RuleSetTestSuite, BranchOnZero)
{
    auto ir_manip = newIrManip(R"script(
  %0 = inttoptr i64 0 to %Result*
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* %0)
  call void @__quantum__qis__reset__body(%Qubit* null)
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  br i1 %2, label %then0__1, label %continue__1

then0__1:
  call void @send_message()
  br label %continue__1

continue__1:
  call void @bye_message()
  ret i8 0
  )script");

    auto configure_adaptor = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

        factory.optimizeResultZero();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    // This optimistation is specific to the the __quantum__qis__read_result__body which
    // returns 1 or 0 depending on the result. We expect that
    //
    // %1 = call %Result* @__quantum__rt__result_get_zero()
    // %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
    // br i1 %2, label %then0__1, label %continue__1
    //
    // will be mapped to using this pattern.

    EXPECT_TRUE(
        ir_manip->hasInstructionSequence(
            {"%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
             "br i1 %0, label %continue__1, label %then0__1"}) ||

        ir_manip->hasInstructionSequence(
            {"%0 = call i1 @__quantum__qis__read_result__body(%Result* null)", "%1 = xor i1 %0, true",
             "br i1 %1, label %then0__1, label %continue__1"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}) ||
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_get_zero()"}) ||
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_get_zero()"}));
}
