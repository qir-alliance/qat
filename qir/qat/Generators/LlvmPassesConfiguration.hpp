#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft
{
namespace quantum
{

    class LlvmPassesConfiguration
    {
      public:
        void setup(ConfigurationManager& config);

        /// Whether or not the LLVM AlwaysInline pass should be added to the profile.
        bool alwaysInline() const;

        /// Whether or not the LLVM LoopUnroll pass should be added to the profile
        bool unrollLoops() const;

        /// Parameter that defines the maximum number of lines of code allowed for inlining.
        int32_t inlineParameter() const;

        bool unrollAllowPartial() const;

        bool unrollAllowPeeling() const;

        bool unrollAllowRuntime() const;

        bool unrollAllowUpperBound() const;

        bool unrollAllowProfilBasedPeeling() const;

        uint64_t unrolFullUnrollCount() const;

        int32_t unrollOptLevel() const;

        bool unrollOnlyWhenForced() const;

        bool unrollForgeScev() const;

        bool useLlvmOptPipeline() const;

        String optPipelineConfig() const;

        bool eliminateConstants() const;
        bool eliminateDeadCode() const;

        bool eliminateMemory() const;

        // Configuration classification
        bool isDisabled() const;
        bool operator==(LlvmPassesConfiguration const& o) const = default;

        static LlvmPassesConfiguration createDisabled();
        static LlvmPassesConfiguration createUnrollInline();

      private:
        bool    always_inline_{false}; ///< Whether or not LLVM component should inline.
        int32_t inline_parameter_{std::numeric_limits<int32_t>::max()};

        bool     unroll_loops_{false}; ///< Whether or not LLVM should unroll loops
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

        bool   use_llvm_opt_pipeline_{false};
        String opt_pipeline_config_{""};
    };

} // namespace quantum
} // namespace microsoft
