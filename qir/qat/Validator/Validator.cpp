// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/CommentLogger.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Logging/LogCollection.hpp"
#include "qir/qat/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/ValidationPass/FunctionValidationPass.hpp"
#include "qir/qat/ValidationPass/ValidationPass.hpp"
#include "qir/qat/Validator/Validator.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>

namespace microsoft::quantum
{

Validator::Validator(
    ValidationPassConfiguration const& cfg,
    ILoggerPtr const&                  logger,
    bool /*debug*/,
    llvm::TargetMachine* target_machine)
  : logger_{logger}
{

    pass_builder_ = std::make_unique<llvm::PassBuilder>(target_machine);

    pass_builder_->registerModuleAnalyses(module_analysis_manager_);
    pass_builder_->registerCGSCCAnalyses(gscc_analysis_manager_);
    pass_builder_->registerFunctionAnalyses(function_analysis_manager_);
    pass_builder_->registerLoopAnalyses(loop_analysis_manager_);

    pass_builder_->crossRegisterProxies(
        loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);

    // Checking if we need to use provided logger or install one
    if (logger_)
    {
        function_analysis_manager_.registerPass([&] { return AllocationAnalysisPass(logger_); });

        module_pass_manager_.addPass(llvm::createModuleToFunctionPassAdaptor(FunctionValidationPass(cfg, logger_)));
        module_pass_manager_.addPass(ValidationPass(cfg, logger_));
    }
    else
    {
        // Our default is a pass that logs errors via comments
        auto logger = std::make_shared<CommentLogger>();
        function_analysis_manager_.registerPass([&] { return AllocationAnalysisPass(logger); });

        module_pass_manager_.addPass(llvm::createModuleToFunctionPassAdaptor(FunctionValidationPass(cfg, logger)));

        module_pass_manager_.addPass(ValidationPass(cfg, logger));
    }
}

bool Validator::validate(llvm::Module& module)
{
    llvm::VerifierAnalysis verifier;
    auto                   result = verifier.run(module, module_analysis_manager_);

    if (result.IRBroken)
    {
        if (logger_)
        {
            logger_->error("Fatal error: Invalid IR.");
        }

        return false;
    }

    try
    {
        module_pass_manager_.run(module, module_analysis_manager_);
    }
    catch (std::exception const& e)
    {
        if (logger_)
        {
            logger_->error("Fatal error: " + static_cast<std::string>(e.what()));
        }

        return false;
    }

    return true;
}

llvm::PassBuilder& Validator::passBuilder()
{
    return *pass_builder_;
}

llvm::LoopAnalysisManager& Validator::loopAnalysisManager()
{
    return loop_analysis_manager_;
}

llvm::FunctionAnalysisManager& Validator::functionAnalysisManager()
{
    return function_analysis_manager_;
}

llvm::CGSCCAnalysisManager& Validator::gsccAnalysisManager()
{
    return gscc_analysis_manager_;
}

llvm::ModuleAnalysisManager& Validator::moduleAnalysisManager()
{
    return module_analysis_manager_;
}

Validator::ILoggerPtr Validator::logger() const
{
    return logger_;
}

} // namespace microsoft::quantum
