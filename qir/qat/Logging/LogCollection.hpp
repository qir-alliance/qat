#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Logging/SourceLocation.hpp"

#include <vector>

namespace microsoft::quantum
{

/// Concrete ILogger implementation that collects all messages and their corresponding location in a
/// list that can be traversed later on.
class LogCollection : public ILogger
{
  public:
    // Interface implementation
    //

    /// Adds a debug message to the list.
    void debug(String const& message) override;

    /// Adds an info message to the list.
    void info(String const& message) override;

    /// Adds a warning message to the list.
    void warning(String const& message) override;

    /// Adds an error message to the list.
    void error(String const& message) override;

    /// Adds an internal error message to the list.
    void internalError(String const& message) override;

    /// Function that allows to set the current location.
    void setLocation(SourceLocation const& loc) override;

    /// Sets the value of the LLVM instruction causing the issue.
    void setLlvmHint(String const& value) override;

    /// Sets the value of the frontend instruction causing the issue.
    void setFrontendHint(String const& value) override;

    /// Accessor to the messages
    Messages const& messages() const override;

    /// Enabling dumping collection to a file
    void dump(std::ostream& out) const override;

  private:
    Location current_location_{}; ///< Holds current location.
    Messages messages_;           ///< All messages emitted.
};

} // namespace microsoft::quantum
