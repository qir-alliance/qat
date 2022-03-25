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
        bool                               force_log_collection,
        bool                               debug,
        llvm::TargetMachine*               target_machine)
      : loop_analysis_manager_{debug}
      , function_analysis_manager_{debug}
      , gscc_analysis_manager_{debug}
      , module_analysis_manager_{debug}
      , logger_{nullptr}
    {

        pass_builder_ = std::make_unique<llvm::PassBuilder>(target_machine);

        pass_builder_->registerModuleAnalyses(module_analysis_manager_);
        pass_builder_->registerCGSCCAnalyses(gscc_analysis_manager_);
        pass_builder_->registerFunctionAnalyses(function_analysis_manager_);
        pass_builder_->registerLoopAnalyses(loop_analysis_manager_);

        pass_builder_->crossRegisterProxies(
            loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);

        if (force_log_collection || !cfg.saveReportTo().empty())
        {
            logger_ = std::make_shared<LogCollection>();
        }

        if (!cfg.saveReportTo().empty())
        {
            save_to_filename_ = cfg.saveReportTo();
        }

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

    Validator::LogColloectionPtr Validator::logger() const
    {
        return logger_;
    }

    void Validator::saveReportToFileIfNeeded()
    {
        if (!save_to_filename_.empty() && logger_)
        {
            std::fstream fout(save_to_filename_, std::ios::out);
            bool         not_first = false;

            fout << "[";
            for (auto& message : logger_->messages())
            {
                if (not_first)
                {
                    fout << ",";
                }
                fout << "\n";
                fout << "  {\n";

                switch (message.type)
                {
                case LogCollection::Type::Debug:
                    fout << "    \"type\": \"debug\",\n";
                    break;
                case LogCollection::Type::Info:
                    fout << "    \"type\": \"info\",\n";
                    break;
                case LogCollection::Type::Warning:
                    fout << "    \"type\": \"warning\",\n";
                    break;
                case LogCollection::Type::Error:
                    fout << "    \"type\": \"error\",\n";
                    break;
                case LogCollection::Type::InternalError:
                    fout << "    \"type\": \"internalError\",\n";
                    break;
                }

                fout << "    \"message\": \"" << message.message << "\",\n";
                fout << "    \"location\": {\n";
                fout << "      \"filename\": \"" << static_cast<std::string>(message.location.name) << "\",\n";
                fout << "      \"line\": " << message.location.line << ",\n";
                fout << "      \"column\": " << message.location.column << ",\n";
                fout << "      \"llvm_hint\": \"" << message.location.llvm_hint << "\",\n";
                fout << "      \"frontend_hint\": \"" << message.location.frontend_hint << "\"\n";
                fout << "    }\n";
                fout << "  }";
                not_first = true;
            }
            fout << "\n]\n";

            fout.close();
        }
    }

} // namespace quantum
} // namespace microsoft
