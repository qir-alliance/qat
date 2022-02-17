// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/LlvmPassesConfiguration.hpp"

#include "Commandline/ConfigurationManager.hpp"

namespace microsoft {
namespace quantum {

LlvmPassesConfiguration::LlvmPassesConfiguration() = default;

void LlvmPassesConfiguration::setup(ConfigurationManager &config)
{
  config.setSectionName("LLVM Passes", "Configuration of LLVM passes.");

  config.addExperimentalParameter(default_pipeline_is_disabled_, "disable-default-pipeline",
                                  "Disables the the default pipeline.");

  config.addExperimentalParameter(pass_pipeline_, "passes",
                                  "LLVM passes pipeline to use upon applying this component.");
}

LlvmPassesConfiguration LlvmPassesConfiguration::createDisabled()
{
  LlvmPassesConfiguration ret;

  ret.pass_pipeline_                = "";
  ret.default_pipeline_is_disabled_ = true;
  return ret;
}

bool LlvmPassesConfiguration::disableDefaultPipeline() const
{
  return default_pipeline_is_disabled_;
}

std::string LlvmPassesConfiguration::passPipeline() const
{
  return pass_pipeline_;
}

bool LlvmPassesConfiguration::isDisabled() const
{
  return pass_pipeline_ == "";
}

bool LlvmPassesConfiguration::operator==(LlvmPassesConfiguration const &ref) const
{
  return true;  // always_inline_ == ref.always_inline_;
}

}  // namespace quantum
}  // namespace microsoft
