// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "ValidationPass/ValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{
    void ValidationPass::opcodeChecks(Instruction& instr)
    {
        auto opname = instr.getOpcodeName();
        opcode_location_[opname].push_back(current_location_);
        if (opcodes_.find(opname) != opcodes_.end())
        {
            ++opcodes_[opname];
        }
        else
        {
            opcodes_[opname] = 1;
        }
    }

    void ValidationPass::callChecks(Instruction& instr)
    {
        auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
        if (call_instr != nullptr)
        {
            auto f = call_instr->getCalledFunction();

            if (f == nullptr)
            {
                return;
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

                external_call_location_[name].push_back(current_location_);
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

                internal_call_location_[name].push_back(current_location_);
            }
        }
    }

    void ValidationPass::pointerChecks(Instruction& instr)
    {
        for (auto& op : instr.operands())
        {
            // Skipping function pointers
            auto function_pointer = llvm::dyn_cast<llvm::Function>(op);
            if (function_pointer)
            {
                continue;
            }

            // Skipping non-pointer types
            auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
            if (!pointer_type)
            {
                continue;
            }

            uint64_t    n            = 1;
            llvm::Type* element_type = pointer_type->getElementType();
            while (pointer_type = llvm::dyn_cast<llvm::PointerType>(element_type))
            {
                element_type = pointer_type->getElementType();
                ++n;
            }

            String name{};

            if (element_type->isStructTy())
            {
                name = static_cast<String>(element_type->getStructName());
            }
            else
            {
                llvm::raw_string_ostream rso(name);
                element_type->print(rso);
            }

            // Adding indirection to the name
            while (n != 0)
            {
                name += "*";
                --n;
            }

            auto it = pointers_.find(name);
            if (it == pointers_.end())
            {
                pointers_[name] = 1;
            }
            else
            {
                ++it->second;
            }

            pointer_location_[name].push_back(current_location_);
        }
    }

    bool ValidationPass::satisfyingOpcodeRequirements()
    {
        auto ret = true;
        if (config_.allowlistOpcodes())
        {
            auto const& allowed_ops = config_.allowedOpcodes();
            for (auto const& k : opcodes_)
            {
                if (allowed_ops.find(k.first) == allowed_ops.end())
                {
                    logger_->setLlvmHint("");

                    // Adding debug location
                    if (opcode_location_.find(k.first) != opcode_location_.end())
                    {
                        auto const& locs = opcode_location_[k.first];
                        if (!locs.empty())
                        {
                            auto const& loc = locs.front();
                            logger_->setLocation(loc.filename, loc.row, loc.col);
                            logger_->setLlvmHint(loc.llvm_hint);
                        }
                    }

                    // Emitting error
                    logger_->error(
                        "Opcode '" + k.first + "' is not allowed for this profile (" + config_.profileName() + ").");

                    ret = false;
                }
            }
        }

        return ret;
    }

    bool ValidationPass::satisfyingInternalCallRequirements()
    {
        if (!config_.allowInternalCalls() && !internal_calls_.empty())
        {
            logger_->setLlvmHint("");
            // TODO(issue-60): Add location

            // Emitting error
            logger_->error("Calls to custom defined functions not allowed.");

            return false;
        }

        return true;
    }

    bool ValidationPass::satisfyingExternalCallRequirements()
    {
        auto ret = true;

        if (config_.allowlistExternalCalls())
        {
            auto const& allowed_functions = config_.allowedExternalCallNames();
            for (auto const& k : external_calls_)
            {
                if (allowed_functions.find(k.first) == allowed_functions.end())
                {
                    logger_->setLlvmHint("");

                    // Adding debug location
                    if (external_call_location_.find(k.first) != external_call_location_.end())
                    {
                        auto const& locs = external_call_location_[k.first];

                        if (!locs.empty())
                        {
                            auto const& loc = locs.front();
                            logger_->setLocation(loc.filename, loc.row, loc.col);
                            logger_->setLlvmHint(loc.llvm_hint);
                        }
                    }

                    // Emitting error
                    logger_->error(
                        "External call '" + k.first + "' is not allowed for this profile (" + config_.profileName() +
                        ").");
                    ret = false;
                }
            }
        }

        return ret;
    }

    bool ValidationPass::satisfyingPointerRequirements()
    {
        auto ret = true;

        if (config_.allowlistPointerTypes())
        {
            auto const& allowed = config_.allowedPointerTypes();
            for (auto const& k : pointers_)
            {
                if (allowed.find(k.first) == allowed.end())
                {
                    logger_->setLlvmHint("");

                    // Adding debug location
                    if (pointer_location_.find(k.first) != pointer_location_.end())
                    {
                        auto const& locs = pointer_location_[k.first];
                        if (!locs.empty())
                        {
                            auto const& loc = locs.front();
                            logger_->setLocation(loc.filename, loc.row, loc.col);
                            logger_->setLlvmHint(loc.llvm_hint);
                        }
                    }

                    // Emitting error
                    logger_->error(
                        "Type '" + k.first + "' is not allowed for this profile (" + config_.profileName() + ").");
                    ret = false;
                }
            }
        }

        return ret;
    }

    llvm::PreservedAnalyses ValidationPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
    {
        for (auto& function : module)
        {
            for (auto& block : function)
            {
                for (auto& instr : block)
                {
                    current_location_ = Location{};
                    llvm::DebugLoc dl = instr.getDebugLoc();
                    if (dl)
                    {
                        current_location_ =
                            Location{static_cast<String>(dl->getFilename()), dl->getLine(), dl->getColumn(), ""};
                    }
                    llvm::raw_string_ostream rso(current_location_.llvm_hint);
                    instr.print(rso);

                    opcodeChecks(instr);
                    callChecks(instr);
                    pointerChecks(instr);
                }
            }
        }

        bool raise_exception = false;

        raise_exception |= !satisfyingOpcodeRequirements();
        raise_exception |= !satisfyingExternalCallRequirements();
        raise_exception |= !satisfyingInternalCallRequirements();
        raise_exception |= !satisfyingPointerRequirements();

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

} // namespace quantum
} // namespace microsoft
