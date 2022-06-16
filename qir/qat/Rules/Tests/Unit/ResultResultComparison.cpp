// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPassConfiguration.hpp"
#include "Rules/Factory.hpp"
#include "TestTools/IrManipulationTestHelper.hpp"
#include "gtest/gtest.h"

#include "Llvm/Llvm.hpp"

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
    ir_manip->declareOpaque("String");
    ir_manip->declareOpaque("Array");

    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");

    ir_manip->declareFunction("void @__quantum__rt__array_update_reference_count(%Array*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__string_update_reference_count(%String*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(RuleSetTestSuite, ResultResultComparison)
{
    auto ir_manip = newIrManip(R"script(
  %q0 = call %Qubit* @__quantum__rt__qubit_allocate()
  %q1 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q0)
  call void @__quantum__qis__cnot__body(%Qubit* %q0, %Qubit* %q1)
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
  %result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
  %0 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %result__2)
  call void @__quantum__rt__result_update_reference_count(%Result* %result, i32 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__2, i32 -1)
  br i1 %0, label %then0__1, label %continue__1
then0__1:                                         ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* %q0)
  call void @__quantum__qis__x__body(%Qubit* %q1)
  br label %continue__1
continue__1:                                      ; preds = %then0__1, %entry
  %result__4 = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q0)
  call void @__quantum__rt__qubit_release(%Qubit* %q1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 1)
  call void @__quantum__rt__result_update_reference_count(%Result* %result__4, i32 -1)
  )script");

    auto configure_profile = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

        factory.disableReferenceCounting();
        factory.disableStringSupport();
        factory.optimizeResultComparison();
        factory.useStaticResultAllocation();
    };

    auto                  profile = std::make_shared<ConfigurableProfileGenerator>(std::move(configure_profile));
    ConfigurationManager& configuration_manager = profile->configurationManager();

    configuration_manager.setConfig(ValidationPassConfiguration::fromProfileName("default"));
    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    // We expect that the calls are there initially
    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {"%result = call %Result* @__quantum__qis__m__body(%Qubit* %q0)",
         "%result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)",
         "%0 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %result__2)"}));

    ir_manip->applyProfile(profile);

    // We expect that the call was removed
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%result = call %Result* @__quantum__qis__m__body(%Qubit* %q0)"}));
    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%result__2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence(
        {"%0 = call i1 @__quantum__rt__result_equal(%Result* %result, %Result* %result__2)"}));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {"%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
         "%1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))",
         "%2 = xor i1 %0, %1"}));
}
