#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft::quantum
{

class LlvmPassesConfiguration
{
  public:
    void setup(ConfigurationManager& config);

    /// Whether or not the LLVM AlwaysInline pass should be added to the adaptor.
    bool alwaysInline() const;

    /// Whether or not the LLVM LoopUnroll pass should be added to the adaptor
    bool unrollLoops() const;

    /// Parameter that defines the maximum number of lines of code allowed for inlining.
    int32_t inlineParameter() const;

    /// Whether or not to allow partial unrolling. When disable only full unrolling will be used.
    bool unrollAllowPartial() const;

    /// Whether or not to allow peeling.
    bool unrollAllowPeeling() const;

    /// Whether or not to allow unrolling of loops with runtime trip counts. See
    /// [implementation](https://llvm.org/doxygen/LoopUnrollRuntime_8cpp_source.html) for details.
    bool unrollAllowRuntime() const;

    /// Enables or disables the usage of trip counting in loop unrolling.
    bool unrollAllowUpperBound() const;

    bool unrollAllowProfilBasedPeeling() const;

    /// The max count full unroll count.
    uint64_t unrolFullUnrollCount() const;

    /// The optimization level for the loop unrolling pass.
    int32_t unrollOptLevel() const;

    /// Whether or not to limit unrolling to which are requested to be unrolled via meta data is
    /// consider. When false, a cost model is used to determine whether or not to unroll a loop.
    bool unrollOnlyWhenForced() const;

    bool unrollForgeScev() const;

    /// Whether or not to add a pass to eliminate constants.
    bool eliminateConstants() const;

    /// Whether or not to add a pass to eliminate dead code.
    bool eliminateDeadCode() const;

    /// Whether or not memory allocations should be attempted to be mapped into registers.
    bool eliminateMemory() const;

    // Configuration classification

    /// Checking if the configuration amounts to being disabled.
    bool isDisabled() const;

    /// Checking whether two configurations are identical.
    bool operator==(LlvmPassesConfiguration const& o) const
    {
        return always_inline_ == o.always_inline_ && inline_parameter_ == o.inline_parameter_ &&
               unroll_loops_ == o.unroll_loops_ && unroll_allow_partial_ == o.unroll_allow_partial_ &&
               unroll_allow_peeling_ == o.unroll_allow_peeling_ && unroll_allow_runtime_ == o.unroll_allow_runtime_ &&
               unroll_allow_upper_bound_ == o.unroll_allow_upper_bound_ &&
               unroll_allow_profile_based_peeling_ == o.unroll_allow_profile_based_peeling_ &&
               unroll_full_unroll_count_ == o.unroll_full_unroll_count_ && unroll_opt_level_ == o.unroll_opt_level_ &&
               unroll_only_when_forced_ == o.unroll_only_when_forced_ && unroll_forget_scev_ == o.unroll_forget_scev_ &&
               eliminate_constants_ == o.eliminate_constants_ && eliminate_dead_code_ == o.eliminate_dead_code_ &&
               eliminate_memory_ == o.eliminate_memory_;
    }

    /// Creating a configuration that disables all passes and/or their effect on the IR.
    static LlvmPassesConfiguration createDisabled();

    /// Creates a configuration that unrolls and inlines code.
    static LlvmPassesConfiguration createUnrollInline();

  private:
    bool    always_inline_{false};
    int32_t inline_parameter_{std::numeric_limits<int32_t>::max()};

    bool     unroll_loops_{false};
    bool     unroll_allow_partial_{true};
    bool     unroll_allow_peeling_{true};
    bool     unroll_allow_runtime_{true};
    bool     unroll_allow_upper_bound_{true};
    bool     unroll_allow_profile_based_peeling_{true};
    uint64_t unroll_full_unroll_count_{1024};
    int32_t  unroll_opt_level_{3};
    bool     unroll_only_when_forced_{false};
    bool     unroll_forget_scev_{false};

    bool eliminate_constants_{true};
    bool eliminate_dead_code_{true};
    bool eliminate_memory_{true};
};

} // namespace microsoft::quantum
