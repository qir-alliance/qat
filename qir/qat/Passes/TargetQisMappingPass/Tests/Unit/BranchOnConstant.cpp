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
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
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

TEST(RuleSetTestSuite, BranchOnConstantZeroZero)
{
    auto ir_manip = newIrManip(R"script(
  %0 = call %Result* @__quantum__rt__result_get_zero()
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
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

        factory.optimizeConstantResult();

        factory.optimizeResultZero();
    };

    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"call void @send_message()", "call void @bye_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%0 = call i1 @__quantum__rt__result_get_zero()"}) ||
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_get_zero()"}));
}

TEST(RuleSetTestSuite, BranchOnConstantZeroOne)
{
    auto ir_manip = newIrManip(R"script(
  %0 = call %Result* @__quantum__rt__result_get_zero()
  %1 = call %Result* @__quantum__rt__result_get_one()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
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

        factory.optimizeConstantResult();

        factory.optimizeResultZero();
    };

    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"call void @bye_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"call void @send_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%0 = call i1 @__quantum__rt__result_get_zero()"}) ||
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_get_one()"}));
}

TEST(RuleSetTestSuite, BranchOnConstantOneZero)
{
    auto ir_manip = newIrManip(R"script(
  %0 = call %Result* @__quantum__rt__result_get_one()
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
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

        factory.optimizeConstantResult();

        factory.optimizeResultZero();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"call void @bye_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"call void @send_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%0 = call i1 @__quantum__rt__result_get_one()"}) ||
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_get_zero()"}));
}

TEST(RuleSetTestSuite, BranchOnConstantOneOne)
{
    auto ir_manip = newIrManip(R"script(
  %0 = call %Result* @__quantum__rt__result_get_one()
  %1 = call %Result* @__quantum__rt__result_get_one()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
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

        factory.optimizeConstantResult();

        factory.optimizeResultZero();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"call void @send_message()", "call void @bye_message()"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%0 = call i1 @__quantum__rt__result_get_one()"}) ||
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_get_one()"}));
}
