#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/IOperandPrototype.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class StorePattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class LoadPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class BitCastPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class IntToPtrPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class ConstIntPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class BranchPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class SelectPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class BasicBlockPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class SwitchPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

class ZExtPattern : public IOperandPrototype
{
  public:
    bool  match(Value* instr, Captures& captures) const override;
    Child copy() const override;
};

} // namespace microsoft::quantum
