// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
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
    ir_manip->declareOpaque("String");
    ir_manip->declareOpaque("Array");

    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("%String* @__quantum__rt__result_to_string(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__message(%String*)");

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
TEST(RuleSetTestSuite, RemovingLeftOverZeroAndOnes)
{
    auto ir_manip = newIrManip(R"script(
    %0 = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 1)
    %1 = call %String* @__quantum__rt__result_to_string(%Result* %0)
    call void @__quantum__rt__message(%String* %1)
    call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
    call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  )script");

    auto configure_adaptor = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

        factory.disableReferenceCounting();
        factory.disableStringSupport();
        factory.removeGetZeroOrOne();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    // We expect that the calls are there initially
    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%0 = call %Result* @__quantum__rt__result_get_zero()"}));

    ir_manip->applyQirAdaptor(adaptor);

    // We expect that the call was removed
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%0 = call %Result* @__quantum__rt__result_get_zero()"}));
    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%1 = call %String* @__quantum__rt__result_to_string(%Result* %0)"}));
}
