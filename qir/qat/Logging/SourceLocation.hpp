#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <utility>
#include <vector>

namespace microsoft::quantum
{

class SourceLocation
{
  public:
    using StringRef = llvm::StringRef;

    SourceLocation() = default;
    SourceLocation(String v_name, int64_t v_line, int64_t v_column)
      : name_{std::move(v_name)}
      , line_{v_line}
      , column_{v_column}
    {
    }

    enum
    {
        InvalidPosition = -1
    };

    explicit operator bool() const
    {
        return line_ != InvalidPosition && column_ != InvalidPosition;
    }

    static SourceLocation invalidPosition()
    {
        return {"", InvalidPosition, InvalidPosition};
    }

    String& name()
    {
        return name_;
    }
    String const& name() const
    {
        return name_;
    }

    void setName(String const& name)
    {
        name_ = name;
    }

    int64_t& line()
    {
        return line_;
    }
    int64_t const& line() const
    {
        return line_;
    }

    void setLine(int64_t line)
    {
        line_ = line;
    }
    int64_t& column()
    {
        return column_;
    }
    int64_t const& column() const
    {
        return column_;
    }
    void setColumn(int64_t column)
    {
        column_ = column;
    }

  private:
    String  name_{};
    int64_t line_{0};
    int64_t column_{0};
};
} // namespace microsoft::quantum
