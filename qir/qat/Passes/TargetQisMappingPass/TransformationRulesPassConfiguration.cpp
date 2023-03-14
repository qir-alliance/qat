// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"

namespace microsoft::quantum
{

void TargetQisMappingPassConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Target QIS mapping", "Modification of the IR to adapt a specific QIS.");

    // Experimental settings
    config.addExperimentalParameter(delete_dead_code_, true, false, "delete-dead-code", "Deleted dead code.");
    config.addExperimentalParameter(
        clone_functions_, true, false, "clone-functions", "Clone functions to ensure correct qubit allocation.");
    config.addExperimentalParameter(
        transform_execution_path_only_, true, false, "transform-execution-path-only",
        "Transform execution paths only.");

    config.addExperimentalParameter(
        max_recursion_, max_recursion_, uint64_t(1), "max-recursion",
        "Defines the maximum recursion when unrolling the execution path");

    config.addExperimentalParameter(
        assume_no_exceptions_, false, false, "assume-no-except",
        "Assumes that no exception will occur during runtime.");

    config.addParameter(reuse_qubits_, false, "reuse-qubits", "Use to define whether or not to reuse qubits.");
    config.addParameter(reuse_results_, false, "reuse-results", "Use to define whether or not to reuse results.");

    // Rules
    config.addParameter(
        optimize_result_one_, true, "optimize-result-one",
        "Maps branching based on quantum measurements compared to one to base adaptor "
        "type measurement.");
    config.addParameter(
        optimize_result_zero_, true, "optimize-result-zero",
        "Maps branching based on quantum measurements compared to zero to base adaptor "
        "type measurement.");
    config.addParameter(
        optimize_result_comparison_, true, "optimize-result-comparison",
        "Maps branching based on quantum measurements compared to each other to base adaptor "
        "type measurement.");
    config.addParameter(
        use_static_qubit_array_allocation_, "use-static-qubit-array-allocation",
        "Maps allocation of qubit arrays to static array allocation.");
    config.addParameter(
        use_static_qubit_allocation_, "use-static-qubit-allocation", "Maps qubit allocation to static allocation.");
    config.addParameter(
        use_static_result_allocation_, "use-static-result-allocation", "Maps result allocation to static allocation.");

    config.addParameter(
        disable_reference_counting_, true, "disable-reference-counting",
        "Disables reference counting by instruction removal.");
    config.addParameter(
        disable_alias_counting_, true, "disable-alias-counting", "Disables alias counting by instruction removal.");
    config.addParameter(
        disable_string_support_, true, "disable-string-support", "Disables string support by instruction removal.");
    config.addParameter(
        disable_initialize_support_, true, "disable-initialize-support",
        "Disables runtime initialization by instruction removal.");
    config.addParameter(
        disable_record_output_support_, true, "disable-record-output-support",
        "Disables record output support by instruction removal.");

    // Ready settings
    entry_point_attr_ = config.getParameter("entry-point-attr");
}

TargetQisMappingPassConfiguration TargetQisMappingPassConfiguration::createDisabled()
{
    TargetQisMappingPassConfiguration ret;
    ret.delete_dead_code_              = false;
    ret.clone_functions_               = false;
    ret.transform_execution_path_only_ = false;
    ret.max_recursion_                 = 512;
    ret.reuse_qubits_                  = false;
    ret.reuse_results_                 = false;

    ret.disable_reference_counting_        = false;
    ret.disable_alias_counting_            = false;
    ret.disable_string_support_            = false;
    ret.disable_initialize_support_        = false;
    ret.disable_record_output_support_     = false;
    ret.optimize_result_one_               = false;
    ret.optimize_result_zero_              = false;
    ret.optimize_result_comparison_        = false;
    ret.optimize_quantum_constants_        = false;
    ret.remove_get_one_or_zero_            = false;
    ret.use_static_qubit_array_allocation_ = false;
    ret.use_static_qubit_allocation_       = false;
    ret.use_static_result_allocation_      = false;
    return ret;
}

TargetQisMappingPassConfiguration TargetQisMappingPassConfiguration::createReuseQubitsOnly()
{
    TargetQisMappingPassConfiguration ret;
    ret.delete_dead_code_              = false;
    ret.clone_functions_               = false;
    ret.transform_execution_path_only_ = false;
    ret.max_recursion_                 = 512;
    ret.reuse_qubits_                  = true;
    ret.reuse_results_                 = false;

    ret.disable_reference_counting_        = false;
    ret.disable_alias_counting_            = false;
    ret.disable_string_support_            = false;
    ret.disable_initialize_support_        = false;
    ret.disable_record_output_support_     = false;
    ret.optimize_result_one_               = false;
    ret.optimize_result_zero_              = false;
    ret.optimize_result_comparison_        = false;
    ret.optimize_quantum_constants_        = false;
    ret.remove_get_one_or_zero_            = false;
    ret.use_static_qubit_array_allocation_ = false;
    ret.use_static_qubit_allocation_       = false;
    ret.use_static_result_allocation_      = false;
    return ret;
}

bool TargetQisMappingPassConfiguration::shouldDeleteDeadCode() const
{
    return delete_dead_code_;
}

bool TargetQisMappingPassConfiguration::shouldCloneFunctions() const
{
    return clone_functions_;
}

