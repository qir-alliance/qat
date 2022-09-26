#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AllocationManager/AllocationManager.hpp"
#include "qir/qat/AllocationManager/IAllocationManager.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Logging/LogCollection.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"

#include <memory>

namespace microsoft::quantum
{

/// Validator class that defines a set of rules which constitutes the adaptor definition. Each of
/// the rules can be used to transform a generic QIR and/or validate that the QIR is compliant with
/// said rule.
class Validator
{
  public:
    using ValidatorPtr = std::unique_ptr<Validator>;
    using ILoggerPtr   = ILogger::ILoggerPtr;

    // Constructors
    //

    explicit Validator(
        TargetProfileConfiguration const& profile,
        TargetQisConfiguration const&     qis,
        ILoggerPtr const&                 logger,
        bool                              debug,
        llvm::TargetMachine*              target_machine = nullptr);

    // Default construction not allowed to ensure that LLVM modules and passes are set up correctly.
    // Copy construction is prohibited due to restriction on classes held by Validator.

    Validator()                 = delete;
    Validator(Validator const&) = delete;
    Validator(Validator&&)      = delete;
    Validator& operator=(Validator const&) = delete;
    Validator& operator=(Validator&&) = delete;
    ~Validator()                      = default;

    // Validator methods
    //

    /// Validates that a module complies with the specified QIR adaptor. Returns true if the module is
    /// valid and false otherwise.
    bool validate(llvm::Module& module);

    /// Returns the logger. This value may be null if no logger was set.
    ILoggerPtr logger() const;

  protected:
    using PassBuilderPtr = std::unique_ptr<llvm::PassBuilder>;

    /// Returns a reference to the pass builder.
    llvm::PassBuilder& passBuilder();

    /// Returns a reference to the loop analysis manager.
    llvm::LoopAnalysisManager& loopAnalysisManager();

    /// Returns a reference to the function analysis manager.
    llvm::FunctionAnalysisManager& functionAnalysisManager();

    /// Returns a reference to the GSCC analysis manager.
    llvm::CGSCCAnalysisManager& gsccAnalysisManager();

    /// Returns a reference to the module analysis manager.
    llvm::ModuleAnalysisManager& moduleAnalysisManager();

  private:
    // LLVM logic to run the passes
    //

    llvm::LoopAnalysisManager     loop_analysis_manager_;
    llvm::FunctionAnalysisManager function_analysis_manager_;
    llvm::CGSCCAnalysisManager    gscc_analysis_manager_;
    llvm::ModuleAnalysisManager   module_analysis_manager_;

    PassBuilderPtr pass_builder_;

    llvm::ModulePassManager module_pass_manager_{};

    ILoggerPtr logger_{nullptr}; ///< Logger to keep track of errors and warnings occurring.
};

} // namespace microsoft::quantum
