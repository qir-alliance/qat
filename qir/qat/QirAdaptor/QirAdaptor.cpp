// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/QirAdaptor/QirAdaptor.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

namespace microsoft::quantum
{

QirAdaptor::QirAdaptor(
    ConfigurationManager& configuration_manager,
    String const&         name,
    ILoggerPtr const&     logger,
    bool                  debug,
    llvm::TargetMachine*  target_machine,
    AllocationManagerPtr  qubit_allocation_manager,
    AllocationManagerPtr  result_allocation_manager)
  : name_{name}
  , configuration_manager_{configuration_manager}
  , logger_{logger}
  , pass_instrumentation_callbacks_{std::make_unique<llvm::PassInstrumentationCallbacks>()}
  , standard_instrumentations_{std::make_unique<llvm::StandardInstrumentations>(debug)}
  , qubit_allocation_manager_{std::move(qubit_allocation_manager)}
  , result_allocation_manager_{std::move(result_allocation_manager)}
  , validator_{std::make_unique<Validator>(
        configuration_manager_.get<TargetProfileConfiguration>(),
        configuration_manager_.get<TargetQisConfiguration>(),
        logger,
        debug)}
{

    standard_instrumentations_->registerCallbacks(*pass_instrumentation_callbacks_);

    // TODO(issue-13): Parameterize
    // pipeline_tuning_options_.LoopUnrolling = !DisableLoopUnrolling;
    // pipeline_tuning_options_.Coroutines = Coroutines;

    pass_builder_ = std::make_unique<llvm::PassBuilder>(
        target_machine, pipeline_tuning_options_, pgo_options_, pass_instrumentation_callbacks_.get());

    registerEPCallbacks();

    // Creating a full pass builder and registering each of the
    // components to make them accessible to the developer.
    pass_builder_->registerModuleAnalyses(module_analysis_manager_);
    pass_builder_->registerCGSCCAnalyses(gscc_analysis_manager_);
    pass_builder_->registerFunctionAnalyses(function_analysis_manager_);
    pass_builder_->registerLoopAnalyses(loop_analysis_manager_);

    pass_builder_->crossRegisterProxies(
        loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);
}

void QirAdaptor::registerEPCallbacks()
{

    if (tryParsePipelineText<llvm::FunctionPassManager>(*pass_builder_, peephole_ep_pipeline_))
    {
        pass_builder_->registerPeepholeEPCallback(
            [this](llvm::FunctionPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse PeepholeEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, peephole_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::LoopPassManager>(*pass_builder_, late_loop_optimizations_ep_pipeline_))
    {
        pass_builder_->registerLateLoopOptimizationsEPCallback(
            [this](llvm::LoopPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse LateLoopOptimizationsEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, late_loop_optimizations_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::LoopPassManager>(*pass_builder_, loop_optimizer_end_ep_pipeline_))
    {
        pass_builder_->registerLoopOptimizerEndEPCallback(
            [this](llvm::LoopPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse LoopOptimizerEndEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, loop_optimizer_end_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::FunctionPassManager>(*pass_builder_, scalar_optimizer_late_ep_pipeline_))
    {
        pass_builder_->registerScalarOptimizerLateEPCallback(
            [this](llvm::FunctionPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse ScalarOptimizerLateEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, scalar_optimizer_late_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::CGSCCPassManager>(*pass_builder_, cgscc_optimizer_late_ep_pipeline_))
    {
        pass_builder_->registerCGSCCOptimizerLateEPCallback(
            [this](llvm::CGSCCPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse CGSCCOptimizerLateEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, cgscc_optimizer_late_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::FunctionPassManager>(*pass_builder_, vectorizer_start_ep_pipeline_))
    {
        pass_builder_->registerVectorizerStartEPCallback(
            [this](llvm::FunctionPassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse VectorizerStartEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, vectorizer_start_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::ModulePassManager>(*pass_builder_, pipeline_start_ep_pipeline_))
    {
        pass_builder_->registerPipelineStartEPCallback(
            [this](llvm::ModulePassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse PipelineStartEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, pipeline_start_ep_pipeline_));
            });
    }

    if (tryParsePipelineText<llvm::FunctionPassManager>(*pass_builder_, optimizer_last_ep_pipeline_))
    {
        pass_builder_->registerOptimizerLastEPCallback(
            [this](llvm::ModulePassManager& pass_manager, llvm::OptimizationLevel)
            {
                llvm::ExitOnError error_safeguard("Unable to parse OptimizerLastEP pipeline: ");
                error_safeguard(pass_builder_->parsePassPipeline(pass_manager, optimizer_last_ep_pipeline_));
            });
    }
}

void QirAdaptor::apply(llvm::Module& module)
{
    module_pass_manager_.run(module, module_analysis_manager_);
}

bool QirAdaptor::verify(llvm::Module& module)
{
    llvm::VerifierAnalysis verifier;
    auto                   result = verifier.run(module, module_analysis_manager_);
    return !result.IRBroken;
}

bool QirAdaptor::validate(llvm::Module& module)
{
    return validator_->validate(module);
}

String const& QirAdaptor::name() const
{
    return name_;
}

QirAdaptor::AllocationManagerPtr QirAdaptor::getQubitAllocationManager()
{
    return qubit_allocation_manager_;
}

QirAdaptor::AllocationManagerPtr QirAdaptor::getResultAllocationManager()
{
    return result_allocation_manager_;
}

void QirAdaptor::setValidator(ValidatorPtr&& validator)
{
    validator_ = std::move(validator);
}

llvm::PassBuilder& QirAdaptor::passBuilder()
{
    return *pass_builder_;
}
llvm::LoopAnalysisManager& QirAdaptor::loopAnalysisManager()
{
    return loop_analysis_manager_;
}
llvm::FunctionAnalysisManager& QirAdaptor::functionAnalysisManager()
{
    return function_analysis_manager_;
}
llvm::CGSCCAnalysisManager& QirAdaptor::gsccAnalysisManager()
{
    return gscc_analysis_manager_;
}
llvm::ModuleAnalysisManager& QirAdaptor::moduleAnalysisManager()
{
    return module_analysis_manager_;
}

llvm::ModulePassManager& QirAdaptor::modulePassManager()
{
    return module_pass_manager_;
}
} // namespace microsoft::quantum
