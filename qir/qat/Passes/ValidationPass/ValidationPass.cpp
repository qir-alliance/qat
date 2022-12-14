// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ValidationPass/ValidationPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

ValidationPass::ValidationPass(
    TargetProfileConfiguration const& profile,
    TargetQisConfiguration const&     qis,
    ILoggerPtr const&                 logger)
  : profile_config_{profile}
  , qis_config_{qis}
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
        llvm::Type* element_type = op->getType()->getPointerElementType();
        while (pointer_type == llvm::dyn_cast<llvm::PointerType>(element_type))
        {
            element_type = op->getType()->getPointerElementType();
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
    if (profile_config_.allowlistOpcodes())
    {

        auto const& allowed_ops = profile_config_.allowedOpcodes();

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
                    llvm::raw_string_ostream rso(current_location_.llvmHint());
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
                        case llvm::CmpInst::Predicate::BAD_FCMP_PREDICATE:
                            first_arg = "badfcmp";
                            break;
                        case llvm::CmpInst::Predicate::BAD_ICMP_PREDICATE:
                            first_arg = "badicmp";
                            break;
                        }
                    }

                    if (!first_arg.empty())
                    {
                        code += " " + first_arg;
                    }

                    OpcodeValue opcode1{opname};
                    OpcodeValue opcode2{opname, first_arg};

                    if (allowed_ops.data().find(opcode1) == allowed_ops.data().end() &&
                        allowed_ops.data().find(opcode2) == allowed_ops.data().end())
                    {

                        logger_->setLocation(
                            {current_location_.name(), current_location_.line(), current_location_.column()});
                        logger_->setLlvmHint(current_location_.llvmHint());

                        logger_->errorOpcodeNotAllowed(code, profile_config_.targetName());
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
    if (!profile_config_.allowInternalCalls() && !internal_calls_.empty())
    {
        logger_->setLlvmHint("");
        // TODO(issue-60): Add location

        // Emitting error
        logger_->errorCustomFunctionsNotAllowed();

        return false;
    }

    return true;
}

bool ValidationPass::satisfyingExternalCallRequirements()
{
    auto ret = true;

    if (profile_config_.allowlistExternalCalls())
    {
        auto const& allowed_functions = profile_config_.allowedExternalCallNames();
        auto const& allowed_qis       = qis_config_.allowedQis();

        for (auto const& k : external_calls_)
        {
            if (allowed_functions.find(k.first) == allowed_functions.end() &&
                allowed_qis.find(k.first) == allowed_qis.end() &&
                !(k.first.rfind("__quantum__qis__", 0) == 0 && qis_config_.allowAnyQis()))
            {
                logger_->setLlvmHint("");

                // Adding debug location
                if (external_call_location_.find(k.first) != external_call_location_.end())
                {
                    auto const& locs = external_call_location_[k.first];

                    if (!locs.empty())
                    {
                        auto const& loc = locs.front();
                        logger_->setLocation({loc.name(), loc.line(), loc.column()});
                        logger_->setLlvmHint(loc.llvmHint());
                    }
                }

                // Emitting error
                logger_->errorExternalCallsNotAllowed(k.first, profile_config_.targetName());
                ret = false;
            }
        }
    }

    return ret;
}

bool ValidationPass::satisfyingPointerRequirements()
{
    auto ret = true;

    if (profile_config_.allowlistPointerTypes())
    {
        auto const& allowed = profile_config_.allowedPointerTypes();
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
                        logger_->setLocation({loc.name(), loc.line(), loc.column()});
                        logger_->setLlvmHint(loc.llvmHint());
                    }
                }

                // Emitting error
                logger_->errorTypeNotAllowed(k.first, profile_config_.targetName());
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
                llvm::raw_string_ostream rso(current_location_.llvmHint());
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
        throw std::runtime_error("QIR is not valid within the defined adaptor");
    }

    return llvm::PreservedAnalyses::all();
}

bool ValidationPass::isRequired()
{
    return true;
}

} // namespace microsoft::quantum
