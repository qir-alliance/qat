// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "ModuleLoader/DebugTable.hpp"

#include "Llvm/Llvm.hpp"

#include <memory>

namespace microsoft {
namespace quantum {

DebugTable::DebugTablePtr DebugTable::create()
{
  DebugTablePtr ret;
  ret.reset(new DebugTable());
  return ret;
}

void DebugTable::printInfoComment(Value const &value, llvm::formatted_raw_ostream &outstream)
{
  registerValuePosition(&value, outstream);
}

void DebugTable::emitBasicBlockStartAnnot(BasicBlock const            *block,
                                          llvm::formatted_raw_ostream &outstream)
{
  registerValuePosition(block, outstream);
}

void DebugTable::emitFunctionAnnot(Function const *function, llvm::formatted_raw_ostream &outstream)
{
  registerValuePosition(function, outstream);
}

DebugTable::Position DebugTable::getPosition(Value const *value) const
{
  auto it = positions_.find(value);
  if (it != positions_.end())
  {
    return it->second;
  }

  return Position::InvalidPosition();
}

void DebugTable::registerModule(StringRef const &filename, Module const *module)
{
  current_filename_ = filename;
  llvm::raw_null_ostream dummy{};
  module->print(dummy, this);
}

}  // namespace quantum
}  // namespace microsoft