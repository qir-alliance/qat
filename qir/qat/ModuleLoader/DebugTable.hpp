#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Llvm/Llvm.hpp"

#include <memory>
#include <unordered_map>

namespace microsoft {
namespace quantum {

class DebugTable : public llvm::AssemblyAnnotationWriter
{
public:
  struct Position
  {
    // TODO(tfr): merge this with the position defined in LogCollection
    using StringRef = llvm::StringRef;
    enum
    {
      INVALID_POSITION = -1
    };

    operator bool() const
    {
      return line != INVALID_POSITION && column != INVALID_POSITION;
    }

    static Position InvalidPosition()
    {
      return {"", INVALID_POSITION, INVALID_POSITION};
    }

    StringRef filename{""};
    int64_t   line{0};
    int64_t   column{0};
  };

  using StringRef     = llvm::StringRef;
  using BasicBlock    = llvm::BasicBlock;
  using Function      = llvm::Function;
  using Value         = llvm::Value;
  using Module        = llvm::Module;
  using Positions     = std::unordered_map<Value const *, Position>;
  using DebugTablePtr = std::shared_ptr<DebugTable>;

  static DebugTablePtr create();

  void printInfoComment(Value const &value, llvm::formatted_raw_ostream &outstream) override;
  void emitBasicBlockStartAnnot(BasicBlock const            *block,
                                llvm::formatted_raw_ostream &outstream) override;
  void emitFunctionAnnot(Function const *function, llvm::formatted_raw_ostream &outstream) override;
  Position getPosition(Value const *value) const;
  void     registerModule(StringRef const &filename, Module const *module);

private:
  Positions positions_;
  StringRef current_filename_{};

  DebugTable() = default;
  void registerValuePosition(Value const *value, llvm::formatted_raw_ostream &outstream)
  {
    outstream.flush();

    Position pos;
    pos.filename = current_filename_;
    pos.line     = outstream.getLine() + 1;
    pos.column   = outstream.getColumn() + 1;

    positions_.insert(std::make_pair(value, std::move(pos)));
  }
};

using DebugTablePtr = DebugTable::DebugTablePtr;

}  // namespace quantum
}  // namespace microsoft