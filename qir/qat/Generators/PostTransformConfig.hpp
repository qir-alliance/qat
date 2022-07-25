#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"

namespace microsoft::quantum
{

struct PostTransformConfig
{
  public:
    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Post-transform optimisation", "");
        config.addParameter(lower_switch_, "lower-switch", "Lower switch statements.");
        config.addParameter(
            should_eleminate_zext_i1_, "should-eleminate-zext-i1", "Replace zext instruction for i1 with select.");
        config.addParameter(
            use_one_shot_measurements_, "use-one-shot-measurements",
            "Wether or not measurement and recording functions should be moved to the end of the program.");
    }

    static PostTransformConfig createDisabled()
    {
        PostTransformConfig ret;

        ret.inst_combine_pass_            = false;
        ret.aggressive_inst_combine_pass_ = false;
        ret.sccp_pass_                    = false;
        ret.simplify_cfg_pass_            = false;
        ret.lower_switch_                 = false;
        ret.should_eleminate_zext_i1_     = false;
        ret.use_one_shot_measurements_    = false;

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

    bool shouldLowerSwitch() const
    {
        return lower_switch_;
    }

    bool shouldEliminateZExtI1() const
    {
        return should_eleminate_zext_i1_;
    }

    bool shouldUseOneShotMeasurements() const
    {
        return use_one_shot_measurements_;
    }

    void setUseOneShotMeasurements(bool const&v)
    {
        use_one_shot_measurements_ = v;
    }
  private:
    bool inst_combine_pass_{true};
    bool aggressive_inst_combine_pass_{true};
    bool sccp_pass_{true};
    bool simplify_cfg_pass_{true};
    bool lower_switch_{true};
    bool should_eleminate_zext_i1_{true};
    bool use_one_shot_measurements_{false};
};

} // namespace microsoft::quantum