// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/AdaptorFactory/TargetProfileMappingConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/CommentLogger.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
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

    ir_manip->declareFunction("%Qubit* @__non_standard_allocator()");
    ir_manip->declareFunction("i8* @__non_standard_int_allocator()");
    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(RuleSetTestSuite, AllocationActionRelease)
{
    auto ir_manip = newIrManip(R"script(
  %qubit = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  call void @__quantum__rt__qubit_release(%Qubit* %qubit)    
  )script");

    auto configure_adaptor = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);
        factory.useStaticQubitAllocation();
    };

    ConfigurationManager configuration_manager;
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager, std::move(configure_adaptor), TargetQisMappingPassConfiguration::createDisabled(),
        LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {"%qubit = inttoptr i64 0 to %Qubit*", "call void @__quantum__qis__h__body(%Qubit* %qubit)"}));
}

// Scenario 2 - Multiple sequential allocations
TEST(RuleSetTestSuite, MultipleAllocationsNoRelease)
{
    auto ir_manip = newIrManip(R"script(
  %qubit1 = call %Qubit* @__quantum__rt__qubit_allocate()
  %qubit2 = call %Qubit* @__quantum__rt__qubit_allocate()
  %qubit3 = call %Qubit* @__quantum__rt__qubit_allocate()
  %qubit4 = call %Qubit* @__quantum__rt__qubit_allocate()
  %qubit5 = call %Qubit* @__quantum__rt__qubit_allocate()
  )script");

    ConfigurationManager configuration_manager;
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager,
        [](RuleSet& rule_set)
        {
            auto factory = RuleFactory(
                                rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

            factory.useStaticQubitAllocation();
        },
        TargetQisMappingPassConfiguration::createDisabled(), LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    // Checking that static allocations happened
    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "%qubit1 = inttoptr i64 0 to %Qubit*",
        "%qubit2 = inttoptr i64 1 to %Qubit*",
        "%qubit3 = inttoptr i64 2 to %Qubit*",
        "%qubit4 = inttoptr i64 3 to %Qubit*",
        "%qubit5 = inttoptr i64 4 to %Qubit*",
    }));

    // Checking that dynamic allocations were removed
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit1 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit2 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit3 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit4 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit5 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
}

// Scenario 3 -  Allocate, release - multiple times
TEST(RuleSetTestSuite, AllocateReleaseMultipleTimes)
{
    auto                 ir_manip = newIrManip(R"script(
  %qubit1 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit1)    
  %qubit2 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit2)    
  %qubit3 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit3)    
  %qubit4 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit4)  
  %qubit5 = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %qubit4)  
  )script");
    ConfigurationManager configuration_manager;
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager,
        [](RuleSet& rule_set)
        {
            auto a = BasicAllocationManager::createNew();
            auto b = BasicAllocationManager::createNew();
            a->setReuseRegisters(true);
            b->setReuseRegisters(true);

            auto factory = RuleFactory(rule_set, std::move(a), std::move(b), nullptr);

            factory.useStaticQubitAllocation();
        },
        TargetQisMappingPassConfiguration::createDisabled(), LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "%qubit1 = inttoptr i64 0 to %Qubit*",
        "%qubit2 = inttoptr i64 0 to %Qubit*",
        "%qubit3 = inttoptr i64 0 to %Qubit*",
        "%qubit4 = inttoptr i64 0 to %Qubit*",
        "%qubit5 = inttoptr i64 0 to %Qubit*",
    }));

    // Checking that dynamic allocations were removed
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit1 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit2 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit3 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit4 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({
        "%qubit5 = call %Qubit* @__quantum__rt__qubit_allocate()",
    }));
}

// Scenario 4 -  Allocate, release - multiple times
TEST(RuleSetTestSuite, ErrorAllocateReleaseByName)
{
    auto                 ir_manip = newIrManip(R"script(
  %leftMessage = call %Qubit* @__non_standard_allocator()
  call void @__quantum__rt__qubit_release(%Qubit* %leftMessage)  
  )script");
    ConfigurationManager configuration_manager;
    auto                 logger  = std::make_shared<CommentLogger>();
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager,
        [logger](RuleSet& rule_set)
        {
            auto factory =
                RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), logger);

            factory.useStaticQubitAllocation();
        },
        TargetQisMappingPassConfiguration::createDisabled(), LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(logger->hadErrors());
    EXPECT_FALSE(ir_manip->isModuleBroken());
    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%leftMessage = call %Qubit* @__non_standard_allocator()"}));
}

TEST(RuleSetTestSuite, ErrorAllocateReleaseByNameWithNoName)
{
    auto                 ir_manip = newIrManip(R"script(
  %0 = call %Qubit* @__non_standard_allocator()
  call void @__quantum__rt__qubit_release(%Qubit* %0)  
  )script");
    ConfigurationManager configuration_manager;
    auto                 logger  = std::make_shared<CommentLogger>();
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager,
        [logger](RuleSet& rule_set)
        {
            auto factory =
                RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), logger);

            factory.useStaticQubitAllocation();
        },
        TargetQisMappingPassConfiguration::createDisabled(), LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(logger->hadErrors());
    EXPECT_FALSE(ir_manip->isModuleBroken());
    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%0 = call %Qubit* @__non_standard_allocator()"}));
}

TEST(RuleSetTestSuite, ErrorReleaseWithTypeErasedAllocation)
{
    auto                 ir_manip = newIrManip(R"script(
  %0 = call i8* @__non_standard_int_allocator()
  %1 = bitcast i8* %0 to %Qubit* 
  call void @__quantum__rt__qubit_release(%Qubit* %1)  
  )script");
    ConfigurationManager configuration_manager;
    auto                 logger  = std::make_shared<CommentLogger>();
    auto                 adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(
        configuration_manager,
        [logger](RuleSet& rule_set)
        {
            auto factory =
                RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), logger);

            factory.useStaticQubitAllocation();
        },
        TargetQisMappingPassConfiguration::createDisabled(), LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileMappingConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(logger->hadErrors());
    EXPECT_FALSE(ir_manip->isModuleBroken());
    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%0 = call i8* @__non_standard_int_allocator()"}));
}