bool TargetQisMappingPassConfiguration::shouldTransformExecutionPathOnly() const
{
    return transform_execution_path_only_;
}

uint64_t TargetQisMappingPassConfiguration::maxRecursion() const
{
    return max_recursion_;
}

bool TargetQisMappingPassConfiguration::shouldReuseQubits() const
{
    return reuse_qubits_;
}

bool TargetQisMappingPassConfiguration::shouldReuseResults() const
{
    return reuse_results_;
}

std::string TargetQisMappingPassConfiguration::entryPointAttr() const
{
    if (entry_point_attr_ == nullptr)
    {
        throw std::runtime_error("Specification entryPoint not found.");
    }

    return entry_point_attr_->value<std::string>();
}

bool TargetQisMappingPassConfiguration::assumeNoExceptions() const
{
    return assume_no_exceptions_;
}

bool TargetQisMappingPassConfiguration::disableReferenceCounting() const
{
    return disable_reference_counting_;
}

bool TargetQisMappingPassConfiguration::disableAliasCounting() const
{
    return disable_alias_counting_;
}

bool TargetQisMappingPassConfiguration::disableStringSupport() const
{
    return disable_string_support_;
}

bool TargetQisMappingPassConfiguration::disableInitializeSupport() const
{
    return disable_initialize_support_;
}

bool TargetQisMappingPassConfiguration::disableRecordOutputSupport() const
{
    return disable_record_output_support_;
}

bool TargetQisMappingPassConfiguration::optimizeResultOne() const
{
    return optimize_result_one_;
}

bool TargetQisMappingPassConfiguration::optimizeResultZero() const
{
    return optimize_result_zero_;
}

bool TargetQisMappingPassConfiguration::optimizeQuantumConstants() const
{
    return optimize_quantum_constants_;
}

bool TargetQisMappingPassConfiguration::optimizeResultComparison() const
{
    return optimize_result_comparison_;
}

bool TargetQisMappingPassConfiguration::removeGetZeroOrOne() const
{
    return remove_get_one_or_zero_;
}

bool TargetQisMappingPassConfiguration::useStaticQubitArrayAllocation() const
{
    return use_static_qubit_array_allocation_;
}

bool TargetQisMappingPassConfiguration::useStaticQubitAllocation() const
{
    return use_static_qubit_allocation_;
}

bool TargetQisMappingPassConfiguration::useStaticResultAllocation() const
{
    return use_static_result_allocation_;
}

uint32_t TargetQisMappingPassConfiguration::defaultIntegerWidth() const
{
    return default_integer_width_;
}

bool TargetQisMappingPassConfiguration::isDisabled() const
{
    return (
        delete_dead_code_ == false && clone_functions_ == false && transform_execution_path_only_ == false &&
        reuse_qubits_ == false && disable_reference_counting_ == false && disable_alias_counting_ == false &&
        disable_string_support_ == false && disable_record_output_support_ == false && optimize_result_one_ == false &&
        optimize_result_zero_ == false && optimize_quantum_constants_ == false &&
        optimize_result_comparison_ == false && remove_get_one_or_zero_ == false &&
        use_static_qubit_array_allocation_ == false && use_static_qubit_allocation_ == false &&
        use_static_result_allocation_ == false && disable_initialize_support_ == false);
}

bool TargetQisMappingPassConfiguration::isDefault() const
{
    TargetQisMappingPassConfiguration ref{};

    return (
        delete_dead_code_ == ref.delete_dead_code_ && clone_functions_ == ref.clone_functions_ &&
        transform_execution_path_only_ == ref.transform_execution_path_only_ && max_recursion_ == ref.max_recursion_ &&
        assume_no_exceptions_ == ref.assume_no_exceptions_ && reuse_qubits_ == ref.reuse_qubits_ &&
        reuse_results_ == ref.reuse_results_ && disable_reference_counting_ == ref.disable_reference_counting_ &&
        disable_alias_counting_ == ref.disable_alias_counting_ &&
        disable_string_support_ == ref.disable_string_support_ &&
        disable_initialize_support_ == ref.disable_initialize_support_ &&
        disable_record_output_support_ == ref.disable_record_output_support_ &&
        optimize_result_one_ == ref.optimize_result_one_ && optimize_result_zero_ == ref.optimize_result_zero_ &&
        optimize_result_comparison_ == ref.optimize_result_comparison_ &&
        remove_get_one_or_zero_ == ref.remove_get_one_or_zero_ &&
        optimize_quantum_constants_ == ref.optimize_quantum_constants_ &&
        use_static_qubit_array_allocation_ == ref.use_static_qubit_array_allocation_ &&
        use_static_qubit_allocation_ == ref.use_static_qubit_allocation_ &&
        use_static_result_allocation_ == ref.use_static_result_allocation_);
}

bool TargetQisMappingPassConfiguration::operator==(TargetQisMappingPassConfiguration const& ref) const
{

    return (
        delete_dead_code_ == ref.delete_dead_code_ && clone_functions_ == ref.clone_functions_ &&
        transform_execution_path_only_ == ref.transform_execution_path_only_ && reuse_qubits_ == ref.reuse_qubits_);
}

} // namespace microsoft::quantum
