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
        // Default constructor which sets the standard pipeline.
        LlvmPassesConfiguration();

        // Setup and pre-fabricated configurations

        /// Setup function that registers the different LLVM passes available via LLVM component.
        void setup(ConfigurationManager& config);

        /// Static function creates a new configuration where all transformations/validation requirements
        /// are disabled.
        static LlvmPassesConfiguration createDisabled();

        // Configuration interpretation
        //

        /// Returns true if the configuration disables all effects of this component. The effect of this
        /// function being true is that registered component should have no effect on transformation
        /// and/or validation of the QIR.
        bool isDisabled() const;

        /// Compares equality of two configurations
        bool operator==(LlvmPassesConfiguration const& ref) const;

        // Flags and options
        //

        /// Whether or not the LLVM AlwaysInline pass should be added to the profile.
        bool alwaysInline() const;

        /// Whether or not the default LLVM pipeline is disabled.
        bool disableDefaultPipeline() const;

        std::string passPipeline() const;

        /// Parameter that defines the maximum number of lines of code allowed for inlining.
        int32_t inlineParameter() const;

      private:
        // Variables that enables or disables the adding of specific passes
        //

        bool        always_inline_{false};                ///< Whether or not LLVM component should inline.
        bool        default_pipeline_is_disabled_{false}; ///< Whether or not the default pipeline is disabled
        std::string pass_pipeline_{""};                   ///< Opt compatible LLVM passes pipeline
        int32_t     inline_parameter_{std::numeric_limits<int32_t>::max()};
    };

} // namespace quantum
} // namespace microsoft
