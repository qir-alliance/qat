// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourcePass/StaticResourcePassConfiguration.hpp"

namespace microsoft
{
namespace quantum
{

    void StaticResourcePassConfiguration::setup(ConfigurationManager& config)
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
    }

    bool StaticResourcePassConfiguration::shouldAnnotateQubitUse() const
    {
        return annotate_qubit_use_;
    }

    bool StaticResourcePassConfiguration::shouldAnnotateResultUse() const
    {
        return annotate_result_use_;
    }

    bool StaticResourcePassConfiguration::shouldAnnotateMaxQubitIndex() const
    {
        return annotate_max_qubit_index_;
    }

    bool StaticResourcePassConfiguration::shouldAnnotateMaxResultIndex() const
    {
        return annotate_max_result_index_;
    }

    bool StaticResourcePassConfiguration::shouldReplaceQubitsOnReset() const
    {
        return replace_qubit_on_reset_;
    }

    bool StaticResourcePassConfiguration::shouldReindexQubits() const
    {
        return reindex_qubits_;
    }

    StaticResourcePassConfiguration StaticResourcePassConfiguration::createDisabled()
    {
        StaticResourcePassConfiguration ret;
        ret.annotate_qubit_use_  = false;
        ret.annotate_result_use_ = false;

        ret.annotate_max_qubit_index_  = false;
        ret.annotate_max_result_index_ = false;

        ret.replace_qubit_on_reset_ = false;
        ret.reindex_qubits_         = false;
        return ret;
    }

} // namespace quantum
} // namespace microsoft
