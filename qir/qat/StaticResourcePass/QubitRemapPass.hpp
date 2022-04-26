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

    class QubitRemapPass : public llvm::PassInfoMixin<QubitRemapPass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = std::shared_ptr<ILogger>;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        enum ResourceType
        {
            None,
            Qubit,
            Result
        };

        // Construction and destruction configuration.
        //

        explicit QubitRemapPass(StaticResourcePassConfiguration const& cfg, ILoggerPtr const& logger = nullptr);

        /// Copy construction is banned.
        QubitRemapPass(QubitRemapPass const&) = delete;

        /// We allow move semantics.
        QubitRemapPass(QubitRemapPass&&) = default;

        /// Default destruction.
        ~QubitRemapPass() = default;

        llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& mam);

        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        bool extractResourceId(llvm::Value* value, uint64_t& return_value, ResourceType& type) const;

        StaticResourcePassConfiguration config_{};

        ILoggerPtr logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
