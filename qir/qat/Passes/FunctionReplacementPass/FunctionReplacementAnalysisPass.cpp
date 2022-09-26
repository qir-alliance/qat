// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{
llvm::AnalysisKey FunctionReplacementAnalysisPass::Key;

FunctionReplacementAnalysisPass::Result FunctionReplacementAnalysisPass::run(
    llvm::Module& module,
    llvm::ModuleAnalysisManager& /*mam*/)
{
    FunctionRegister ret;

    // Registering all functions
    for (auto& function : module)
    {
        ret.name_to_function_pointer[static_cast<String>(function.getName())] = &function;
    }

    // Registering replacements
    for (auto& function : module)
    {
        /*
        if (function.isDeclaration())
        {
            continue;
        }
        */

        if (function.hasFnAttribute("replaceWith"))
        {

            auto attr = function.getFnAttribute("replaceWith");
            if (!attr.isStringAttribute())
            {
                if (logger_)
                {
                    logger_->errorExpectedStringValueForAttr(
                        static_cast<String>(function.getName()), static_cast<String>(attr.getKindAsString()));
                }
                else
                {
                    throw std::runtime_error("Expected string attribute for attribute 'replaceWith'");
                }
            }

            auto name = static_cast<String>(attr.getValueAsString());
            auto it   = ret.name_to_function_pointer.find(name);

            // Ignoring replacements that were not found
            if (it == ret.name_to_function_pointer.end())
            {
                if (logger_)
                {
                    logger_->warningWeakLinkReplacementNotPossible(static_cast<String>(function.getName()), name);
                }
                continue;
            }

            // Checking function signature
            String                   signature1;
            llvm::raw_string_ostream ostream1(signature1);
            ostream1 << *function.getFunctionType();

            String                   signature2;
            llvm::raw_string_ostream ostream2(signature2);
            ostream2 << *it->second->getFunctionType();

            if (signature1 != signature2)
            {
                if (logger_)
                {
                    logger_->errorReplacementSignatureMismatch(
                        static_cast<String>(function.getName()), signature1, signature2);
                }
                else
                {
                    throw std::runtime_error("Expected string attribute for attribute 'replaceWith'");
                }
            }

            // Registering replacement
            ret.functions_to_replace[&function] = it->second;
        }
    }

    for (auto& function : module)
    {
        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                auto call_instr = llvm::dyn_cast<llvm::CallInst>(&instr);
                if (call_instr == nullptr)
                {
                    continue;
                }

                auto function_ptr = call_instr->getCalledFunction();
                auto it           = ret.functions_to_replace.find(function_ptr);

                if (function_ptr == nullptr || it == ret.functions_to_replace.end())
                {
                    continue;
                }

                ret.calls_to_replace.push_back(call_instr);
            }
        }
    }

    return ret;
}

bool FunctionReplacementAnalysisPass::isRequired()
{
    return true;
}

llvm::PreservedAnalyses FunctionReplacementAnalysisPassPrinter::run(
    llvm::Module&                module,
    llvm::ModuleAnalysisManager& mam)
{
    auto& result = mam.getResult<FunctionReplacementAnalysisPass>(module);
    llvm::errs() << "============================== REPORT ==============================\n";
    llvm::errs() << "Functions:\n";
    for (auto& p : result.name_to_function_pointer)
    {
        llvm::errs() << "Found function " << p.first << "\n";
    }

    llvm::errs() << "\nFunctions to replace:\n";
    for (auto& p : result.functions_to_replace)
    {
        llvm::errs() << p.first->getName() << " -> " << p.second->getName() << "\n";
    }

    llvm::errs() << "\nCalls to replacable functions:\n";
    for (auto& p : result.calls_to_replace)
    {
        llvm::errs() << *p << "\n";
    }
    llvm::errs() << "============================ END REPORT ============================\n";

    return llvm::PreservedAnalyses::all();
}

} // namespace microsoft::quantum
