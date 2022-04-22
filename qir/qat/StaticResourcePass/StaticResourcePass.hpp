#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourcePass/StaticResourcePassConfiguration.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
{

    class StaticResourcePass : public llvm::PassInfoMixin<StaticResourcePass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = std::shared_ptr<ILogger>;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        // Construction and destruction configuration.
        //

        explicit StaticResourcePass(StaticResourcePassConfiguration const& cfg, ILoggerPtr const& logger = nullptr);

        /// Copy construction is banned.
        StaticResourcePass(StaticResourcePass const&) = delete;

        /// We allow move semantics.
        StaticResourcePass(StaticResourcePass&&) = default;

        /// Default destruction.
        ~StaticResourcePass() = default;

        llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        struct ResourceStats
        {
            uint64_t largest_qubit_index{0};
            uint64_t largest_result_index{0};
            uint64_t usage_qubit_counts{0};
            uint64_t usage_result_counts{0};
        };

        bool enforceRequirements(llvm::Module& module) const;
        void allocateOnReset(llvm::Module& module) const;
        void annotateQubits(llvm::Module& module) const;
        void remapQubits(llvm::Module& module) const;

        ResourceStats getLargestIndices(llvm::Function& function) const;

        StaticResourcePassConfiguration config_{};

        ILoggerPtr logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
