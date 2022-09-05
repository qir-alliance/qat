#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/SourceLocation.hpp"

#include <memory>
#include <unordered_map>

namespace microsoft::quantum
{

class InstructionLocationTable : public llvm::AssemblyAnnotationWriter
{
  public:
    using Position = SourceLocation;

    using StringRef         = llvm::StringRef;
    using BasicBlock        = llvm::BasicBlock;
    using Function          = llvm::Function;
    using Value             = llvm::Value;
    using Module            = llvm::Module;
    using Positions         = std::unordered_map<Value const*, Position>;
    using FunctionPositions = std::unordered_map<String, Position>;

    using InstructionLocationTablePtr = std::shared_ptr<InstructionLocationTable>;

    /// Pointer constructor for the debug table.
    static InstructionLocationTablePtr create();

    // Debug table interface
    //

    /// Gets the position of a LLVM value.
    Position getPosition(Value const* value) const;

    /// Gets the position from a function name
    Position getPositionFromFunctionName(String const& name) const;

    /// Registers a module in debug table.
    void registerModule(StringRef const& filename, Module const* module);

  protected:
    // AssemblyAnnotationWriter interface implementations
    //

    void printInfoComment(Value const& value, llvm::formatted_raw_ostream& outstream) override;
    void emitBasicBlockStartAnnot(BasicBlock const* block, llvm::formatted_raw_ostream& outstream) override;
    void emitFunctionAnnot(Function const* function, llvm::formatted_raw_ostream& outstream) override;

  private:
    Positions         positions_;
    FunctionPositions function_positions_;
    StringRef         current_filename_{};

    InstructionLocationTable() = default;
    void registerValuePosition(Value const* value, llvm::formatted_raw_ostream& outstream);
};

using InstructionLocationTablePtr = InstructionLocationTable::InstructionLocationTablePtr;

} // namespace microsoft::quantum
