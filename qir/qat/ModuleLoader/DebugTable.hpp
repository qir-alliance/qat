#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/SourceLocation.hpp"

#include "Llvm/Llvm.hpp"

#include <memory>
#include <unordered_map>

namespace microsoft
{
namespace quantum
{

    class DebugTable : public llvm::AssemblyAnnotationWriter
    {
      public:
        using Position = SourceLocation;

        using StringRef     = llvm::StringRef;
        using BasicBlock    = llvm::BasicBlock;
        using Function      = llvm::Function;
        using Value         = llvm::Value;
        using Module        = llvm::Module;
        using Positions     = std::unordered_map<Value const*, Position>;
        using DebugTablePtr = std::shared_ptr<DebugTable>;

        /// Pointer constructor for the debug table.
        static DebugTablePtr create();

        // Debug table interface
        //

        /// Gets the position of a LLVM value.
        Position getPosition(Value const* value) const;

        /// Registers a module in debug table.
        void registerModule(StringRef const& filename, Module const* module);

      protected:
        // AssemblyAnnotationWriter interface implementations
        //

        void printInfoComment(Value const& value, llvm::formatted_raw_ostream& outstream) override;
        void emitBasicBlockStartAnnot(BasicBlock const* block, llvm::formatted_raw_ostream& outstream) override;
        void emitFunctionAnnot(Function const* function, llvm::formatted_raw_ostream& outstream) override;

      private:
        Positions positions_;
        StringRef current_filename_{};

        DebugTable() = default;
        void registerValuePosition(Value const* value, llvm::formatted_raw_ostream& outstream)
        {
            outstream.flush();

            Position pos;
            pos.name   = current_filename_;
            pos.line   = outstream.getLine() + 1;
            pos.column = outstream.getColumn() + 1;

            positions_.insert(std::make_pair(value, std::move(pos)));
        }
    };

    using DebugTablePtr = DebugTable::DebugTablePtr;

} // namespace quantum
} // namespace microsoft