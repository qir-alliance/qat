#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Logging/SourceLocation.hpp"

#include <vector>

namespace microsoft {
namespace quantum {

/// Concrete ILogger implementation that collects all messages and their corresponding location in a
/// list that can be traversed later on.
class LogCollection : public ILogger
{
public:
  /// Class that holds the location of where the incident happened.
  struct Location : public SourceLocation
  {
    String llvm_hint;
    String frontend_hint;
  };

  /// Enum description what type of information we are conveying.
  enum class Type
  {
    Debug,
    Info,
    Warning,
    Error,
    InternalError,
  };

  /// Struct to hold a message together with its type and location
  struct Message
  {
    Type     type;
    Location location;
    String   message;
  };

  /// List of messages defined as alias.
  using Messages = std::vector<Message>;

  // Interface implementation
  //

  /// Adds a debug message to the list.
  void debug(String const &message) override;

  /// Adds an info message to the list.
  void info(String const &message) override;

  /// Adds a warning message to the list.
  void warning(String const &message) override;

  /// Adds an error message to the list.
  void error(String const &message) override;

  /// Adds an internal error message to the list.
  void internalError(String const &message) override;

  /// Function that allows to set the current location.
  void setLocation(String const &name, int64_t line, int64_t col) override;

  /// Sets the value of the LLVM instruction causing the issue.
  void setLlvmHint(String const &value) override;

  /// Sets the value of the frontend instruction causing the issue.
  void setFrontendHint(String const &value) override;

  /// Accessor to the messages
  Messages const &messages() const;

private:
  Location current_location_{};  ///< Holds current location.
  Messages messages_;            ///< All messages emitted.
};

}  // namespace quantum
}  // namespace microsoft
