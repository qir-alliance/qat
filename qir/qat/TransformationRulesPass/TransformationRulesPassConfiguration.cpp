// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "TransformationRulesPass/TransformationRulesPassConfiguration.hpp"

namespace microsoft
{
namespace quantum
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

        // Ready settings

        config.addParameter(
            entry_point_attr_, "entry-point-attr", "Specifies the attribute indicating the entry point.");

        config.addParameter(annotate_qubit_use_, "annotate-qubit-use", "Annotate the number of qubits used");

        config.addParameter(annotate_result_use_, "annotate-result-use", "Annotate the number of results used");
    }

    TransformationRulesPassConfiguration TransformationRulesPassConfiguration::createDisabled()
    {
        TransformationRulesPassConfiguration ret;
        ret.delete_dead_code_              = false;
        ret.clone_functions_               = false;
        ret.transform_execution_path_only_ = false;
        ret.max_recursion_                 = 512;
        ret.reuse_qubits_                  = false;
        ret.annotate_qubit_use_            = false;

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
        ret.annotate_qubit_use_            = false;

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

    bool TransformationRulesPassConfiguration::shouldAnnotateQubitUse() const
    {
        return annotate_qubit_use_;
    }

    bool TransformationRulesPassConfiguration::shouldReuseResults() const
    {
        return reuse_results_;
    }

    bool TransformationRulesPassConfiguration::shouldAnnotateResultUse() const
    {
        return annotate_result_use_;
    }

    std::string TransformationRulesPassConfiguration::entryPointAttr() const
    {
        return entry_point_attr_;
    }

    bool TransformationRulesPassConfiguration::assumeNoExceptions() const
    {
        return assume_no_exceptions_;
    }

    bool TransformationRulesPassConfiguration::isDisabled() const
    {
        return (
            delete_dead_code_ == false && clone_functions_ == false && transform_execution_path_only_ == false &&
            reuse_qubits_ == false);
    }

    bool TransformationRulesPassConfiguration::operator==(TransformationRulesPassConfiguration const& ref) const
    {

        return (
            delete_dead_code_ == ref.delete_dead_code_ && clone_functions_ == ref.clone_functions_ &&
            transform_execution_path_only_ == ref.transform_execution_path_only_ && reuse_qubits_ == ref.reuse_qubits_);
    }

} // namespace quantum
} // namespace microsoft
