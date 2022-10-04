// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
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

    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Select on measurement result
TEST(RuleSetTestSuite, SelectOnOne)
{
    auto ir_manip = newIrManip(R"script(
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  %0 = call %Result* @__quantum__rt__result_get_one()
  %1 = call i1 @__quantum__rt__result_equal(%Result* nonnull inttoptr (i64 1 to %Result*), %Result* %0)
  %2 = select i1 %1, i8 3, i8 4
  %3 = add i8 2, %2
  ret i8 %3
  )script");

    auto configure_adaptor = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

        factory.optimizeResultOne();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    // This optimization is specific to the the __quantum__qis__read_result__body which
    // returns 1 or 0 depending on the result. We expect that
    //
    // %1 = call %Result* @__quantum__rt__result_get_one()
    // %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
    // ...
    // %5 = select i1 %2, <type> %3, <type> %4
    //
    // will be mapped to using this instruction.

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "%0 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to "
        "%Result*))",
        "%1 = select i1 %0, i8 5, i8 6",
    }));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_equal(%Result* nonnull inttoptr (i64 1 "
                                          "to %Result*), %Result* %0)"}) ||
        ir_manip->hasInstructionSequence({"%1 = call i1 @__quantum__rt__result_equal(%Result* nonnull inttoptr "
                                          "(i64 1 to %Result*), %Result* %0)"}));

    EXPECT_FALSE(
        ir_manip->hasInstructionSequence({"%0 = call %Result* @__quantum__rt__result_get_one()"}) ||
        ir_manip->hasInstructionSequence({"%0 = call %Result* @__quantum__rt__result_get_one()"}));
}
