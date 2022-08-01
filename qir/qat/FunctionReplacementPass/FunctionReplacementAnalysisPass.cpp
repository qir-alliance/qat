// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum {
llvm::AnalysisKey FunctionReplacementAnalysisPass::Key;

FunctionReplacementAnalysisPass::Result FunctionReplacementAnalysisPass::run(
    llvm::Module &module, llvm::ModuleAnalysisManager & /*mam*/)
{
  FunctionRegister ret;

  // Registering all functions
  for(auto &function: module)
  {
    /*
    if(function.isDeclaration())
    {
      continue;
    }
    */

    ret.name_to_function_pointer[static_cast<String>(function.getName())] = &function;
  }

  // Registering replacements
  for(auto &function: module)
  {
    if(function.isDeclaration())
    {
      continue;
    }

    if(function.hasFnAttribute("replaceWith"))
    {
      llvm::errs() << "Found replace with ---\n";
      auto attr = function.getFnAttribute("replaceWith");
      if(!attr.isStringAttribute())
      {
        // TODO: Use logger
        throw std::runtime_error("Expected string attribute");
      }

      auto name = static_cast<String>(attr.getValueAsString());
      auto it = ret.name_to_function_pointer.find(name);

      // Ignoring replacements that were not found
      if(it == ret.name_to_function_pointer.end())
      {
        llvm::errs() << name << " not found\n";
        continue;
      }

      // Checking function signature
      // TODO:

      ret.functions_to_replace[&function] = it->second;
    }
  }


  for(auto &function: module)
  {
    for(auto& block: function)
    {
      for(auto &instr: block)
      {
         auto call_instr = llvm::dyn_cast<llvm::CallInst>(&instr);
         if(call_instr == nullptr)
         {
            continue;
         }

         auto function = call_instr->getCalledFunction ();
         auto it = ret.functions_to_replace.find(function);

         if(function == nullptr || it == ret.functions_to_replace.end())
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
    llvm::Module &module, llvm::ModuleAnalysisManager &mam)
{
  auto &result = mam.getResult<FunctionReplacementAnalysisPass>(module);
  llvm::errs() << "============================== REPORT ==============================\n";
  llvm::errs() << "Functions:\n";
  for(auto &p: result.name_to_function_pointer)
  {
    llvm::errs() << "Found function " << p.first << "\n";
  }

  llvm::errs() << "\nFunctions to replace:\n";
  for(auto &p: result.functions_to_replace)
  {
    llvm::errs() <<  p.first->getName() << " -> " <<   p.second->getName() << "\n";
  }

  llvm::errs() << "\nCalls to replacable functions:\n";
  for(auto &p: result.calls_to_replace)
  {
    llvm::errs() << *p <<"\n";
  }
  llvm::errs() << "============================ END REPORT ============================\n";


  return llvm::PreservedAnalyses::all();
}

}  // namespace microsoft::quantum
