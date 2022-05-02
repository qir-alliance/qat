#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "ValidationPass/ValidationPassConfiguration.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
{

    class ValidationPass : public llvm::PassInfoMixin<ValidationPass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = ILogger::ILoggerPtr;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        // Construction and destruction configuration.
        //

        explicit ValidationPass(ValidationPassConfiguration const& cfg, ILoggerPtr const& logger = nullptr);

        /// Copy construction is banned.
        ValidationPass(ValidationPass const&) = delete;

        /// We allow move semantics.
        ValidationPass(ValidationPass&&) = default;

        /// Default destruction.
        ~ValidationPass() = default;

        llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);
        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        void opcodeChecks(Instruction& instr);
        void callChecks(Instruction& instr);
        void pointerChecks(Instruction& instr);

        bool satisfyingOpcodeRequirements();
        bool satisfyingInternalCallRequirements();
        bool satisfyingExternalCallRequirements();
        bool satisfyingPointerRequirements();

        using Locations = std::vector<Location>;

        ValidationPassConfiguration config_{};

        Location current_location_{};

        std::unordered_map<std::string, uint64_t>  opcodes_;
        std::unordered_map<std::string, Locations> opcode_location_;

        std::unordered_map<std::string, uint64_t>  external_calls_;
        std::unordered_map<std::string, Locations> external_call_location_;

        std::unordered_map<std::string, uint64_t>  internal_calls_;
        std::unordered_map<std::string, Locations> internal_call_location_;

        std::unordered_map<std::string, uint64_t>  pointers_;
        std::unordered_map<std::string, Locations> pointer_location_;

        ILoggerPtr logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
