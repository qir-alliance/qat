// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"

namespace microsoft::quantum
{

void LlvmPassesConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("LLVM optimizations", "Enables specific LLVM optimizations before and after transformation.");

    // LLVM transformations
    config.addParameter(unroll_loops_, "unroll-loops", "Aggressively unroll loops.");
    config.addParameter(
        unroll_allow_partial_, "allow-partial",
        "Enables or disables partial unrolling. When disabled only full unrolling is allowed.");
    config.addParameter(unroll_allow_peeling_, "allow-peeling", "Enables or disables loop peeling.");
    config.addParameter(
        unroll_allow_runtime_, "allow-runtime", "Enables or disables unrolling of loops with runtime trip count.");
    config.addParameter(
        unroll_allow_upper_bound_, "allow-upper-bound",
        "Enables or disables the use of trip count upper bound in loop unrolling.");
    config.addParameter(
        unroll_allow_profile_based_peeling_, "allow-profile-based-peeling",
        "Enables or disables loop peeling basing on profile.");
    config.addParameter(unroll_full_unroll_count_, "full-unroll-count", "Sets the max full unroll count.");
    config.addParameter(unroll_opt_level_, "unroll-opt-level", "Sets the optimization level for loop unrolling.");
    config.addParameter(
        unroll_only_when_forced_, "only-when-forced",
        "If true, only loops that explicitly request unrolling via metadata are considered.");
    config.addParameter(
        unroll_forget_scev_, "forget-scev",
        "If true, forget all loops when unrolling. If false, forget top-most loop of "
        "the currently processed loops.");

    config.addParameter(always_inline_, "always-inline", "Aggressively inline function calls.");

    config.addParameter(inline_parameter_, "inlining-parameter", "Number of code lines acceptable when inlining.");

    config.addParameter(eliminate_constants_, "eliminate-constants", "Uses LLVM pass to eliminate constants.");
    config.addParameter(eliminate_dead_code_, "eliminate-dead-code", "Uses LLVMs aggressive dead code elimination.");
    config.addParameter(eliminate_memory_, "eliminate-memory", "Maps memory into registers where feasible.");
}

bool LlvmPassesConfiguration::alwaysInline() const
{
    return always_inline_;
}

bool LlvmPassesConfiguration::unrollLoops() const
{
    return unroll_loops_;
}

int32_t LlvmPassesConfiguration::inlineParameter() const
{
    return inline_parameter_;
}

bool LlvmPassesConfiguration::unrollAllowPartial() const
{
    return unroll_allow_partial_;
}

bool LlvmPassesConfiguration::unrollAllowPeeling() const
{
    return unroll_allow_peeling_;
}

bool LlvmPassesConfiguration::unrollAllowRuntime() const
{
    return unroll_allow_runtime_;
}

bool LlvmPassesConfiguration::unrollAllowUpperBound() const
{
    return unroll_allow_upper_bound_;
}

bool LlvmPassesConfiguration::unrollAllowProfilBasedPeeling() const
{
    return unroll_allow_profile_based_peeling_;
}

uint64_t LlvmPassesConfiguration::unrolFullUnrollCount() const
{
    return unroll_full_unroll_count_;
}

int32_t LlvmPassesConfiguration::unrollOptLevel() const
{
    return unroll_opt_level_;
}

bool LlvmPassesConfiguration::unrollOnlyWhenForced() const
{
    return unroll_only_when_forced_;
}

bool LlvmPassesConfiguration::unrollForgeScev() const
{
    return unroll_forget_scev_;
}

bool LlvmPassesConfiguration::eliminateConstants() const
{
    return eliminate_constants_;
}

bool LlvmPassesConfiguration::eliminateDeadCode() const
{
    return eliminate_dead_code_;
}

bool LlvmPassesConfiguration::eliminateMemory() const
{
    return eliminate_memory_;
}

LlvmPassesConfiguration LlvmPassesConfiguration::createDisabled()
{

    LlvmPassesConfiguration ret;

    ret.always_inline_                      = false;
    ret.inline_parameter_                   = 0;
    ret.unroll_loops_                       = false;
    ret.unroll_allow_partial_               = false;
    ret.unroll_allow_peeling_               = false;
    ret.unroll_allow_runtime_               = false;
    ret.unroll_allow_upper_bound_           = false;
    ret.unroll_allow_profile_based_peeling_ = false;
    ret.unroll_full_unroll_count_           = 0;
    ret.unroll_opt_level_                   = 0;
    ret.unroll_only_when_forced_            = false;
    ret.unroll_forget_scev_                 = false;
    ret.eliminate_constants_                = false;
    ret.eliminate_dead_code_                = false;
    ret.eliminate_memory_                   = false;

    return ret;
}

LlvmPassesConfiguration LlvmPassesConfiguration::createUnrollInline()
{

    LlvmPassesConfiguration ret;

    ret.always_inline_                      = true;
    ret.inline_parameter_                   = std::numeric_limits<int32_t>::max();
    ret.unroll_loops_                       = true;
    ret.unroll_allow_partial_               = true;
    ret.unroll_allow_peeling_               = true;
    ret.unroll_allow_runtime_               = true;
    ret.unroll_allow_upper_bound_           = true;
    ret.unroll_allow_profile_based_peeling_ = true;
    ret.unroll_full_unroll_count_           = 1024;
    ret.unroll_opt_level_                   = 3;
    ret.unroll_only_when_forced_            = false;
    ret.unroll_forget_scev_                 = false;
    ret.eliminate_constants_                = true;
    ret.eliminate_dead_code_                = true;
    ret.eliminate_memory_                   = true;

    return ret;
}

bool LlvmPassesConfiguration::isDisabled() const
{
    return always_inline_ == false && inline_parameter_ == 0 && unroll_loops_ == false &&
           unroll_allow_partial_ == false && unroll_allow_peeling_ == false && unroll_allow_runtime_ == false &&
           unroll_allow_upper_bound_ == false && unroll_allow_profile_based_peeling_ == false &&
           unroll_full_unroll_count_ == 0 && unroll_opt_level_ == 0 && unroll_only_when_forced_ == false &&
           unroll_forget_scev_ == false && eliminate_constants_ == false && eliminate_dead_code_ == false &&
           eliminate_memory_ == false;
}

} // namespace microsoft::quantum
