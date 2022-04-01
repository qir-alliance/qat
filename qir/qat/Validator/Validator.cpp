// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/CommentLogger.hpp"
#include "Logging/ILogger.hpp"
#include "Logging/LogCollection.hpp"
#include "ValidationPass/ValidationPass.hpp"
#include "Validator/Validator.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>

namespace microsoft
{
namespace quantum
{

    Validator::Validator(
        ValidationPassConfiguration const& cfg,
        ILoggerPtr const&                  logger,
        bool                               debug,
        llvm::TargetMachine*               target_machine)
      : loop_analysis_manager_{debug}
      , function_analysis_manager_{debug}
      , gscc_analysis_manager_{debug}
      , module_analysis_manager_{debug}
      , logger_{logger}
    {

        pass_builder_ = std::make_unique<llvm::PassBuilder>(target_machine);

        pass_builder_->registerModuleAnalyses(module_analysis_manager_);
        pass_builder_->registerCGSCCAnalyses(gscc_analysis_manager_);
        pass_builder_->registerFunctionAnalyses(function_analysis_manager_);
        pass_builder_->registerLoopAnalyses(loop_analysis_manager_);

        pass_builder_->crossRegisterProxies(
            loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);

        // Checking if we need to save the log to a file
        if (logger_)
        {
            module_pass_manager_.addPass(ValidationPass(cfg, logger_));
        }
        else
        {
            // Our default is a pass that logs errors via comments
            module_pass_manager_.addPass(ValidationPass(cfg, std::make_shared<CommentLogger>()));
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

            saveReportToFileIfNeeded();
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

            saveReportToFileIfNeeded();
            return false;
        }

        saveReportToFileIfNeeded();
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

    void Validator::saveReportToFileIfNeeded()
    {
        if (!save_to_filename_.empty() && logger_)
        {
            // TODO: Move to logger functionality
        }
    }

} // namespace quantum
} // namespace microsoft
