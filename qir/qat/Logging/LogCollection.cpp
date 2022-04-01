// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/LogCollection.hpp"
#include "Utils/Trim.hpp"

#include <vector>

namespace microsoft
{
namespace quantum
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
        messages_.push_back({Type::Warning, current_location_, message});
    }

    void LogCollection::error(String const& message)
    {
        messages_.push_back({Type::Error, current_location_, message});
    }

    void LogCollection::internalError(String const& message)
    {
        messages_.push_back({Type::InternalError, current_location_, message});
    }

    void LogCollection::setLocation(SourceLocation const& loc)
    {
        current_location_.name   = loc.name;
        current_location_.line   = loc.line;
        current_location_.column = loc.column;
    }

    ILogger::Messages const& LogCollection::messages() const
    {
        return messages_;
    }

    void LogCollection::setLlvmHint(String const& value)
    {
        current_location_.llvm_hint = value;
        trim(current_location_.llvm_hint);
    }

    void LogCollection::setFrontendHint(String const& value)
    {
        current_location_.frontend_hint = value;
        trim(current_location_.frontend_hint);
    }

    void LogCollection::dump(std::ostream& fout) const
    {
        bool not_first = false;

        fout << "[";
        for (auto& message : messages_)
        {
            if (not_first)
            {
                fout << ",";
            }
            fout << "\n";
            fout << "  {\n";

            switch (message.type)
            {
            case LogCollection::Type::Debug:
                fout << "    \"type\": \"debug\",\n";
                break;
            case LogCollection::Type::Info:
                fout << "    \"type\": \"info\",\n";
                break;
            case LogCollection::Type::Warning:
                fout << "    \"type\": \"warning\",\n";
                break;
            case LogCollection::Type::Error:
                fout << "    \"type\": \"error\",\n";
                break;
            case LogCollection::Type::InternalError:
                fout << "    \"type\": \"internalError\",\n";
                break;
            }

            fout << "    \"message\": \"" << message.message << "\",\n";
            fout << "    \"location\": {\n";
            fout << "      \"filename\": \"" << static_cast<std::string>(message.location.name) << "\",\n";
            fout << "      \"line\": " << message.location.line << ",\n";
            fout << "      \"column\": " << message.location.column << ",\n";
            fout << "      \"llvm_hint\": \"" << message.location.llvm_hint << "\",\n";
            fout << "      \"frontend_hint\": \"" << message.location.frontend_hint << "\"\n";
            fout << "    }\n";
            fout << "  }";
            not_first = true;
        }
        fout << "\n]\n";
    }

} // namespace quantum
} // namespace microsoft
