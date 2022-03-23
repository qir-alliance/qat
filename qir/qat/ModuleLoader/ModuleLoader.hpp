#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "ModuleLoader/DebugInfoUpdater.hpp"
#include "ModuleLoader/DebugTable.hpp"
#include "QatTypes/QatTypes.hpp"
#include "RemoveDisallowedAttributesPass/RemoveDisallowedAttributesPass.hpp"

#include "Llvm/Llvm.hpp"

namespace microsoft
{
namespace quantum
{

    class ModuleLoader
    {
      public:
        using Module       = llvm::Module;
        using Linker       = llvm::Linker;
        using SMDiagnostic = llvm::SMDiagnostic;

        explicit ModuleLoader(Module* final_module)
          : final_module_{final_module}
          , linker_{*final_module}
          , debug_table_{DebugTable::create()}
        {
        }

        bool addModule(std::unique_ptr<Module>&& module, String const& filename = "unknown")
        {
            if (llvm::verifyModule(*module, &llvm::errs()))
            {
                llvm::errs() << filename << ": "
                             << "input module is broken!\n";
                return false;
            }

            return !linker_.linkInModule(std::move(module), Linker::Flags::None);
        }

        bool addIrFile(String input_file)
        {
            bool override_debug_symbols = true;

            // Converting to absolute path
            llvm::SmallVector<char, 256> input_vec;
            input_vec.assign(input_file.begin(), input_file.end());
            llvm::sys::fs::make_absolute(input_vec);
            input_file.resize(input_vec.size());
            uint64_t i = 0;
            for (auto& s : input_vec)
            {
                input_file[i++] = s;
            }

            // Loading module
            SMDiagnostic            err;
            std::unique_ptr<Module> module = llvm::parseIRFile(input_file, err, final_module_->getContext());
            if (!module)
            {
                llvm::errs() << "Failed to load " << input_file << "\n";
                return false;
            }

            // Registering all debug info
            auto directory = llvm::sys::path::parent_path(input_file);
            auto filename  = llvm::sys::path::filename(input_file);

            debug_table_->registerModule(input_file, module.get());

            // Whether or not to override debug symbols
            if (override_debug_symbols)
            {
                // Debug info
                llvm::StripDebugInfo(*module.get());

                // Adding debug versioning
                auto debug_version_key = "Debug Info Version";
                if (!module->getModuleFlag(debug_version_key))
                {
                    module->addModuleFlag(llvm::Module::Warning, debug_version_key, llvm::DEBUG_METADATA_VERSION);
                }

                // Update with debug information
                DebugInfoUpdater updater(debug_table_, *module.get(), directory, filename);
                updater.update();
            }

            // Transforming module
            SingleModuleTransformation transformation;
            if (!transformation.apply(module.get()))
            {
                llvm::errs() << "Failed to transform " << input_file << "\n";
                return false;
            }

            // Linking
            return addModule(std::move(module), input_file);
        }

      private:
        Module*       final_module_;
        Linker        linker_;
        DebugTablePtr debug_table_{nullptr};

        // Single Module Transformation
        //

        class SingleModuleTransformation
        {
          public:
            using PassBuilder             = llvm::PassBuilder;
            using OptimizationLevel       = PassBuilder::OptimizationLevel;
            using FunctionAnalysisManager = llvm::FunctionAnalysisManager;

            explicit SingleModuleTransformation(
                OptimizationLevel const& optimization_level = OptimizationLevel::O0,
                bool                     debug              = false)
              : loop_analysis_manager_{debug}
              , function_analysis_manager_{debug}
              , gscc_analysis_manager_{debug}
              , module_analysis_manager_{debug}
              , optimization_level_{optimization_level}
              , debug_{debug}
            {

                pass_builder_.registerModuleAnalyses(module_analysis_manager_);
                pass_builder_.registerCGSCCAnalyses(gscc_analysis_manager_);
                pass_builder_.registerFunctionAnalyses(function_analysis_manager_);
                pass_builder_.registerLoopAnalyses(loop_analysis_manager_);

                pass_builder_.crossRegisterProxies(
                    loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_,
                    module_analysis_manager_);

                module_pass_manager_.addPass(RemoveDisallowedAttributesPass());
            }

            bool apply(llvm::Module* module)
            {
                module_pass_manager_.run(*module, module_analysis_manager_);

                if (llvm::verifyModule(*module, &llvm::errs()))
                {
                    return false;
                }

                return true;
            }

            bool isDebugMode() const
            {
                return debug_;
            }

          private:
            llvm::PassBuilder             pass_builder_;
            llvm::LoopAnalysisManager     loop_analysis_manager_;
            llvm::FunctionAnalysisManager function_analysis_manager_;
            llvm::CGSCCAnalysisManager    gscc_analysis_manager_;
            llvm::ModuleAnalysisManager   module_analysis_manager_;

            llvm::ModulePassManager module_pass_manager_{};
            OptimizationLevel       optimization_level_{};
            bool                    debug_{false};
        };
    };

} // namespace quantum
} // namespace microsoft
