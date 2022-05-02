#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"

namespace microsoft
{
namespace quantum
{

    struct PostTransformConfig
    {
      public:
        void setup(ConfigurationManager& config)
        {
            config.setSectionName("Post transform optimisation", "");
        }

        static PostTransformConfig createDisabled()
        {
            PostTransformConfig ret;

            ret.inst_combine_pass_            = false;
            ret.aggressive_inst_combine_pass_ = false;
            ret.sccp_pass_                    = false;
            ret.simplify_cfg_pass_            = false;

            return ret;
        }

        bool shouldAddInstCombinePass() const
        {
            return inst_combine_pass_;
        }

        bool shouldAddAggressiveInstCombinePass() const
        {
            return aggressive_inst_combine_pass_;
        }

        bool shouldAddSccpPass() const
        {
            return sccp_pass_;
        }

        bool shouldAddSimplifyCfgPass() const
        {
            return simplify_cfg_pass_;
        }

      private:
        bool inst_combine_pass_{true};
        bool aggressive_inst_combine_pass_{true};
        bool sccp_pass_{true};
        bool simplify_cfg_pass_{true};
    };

} // namespace quantum
} // namespace microsoft