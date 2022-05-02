// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "Llvm/Llvm.hpp"
#include "Rules/Factory.hpp"
#include "Rules/ReplacementRule.hpp"
#include "TestTools/IrManipulationTestHelper.hpp"
#include "gtest/gtest.h"

#include <functional>

using namespace microsoft::quantum;

namespace {
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const &script)
{
  IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

  ir_manip->declareOpaque("Qubit");
  ir_manip->declareOpaque("Result");

  ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
  ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
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

}  // namespace

// Single allocation with action and then release
TEST(RuleSetTestSuite, BranchOnOne)
{
  auto ir_manip = newIrManip(R"script(
  %0 = inttoptr i64 0 to %Result*
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* %0)
  call void @__quantum__qis__reset__body(%Qubit* null)
  %1 = call %Result* @__quantum__rt__result_get_one()
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

  auto configure_profile = [](RuleSet &rule_set) {
    auto factory = RuleFactory(rule_set, BasicAllocationManager::createNew(),
                               BasicAllocationManager::createNew(), nullptr);
    // factory.useStaticResultAllocation();

    factory.optimizeResultOne();
  };

  auto profile = std::make_shared<ConfigurableProfileGenerator>(std::move(configure_profile));

  ConfigurationManager &configuration_manager = profile->configurationManager();
  configuration_manager.addConfig<FactoryConfiguration>();

  configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
  configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

  ir_manip->applyProfile(profile);

  // This optimistation is specific to the the __quantum__qis__read_result__body which
  // returns 1 or 0 depending on the result. We expect that
  //
  // %1 = call %Result* @__quantum__rt__result_get_one()
  // %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
  // br i1 %2, label %then0__1, label %continue__1
  //
  // will be mapped to using this instruction.
  EXPECT_TRUE(ir_manip->hasInstructionSequence(
      {"%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
       "br i1 %0, label %then0__1, label %continue__1"}));

  EXPECT_FALSE(ir_manip->hasInstructionSequence(
                   {"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}) ||
               ir_manip->hasInstructionSequence(
                   {"%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)"}));

  EXPECT_FALSE(
      ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_get_one()"}) ||
      ir_manip->hasInstructionSequence({"%2 = call i1 @__quantum__rt__result_get_one()"}));
}
