#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"

namespace microsoft {
namespace quantum {

class ValidationPassConfiguration
{
public:
  using Set = std::unordered_set<std::string>;
  // Setup and construction
  //

  /// Setup function that adds the configuration flags to the ConfigurationManager. See the
  /// ConfigurationManager documentation for more details on how the setup process is implemented.
  void setup(ConfigurationManager &config)
  {
    config.setSectionName("Validation configuration", "");
    config.addParameter(allow_internal_calls_, "allow-internal-calls",
                        "Whether or not internal calls are allowed.");
    config.addParameter(save_report_to_, "save-validation-report",
                        "Saves the validation report to specified filename.");
  }

  static ValidationPassConfiguration fromProfileName(String const &name)
  {
    auto profile = ValidationPassConfiguration();
    if (name == "generic")
    {
      profile.allow_internal_calls_     = true;
      profile.allowlist_external_calls_ = false;
      profile.allowlist_opcodes_        = false;
    }
    else if (name == "base")
    {
      profile.allow_internal_calls_     = false;
      profile.allowlist_external_calls_ = true;
      profile.allowlist_opcodes_        = true;
      profile.opcodes_                  = Set{"br", "call", "unreachable", "ret", "phi", "select"};
      profile.external_calls_           = Set{
          "__quantum__qis__mz__body",     "__quantum__qis__read_result__body",
          "__quantum__qis__reset__body",  "__quantum__qis__z__body",
          "__quantum__qis__s__adj",       "__quantum__qis__dumpregister__body",
          "__quantum__qis__y__body",      "__quantum__qis__x__body",
          "__quantum__qis__t__body",      "__quantum__qis__cz__body",
          "__quantum__qis__s__body",      "__quantum__qis__h__body",
          "__quantum__qis__cnot__body",   "__quantum__qis__sqrt__body",
          "__quantum__qis__crz__body",    "__quantum__qis__rz__body",
          "__quantum__qis__arcsin__body", "__quantum__qis__drawrandomint__body",
          "__quantum__qis__rx__body",     "__quantum__qis__m__body",
          "__quantum__qis__t__adj",
      };
      profile.allowlist_pointer_types_ = true;
      profile.allowed_pointer_types_   = {"i8*",    "i16*",    "i32*",    "i64*",
                                        "Qubit*", "Qubit**", "Result*", "Result**"};
    }
    else
    {
      throw std::runtime_error("Invalid profile " + name);
    }

    return profile;
  }

  Set const &allowedOpcodes() const
  {
    return opcodes_;
  }

  Set const &allowedExternalCallNames() const
  {
    return external_calls_;
  }

  bool allowInternalCalls() const
  {
    return allow_internal_calls_;
  }

  bool allowlistOpcodes() const
  {
    return allowlist_opcodes_;
  }

  bool allowlistExternalCalls() const
  {
    return allowlist_external_calls_;
  }

  String const &saveReportTo() const
  {
    return save_report_to_;
  }

  bool allowlistPointerTypes() const
  {
    return allowlist_pointer_types_;
  }

  Set const &allowedPointerTypes() const
  {
    return allowed_pointer_types_;
  }

private:
  Set opcodes_{};
  Set external_calls_{};
  Set allowed_pointer_types_{};

  String save_report_to_{""};

  bool allowlist_opcodes_{true};
  bool allowlist_external_calls_{true};
  bool allow_internal_calls_{false};
  bool allowlist_pointer_types_{false};

  bool allow_primitive_return_{true};
  bool allow_struct_return_{true};
  bool allow_pointer_return_{true};
};

}  // namespace quantum
}  // namespace microsoft
