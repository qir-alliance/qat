// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"

#include <cstdint>
#include <fstream>
#include <iostream>
#include <string>

namespace microsoft
{
namespace quantum
{
    ILogger::~ILogger()
    {
        // Ensuring that the captured function is deleted to release
        // shared memory.
        location_resolver_ = nullptr;
    }

    void ILogger::setLocationFromValue(llvm::Value const* value)
    {
        if (location_resolver_)
        {
            auto loc = location_resolver_(value);
            setLocation(loc);
        }
    }

    void ILogger::setLocationResolver(LocationResolver const& r)
    {
        location_resolver_ = r;
    }

    ILogger::Messages const& ILogger::messages() const
    {
        throw std::runtime_error("messages() is not supported by logger.");
    }

    void ILogger::dump(std::ostream& /*out*/) const
    {
        throw std::runtime_error("dump() is not supported by logger.");
    }

    SourceLocation ILogger::resolveLocation(llvm::Value const* value)
    {
        if (location_resolver_)
        {
            return location_resolver_(value);
        }
        return SourceLocation::InvalidPosition();
    }

    bool ILogger::hadErrors() const
    {
        return had_errors_;
    }

    bool ILogger::hadWarnings() const
    {
        return had_warnings_;
    }

    void ILogger::errorCouldNotDeleteNode(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Could not delete node.");
    }

    void ILogger::errorExpectedStraightLineCodeMultipleFunctions(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Expected straight line code, but multiple functions present.");
    }

    void ILogger::errorExpectedStraightLineCodeMultipleBlocks(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Expected straight line code, but multiple blocks present.");
    }

    void ILogger::errorReleaseFailNonStandardAlloc(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Cannot release qubit from non-standard allocation.");
    }

    void ILogger::warningReleasePhiNodeQubit(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        warning("Cannot release qubit arising from phi node.");
    }

    void ILogger::errorFunctionInliningMaxRecursion(uint64_t n, llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Function inlining exceeded maximum recursion depth of " + std::to_string(n));
    }

    void ILogger::errorNoQubitsPresent(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("No qubits present in function (required by profile).");
    }

    void ILogger::errorNoResultsPresent(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("No results present in function (required by profile).");
    }

    void ILogger::errorOpcodeNotAllowed(String const& code, String const& profile_name, llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }

        error("Opcode '" + code + "' is not allowed for this profile (" + profile_name + ").");
    }

    void ILogger::errorCustomFunctionsNotAllowed(llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Calls to custom defined functions not allowed.");
    }

    void ILogger::errorExternalCallsNotAllowed(
        String const& function_name,
        String const& profile_name,
        llvm::Value*  ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("External call '" + function_name + "' is not allowed for this profile (" + profile_name + ").");
    }

    void ILogger::errorTypeNotAllowed(String const& type_name, String const& profile_name, llvm::Value* ptr)
    {
        if (ptr)
        {
            setLocationFromValue(ptr);
        }
        error("Type '" + type_name + "' is not allowed for this profile (" + profile_name + ").");
    }
} // namespace quantum
} // namespace microsoft
