#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AllocationManager/AllocationManager.hpp"
#include "qir/qat/AllocationManager/IAllocationManager.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"
#include "qir/qat/Validator/Validator.hpp"

namespace microsoft::quantum
{

class QirAdaptorFactory;

/// QirAdaptor class that defines a set of rules which constitutes the adaptor definition. Each of the
/// rules can be used to transform a generic QIR and/or validate that the QIR is compliant with said
/// rule.
class QirAdaptor
{
  public:
    /// Allocation manager pointer type. Used to reference to concrete allocation manager
    /// implementations which defines the allocation logic of the adaptor.
    using AllocationManagerPtr = IAllocationManager::AllocationManagerPtr;

    /// Validator class used to check that an IR fulfils a given specification
    using ValidatorPtr = Validator::ValidatorPtr;

    using ILoggerPtr = std::shared_ptr<ILogger>;

    // Constructors
    //

    explicit QirAdaptor(
        ConfigurationManager& configuration_manager,
        String const&         name,
        ILoggerPtr const&     logger,
        bool                  debug,
        llvm::TargetMachine*  target_machine            = nullptr,
        AllocationManagerPtr  qubit_allocation_manager  = BasicAllocationManager::createNew(),
        AllocationManagerPtr  result_allocation_manager = BasicAllocationManager::createNew());

    // Default construction not allowed as this leads to invalid configuration of the allocation
    // managers.

    QirAdaptor()                  = delete;
    QirAdaptor(QirAdaptor const&) = delete;
    QirAdaptor(QirAdaptor&&)      = delete;
    QirAdaptor& operator=(QirAdaptor const&) = delete;
    QirAdaptor& operator=(QirAdaptor&&) = delete;
    ~QirAdaptor()                       = default;

    // QirAdaptor methods
    //

    /// Applies the adaptor to a module.
    void apply(llvm::Module& module);

    /// Verifies that a module is a valid LLVM IR.
    bool verify(llvm::Module& module);

    /// Validates that a module complies with the specified QIR adaptor.
    bool validate(llvm::Module& module);

    AllocationManagerPtr getQubitAllocationManager();
    AllocationManagerPtr getResultAllocationManager();

    String const& name() const;

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

    /// Returns the module pass manager associated with the adaptor
    llvm::ModulePassManager& modulePassManager();

    /// Returns the configuration manager
    ConfigurationManager& configurationManager()
    {
        return configuration_manager_;
    }

  protected:
    // Ensuring that QirAdaptorFactory has access to following protected functions.
    friend class QirAdaptorFactory;

    /// Sets the validator
    void setValidator(ValidatorPtr&& validator);

  private:
    using PassInstrumentationCallbacksPtr = std::unique_ptr<llvm::PassInstrumentationCallbacks>;
    using StandardInstrumentationsPtr     = std::unique_ptr<llvm::StandardInstrumentations>;
    using PassBuilderPtr                  = std::unique_ptr<llvm::PassBuilder>;

    void registerEPCallbacks();

    template <typename PassManager>
    bool tryParsePipelineText(llvm::PassBuilder& pass_builder, std::string const& pipeline_options)
    {
        if (pipeline_options.empty())
        {
            return false;
        }

        PassManager pass_manager;
        if (auto err = pass_builder.parsePassPipeline(pass_manager, pipeline_options))
        {
            llvm::errs() << "Could not parse -" << pipeline_options << " pipeline: " << toString(std::move(err))
                         << "\n";
            return false;
        }
        return true;
    }

    /// Name of the selected adaptor
    String name_{};

    ConfigurationManager& configuration_manager_; ///< Holds a reference to the configuration manager

    ILoggerPtr logger_{nullptr};

    // LLVM logic to run the passes
    //

    llvm::LoopAnalysisManager     loop_analysis_manager_;
    llvm::FunctionAnalysisManager function_analysis_manager_;
    llvm::CGSCCAnalysisManager    gscc_analysis_manager_;
    llvm::ModuleAnalysisManager   module_analysis_manager_;

    llvm::Optional<llvm::PGOOptions> pgo_options_;
    PassInstrumentationCallbacksPtr  pass_instrumentation_callbacks_;
    StandardInstrumentationsPtr      standard_instrumentations_;
    llvm::PipelineTuningOptions      pipeline_tuning_options_;

    PassBuilderPtr pass_builder_;

    llvm::ModulePassManager   module_pass_manager_{};
    llvm::FunctionPassManager function_pass_manager_{};

    // Allocation management
    //

    /// Interface pointer to the qubit allocation manager. Mode of operation depends on the concrete
    /// implementation of the manager which is swappable through the interface.
    AllocationManagerPtr qubit_allocation_manager_{};

    /// Interface pointer to the results allocation manager. Again here the manager behaviour is
    /// determined by its implementation details.
    AllocationManagerPtr result_allocation_manager_{};

    ///
    ValidatorPtr validator_{};

    std::string peephole_ep_pipeline_{""};
    std::string late_loop_optimizations_ep_pipeline_{""};
    std::string loop_optimizer_end_ep_pipeline_{""};
    std::string scalar_optimizer_late_ep_pipeline_{""};
    std::string cgscc_optimizer_late_ep_pipeline_{""};
    std::string vectorizer_start_ep_pipeline_{""};
    std::string pipeline_start_ep_pipeline_{""};
    std::string optimizer_last_ep_pipeline_{""};
};

} // namespace microsoft::quantum
