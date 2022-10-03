// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/TransformationRulesPass/TransformationRulesPassConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"

namespace microsoft::quantum
{

void TransformationRulesPassConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Pass configuration", "Configuration of the pass and its corresponding optimizations.");

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
        disable_record_output_support_, true, "disable-record-output-support",
        "Disables record output support by instruction removal.");

    // Ready settings

    config.addParameter(entry_point_attr_, "entry-point-attr", "Specifies the attribute indicating the entry point.");
}

TransformationRulesPassConfiguration TransformationRulesPassConfiguration::createDisabled()
{
    TransformationRulesPassConfiguration ret;
    ret.delete_dead_code_              = false;
    ret.clone_functions_               = false;
    ret.transform_execution_path_only_ = false;
    ret.max_recursion_                 = 512;
    ret.reuse_qubits_                  = false;
    ret.reuse_results_                 = false;

    ret.disable_reference_counting_        = false;
    ret.disable_alias_counting_            = false;
    ret.disable_string_support_            = false;
    ret.disable_record_output_support_     = false;
    ret.optimize_result_one_               = false;
    ret.optimize_result_zero_              = false;
    ret.optimize_result_comparison_        = false;
    ret.optimize_qauntum_constants_        = false;
    ret.remove_get_one_or_zero_            = false;
    ret.use_static_qubit_array_allocation_ = false;
    ret.use_static_qubit_allocation_       = false;
    ret.use_static_result_allocation_      = false;
    return ret;
}

TransformationRulesPassConfiguration TransformationRulesPassConfiguration::createReuseQubitsOnly()
{
    TransformationRulesPassConfiguration ret;
    ret.delete_dead_code_              = false;
    ret.clone_functions_               = false;
    ret.transform_execution_path_only_ = false;
    ret.max_recursion_                 = 512;
    ret.reuse_qubits_                  = true;
    ret.reuse_results_                 = false;

    ret.disable_reference_counting_        = false;
    ret.disable_alias_counting_            = false;
    ret.disable_string_support_            = false;
    ret.disable_record_output_support_     = false;
    ret.optimize_result_one_               = false;
    ret.optimize_result_zero_              = false;
    ret.optimize_result_comparison_        = false;
    ret.optimize_qauntum_constants_        = false;
    ret.remove_get_one_or_zero_            = false;
    ret.use_static_qubit_array_allocation_ = false;
    ret.use_static_qubit_allocation_       = false;
    ret.use_static_result_allocation_      = false;
    return ret;
}

bool TransformationRulesPassConfiguration::shouldDeleteDeadCode() const
{
    return delete_dead_code_;
}

bool TransformationRulesPassConfiguration::shouldCloneFunctions() const
{
    return clone_functions_;
}

bool TransformationRulesPassConfiguration::shouldTransformExecutionPathOnly() const
{
    return transform_execution_path_only_;
}

uint64_t TransformationRulesPassConfiguration::maxRecursion() const
{
    return max_recursion_;
}

bool TransformationRulesPassConfiguration::shouldReuseQubits() const
{
    return reuse_qubits_;
}

bool TransformationRulesPassConfiguration::shouldReuseResults() const
{
    return reuse_results_;
}

std::string TransformationRulesPassConfiguration::entryPointAttr() const
{
    return entry_point_attr_;
}

bool TransformationRulesPassConfiguration::assumeNoExceptions() const
{
    return assume_no_exceptions_;
}

bool TransformationRulesPassConfiguration::disableReferenceCounting() const
{
    return disable_reference_counting_;
}

bool TransformationRulesPassConfiguration::disableAliasCounting() const
{
    return disable_alias_counting_;
}

bool TransformationRulesPassConfiguration::disableStringSupport() const
{
    return disable_string_support_;
}

bool TransformationRulesPassConfiguration::disableRecordOutputSupport() const
{
    return disable_record_output_support_;
}

bool TransformationRulesPassConfiguration::optimizeResultOne() const
{
    return optimize_result_one_;
}

bool TransformationRulesPassConfiguration::optimizeResultZero() const
{
    return optimize_result_zero_;
}

bool TransformationRulesPassConfiguration::optimizeQuantumConstants() const
{
    return optimize_qauntum_constants_;
}

bool TransformationRulesPassConfiguration::optimizeResultComparison() const
{
    return optimize_result_comparison_;
}

bool TransformationRulesPassConfiguration::removeGetZeroOrOne() const
{
    return remove_get_one_or_zero_;
}

bool TransformationRulesPassConfiguration::useStaticQubitArrayAllocation() const
{
    return use_static_qubit_array_allocation_;
}

bool TransformationRulesPassConfiguration::useStaticQubitAllocation() const
{
    return use_static_qubit_allocation_;
}

bool TransformationRulesPassConfiguration::useStaticResultAllocation() const
{
    return use_static_result_allocation_;
}

uint32_t TransformationRulesPassConfiguration::defaultIntegerWidth() const
{
    return default_integer_width_;
}

bool TransformationRulesPassConfiguration::isDisabled() const
{
    return (
        delete_dead_code_ == false && clone_functions_ == false && transform_execution_path_only_ == false &&
        reuse_qubits_ == false && disable_reference_counting_ == false && disable_alias_counting_ == false &&
        disable_string_support_ == false && disable_record_output_support_ == false && optimize_result_one_ == false &&
        optimize_result_zero_ == false && optimize_qauntum_constants_ == false &&
        optimize_result_comparison_ == false && remove_get_one_or_zero_ == false &&
        use_static_qubit_array_allocation_ == false && use_static_qubit_allocation_ == false &&
        use_static_result_allocation_ == false);
}

bool TransformationRulesPassConfiguration::isDefault() const
{
    TransformationRulesPassConfiguration ref{};

    return (
        delete_dead_code_ == ref.delete_dead_code_ && clone_functions_ == ref.clone_functions_ &&
        transform_execution_path_only_ == ref.transform_execution_path_only_ && max_recursion_ == ref.max_recursion_ &&
        entry_point_attr_ == ref.entry_point_attr_ && assume_no_exceptions_ == ref.assume_no_exceptions_ &&
        reuse_qubits_ == ref.reuse_qubits_ && reuse_results_ == ref.reuse_results_ &&
        disable_reference_counting_ == ref.disable_reference_counting_ &&
        disable_alias_counting_ == ref.disable_alias_counting_ &&
        disable_string_support_ == ref.disable_string_support_ &&
        disable_record_output_support_ == ref.disable_record_output_support_ &&
        optimize_result_one_ == ref.optimize_result_one_ && optimize_result_zero_ == ref.optimize_result_zero_ &&
        optimize_result_comparison_ == ref.optimize_result_comparison_ &&
        remove_get_one_or_zero_ == ref.remove_get_one_or_zero_ &&
        optimize_qauntum_constants_ == ref.optimize_qauntum_constants_ &&
        use_static_qubit_array_allocation_ == ref.use_static_qubit_array_allocation_ &&
        use_static_qubit_allocation_ == ref.use_static_qubit_allocation_ &&
        use_static_result_allocation_ == ref.use_static_result_allocation_);
}

bool TransformationRulesPassConfiguration::operator==(TransformationRulesPassConfiguration const& ref) const
{

    return (
        delete_dead_code_ == ref.delete_dead_code_ && clone_functions_ == ref.clone_functions_ &&
        transform_execution_path_only_ == ref.transform_execution_path_only_ && reuse_qubits_ == ref.reuse_qubits_);
}

} // namespace microsoft::quantum
