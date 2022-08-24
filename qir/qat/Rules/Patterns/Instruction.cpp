// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Patterns/Instruction.hpp"

#include "qir/qat/Rules/IOperandPrototype.hpp"

namespace microsoft::quantum
{

bool StorePattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::StoreInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

StorePattern::Child StorePattern::copy() const
{
    auto ret = std::make_shared<StorePattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool LoadPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::LoadInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

LoadPattern::Child LoadPattern::copy() const
{
    auto ret = std::make_shared<LoadPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool BitCastPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::BitCastInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

BitCastPattern::Child BitCastPattern::copy() const
{
    auto ret = std::make_shared<BitCastPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool IntToPtrPattern::match(Value* instr, Captures& captures) const
{
    auto* a = llvm::dyn_cast<llvm::IntToPtrInst>(instr);
    auto* b = llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(instr);

    if (a == nullptr && b == nullptr)
    {
        return fail(instr, captures);
    }

    auto ret = success(instr, captures);
    return ret;
}

IntToPtrPattern::Child IntToPtrPattern::copy() const
{
    auto ret = std::make_shared<IntToPtrPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool ConstIntPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::ConstantInt>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

ConstIntPattern::Child ConstIntPattern::copy() const
{
    auto ret = std::make_shared<ConstIntPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool BranchPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::BranchInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

BranchPattern::Child BranchPattern::copy() const
{
    auto ret = std::make_shared<BranchPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool SelectPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::SelectInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

SelectPattern::Child SelectPattern::copy() const
{
    auto ret = std::make_shared<SelectPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool BasicBlockPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::BasicBlock>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

BasicBlockPattern::Child BasicBlockPattern::copy() const
{
    auto ret = std::make_shared<BasicBlockPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool SwitchPattern::match(Value* instr, Captures& captures) const
{
    auto* load_instr = llvm::dyn_cast<llvm::SwitchInst>(instr);
    if (load_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

SwitchPattern::Child SwitchPattern::copy() const
{
    auto ret = std::make_shared<SwitchPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

bool ZExtPattern::match(Value* instr, Captures& captures) const
{
    auto* cast_instr = llvm::dyn_cast<llvm::ZExtInst>(instr);
    if (cast_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

ZExtPattern::Child ZExtPattern::copy() const
{
    auto ret = std::make_shared<ZExtPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

} // namespace microsoft::quantum
