// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
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
    ir_manip->declareOpaque("Array");
    ir_manip->declareOpaque("Tuple");
    ir_manip->declareOpaque("Range");
    ir_manip->declareOpaque("Callable");
    ir_manip->declareOpaque("String");

    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__s__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__cx__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__rz__body(double, %Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__t__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__z__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("%Array* @__quantum__rt__array_copy(%Array*, i1)");
    ir_manip->declareFunction("%Array* @__quantum__rt__array_create_1d(i32, i64)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
    ir_manip->declareFunction("i1 @__quantum__qis__read_result__body(%Result*)");
    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__result_update_reference_count(%Result*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

void expectFail(String const& target_name, String const& script, std::vector<String> const& errors)
{
    auto ir_manip = newIrManip(script);

    ConfigurationManager configuration_manager;
    auto                 adaptor_generator = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager);

    configuration_manager.setConfig(TargetQisMappingPassConfiguration::createDisabled());
    configuration_manager.setConfig(TargetProfileConfiguration::fromQirTargetName(target_name));
    configuration_manager.setConfig(TargetQisConfiguration::fromQirTargetName(target_name));
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    EXPECT_TRUE(ir_manip->containsExactValidationErrors(adaptor_generator, target_name, errors, true));
}

} // namespace

TEST(QSharpNegative, IfWithPhi)
{
    expectFail(
        "default", R"script(
  %0 = icmp eq i64 9, 1
  br i1 %0, label %quantum, label %IfWithPhi__Main__body.exit

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__h__body(%Qubit* null)
  br label %IfWithPhi__Main__body.exit

IfWithPhi__Main__body.exit:                        ; preds = %quantum, %entry
  %ret.0.i = phi i64 [ 9, %quantum ], [ 1, %entry ]
  )script",
        {
            "%ret.0.i = phi i64 [ 9, %quantum ], [ 1, %entry ]",
            "%0 = icmp eq i64 9, 1",
        });
}

TEST(QSharpNegative, SelectStmt)
{
    expectFail(
        "default", R"script(
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__h__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*))
  tail call void @__quantum__qis__mz__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* inttoptr (i64 1 to %Qubit*))
  %0 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %1 = select i1 %0, i64 1337, i64 122
  )script",
        {
            "%1 = select i1 %0, i64 1337, i64 122",
        });
}

TEST(QSharpNegative, ExternalFunctions)
{
    expectFail(
        "default", R"script(
  %q.i = tail call %Qubit* @__quantum__rt__qubit_allocate()
  tail call void @__quantum__qis__h__body(%Qubit* %q.i)
  %result.i.i = tail call %Result* @__quantum__qis__m__body(%Qubit* %q.i)
  tail call void @__quantum__qis__reset__body(%Qubit* %q.i)
  tail call void @__quantum__rt__result_update_reference_count(%Result* %result.i.i, i32 -1)
  tail call void @__quantum__rt__qubit_release(%Qubit* %q.i)
)script",
        {
            "tail call void @__quantum__rt__qubit_release(%Qubit* %q.i)",
            "tail call void @__quantum__rt__result_update_reference_count(%Result* "
            "%result.i.i, i32 -1)",
            "%result.i.i = tail call %Result* @__quantum__qis__m__body(%Qubit* %q.i)",
            "%q.i = tail call %Qubit* @__quantum__rt__qubit_allocate()",
        });
}

TEST(QSharpNegative, LoopWithPhiAndSelect)
{
    expectFail(
        "default", R"script(
  %.not1.i = icmp slt i64 5, 1
  br i1 %.not1.i, label %LoopCase__Main__body.1.exit, label %body__1.i

body__1.i:                                        ; preds = %body__1.i, %entry
  %0 = phi i64 [ %2, %body__1.i ], [ 2, %entry ]
  %1 = icmp sgt i64 %0, 5
  %2 = add i64 %0, 1
  tail call void @__quantum__qis__h__body(%Qubit* null)
  tail call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* null)
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br i1 %1, label %header__1.exit__1_crit_edge.i, label %body__1.i

header__1.exit__1_crit_edge.i:                    ; preds = %body__1.i
  %4 = select i1 %3, i64 1337, i64 122
  br label %LoopCase__Main__body.1.exit

LoopCase__Main__body.1.exit:                      ; preds = %header__1.exit__1_crit_edge.i, %entry
  %ret.0.lcssa.i = phi i64 [ %4, %header__1.exit__1_crit_edge.i ], [ 1, %entry ]
  )script",
        {
            "%0 = phi i64 [ %2, %body__1.i ], [ 2, %entry ]",
            "%4 = select i1 %3, i64 1337, i64 122",
            "%1 = icmp sgt i64 %0, 5",
            "%.not1.i = icmp slt i64 5, 1",
            "%ret.0.lcssa.i = phi i64 [ %4, %header__1.exit__1_crit_edge.i ], [ 1, %entry ]",
        });
}
