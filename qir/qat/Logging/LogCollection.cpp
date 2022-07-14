// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/LogCollection.hpp"

#include "qir/qat/Utils/Trim.hpp"

#include <fstream>
#include <iostream>
#include <vector>

namespace microsoft::quantum
{

void LogCollection::debug(String const& message)
{
    messages_.push_back({Type::Debug, current_location_, message});
}

void LogCollection::info(String const& message)
{
    messages_.push_back({Type::Info, current_location_, message});
}

void LogCollection::warning(String const& message)
{
    setHasWarnings(true);
    messages_.push_back({Type::Warning, current_location_, message});
}

void LogCollection::error(String const& message)
{
    setHasErrors(true);
    messages_.push_back({Type::Error, current_location_, message});
}

void LogCollection::internalError(String const& message)
{
    setHasErrors(true);
    messages_.push_back({Type::InternalError, current_location_, message});
}

void LogCollection::setLocation(SourceLocation const& loc)
{
    current_location_.setName(loc.name());
    current_location_.setLine(loc.line());
    current_location_.setColumn(loc.column());
}

ILogger::Messages const& LogCollection::messages() const
{
    return messages_;
}

void LogCollection::setLlvmHint(String const& value)
{
    current_location_.setLlvmHint(value);
    trim(current_location_.llvmHint());
}

void LogCollection::setFrontendHint(String const& value)
{
    current_location_.setFrontendHint(value);
    trim(current_location_.frontendHint());
}

void LogCollection::dump(std::ostream& out) const
{
    bool not_first = false;
    out << "[";
    for (auto& message : messages_)
    {
        if (not_first)
        {
            out << ",";
        }
        out << "\n";
        out << "  {\n";

        switch (message.type)
        {
        case LogCollection::Type::Debug:
            out << "    \"type\": \"debug\",\n";
            break;
        case LogCollection::Type::Info:
            out << "    \"type\": \"info\",\n";
            break;
        case LogCollection::Type::Warning:
            out << "    \"type\": \"warning\",\n";
            break;
        case LogCollection::Type::Error:
            out << "    \"type\": \"error\",\n";
            break;
        case LogCollection::Type::InternalError:
            out << "    \"type\": \"internalError\",\n";
            break;
        }

        out << "    \"message\": \"" << message.message << "\",\n";
        out << "    \"location\": {\n";
        out << "      \"filename\": \"" << static_cast<std::string>(message.location.name()) << "\",\n";
        out << "      \"line\": " << message.location.line() << ",\n";
        out << "      \"column\": " << message.location.column() << ",\n";
        out << "      \"llvm_hint\": \"" << message.location.llvmHint() << "\",\n";
        out << "      \"frontend_hint\": \"" << message.location.frontendHint() << "\"\n";
        out << "    }\n";
        out << "  }";
        not_first = true;
    }
    out << "\n]\n";
}

} // namespace microsoft::quantum
