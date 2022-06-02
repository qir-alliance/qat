// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "ValidationPass/ValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    ValidationPass::ValidationPass(ValidationPassConfiguration const& cfg, ILoggerPtr const& logger)
      : config_{cfg}
      , logger_{logger}
    {
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

            String                   signature;
            llvm::raw_string_ostream ostream(signature);
            ostream << f->getName() << ":";
            ostream << *f->getFunctionType();

            if (f->isDeclaration())
            {
                if (external_calls_.find(signature) != external_calls_.end())
                {
                    ++external_calls_[signature];
                }
                else
                {
                    external_calls_[signature] = 1;
                }

                external_call_location_[signature].push_back(current_location_);
            }
            else
            {
                if (internal_calls_.find(signature) != internal_calls_.end())
                {
                    ++internal_calls_[signature];
                }
                else
                {
                    internal_calls_[signature] = 1;
                }

                internal_call_location_[signature].push_back(current_location_);
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

    bool ValidationPass::satisfyingOpcodeRequirements(llvm::Module& module)
    {
        auto ret = true;
        if (config_.allowlistOpcodes())
        {

            auto const& allowed_ops = config_.allowedOpcodes();

            for (auto& function : module)
            {
                for (auto& block : function)
                {
                    for (auto& instr : block)
                    {
                        auto loc          = logger_->resolveLocation(&instr);
                        current_location_ = Location{loc};
                        llvm::DebugLoc dl = instr.getDebugLoc();
                        if (dl)
                        {
                            current_location_ = Location{
                                static_cast<String>(dl->getFilename()), dl->getLine(), dl->getColumn(), "", ""};
                        }
                        llvm::raw_string_ostream rso(current_location_.llvm_hint);
                        instr.print(rso);

                        String opname = static_cast<String>(instr.getOpcodeName());
                        String first_arg{""};
                        String code = opname;

                        auto cmp = llvm::dyn_cast<llvm::CmpInst>(&instr);
                        if (cmp)
                        {
                            switch (cmp->getPredicate())
                            {
                            case llvm::CmpInst::Predicate::FCMP_FALSE:
                                first_arg = "false";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_OEQ:
                                first_arg = "oeq";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_OGT:
                                first_arg = "ogt";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_OGE:
                                first_arg = "oge";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_OLT:
                                first_arg = "olt";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_OLE:
                                first_arg = "ole";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_ONE:
                                first_arg = "one";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_ORD:
                                first_arg = "ord";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_UNO:
                                first_arg = "uno";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_UEQ:
                                first_arg = "ueq";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_UGT:
                                first_arg = "ugt";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_UGE:
                                first_arg = "uge";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_ULT:
                                first_arg = "ult";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_ULE:
                                first_arg = "ule";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_UNE:
                                first_arg = "une";
                                break;
                            case llvm::CmpInst::Predicate::FCMP_TRUE:
                                first_arg = "true";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_EQ:
                                first_arg = "eq";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_NE:
                                first_arg = "ne";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_UGT:
                                first_arg = "ugt";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_UGE:
                                first_arg = "uge";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_ULT:
                                first_arg = "ult";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_ULE:
                                first_arg = "ule";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_SGT:
                                first_arg = "sgt";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_SGE:
                                first_arg = "sge";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_SLT:
                                first_arg = "slt";
                                break;
                            case llvm::CmpInst::Predicate::ICMP_SLE:
                                first_arg = "sle";
                                break;
                            }
                        }

                        if (!first_arg.empty())
                        {
                            code += " " + first_arg;
                        }

                        OpcodeValue opcode1{opname};
                        OpcodeValue opcode2{opname, first_arg};

                        if (allowed_ops.find(opcode1) == allowed_ops.end() &&
                            allowed_ops.find(opcode2) == allowed_ops.end())
                        {

                            logger_->setLocation(
                                {current_location_.name, current_location_.line, current_location_.column});
                            logger_->setLlvmHint(current_location_.llvm_hint);

                            logger_->error(
                                "Opcode '" + code + "' is not allowed for this profile (" + config_.profileName() +
                                ").");
                            ret = false;
                        }
                    }
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
                            logger_->setLocation({loc.name, loc.line, loc.column});
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
                            logger_->setLocation({loc.name, loc.line, loc.column});
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
                    auto loc          = logger_->resolveLocation(&instr);
                    current_location_ = Location{loc};
                    llvm::DebugLoc dl = instr.getDebugLoc();
                    if (dl)
                    {
                        current_location_ =
                            Location{static_cast<String>(dl->getFilename()), dl->getLine(), dl->getColumn(), "", ""};
                    }
                    llvm::raw_string_ostream rso(current_location_.llvm_hint);
                    instr.print(rso);

                    callChecks(instr);
                    pointerChecks(instr);
                }
            }
        }

        bool raise_exception = false;

        raise_exception |= !satisfyingOpcodeRequirements(module);
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
