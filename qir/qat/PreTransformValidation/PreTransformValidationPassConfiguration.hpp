#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft
{
namespace quantum
{

    class PreTransformValidationPassConfiguration
    {
      public:
        void setup(ConfigurationManager& config)
        {
            config.setSectionName("Pre-transform validation", "");
        }

        static PreTransformValidationPassConfiguration createDisabled()
        {
            PreTransformValidationPassConfiguration ret;
            ret.require_straightline_code_ = false;
            return ret;
        }

        bool requireStraightLineCode() const
        {
            /// TODO: Configure from configurations
            return require_straightline_code_;
        }

      private:
        bool require_straightline_code_{true};
    };

} // namespace quantum
} // namespace microsoft
