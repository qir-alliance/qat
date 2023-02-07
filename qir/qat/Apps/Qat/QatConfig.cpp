// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Apps/Qat/QatConfig.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"

namespace microsoft::quantum
{

void QatConfig::setup(ConfigurationManager& config)
{
    // Note that the QAT configuration cannot have experimental values as the experimental flag is not set yet.

    config.setSectionName("QAT base configuration", "Configuration of QAT defining the high-level behaviour.");
    config.addParameter(load_, static_cast<String>(""), "load", "Load component.");
    config.addParameter(
        generate_, "apply", "Applies a adaptor to transform the IR in correspondence with the adaptor.");
    config.addParameter(validate_, false, "validate", "Executes the validation procedure.");
    config.addParameter(target_name_, static_cast<String>("default"), "adaptor", "Sets the adaptor.");
    config.addParameter(
        adapter_pipeline_,
        {"replacement-linking", "llvm-optimization", "remove-non-entrypoint-functions", "target-qis-mapping",
         "static-resources", "target-profile-mapping", "straightline-code-requirement", "grouping"},
        "adaptor-pipeline", "Overrides the adaptor pipleline.");

    config.addParameter(
        emit_human_readable_llvm_, false, "emit-human-readable-llvm", "Emits LLVM IR to the standard output.");
    config.addShorthandNotation("emit-human-readable-llvm", "S");

    config.addParameter(
        target_definition_, static_cast<std::string>(""), "target-def",
        "YAML file containing the definition for the target.", ConfigurationManager::ParameterVisibility::CliOnly);

    config.addParameter(
        save_config_to_, static_cast<std::string>(""), "save-config", "YAML file to which the config will be save.",
        ConfigurationManager::ParameterVisibility::CliOnly);

    config.addParameter(verify_module_, "verify-module", "Verifies the module after transformation.");

    config.addParameter(experimental_, "experimental", "Enables experimental features.");
    config.addParameter(dump_config_, "dump-config", "Prints the configuration to the standard output.");
    config.addParameter(add_ir_debug_info_, "add-ir-debug", "Annotates the IR with debug information.");
    config.addParameter(strip_existing_debug_, "strip-existing-dbg", "Strips existing debug symbols.");

    config.addParameter(output_file_, "output", "Output file. If empty, the output is sent to stdout.");
    config.addShorthandNotation("output", "o");

    config.addParameter(save_report_to_, "save-logs", "Saves the logs report to specified filename in JSON format.");
    config.addParameter(show_version_, "version", "Shows the version of QAT.");
    config.addShorthandNotation("version", "v");
    config.addParameter(show_help_, "help", "Show help page.");
    config.addShorthandNotation("help", "h");
}

bool QatConfig::shouldGenerate() const
{
    return generate_;
}

bool QatConfig::shouldValidate() const
{
    return validate_;
}

String QatConfig::targetName() const
{
    return target_name_;
}

bool QatConfig::shouldEmitHumanReadibleLlvm() const
{
    return emit_human_readable_llvm_;
}

bool QatConfig::isOpt0Enabled() const
{
    return opt0_;
}

bool QatConfig::isOpt1Enabled() const
{
    return opt1_;
}

bool QatConfig::isOpt2Enabled() const
{
    return opt2_;
}

bool QatConfig::isOpt3Enabled() const
{
    return opt3_;
}

bool QatConfig::verifyModule() const
{
    return verify_module_;
}

bool QatConfig::isDebugMode() const
{
    return debug_;
}

bool QatConfig::shouldDumpConfig() const
{
    return dump_config_;
}

String QatConfig::load() const
{
    return load_;
}

bool QatConfig::isExperimental() const
{
    return experimental_;
}

bool QatConfig::addIrDebugInfo() const
{
    return add_ir_debug_info_;
}

bool QatConfig::stripExistingDebugInfo() const
{
    return strip_existing_debug_;
}

String const& QatConfig::outputFile() const
{
    return output_file_;
}

String const& QatConfig::saveReportTo() const
{
    return save_report_to_;
}

bool QatConfig::showHelp() const
{
    return show_help_;
}

bool QatConfig::showVersion() const
{
    return show_version_;
}

String QatConfig::targetDefinition() const
{
    return target_definition_;
}

String QatConfig::saveConfigTo() const
{
    return save_config_to_;
}

QatConfig::AdaptorPipeline QatConfig::adaptorPipeline() const
{
    return adapter_pipeline_;
}
} // namespace microsoft::quantum
