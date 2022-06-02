#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft
{
namespace quantum
{

    class PostTransformValidationPassConfiguration
    {
      public:
        using DeferredValuePtr = DeferredValue::DeferredValuePtr;

        void setup(ConfigurationManager& config)
        {
            config.setSectionName("Pre-transform validation", "");
            replace_qubits_on_reset_ = config.getParameter("replace-qubit-on-reset");
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

            return replace_qubits_on_reset_->value<bool>();
        }

      private:
        bool             disable_straightline_code_requirement_{false};
        DeferredValuePtr replace_qubits_on_reset_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
