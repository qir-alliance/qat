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
    ir_manip->declareFunction("void @no_opt(i64)");

    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__int_record_output(i64)");

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__z__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__y__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");

    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("void @__quantum__rt__result_record_output(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__bool_record_output(i1)");
    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");

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

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetQisConfiguration::fromQirTargetName("default"));
    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());

    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

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
  call void @no_opt(i64 %3)
  )script");

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%0 = call i64 @get_arg()",
            "%1 = icmp slt i64 %0, 0",
            "%2 = mul i64 %0, 45",
            "%3 = add i64 %2, 13",
            "br label %load",
        },
        "entry"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%4 = select i1 %1, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)",
            "%5 = select i1 %1, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null",
            "br label %quantum",
        },
        "load"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__x__body(%Qubit* %4)",
            "tail call void @__quantum__qis__z__body(%Qubit* null)",
            "tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %5)",
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__mz__body(%Qubit* %5, %Result* null)",
            "tail call void @__quantum__qis__reset__body(%Qubit* %5)",
            "%6 = tail call i1 @__quantum__qis__read_result__body(%Result* null)",
            "br label %post-classical",
        },
        "readout"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%7 = select i1 %6, i64 -7, i64 %3",
            "call void @no_opt(i64 %7)",
            "br label %exit_quantum_grouping",
        },
        "post-classical"));
}

TEST(GroupingComponent, BasicRecording)
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
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__int_record_output(i64 %3)  
  call void @__quantum__rt__int_record_output(i64 %3)    
  call void @__quantum__rt__int_record_output(i64 %3)    
  call void @__quantum__rt__array_end_record_output()
  call void @no_opt(i64 %3)
  )script");

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%0 = call i64 @get_arg()",
            "%1 = icmp slt i64 %0, 0",
            "%2 = mul i64 %0, 45",
            "%3 = add i64 %2, 13",
            "br label %load",
        },
        "entry"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%4 = select i1 %1, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)",
            "%5 = select i1 %1, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null",
            "br label %quantum",
        },
        "load"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__x__body(%Qubit* %4)",
            "tail call void @__quantum__qis__z__body(%Qubit* null)",
            "tail call void @__quantum__qis__cnot__body(%Qubit* %4, %Qubit* %5)",
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__mz__body(%Qubit* %5, %Result* null)",
            "tail call void @__quantum__qis__reset__body(%Qubit* %5)",
            "%6 = tail call i1 @__quantum__qis__read_result__body(%Result* null)",
            "br label %post-classical",
        },
        "readout"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%7 = select i1 %6, i64 -7, i64 %3",
            "call void @__quantum__rt__array_start_record_output()",
            "call void @__quantum__rt__int_record_output(i64 %7)",
            "call void @__quantum__rt__int_record_output(i64 %7)",
            "call void @__quantum__rt__int_record_output(i64 %7)",
            "call void @__quantum__rt__array_end_record_output()",
            "call void @no_opt(i64 %7)",
            "br label %exit_quantum_grouping",
        },
        "post-classical"));
}

TEST(GroupingComponent, DeferredMeasurement)
{
    ConfigurationManager configuration_manager;
    auto                 ir_manip = newIrManip(R"script(
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

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__h__body(%Qubit* null)",
            "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)",
            "call void @__quantum__qis__reset__body(%Qubit* null)",
            "%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* " // NOLINT
            "nonnull inttoptr (i64 1 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "%1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to "
            "%Result*))",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* "
            "nonnull "
            "inttoptr (i64 2 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "%2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to "
            "%Result*))",
            "br label %post-classical",
        },
        "readout"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__rt__array_start_record_output()",
            "call void @__quantum__rt__bool_record_output(i1 %0)",
            "call void @__quantum__rt__bool_record_output(i1 %1)",
            "call void @__quantum__rt__bool_record_output(i1 %2)",
            "call void @__quantum__rt__array_end_record_output()",
            "br label %exit_quantum_grouping",
        },
        "post-classical"));
}

