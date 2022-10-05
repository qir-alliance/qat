// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/ILogger.hpp"

#include <cstdint>
#include <fstream>
#include <iostream>
#include <string>

namespace microsoft::quantum
{
ILogger::~ILogger()
{
    // Ensuring that the captured function is deleted to release
    // shared memory.
    location_resolver_ = nullptr;
}

void ILogger::setLocationFromFunctionName(String const& name)
{
    if (location_from_name_resolver_)
    {
        auto loc = location_from_name_resolver_(name);
        setLocation(loc);
    }
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

void ILogger::setLocationFromNameResolver(LocationFromNameResolver const& r)
{
    location_from_name_resolver_ = r;
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
    return SourceLocation::invalidPosition();
}

bool ILogger::hadErrors() const
{
    return had_errors_;
}

bool ILogger::hadWarnings() const
{
    return had_warnings_;
}

void ILogger::errorWithLocation(String const& message, llvm::Value* ptr)
{
    if (ptr)
    {
        setLocationFromValue(ptr);
    }
    error(message);
}

void ILogger::warningWithLocation(String const& message, llvm::Value* ptr)
{
    if (ptr)
    {
        setLocationFromValue(ptr);
    }
    warning(message);
}

void ILogger::errorCouldNotDeleteNode(llvm::Value* ptr)
{
    errorWithLocation("Could not delete node.", ptr);
}

void ILogger::errorExpectedStraightLineCodeMultipleFunctions(llvm::Value* ptr)
{
    errorWithLocation("Expected straight line code, but multiple functions present.", ptr);
}

void ILogger::errorExpectedStraightLineCodeMultipleBlocks(llvm::Value* ptr)
{
    errorWithLocation("Expected straight line code, but multiple blocks present.", ptr);
}

void ILogger::errorReleaseFailNonStandardAlloc(llvm::Value* ptr)
{
    errorWithLocation("Cannot release qubit from non-standard allocation.", ptr);
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
    errorWithLocation("Function inlining exceeded maximum recursion depth of " + std::to_string(n), ptr);
}

void ILogger::errorNoQubitsPresent(llvm::Value* ptr, String const& name)
{
    errorWithLocation("No qubits present in function (required by adaptor '" + name + "').", ptr);
}

void ILogger::errorNoResultsPresent(llvm::Value* ptr, String const& name)
{
    errorWithLocation("No results present in function (required by adaptor '" + name + "').", ptr);
}

void ILogger::errorOpcodeNotAllowed(String const& code, String const& target_name, llvm::Value* ptr)
{
    if (ptr)
    {
        setLocationFromValue(ptr);
    }

    error("Opcode '" + code + "' is not allowed for this adaptor (" + target_name + ").");
}

void ILogger::errorCustomFunctionsNotAllowed(llvm::Value* ptr)
{
    errorWithLocation("Calls to custom defined functions not allowed.", ptr);
}

void ILogger::errorExternalCallsNotAllowed(String const& function_name, String const& target_name, llvm::Value* ptr)
{
    errorWithLocation(
        "External call '" + function_name + "' is not allowed for this adaptor (" + target_name + ").", ptr);
}

void ILogger::errorTypeNotAllowed(String const& type_name, String const& target_name, llvm::Value* ptr)
{
    errorWithLocation("Type '" + type_name + "' is not allowed for this adaptor (" + target_name + ").", ptr);
}

void ILogger::errorPoisonNotAllowed(String const& target_name, llvm::Value* ptr)
{
    errorWithLocation("Poison value is not allowed for this adaptor (" + target_name + ").", ptr);
}

void ILogger::errorUndefNotAllowed(String const& target_name, llvm::Value* ptr)
{
    errorWithLocation("Undef value is not allowed for this adaptor (" + target_name + ").", ptr);
}

void ILogger::errorExpectedStringValueForAttr(String const& function_name, String const& attr_name)
{
    setLocationFromFunctionName(function_name);
    error("Expected string value for attribute '" + attr_name + "' for function " + function_name);
}

void ILogger::warningWeakLinkReplacementNotPossible(String const& function_name, String const& replacement)
{
    setLocationFromFunctionName(function_name);
    warning("Could not find replacement " + replacement + " for function " + function_name);
}
void ILogger::errorReplacementSignatureMismatch(
    String const& function_name,
    String const& signature1,
    String const& signature2)
{
    setLocationFromFunctionName(function_name);
    error("Replacement signature mismatch: " + signature1 + " differs from " + signature2);
}

void ILogger::setHasErrors(bool value)
{
    had_errors_ = value;
}

void ILogger::setHasWarnings(bool value)
{
    had_warnings_ = value;
}

} // namespace microsoft::quantum
