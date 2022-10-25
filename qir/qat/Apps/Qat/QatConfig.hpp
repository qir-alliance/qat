#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

/// Main configuration class for the qat command-line program.
class QatConfig
{
  public:
    using AdaptorPipeline = std::vector<String>;

    // Functions required by configuration manager
    //

    /// Setup function that binds instance variables to the command-line/configuration entries.
    /// This function also provide descriptions of each of the properties below.
    void setup(ConfigurationManager& config);

    // Flags and options
    //

    /// List of dynamic libraries to load.
    String load() const;

    /// Flag that indicates whether or not we are generating a new QIR by applying a adaptor.
    bool shouldGenerate() const;

    /// Flag to indicate whether or not to verify that the (Q)IR is a valid LLVM IR.
    bool verifyModule() const;

    /// Flag to indicate whether or not to validate the compliance with the QIR adaptor.
    bool shouldValidate() const;

    /// String to request a specific adaptor name. Default is 'default'.
    String targetName() const;

    /// Indicates whether or not the QIR adaptor tool should emit LLVM IR to the standard output.
    bool shouldEmitHumanReadibleLlvm() const;

    /// Tells if the optimization level 0 is enabled. Note higher OX override lower ones.
    bool isOpt0Enabled() const;

    /// Tells if the optimization level 1 is enabled. Note higher OX override lower ones.
    bool isOpt1Enabled() const;

    /// Tells if the optimization level 2 is enabled. Note higher OX override lower ones.
    bool isOpt2Enabled() const;

    /// Tells if the optimization level 3 is enabled. Note higher OX override lower ones.
    bool isOpt3Enabled() const;

    /// Enables debug output.
    bool isDebugMode() const;

    /// Request the full configuration to be dumped to the screen.
    bool shouldDumpConfig() const;

    /// Whether or not experimental features are enabled.
    bool isExperimental() const;

    /// Whether or not to annotate IR with debug info.
    bool addIrDebugInfo() const;

    /// Filename to which the output is saved to.
    String const& outputFile() const;

    /// Filename to which the log messages are saved to
    String const& saveReportTo() const;

    /// Whether or not to strip existing debug info.
    bool stripExistingDebugInfo() const;

    /// Whether or not to show the version of qat
    bool showVersion() const;

    /// Whether or not to show help page.
    bool showHelp() const;

    /// YAML filename containing target definition
    String targetDefinition() const;

    /// YAML filename to save the configuration to
    String saveConfigTo() const;

    /// Component pipeline to be build
    AdaptorPipeline adaptorPipeline() const;

  private:
    // Variables to be bound to the configuration manager
    //
    String          load_{""};
    bool            generate_{false};
    bool            validate_{false};
    String          target_name_{"default"};
    AdaptorPipeline adapter_pipeline_{};

    bool emit_human_readable_llvm_{false};
    bool opt0_{false};
    bool opt1_{false};
    bool opt2_{false};
    bool opt3_{false};
    bool verify_module_{false};
    bool add_ir_debug_info_{false};
    bool strip_existing_debug_{false};

    String output_file_{""};
    String save_report_to_{""};

    bool debug_{false};
    bool experimental_{false};
    bool dump_config_{false};
    bool show_version_{false};
    bool show_help_{false};

    String target_definition_{""};
    String save_config_to_{""};
};
} // namespace microsoft::quantum
