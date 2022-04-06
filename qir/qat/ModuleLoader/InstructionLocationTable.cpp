// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "ModuleLoader/InstructionLocationTable.hpp"

#include "Llvm/Llvm.hpp"

#include <memory>

namespace microsoft
{
namespace quantum
{

    InstructionLocationTable::InstructionLocationTablePtr InstructionLocationTable::create()
    {
        InstructionLocationTablePtr ret;
        ret.reset(new InstructionLocationTable());
        return ret;
    }
    void InstructionLocationTable::printInfoComment(Value const& value, llvm::formatted_raw_ostream& outstream)
    {
        registerValuePosition(&value, outstream);
    }

    void InstructionLocationTable::emitBasicBlockStartAnnot(
        BasicBlock const*            block,
        llvm::formatted_raw_ostream& outstream)
    {
        registerValuePosition(block, outstream);
    }

    void InstructionLocationTable::emitFunctionAnnot(Function const* function, llvm::formatted_raw_ostream& outstream)
    {
        registerValuePosition(function, outstream);
    }

    InstructionLocationTable::Position InstructionLocationTable::getPosition(Value const* value) const
    {
        auto it = positions_.find(value);
        if (it != positions_.end())
        {
            return it->second;
        }

        return Position::InvalidPosition();
    }

    void InstructionLocationTable::registerModule(StringRef const& filename, Module const* module)
    {
        current_filename_ = filename;

        // Using a null output stream to traverse the DAG and keep track of the position of the cursor.
        // The cursor position is subsequently recorded as instructions are registered.
        llvm::raw_null_ostream dummy{};
        module->print(dummy, this);
    }

    void InstructionLocationTable::registerValuePosition(Value const* value, llvm::formatted_raw_ostream& outstream)
    {
        outstream.flush();

        Position pos;
        pos.name   = static_cast<String>(current_filename_);
        pos.line   = outstream.getLine() + 1;
        pos.column = outstream.getColumn() + 1;

        positions_.insert(std::make_pair(value, pos));
    }

} // namespace quantum
} // namespace microsoft