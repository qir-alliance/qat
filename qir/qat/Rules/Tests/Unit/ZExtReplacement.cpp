// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "Generators/PostTransformConfig.hpp"
#include "GroupingPass/GroupingPass.hpp"
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

    ir_manip->declareFunction("void @print_i64(i64)");
    ir_manip->declareFunction("i1 @get_i1()");
    ir_manip->declareFunction("i2 @get_i2()");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(RuleSetTestSuite, ZExtReplacement)
{
    auto ir_manip = newIrManip(R"script(
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3)    
  )script");

    auto configure_profile = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);
        factory.replaceZextForI1();
    };

    auto profile = std::make_shared<ConfigurableProfileGenerator>(
        std::move(configure_profile), TransformationRulesPassConfiguration::createDisabled(),
        LlvmPassesConfiguration::createDisabled());

    ConfigurationManager& configuration_manager = profile->configurationManager();
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformConfig::createDisabled());

    ir_manip->applyProfile(profile);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%1 = select i1 %0, i64 1, i64 0", "%3 = zext i2 %2 to i64"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%1 = zext i1 %0 to i64"}));
}
