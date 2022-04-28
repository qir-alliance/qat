// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "Rules/Factory.hpp"
#include "StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
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
        [&analysis_result](DummyConfig const& config, ProfileGenerator* ptr, Profile& profile) {
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

TEST(StaticResourceComponent, AllocationAnalysisPass2)
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