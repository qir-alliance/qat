// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/ModuleLoader/InstructionLocationTable.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <memory>

namespace microsoft::quantum
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

void InstructionLocationTable::emitBasicBlockStartAnnot(BasicBlock const* block, llvm::formatted_raw_ostream& outstream)
{
    registerValuePosition(block, outstream);
}

void InstructionLocationTable::emitFunctionAnnot(Function const* function, llvm::formatted_raw_ostream& outstream)
{
    outstream.flush();

    Position pos;
    pos.setName(static_cast<String>(current_filename_));
    pos.setLine(outstream.getLine() + 1);
    pos.setColumn(outstream.getColumn() + 1);

    positions_.insert(std::make_pair(function, pos));
    function_positions_[static_cast<String>(function->getName())] = pos;
}

InstructionLocationTable::Position InstructionLocationTable::getPosition(Value const* value) const
{
    auto it = positions_.find(value);
    if (it != positions_.end())
    {
        return it->second;
    }

    return Position::invalidPosition();
}

InstructionLocationTable::Position InstructionLocationTable::getPositionFromFunctionName(String const& name) const
{
    auto it = function_positions_.find(name);
    if (it != function_positions_.end())
    {
        return it->second;
    }

    return Position::invalidPosition();
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
    pos.setName(static_cast<String>(current_filename_));
    pos.setLine(outstream.getLine() + 1);
    pos.setColumn(outstream.getColumn() + 1);

    positions_.insert(std::make_pair(value, pos));
}

} // namespace microsoft::quantum
