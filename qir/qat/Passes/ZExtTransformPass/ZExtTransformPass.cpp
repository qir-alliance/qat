// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ZExtTransformPass/ZExtTransformPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

llvm::PreservedAnalyses ZExtTransformPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& /*fam*/)
{
    std::vector<llvm::Instruction*> to_delete;
    auto                            builder = llvm::IRBuilder<>(function.getContext());

    for (auto& block : function)
    {
        for (auto& instr : block)
        {
            auto cast_instr = llvm::dyn_cast<llvm::ZExtInst>(&instr);
            if (!cast_instr)
            {
                continue;
            }

            auto arg = instr.getOperand(0);

            auto input_type = arg->getType();
            if (!input_type->isIntegerTy(1))
            {
                continue;
            }

            auto output_type = instr.getType();

            if (!output_type->isIntegerTy())
            {
                continue;
            }

            uint64_t width      = output_type->getIntegerBitWidth();
            auto     one        = llvm::APInt(static_cast<uint32_t>(width), 1);
            auto     one_value  = llvm::ConstantInt::get(builder.getContext(), one);
            auto     zero       = llvm::APInt(static_cast<uint32_t>(width), 0);
            auto     zero_value = llvm::ConstantInt::get(builder.getContext(), zero);

            builder.SetInsertPoint(&instr);
            auto new_val = builder.CreateSelect(arg, one_value, zero_value);
            new_val->takeName(&instr);

            instr.replaceAllUsesWith(new_val);
            to_delete.push_back(&instr);
        }
    }

    if (to_delete.empty())
    {
        return llvm::PreservedAnalyses::all();
    }

    for (auto it = to_delete.rbegin(); it != to_delete.rend(); ++it)
    {
        auto ptr = *it;
        if (!ptr->use_empty())
        {
            throw std::runtime_error("Could not remove replaced instruction while transforming zext to select.\n");
        }
        else
        {
            ptr->eraseFromParent();
        }
    }

    return llvm::PreservedAnalyses::none();
}

bool ZExtTransformPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum
