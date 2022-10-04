// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

#include <functional>

using namespace microsoft::quantum;
using namespace microsoft::quantum::notation;
using Value        = llvm::Value;
using Builder      = llvm::IRBuilder<>;
using Captures     = RuleSet::Captures;
using Replacements = RuleSet::Replacements;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
{
    IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareOpaque("Qubit");
    ir_manip->declareOpaque("Array");
    ir_manip->declareOpaque("Result");

    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

TEST(RuleSetTestSuite, IntToPtr)
{
    auto ir_manip          = newIrManip(R"script(
  %0 = inttoptr i64 2 to %Array*
 )script");
    bool matched           = false;
    auto configure_adaptor = [&matched](RuleSet& rule_set)
    {
        auto inttoptr = intToPtr(constInt());
        auto rule     = ReplacementRule(
                std::move(inttoptr),
                [&matched](Builder&, Value*, Captures&, Replacements&)
                {
                matched = true;
                return true;
                });
        auto ret = std::make_shared<ReplacementRule>(std::move(rule));

        rule_set.addRule(ret);
    };

    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(matched);
}

TEST(RuleSetTestSuite, EmbeddedIntToPtr)
{
    auto ir_manip = newIrManip(R"script(
  %0 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* nonnull inttoptr (i64 2 to %Array*), i64 0)
  )script");
    bool matched  = false;

    auto configure_adaptor = [&matched](RuleSet& rule_set)
    {
        auto inttoptr = call("__quantum__rt__array_get_element_ptr_1d", intToPtr(constInt()), constInt());
        auto rule     = ReplacementRule(
                std::move(inttoptr),
                [&matched](Builder&, Value*, Captures&, Replacements&)
                {
                matched = true;
                return true;
                });
        auto ret = std::make_shared<ReplacementRule>(std::move(rule));

        rule_set.addRule(ret);
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(matched);
}

TEST(RuleSetTestSuite, ExpandedIntToPtr)
{
    auto ir_manip = newIrManip(R"script(
  %leftPreshared = inttoptr i64 2 to %Array*
  %0 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %leftPreshared, i64 0)
  )script");
    bool matched  = false;

    auto configure_adaptor = [&matched](RuleSet& rule_set)
    {
        auto inttoptr = call("__quantum__rt__array_get_element_ptr_1d", intToPtr(constInt()), constInt());
        auto rule     = ReplacementRule(
                std::move(inttoptr),
                [&matched](Builder&, Value*, Captures&, Replacements&)
                {
                matched = true;
                return true;
                });
        auto ret = std::make_shared<ReplacementRule>(std::move(rule));

        rule_set.addRule(ret);
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(matched);
}
