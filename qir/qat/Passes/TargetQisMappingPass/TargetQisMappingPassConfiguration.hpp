#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"

namespace microsoft::quantum
{
/// Configuration class for the RuleTransformation pass.
class TargetQisMappingPassConfiguration
{
  public:
    using DeferredValuePtr = DeferredValue::DeferredValuePtr;

    // Setup and construction
    //

    /// Setup function that attached the configuration to the ConfigurationManager.
    void setup(ConfigurationManager& config);

    /// Creates a configuration where all functionality is disabled.
    static TargetQisMappingPassConfiguration createDisabled();

    /// Creates a configuration where only reuse qubits is enabled.
    static TargetQisMappingPassConfiguration createReuseQubitsOnly();

    // Configuration classes
    //

    /// Tests whether all functionality is disabled for this component.
    bool isDisabled() const;

    /// Tests whether this is an instance of default configuration
    bool isDefault() const;

    /// Testing equality of two configurations
    bool operator==(TargetQisMappingPassConfiguration const& ref) const;

    // Properties
    //

    /// Whether or not the component should delete dead code.
    bool shouldDeleteDeadCode() const;

    /// Whether or not the component should clone functions. This is relevant in relation to qubit
    /// allocation if execution paths are expanded.
    bool shouldCloneFunctions() const;

    /// Whether or not we assume that the code does not throw at runtime.
    bool assumeNoExceptions() const;

    /// Whether or not the component should follow the execution path only or it should be applied to
    /// all parts of the code. For statically allocated qubits one generally wants to follow the
    /// execution path whereas it makes more sense to apply to all parts of the code for dynamic qubit
    /// allocation.
    bool shouldTransformExecutionPathOnly() const;

    /// The maximum recursion acceptable when unrolling the execution path.
    uint64_t maxRecursion() const;

    /// Whether or not to reuse qubits.
    bool shouldReuseQubits() const;

    /// Whether or not to annotate entry point with the number of qubits they use.
    bool shouldAnnotateQubitUse() const;

    /// Whether or not to reuse result registers.
    bool shouldReuseResults() const;

    /// Whether or not to annotate entry point with the number of results they use.
    bool shouldAnnotateResultUse() const;

    /// Whether or not the component should attempt to group measurements.
    bool shouldGroupMeasurements() const;

    /// Whether or not the target supports measurement (and result interpretation) during the circuit
    /// execution.
    bool oneShotMeasurement() const;

    /// Attribute which indicate that a function is the entry point.
    std::string entryPointAttr() const;

    bool disableReferenceCounting() const;

    bool disableAliasCounting() const;

    bool disableStringSupport() const;

    bool disableInitializeSupport() const;

    bool disableRecordOutputSupport() const;

    bool optimizeResultOne() const;

    bool optimizeResultZero() const;

    bool optimizeQuantumConstants() const;

    bool optimizeResultComparison() const;

    bool removeGetZeroOrOne() const;

    bool useStaticQubitArrayAllocation() const;

    bool useStaticQubitAllocation() const;

    bool useStaticResultAllocation() const;

    uint32_t defaultIntegerWidth() const;

  private:
    // Code expansion and trimming
    //

    bool             delete_dead_code_{true};
    bool             clone_functions_{true};
    bool             transform_execution_path_only_{true};
    uint64_t         max_recursion_{512};
    DeferredValuePtr entry_point_attr_{nullptr};

    // Branching
    bool assume_no_exceptions_{false};

    // Allocation options
    //
    bool reuse_qubits_{true};
    bool reuse_results_{true};

    // Rules Configuration
    bool disable_reference_counting_{true};
    bool disable_alias_counting_{true};
    bool disable_string_support_{true};
    bool disable_initialize_support_{true};
    bool disable_record_output_support_{true};

    // Optimizations
    bool optimize_result_one_{true};
    bool optimize_result_zero_{true};
    bool optimize_result_comparison_{true};
    bool optimize_quantum_constants_{true};
    bool remove_get_one_or_zero_{true};

    bool use_static_qubit_array_allocation_{true};
    bool use_static_qubit_allocation_{true};
    bool use_static_result_allocation_{true};

    uint32_t default_integer_width_{64};
};

} // namespace microsoft::quantum
