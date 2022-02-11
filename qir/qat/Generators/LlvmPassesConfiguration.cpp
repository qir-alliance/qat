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
  config.addExperimentalParameter(always_inline_, "always-inline",
                                  "Aggressively inline function calls.");
  config.addExperimentalParameter(default_pipeline_is_disabled_, "disable-default-pipeline",
                                  "Disables the the default pipeline.");

  config.addExperimentalParameter(pass_pipeline_, "passes",
                                  "LLVM passes pipeline to use upon applying this component.");

  config.addExperimentalParameter(inline_parameter_, "inlining-parameter",
                                  "Number of code lines acceptable when inlining.");
}

LlvmPassesConfiguration LlvmPassesConfiguration::createDisabled()
{
  LlvmPassesConfiguration ret;
  ret.always_inline_                = false;
  ret.pass_pipeline_                = "";
  ret.default_pipeline_is_disabled_ = true;
  return ret;
}

bool LlvmPassesConfiguration::alwaysInline() const
{
  return always_inline_;
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
  return always_inline_ == false && pass_pipeline_ == "";
}

bool LlvmPassesConfiguration::operator==(LlvmPassesConfiguration const &ref) const
{
  return always_inline_ == ref.always_inline_;
}

int32_t LlvmPassesConfiguration::inlineParameter() const
{
  return inline_parameter_;
}

}  // namespace quantum
}  // namespace microsoft
