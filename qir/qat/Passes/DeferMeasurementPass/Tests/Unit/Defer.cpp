// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/AdaptorFactory/TargetProfileMappingConfiguration.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

#include <functional>
#include <memory>

using namespace microsoft::quantum;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
{
    IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareOpaque("Qubit");
    ir_manip->declareOpaque("Result");

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_one()");
    ir_manip->declareFunction("i1 @__quantum__rt__result_equal(%Result*, %Result*)");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__bool_record_output(i1)");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("i1 @__quantum__qis__read_result__body(%Result*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

TEST(DeferMeasurements, ReorderTest)
{
    using namespace microsoft::quantum::notation;

    auto ir_manip = newIrManip(R"script(
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__reset__body(%Qubit* null)
  %r1 = call i1 @__quantum__qis__read_result__body(%Result* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  %r2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  %r3 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__bool_record_output(i1 %r1)
  call void @__quantum__rt__bool_record_output(i1 %r2)
  call void @__quantum__rt__bool_record_output(i1 %r3)
  call void @__quantum__rt__array_end_record_output()
  )script");

    auto configure_adaptor = [](RuleSet&) {};

    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());
    auto cfg = TargetProfileMappingConfiguration::createDisabled();
    cfg.setUseDeferMeasurements(true);
    configuration_manager.setConfig(cfg);

    ir_manip->applyQirAdaptor(adaptor);
    llvm::errs() << *ir_manip->module();

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        // Circuit
        "call void @__quantum__qis__h__body(%Qubit* null)",
        "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
        "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
        // Readout
        "call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)",
        "call void @__quantum__qis__reset__body(%Qubit* null)",
        "%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* " // NOLINT
        "nonnull inttoptr "                                                                          // NOLINT
        "(i64 1 to %Result*))",
        "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
        "%1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* " // NOLINT
        "nonnull inttoptr "                                                                          // NOLINT
        "(i64 2 to %Result*))",
        "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
        "%2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))",
        "call void @__quantum__rt__array_start_record_output()",
        "call void @__quantum__rt__bool_record_output(i1 %0)",
        "call void @__quantum__rt__bool_record_output(i1 %1)",
        "call void @__quantum__rt__bool_record_output(i1 %2)",
        "call void @__quantum__rt__array_end_record_output()",
    }));
}