TEST(GroupingComponent, ReuseTest)
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
  tail call void @__quantum__qis__x__body(%Qubit* %a1.i.i)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %a1.i.i, %Qubit* %a2.i.i)
  tail call void @__quantum__qis__mz__body(%Qubit* %a2.i.i, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %a2.i.i)
  %2 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %3 = mul i64 %z, 45
  %.op.op.i.i = add i64 %3, 13
  %4 = select i1 %1, i64 -7, i64 %.op.op.i.i
  %5 = select i1 %2, i64 -7, i64 %.op.op.i.i  
  call void @no_opt(i64 %4)
  call void @no_opt(i64 %5)
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
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__mz__body(%Qubit* %3, %Result* null)",
            "tail call void @__quantum__qis__reset__body(%Qubit* %3)",
            "%4 = tail call i1 @__quantum__qis__read_result__body(%Result* null)",
            "br label %post-classical",

        },
        "readout"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%5 = mul i64 %0, 45",
            "%6 = add i64 %5, 13",
            "%7 = select i1 %4, i64 -7, i64 %6",
            "call void @no_opt(i64 %7)",
            "br label %load4",
        },
        "post-classical"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__x__body(%Qubit* %2)",
            "tail call void @__quantum__qis__z__body(%Qubit* null)",
            "tail call void @__quantum__qis__cnot__body(%Qubit* %2, %Qubit* %3)",
        },
        "quantum2"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "tail call void @__quantum__qis__mz__body(%Qubit* %3, %Result* null)",
            "tail call void @__quantum__qis__reset__body(%Qubit* %3)",
            "%8 = tail call i1 @__quantum__qis__read_result__body(%Result* null)",
            "br label %post-classical1",
        },
        "readout3"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "%9 = select i1 %8, i64 -7, i64 %6",
            "call void @no_opt(i64 %9)",
            "br label %exit_quantum_grouping",
        },
        "post-classical1"));
}

TEST(GroupingComponent, DeferredMeasurementSplit)
{
    ConfigurationManager configuration_manager;
    auto                 ir_manip = newIrManip(R"script(
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

  call void @__quantum__qis__x__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__reset__body(%Qubit* null)
  %x1 = call i1 @__quantum__qis__read_result__body(%Result* null)
  call void @__quantum__qis__y__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  %x2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* nonnull inttoptr (i64 2 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  %x3 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to %Result*))

  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__bool_record_output(i1 %x1)
  call void @__quantum__rt__bool_record_output(i1 %x2)
  call void @__quantum__rt__bool_record_output(i1 %x3)
  call void @__quantum__rt__array_end_record_output()
  call void @__quantum__rt__array_start_record_output()
  call void @__quantum__rt__bool_record_output(i1 %r1)
  call void @__quantum__rt__bool_record_output(i1 %r2)
  call void @__quantum__rt__bool_record_output(i1 %r3)
  call void @__quantum__rt__array_end_record_output()
  )script");

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__h__body(%Qubit* null)",
            "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "br label %readout",
        },
        "quantum"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)",
            "call void @__quantum__qis__reset__body(%Qubit* null)",
            "%0 = call i1 @__quantum__qis__read_result__body(%Result* null)",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* " // NOLINT
            "nonnull inttoptr (i64 1 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "%1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to "
            "%Result*))",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* "
            "nonnull "
            "inttoptr (i64 2 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "%2 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to "
            "%Result*))",
            "br label %post-classical",
        },
        "readout"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__x__body(%Qubit* null)",
            "call void @__quantum__qis__y__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "br label %readout3",
        },
        "quantum2"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)",
            "call void @__quantum__qis__reset__body(%Qubit* null)",
            "%3 = call i1 @__quantum__qis__read_result__body(%Result* null)",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* " // NOLINT
            "nonnull inttoptr (i64 1 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))",
            "%4 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to "
            "%Result*))",
            "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* "
            "nonnull "
            "inttoptr (i64 2 to %Result*))",
            "call void @__quantum__qis__reset__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))",
            "%5 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 2 to "
            "%Result*))",
            "br label %post-classical1",
        },
        "readout3"));

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {
            "call void @__quantum__rt__array_start_record_output()",
            "call void @__quantum__rt__bool_record_output(i1 %3)",
            "call void @__quantum__rt__bool_record_output(i1 %4)",
            "call void @__quantum__rt__bool_record_output(i1 %5)",
            "call void @__quantum__rt__array_end_record_output()",
            "call void @__quantum__rt__array_start_record_output()",
            "call void @__quantum__rt__bool_record_output(i1 %0)",
            "call void @__quantum__rt__bool_record_output(i1 %1)",
            "call void @__quantum__rt__bool_record_output(i1 %2)",
            "call void @__quantum__rt__array_end_record_output()",
            "br label %exit_quantum_grouping",
        },
        "post-classical1"));
}