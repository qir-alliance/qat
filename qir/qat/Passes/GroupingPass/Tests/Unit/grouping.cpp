// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"

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
    ir_manip->declareOpaque("Array");
    ir_manip->declareOpaque("Tuple");
    ir_manip->declareOpaque("Range");
    ir_manip->declareOpaque("Callable");
    ir_manip->declareOpaque("String");

    ir_manip->declareFunction("i64 @get_arg()");

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__z__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");

    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__result_record_output(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("i1 @__quantum__qis__read_result__body(%Result*)");

    ir_manip->declareFunction("i64 @TeleportChain__Calculate__body(i64, %Qubit*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    return ir_manip;
}
} // namespace

std::shared_ptr<ConfigurableQirAdaptorFactory> newQirAdaptor(ConfigurationManager& configuration_manager)
{

    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager);

    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration());

    return adaptor;
}

TEST(GroupingComponent, BasicGrouping)
{
    ConfigurationManager configuration_manager;
    auto                 ir_manip = newIrManip(R"script(
  %z = call i64 @get_arg()
  %0 = icmp slt i64 %z, 0
  %a1.i.i = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %a2.i.i = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  tail call void @__quantum__qis__x__body(%Qubit* %a1.i.i)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %a1.i.i, %Qubit* %a2.i.i)
  tail call void @__quantum__qis__mz__body(%Qubit* %a2.i.i, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %a2.i.i)
  %1 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %2 = mul i64 %z, 45
  %.op.op.i.i = add i64 %2, 13
  %3 = select i1 %1, i64 -7, i64 %.op.op.i.i
  )script");

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%0 = call i64 @get_arg()",
            "%1 = icmp slt i64 %0, 0",
            "br label %load",
        },
        "entry"));
    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%2 = select i1 %1, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)",
            "%3 = select i1 %1, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null",
            "br label %quantum",
        },
        "load"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__x__body(%Qubit* %2)",
            "tail call void @__quantum__qis__z__body(%Qubit* null)",
            "tail call void @__quantum__qis__cnot__body(%Qubit* %2, %Qubit* %3)",
            "tail call void @__quantum__qis__mz__body(%Qubit* %3, %Result* null)",
            "tail call void @__quantum__qis__reset__body(%Qubit* %3)",
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%4 = tail call i1 @__quantum__qis__read_result__body(%Result* null)",
            "br label %post-classical",
        },
        "readout"));
}