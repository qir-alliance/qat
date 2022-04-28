// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"

namespace microsoft
{
namespace quantum
{

    void StaticResourceComponentConfiguration::setup(ConfigurationManager& config)
    {
        config.setSectionName("Static resource manipulation", "");
        config.addParameter(annotate_qubit_use_, "annotate-qubit-use", "Annotate the number of qubits used");

        config.addParameter(annotate_result_use_, "annotate-result-use", "Annotate the number of results used");

        config.addParameter(
            annotate_max_qubit_index_, "annotate-max-qubit-index", "Annotate the maximum qubit index used");

        config.addParameter(
            annotate_max_result_index_, "annotate-max-result-index", "Annotate the maximum result index used");

        config.addParameter(
            annotate_max_result_index_, "annotate-max-result-index", "Annotate the maximum result index used");

        config.addParameter(
            reindex_qubits_, "reindex-qubits",
            "Re-indexes statically allocated qubits with sequential ids starting from 0");

        config.addParameter(
            replace_qubit_on_reset_, "replace-qubit-on-reset", "Replaces a qubit with new qubit if the qubit is reset");

        config.addParameter(
            inline_after_id_change_, "inline-after-id-change", "Inlines instructions after id was changed");
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

} // namespace quantum
} // namespace microsoft
