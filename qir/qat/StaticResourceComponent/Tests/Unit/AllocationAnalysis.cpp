// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/Generators/ConfigurableProfileGenerator.hpp"
#include "qir/qat/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
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

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");

    ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");
    ir_manip->declareFunction("%Result* @__quantum__qis__m__body(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__result_record_output(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");
    ir_manip->declareFunction("%Result* @__quantum__rt__result_get_zero()");
    ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
    ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");

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

struct DummyConfig
{
    void setup(ConfigurationManager&) {}
};

class AnalysisReadoutPass : public llvm::PassInfoMixin<AnalysisReadoutPass>
{
  public:
    AnalysisReadoutPass(AllocationAnalysis& analysis_result)
      : analysis_result_{analysis_result}
    {
    }
    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
    {
        analysis_result_ = fam.getResult<AllocationAnalysisPass>(function);
        return llvm::PreservedAnalyses::all();
    }

    static bool isRequired()
    {
        return true;
    }

  private:
    AllocationAnalysis& analysis_result_;
};

class Configuration : public StaticResourceComponentConfiguration
{
  public:
    Configuration()
      : StaticResourceComponentConfiguration(StaticResourceComponentConfiguration::createDisabled())
    {
    }

    void enableAnnotateQubitUse()
    {
        annotate_qubit_use_ = true;
    }

    void enableAnnotateResultUse()
    {
        annotate_result_use_ = true;
    }

    void enableAnnotateMaxQubitIndex()
    {
        annotate_max_qubit_index_ = true;
    }

    void enableAnnotateMaxResultIndex()
    {
        annotate_max_result_index_ = true;
    }

    void enableReplaceQubitOnReset()
    {
        replace_qubit_on_reset_ = true;
    }

    void enableReindexQubits()
    {
        reindex_qubits_ = true;
    }

    void enableInlineAfterIdChange()
    {
        inline_after_id_change_ = true;
    }
};

std::shared_ptr<ConfigurableProfileGenerator> newProfile(
    AllocationAnalysis&                         analysis_result,
    StaticResourceComponentConfiguration const& cfg)
{
    auto                  profile               = std::make_shared<ConfigurableProfileGenerator>();
    ConfigurationManager& configuration_manager = profile->configurationManager();

    configuration_manager.addConfig<FactoryConfiguration>();
    configuration_manager.addConfig<DummyConfig>();

    profile->registerAnonymousProfileComponent<DummyConfig>(
        [&analysis_result](DummyConfig const& config, ProfileGenerator* ptr, Profile& profile)
        {
            auto& fpm = ptr->functionPassManager();
            fpm.addPass(AnalysisReadoutPass(analysis_result));
        });

    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(cfg);

    return profile;
}

TEST(StaticResourceComponent, AllocationAnalysisPass)
{
    auto               ir_manip = newIrManip(R"script(
    call void @__quantum__qis__h__body(%Qubit* inttoptr (i64 9 to %Qubit*))
    call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 9 to %Qubit*), %Qubit* inttoptr (i64 1 to %Qubit*))
    call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* inttoptr (i64 2 to %Qubit*))
    %result0 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 9 to %Qubit*))
    %result1 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 1 to %Qubit*))
    %result2 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 2 to %Qubit*))
    call void @__quantum__rt__array_start_record_output()
    call void @__quantum__rt__result_record_output(%Result* %result0)
    call void @__quantum__rt__result_record_output(%Result* %result1)
    call void @__quantum__rt__result_record_output(%Result* %result2)
    call void @__quantum__rt__array_end_record_output()
    call void @__quantum__rt__array_start_record_output()
    %zero = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero)
    %zero1 = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero1)
    %zero2 = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero2)
    call void @__quantum__rt__array_end_record_output()
  )script");
    AllocationAnalysis analysis_result{0};

    auto profile = newProfile(analysis_result, Configuration());
    ir_manip->applyProfile(profile);

    EXPECT_EQ(analysis_result.usage_qubit_counts, 3);
    EXPECT_EQ(analysis_result.usage_result_counts, 3);
    EXPECT_EQ(analysis_result.largest_qubit_index, 9);
    EXPECT_EQ(analysis_result.largest_result_index, 2);
}

