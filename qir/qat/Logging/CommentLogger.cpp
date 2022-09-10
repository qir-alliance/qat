// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/CommentLogger.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <vector>

namespace microsoft::quantum
{

void CommentLogger::debug(String const& message)
{
    llvm::errs() << "debug - " << location_.name() << ":" << location_.line() << "," << location_.column() << " - "
                 << message << "\n";
}

void CommentLogger::info(String const& message)
{
    llvm::errs() << "info - " << location_.name() << ":" << location_.line() << "," << location_.column() << " - "
                 << message << "\n";
}

void CommentLogger::warning(String const& message)
{
    setHasWarnings(true);

    llvm::errs() << "warning - " << location_.name() << ":" << location_.line() << "," << location_.column() << " - "
                 << message << "\n";
}

void CommentLogger::error(String const& message)
{
    setHasErrors(true);
    llvm::errs() << "error - " << location_.name() << ":" << location_.line() << "," << location_.column() << " - "
                 << message << "\n";
}

void CommentLogger::internalError(String const& message)
{
    setHasErrors(true);
    llvm::errs() << "internal error - " << location_.name() << ":" << location_.line() << "," << location_.column()
                 << " - " << message << "\n";
}

void CommentLogger::setLocation(SourceLocation const& loc)
{
    location_ = loc;
}

void CommentLogger::setLlvmHint(String const&) {}

void CommentLogger::setFrontendHint(String const&) {}

} // namespace microsoft::quantum
