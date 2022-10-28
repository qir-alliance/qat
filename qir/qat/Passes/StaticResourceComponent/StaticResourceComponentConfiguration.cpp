// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

void StaticResourceComponentConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Static resource manipulation", "Manipulates statically allocated qubits and results");
    config.addParameter(annotate_qubit_use_, "annotate-qubit-use", "Annotate the number of qubits used");

    config.addParameter(annotate_result_use_, "annotate-result-use", "Annotate the number of results used");

    config.addParameter(annotate_max_qubit_index_, "annotate-max-qubit-index", "Annotate the maximum qubit index used");

    config.addParameter(
        annotate_max_result_index_, "annotate-max-result-index", "Annotate the maximum result index used");

    config.addParameter(
        reindex_qubits_, "reindex-qubits",
        "Re-indexes statically allocated qubits with sequential ids starting from 0");

    config.addParameter(
        replace_qubit_on_reset_, "replace-qubit-on-reset", "Replaces a qubit with new qubit if the qubit is reset");

    config.addParameter(inline_after_id_change_, "inline-after-id-change", "Inlines instructions after id was changed");

    required_num_qubits_attr_  = config.getParameter("required-num-qubits-attr");
    required_num_results_attr_ = config.getParameter("required-num-results-attr");
    max_index_qubits_attr_     = config.getParameter("max-index-qubits-attr");
    max_index_results_attr_    = config.getParameter("max-index-results-attr");
}

String StaticResourceComponentConfiguration::requiredNumQubitsAttr() const
{
    if (required_num_qubits_attr_ == nullptr)
    {
        return "requiredQubits";
    }

    return required_num_qubits_attr_->value<String>();
}

String StaticResourceComponentConfiguration::maxIndexQubitsAttr() const
{
    if (max_index_qubits_attr_ == nullptr)
    {
        return "maxQubitIndex";
    }

    return max_index_qubits_attr_->value<String>();
}

String StaticResourceComponentConfiguration::requiredNumResultsAttr() const
{
    if (required_num_results_attr_ == nullptr)
    {
        return "requiredResults";
    }

    return required_num_results_attr_->value<String>();
}

String StaticResourceComponentConfiguration::maxIndexResultsAttr() const
{
    if (max_index_results_attr_ == nullptr)
    {
        return "maxResultIndex";
    }

    return max_index_results_attr_->value<String>();
}

bool StaticResourceComponentConfiguration::shouldAnnotateQubitUse() const
{
    return annotate_qubit_use_;
}

bool StaticResourceComponentConfiguration::shouldAnnotateResultUse() const
{
    return annotate_result_use_;
}

bool StaticResourceComponentConfiguration::shouldAnnotateMaxQubitIndex() const
{
    return annotate_max_qubit_index_;
}

bool StaticResourceComponentConfiguration::shouldAnnotateMaxResultIndex() const
{
    return annotate_max_result_index_;
}

bool StaticResourceComponentConfiguration::shouldReplaceQubitsOnReset() const
{
    return replace_qubit_on_reset_;
}

bool StaticResourceComponentConfiguration::shouldReindexQubits() const
{
    return reindex_qubits_;
}

bool StaticResourceComponentConfiguration::shouldInlineAfterIdChange() const
{
    return inline_after_id_change_;
}

bool StaticResourceComponentConfiguration::isChangingIds() const
{
    return reindex_qubits_ || replace_qubit_on_reset_;
}

StaticResourceComponentConfiguration StaticResourceComponentConfiguration::createDisabled()
{
    StaticResourceComponentConfiguration ret;
    ret.annotate_qubit_use_  = false;
    ret.annotate_result_use_ = false;

    ret.annotate_max_qubit_index_  = false;
    ret.annotate_max_result_index_ = false;

    ret.replace_qubit_on_reset_ = false;
    ret.reindex_qubits_         = false;
    ret.inline_after_id_change_ = false;

    return ret;
}

void StaticResourceComponentConfiguration::enableAnnotateQubitUse()
{
    annotate_qubit_use_ = true;
}

void StaticResourceComponentConfiguration::enableAnnotateResultUse()
{
    annotate_result_use_ = true;
}

void StaticResourceComponentConfiguration::enableAnnotateMaxQubitIndex()
{
    annotate_max_qubit_index_ = true;
}

void StaticResourceComponentConfiguration::enableAnnotateMaxResultIndex()
{
    annotate_max_result_index_ = true;
}

void StaticResourceComponentConfiguration::enableReplaceQubitOnReset()
{
    replace_qubit_on_reset_ = true;
}

void StaticResourceComponentConfiguration::enableReindexQubits()
{
    reindex_qubits_ = true;
}

void StaticResourceComponentConfiguration::enableInlineAfterIdChange()
{
    inline_after_id_change_ = true;
}

} // namespace microsoft::quantum
