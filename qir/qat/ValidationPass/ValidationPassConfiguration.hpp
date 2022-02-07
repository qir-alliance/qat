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

  ValidationPassConfiguration() = default;

  /// Setup function that adds the configuration flags to the ConfigurationManager. See the
  /// ConfigurationManager documentation for more details on how the setup process is implemented.
  void setup(ConfigurationManager &config);

  static ValidationPassConfiguration fromProfileName(String const &name);
  Set const                         &allowedOpcodes() const;
  Set const                         &allowedExternalCallNames() const;

  bool allowInternalCalls() const;
  bool allowlistOpcodes() const;
  bool allowlistExternalCalls() const;

  String const &saveReportTo() const;
  bool          allowlistPointerTypes() const;
  Set const    &allowedPointerTypes() const;

  String profileName() const;

private:
  void addAllowedExternalCall(String const &name);
  void addAllowedOpcode(String const &name);
  void addAllowedPointerType(String const &name);

  String profile_name_{"null"};

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
