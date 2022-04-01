#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/SourceLocation.hpp"
#include "QatTypes/QatTypes.hpp"

#include "Llvm/Llvm.hpp"

#include <cstdint>
#include <iostream>
#include <string>

namespace microsoft
{
namespace quantum
{

    /// Logger interface to allow the collection of different types of messages during QIR
    /// transformation and/or validation.
    class ILogger
    {
      public:
        using Value            = llvm::Value;
        using LocationResolver = std::function<SourceLocation(Value const*)>;

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

        // Constructors, copy and move operators and destructors
        //

        ILogger()               = default;
        ILogger(ILogger const&) = default;
        ILogger(ILogger&&)      = default;
        ILogger& operator=(ILogger const&) = default;
        ILogger& operator=(ILogger&&) = default;

        virtual ~ILogger();

        // Abstract interface methods
        //

        /// Reports a debug message.
        virtual void debug(String const& message) = 0;

        /// Reports an info message.
        virtual void info(String const& message) = 0;

        /// Reports a warning message.
        virtual void warning(String const& message) = 0;

        /// Reports an error message.
        virtual void error(String const& message) = 0;

        /// Reports an internal error message.
        virtual void internalError(String const& message) = 0;

        /// Sets the current location. Importantly, the location can be set independently of the reported
        /// messages. This allows one to update the location upon updating the cursor position without
        /// having to worry about keeping a copy of the location to pass when reporting messages.
        /// The most obvious case of this is file path (name) with a line and character (line, col).
        virtual void setLocation(SourceLocation const& location) = 0;

        /// Sets the value of the LLVM instruction causing the issue.
        virtual void setLlvmHint(String const& value) = 0;

        /// Sets the value of the frontend instruction causing the issue.
        virtual void setFrontendHint(String const& value) = 0;

        virtual Messages const& messages() const;

        virtual void dump(std::ostream& fout) const;

        // Location integration with LLVM
        //

        /// Sets the logger position based on a LLVM value.
        void setLocationFromValue(llvm::Value const* value);

        /// Sets a resolver which that translates a LLVM value into a position in the source
        void setLocationResolver(LocationResolver const& r);

      private:
        LocationResolver location_resolver_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
