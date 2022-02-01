// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "ValidationPass/ValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft {
namespace quantum {
llvm::PreservedAnalyses ValidationPass::run(llvm::Module &module,
                                            llvm::ModuleAnalysisManager & /*mam*/)
{

  for (auto &function : module)
  {
    for (auto &block : function)
    {
      for (auto &instr : block)
      {
        Location loc{};

        llvm::DebugLoc dl = instr.getDebugLoc();
        if (dl)
        {
          loc = Location{static_cast<String>(dl->getFilename()), dl->getLine(), dl->getColumn()};
        }

        auto opname = instr.getOpcodeName();
        opcode_location_[opname].push_back(loc);
        if (opcodes_.find(opname) != opcodes_.end())
        {
          ++opcodes_[opname];
        }
        else
        {
          opcodes_[opname] = 1;
        }

        auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
        if (call_instr != nullptr)
        {
          auto f = call_instr->getCalledFunction();
          if (f == nullptr)
          {
            continue;
          }

          auto name = static_cast<std::string>(f->getName());
          if (f->isDeclaration())
          {
            if (external_calls_.find(name) != external_calls_.end())
            {
              ++external_calls_[name];
            }
            else
            {
              external_calls_[name] = 1;
            }

            external_call_location_[opname].push_back(loc);
          }
          else
          {
            if (internal_calls_.find(name) != internal_calls_.end())
            {
              ++internal_calls_[name];
            }
            else
            {
              internal_calls_[name] = 1;
            }

            internal_call_location_[opname].push_back(loc);
          }
        }
      }
    }
  }

  bool raise_exception = false;
  if (config_.allowlistOpcodes())
  {
    auto const &allowed_ops = config_.allowedOpcodes();
    for (auto const &k : opcodes_)
    {
      if (allowed_ops.find(k.first) == allowed_ops.end())
      {
        // Adding debug location
        if (opcode_location_.find(k.first) != opcode_location_.end())
        {
          auto const &locs = opcode_location_[k.first];
          if (!locs.empty())
          {
            auto const &loc = locs.front();
            logger_->setLocation(loc.filename, loc.row, loc.col);
          }
        }

        // Emitting error
        logger_->error("'" + k.first + "' is not allowed for this profile.");
      }
    }
  }

  if (config_.allowlistOpcodes())
  {
    auto const &allowed_functions = config_.allowedExternalCallNames();
    for (auto const &k : external_calls_)
    {
      if (allowed_functions.find(k.first) == allowed_functions.end())
      {

        // Adding debug location
        if (external_call_location_.find(k.first) != external_call_location_.end())
        {
          auto const &locs = external_call_location_[k.first];
          if (!locs.empty())
          {
            auto const &loc = locs.front();
            logger_->setLocation(loc.filename, loc.row, loc.col);
          }
        }

        // Emitting error
        logger_->error("'" + k.first + "' is not allowed for this profile.");
      }
    }
  }

  if (!config_.allowInternalCalls() && !internal_calls_.empty())
  {
    // TODO: Add location

    // Emitting error
    logger_->error("Calls to custom defined functions not allowed.");
    raise_exception = true;
  }

  if (raise_exception)
  {
    throw std::runtime_error("QIR is not valid within the defined profile");
  }

  return llvm::PreservedAnalyses::all();
}

bool ValidationPass::isRequired()
{
  return true;
}

}  // namespace quantum
}  // namespace microsoft
