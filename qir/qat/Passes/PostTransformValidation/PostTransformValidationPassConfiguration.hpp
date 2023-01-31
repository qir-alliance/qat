#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft::quantum
{

class PostTransformValidationPassConfiguration
{
  public:
    using DeferredValuePtr = DeferredValue::DeferredValuePtr;

    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Post transform validation", "");
        config.addParameter(
            disable_straightline_code_requirement_, "disable-straightline-code-requirement",
            "Validate whether only one defined single-block should be present.");
        replace_qubits_on_reset_ = config.getParameter("replace-qubit-on-reset");
        defer_measurements_      = config.getParameter("defer-measurements");
    }

    static PostTransformValidationPassConfiguration createDisabled()
    {
        PostTransformValidationPassConfiguration ret;
        ret.disable_straightline_code_requirement_ = true;
        return ret;
    }

    bool requireStraightLineCode() const
    {
        if (disable_straightline_code_requirement_)
        {
            return false;
        }

        return replace_qubits_on_reset_->value<bool>() || defer_measurements_->value<bool>();
    }

  private:
    bool             disable_straightline_code_requirement_{false};
    DeferredValuePtr replace_qubits_on_reset_{nullptr};
    DeferredValuePtr defer_measurements_{nullptr};
};

} // namespace microsoft::quantum