TEST(StaticResourceComponent, RemapTest)
{
    auto               ir_manip = newIrManip(R"script(
    call void @__quantum__qis__h__body(%Qubit* inttoptr (i64 9 to %Qubit*))
    call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 9 to %Qubit*), %Qubit* inttoptr (i64 1 to %Qubit*))
    call void @__quantum__qis__cnot__body(%Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* inttoptr (i64 2 to %Qubit*))
    %result0 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 9 to %Qubit*))
    %result1 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 1 to %Qubit*))
    %result2 = call %Result* @__quantum__qis__m__body(%Qubit* inttoptr (i64 2 to %Qubit*))
    call void @__quantum__rt__array_start_record_output()
    call void @__quantum__rt__result_record_output(%Result* %result0)
    call void @__quantum__rt__result_record_output(%Result* %result1)
    call void @__quantum__rt__result_record_output(%Result* %result2)
    call void @__quantum__rt__array_end_record_output()
    call void @__quantum__rt__array_start_record_output()
    %zero = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero)
    %zero1 = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero1)
    %zero2 = call %Result* @__quantum__rt__result_get_zero()
    call void @__quantum__rt__result_record_output(%Result* %zero2)
    call void @__quantum__rt__array_end_record_output()
  )script");
    AllocationAnalysis analysis_result{0};

    Configuration config;
    config.enableReindexQubits();
    auto profile = newProfile(analysis_result, config);
    ir_manip->applyProfile(profile);

    EXPECT_EQ(analysis_result.usage_qubit_counts, 3);
    EXPECT_EQ(analysis_result.usage_result_counts, 3);
    EXPECT_EQ(analysis_result.largest_qubit_index, 2);
    EXPECT_EQ(analysis_result.largest_result_index, 2);
}

TEST(StaticResourceComponent, AllocateOnMeasure)
{
    auto               ir_manip = newIrManip(R"script(
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 2 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 3 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 4 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 5 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 6 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  )script");
    AllocationAnalysis analysis_result{0};

    Configuration config;
    config.enableReplaceQubitOnReset();

    auto profile = newProfile(analysis_result, config);
    ir_manip->applyProfile(profile);

    EXPECT_EQ(analysis_result.usage_qubit_counts, 7);
    EXPECT_EQ(analysis_result.usage_result_counts, 7);
    EXPECT_EQ(analysis_result.largest_qubit_index, 6);
    EXPECT_EQ(analysis_result.largest_result_index, 6);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "%0 = inttoptr i64 0 to %Qubit*",
        "%1 = inttoptr i64 0 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %0, %Result* %1)",
        "%2 = inttoptr i64 1 to %Qubit*",
        "%3 = inttoptr i64 1 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %2, %Result* %3)",
        "%4 = inttoptr i64 2 to %Qubit*",
        "%5 = inttoptr i64 2 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %4, %Result* %5)",
        "%6 = inttoptr i64 3 to %Qubit*",
        "%7 = inttoptr i64 3 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %6, %Result* %7)",
        "%8 = inttoptr i64 4 to %Qubit*",
        "%9 = inttoptr i64 4 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %8, %Result* %9)",
        "%10 = inttoptr i64 5 to %Qubit*",
        "%11 = inttoptr i64 5 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %10, %Result* %11)",
        "%12 = inttoptr i64 6 to %Qubit*",
        "%13 = inttoptr i64 6 to %Result*",
        "call void @__quantum__qis__mz__body(%Qubit* %12, %Result* %13)",
    }));
}

TEST(StaticResourceComponent, AllocateOnMeasureWithInline)
{
    auto               ir_manip = newIrManip(R"script(
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 1 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 2 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 3 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 4 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 5 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* nonnull inttoptr (i64 6 to %Result*))
  call void @__quantum__qis__reset__body(%Qubit* null)
  )script");
    AllocationAnalysis analysis_result{0};

    Configuration config;
    config.enableReplaceQubitOnReset();
    config.enableInlineAfterIdChange();

    auto profile = newProfile(analysis_result, config);
    ir_manip->applyProfile(profile);

    EXPECT_EQ(analysis_result.usage_qubit_counts, 7);
    EXPECT_EQ(analysis_result.usage_result_counts, 7);
    EXPECT_EQ(analysis_result.largest_qubit_index, 6);
    EXPECT_EQ(analysis_result.largest_result_index, 6);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 1 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 2 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 3 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 3 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 4 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 4 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 5 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 5 to %Result*))",
        "call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 6 to %Qubit*), %Result* "
        "nonnull inttoptr (i64 6 to %Result*))",
    }));
}