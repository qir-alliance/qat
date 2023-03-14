// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"

namespace microsoft::quantum
{
namespace
{
    using Instruction  = llvm::Instruction;
    using Value        = llvm::Value;
    using Builder      = ReplacementRule::Builder;
    using Captures     = ReplacementRule::Captures;
    using Replacements = ReplacementRule::Replacements;

} // namespace

using ReplacementRulePtr = RuleFactory::ReplacementRulePtr;
using namespace microsoft::quantum::notation;

RuleFactory::RuleFactory(
    RuleSet&             rule_set,
    AllocationManagerPtr qubit_alloc_manager,
    AllocationManagerPtr result_alloc_manager,
    ILoggerPtr           logger)
  : rule_set_{rule_set}
  , qubit_alloc_manager_{std::move(qubit_alloc_manager)}
  , result_alloc_manager_{std::move(result_alloc_manager)}
  , logger_{std::move(logger)}
{
}

void RuleFactory::usingConfiguration(TargetQisMappingPassConfiguration const& config)
{
    default_integer_width_ = config.defaultIntegerWidth();

    if (config.disableReferenceCounting())
    {
        disableReferenceCounting();
    }

    if (config.disableAliasCounting())
    {
        disableAliasCounting();
    }

    if (config.disableStringSupport())
    {
        disableStringSupport();
    }

    if (config.disableInitializeSupport())
    {
        disableInitializeSupport();
    }

    if (config.disableRecordOutputSupport())
    {
        disableRecordOutputSupport();
    }

    if (config.optimizeQuantumConstants())
    {
        optimizeConstantResult();
    }

    if (config.optimizeResultOne())
    {
        optimizeResultOne();
    }

    if (config.optimizeResultZero())
    {
        optimizeResultZero();
    }

    if (config.optimizeResultComparison())
    {
        optimizeResultComparison();
    }

    if (config.useStaticQubitArrayAllocation())
    {
        useStaticQubitArrayAllocation();
    }

    if (config.useStaticQubitAllocation())
    {
        useStaticQubitAllocation();
    }

    if (config.useStaticResultAllocation())
    {
        useStaticResultAllocation();
    }

    if (config.removeGetZeroOrOne())
    {
        removeGetZeroOrOne();
    }
}

void RuleFactory::removeFunctionCall(String const& name)
{
    addRule({callByNameOnly(name), deleteInstruction()});
}

void RuleFactory::removeGetZeroOrOne()
{
    addRule(
        {callByNameOnly("__quantum__rt__result_get_zero"), deleteUnusedInstruction()},
        RuleSet::ReplaceDirection::ReplaceBackwards);
    addRule(
        {callByNameOnly("__quantum__rt__result_get_one"), deleteUnusedInstruction()},
        RuleSet::ReplaceDirection::ReplaceBackwards);
}

void RuleFactory::resolveConstantArraySizes()
{
    // Array access replacement
    auto size_replacer = [](Builder&, Value* val, Captures& cap, Replacements& replacements)
    {
        // Get the index and testing that it is a constant int
        auto cst = llvm::dyn_cast<llvm::ConstantInt>(cap["size"]);
        if (cst == nullptr)
        {
            // ... if not, we cannot perform the mapping.
            return false;
        }

        val->replaceAllUsesWith(cst);
        replacements.push_back({llvm::dyn_cast<Instruction>(val), nullptr});

        return true;
    };

    auto create_array = call("__quantum__rt__array_create_1d", "elementSize"_cap = _, "size"_cap = _);
    auto get_size     = call("__quantum__rt__array_get_size_1d", create_array);

    addRule({std::move(get_size), size_replacer});
}

void RuleFactory::inlineCallables()
{
    auto logger = logger_;

    // Array access replacement
    auto callable_replacer = [logger](Builder&, Value* val, Captures&, Replacements&)
    {
        if (logger)
        {
            logger->setLocationFromValue(val);
            logger->internalError("Support for callable replacement is not implemented yet.");
        }
        else
        {
            throw std::runtime_error(
                "No logger present - internal error: Support for callable replacement is not implemented "
                "yet.\n");
        }

        return false;
    };

    auto create_callable = call("__quantum__rt__callable_create", "function"_cap = _, "size"_cap = _, _);
    auto invoke          = call("__quantum__rt__callable_invoke", create_callable, "args"_cap = _, "ret"_cap = _);

    addRule({std::move(invoke), callable_replacer});
}

void RuleFactory::useStaticQubitArrayAllocation()
{
    // TODO(issue-14): Use weak pointers to capture allocation managers
    auto qubit_alloc_manager = qubit_alloc_manager_;

    /// Allocation
    auto default_iw = default_integer_width_;
    auto allocation_replacer =
        [default_iw, qubit_alloc_manager](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        auto cst = llvm::dyn_cast<llvm::ConstantInt>(cap["size"]);
        if (cst == nullptr)
        {
            return false;
        }

        auto ptr_type = llvm::dyn_cast<llvm::PointerType>(val->getType());
        if (ptr_type == nullptr)
        {
            return false;
        }

        if (cst == nullptr)
        {
            return false;
        }

        auto llvm_size = cst->getValue();
        auto name      = val->getName().str();
        auto size      = llvm_size.getZExtValue();
        auto offset    = qubit_alloc_manager->allocate(name, size);

        // Creating a new index APInt that is shifted by the offset of the allocation
        auto idx = llvm::APInt(default_iw, offset);

        // Computing offset
        auto new_index = llvm::ConstantInt::get(builder.getContext(), idx);

        // Replacing the instruction with new instruction
        auto old_instr = llvm::dyn_cast<Instruction>(val);

        // Safety precaution to ensure that we are dealing with a Instruction
        if (old_instr == nullptr)
        {
            return false;
        }

        auto instr = new llvm::IntToPtrInst(new_index, ptr_type);
        instr->takeName(old_instr);

        // Ensuring that we have replaced the instruction before
        // identifying release
        old_instr->replaceAllUsesWith(instr);

        replacements.push_back({old_instr, instr});
        return true;
    };

    /// This rule is replacing the allocate qubit array instruction
    ///
    /// %leftPreshared = call %Array* @__quantum__rt__qubit_allocate_array(i64 2)
    ///
    /// by changing it to a constant pointer
    ///
    /// %leftPreshared = inttoptr i64 0 to %Array*
    ///
    /// In this way, we use the

    addRule({call("__quantum__rt__qubit_allocate_array", "size"_cap = _), allocation_replacer});

    // Array access replacement
    auto access_replacer =
        [qubit_alloc_manager](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        // Getting the type pointer
        auto ptr_type = llvm::dyn_cast<llvm::PointerType>(val->getType());
        if (ptr_type == nullptr)
        {
            return false;
        }

        // Get the index and testing that it is a constant int
        auto cst = llvm::dyn_cast<llvm::ConstantInt>(cap["index"]);
        if (cst == nullptr)
        {
            // ... if not, we cannot perform the mapping.
            return false;
        }

        // Computing the index by getting the current index value and offsetting by
        // the offset at which the qubit array is allocated.
        auto offset_cst = llvm::dyn_cast<llvm::ConstantInt>(cap["arrayName"]);
        if (offset_cst == nullptr)
        {
            return false;
        }
        auto llvm_offset = offset_cst->getValue();
        auto offset      = llvm_offset.getZExtValue();

        // Creating a new index APInt that is shifted by the offset of the allocation
        auto llvm_size = cst->getValue();
        auto idx       = llvm::APInt(llvm_size.getBitWidth(), llvm_size.getZExtValue() + offset);

        // Computing offset
        auto new_index = llvm::ConstantInt::get(builder.getContext(), idx);

        auto old_instr = llvm::dyn_cast<Instruction>(val);

        if (old_instr == nullptr)
        {
            return false;
        }

        // Converting pointer
        builder.SetInsertPoint(old_instr->getNextNode());

        auto instr = builder.CreateIntToPtr(new_index, ptr_type);
        instr->takeName(old_instr);
        old_instr->replaceAllUsesWith(instr);

        // Replacing the instruction with new instruction
        replacements.push_back({old_instr, nullptr});

        // Deleting the getelement and cast operations
        replacements.push_back({llvm::dyn_cast<Instruction>(cap["getElement"]), nullptr});
        replacements.push_back({llvm::dyn_cast<Instruction>(cap["cast"]), nullptr});

        return true;
    };

    auto get_element = call(
        "__quantum__rt__array_get_element_ptr_1d", intToPtr("arrayName"_cap = constInt()), "index"_cap = constInt());
    auto cast_pattern = bitCast("getElement"_cap = get_element);
    auto load_pattern = load("cast"_cap = cast_pattern);

    addRule({"Array Load Pattern", std::move(load_pattern), access_replacer});

    /// Release replacement
    auto deleter = deleteInstruction();

    addRule(
        {call("__quantum__rt__qubit_release_array", intToPtr("const"_cap = constInt())),
         [qubit_alloc_manager, deleter](Builder& builder, Value* val, Captures& cap, Replacements& rep)
         {
             // Recovering the qubit id
             auto cst = llvm::dyn_cast<llvm::ConstantInt>(cap["const"]);
             if (cst == nullptr)
             {
                 return false;
             }
             auto address = cst->getValue().getZExtValue();

             // Releasing
             qubit_alloc_manager->release(address);

             // Deleting instruction
             return deleter(builder, val, cap, rep);
         }});
}

void RuleFactory::useStaticQubitAllocation()
{
    auto logger              = logger_;
    auto qubit_alloc_manager = qubit_alloc_manager_;
    auto default_iw          = default_integer_width_;
    auto allocation_replacer =
        [default_iw, qubit_alloc_manager](Builder& builder, Value* val, Captures&, Replacements& replacements)
    {
        // Getting the type pointer
        auto ptr_type = llvm::dyn_cast<llvm::PointerType>(val->getType());
        if (ptr_type == nullptr)
        {
            return false;
        }

        auto qubit_name = val->getName().str();

        // Computing the index by getting the current index value and offseting by
        // the offset at which the qubit array is allocated.
        auto offset = qubit_alloc_manager->allocate(qubit_name);

        // Creating a new index APInt that is shifted by the offset of the allocation
        auto idx = llvm::APInt(default_iw, offset);

        // Computing offset
        auto new_index = llvm::ConstantInt::get(builder.getContext(), idx);

        auto instr = new llvm::IntToPtrInst(new_index, ptr_type);

        // Replacing the instruction with new instruction
        auto old_instr = llvm::dyn_cast<Instruction>(val);

        // Safety precaution to ensure that we are dealing with a Instruction
        if (old_instr == nullptr)
        {
            return false;
        }

        instr->takeName(old_instr);

        // Ensuring that we have replaced the instruction before
        // identifying release
        old_instr->replaceAllUsesWith(instr);

        replacements.push_back({old_instr, instr});

        return true;
    };

    // Dealing with qubit allocation
    addRule({call("__quantum__rt__qubit_allocate"), allocation_replacer});

    /// Release replacement
    auto deleter = deleteInstruction();

    // Handling the case where a constant integer is cast to a pointer and the pointer
    // is used in a call to qubit_release:
    //
    // %0 = inttoptr i64 0 to %Qubit*
    // call void @__quantum__rt__qubit_release(%Qubit* %0
    //
    // The case of named addresses are also covered, by this pattern:
    // %leftMessage = inttoptr i64 0 to %Qubit*
    // call void @__quantum__rt__qubit_release(%Qubit* %leftMessage)

    addRule(
        {call("__quantum__rt__qubit_release", intToPtr("const"_cap = constInt())),
         [qubit_alloc_manager, deleter](Builder& builder, Value* val, Captures& cap, Replacements& rep)
         {
             // Recovering the qubit id
             auto cst = llvm::dyn_cast<llvm::ConstantInt>(cap["const"]);
             if (cst == nullptr)
             {
                 return false;
             }
             auto address = cst->getValue().getZExtValue();

             // Releasing
             qubit_alloc_manager->release(address);

             // Deleting instruction
             return deleter(builder, val, cap, rep);
         }});

    // Handling where allocation is done by non-standard functions. In
    // this rule reports an error as we cannot reliably do a mapping.
    //
    // %leftMessage = call %Qubit* @__non_standard_allocator()
    // call void @__quantum__rt__qubit_release(%Qubit* %leftMessage)
    addRule(
        {call("__quantum__rt__qubit_release", "name"_cap = _),
         [qubit_alloc_manager, deleter, logger](Builder& builder, Value* val, Captures& cap, Replacements& rep)
         {
             // Getting the name
             auto name = cap["name"]->getName().str();

             auto* phi_node = llvm::dyn_cast<llvm::PHINode>(cap["name"]);
             if (phi_node != nullptr)
             {

                 if (logger)
                 {
                     logger->warningReleasePhiNodeQubit(val);
                 }
                 else
                 {
                     throw std::runtime_error(
                         "No logger present - Warning: Cannot release qubit arising from phi node.\n");
                 }
                 return false;
             }

             if (logger)
             {
                 logger->errorReleaseFailNonStandardAlloc(val);
             }
             else
             {
                 throw std::runtime_error(
                     "No logger present - Error: Cannot release qubit from non-standard allocation.\n");
             }

             return deleter(builder, val, cap, rep);
         }

        });
}

void RuleFactory::useStaticResultAllocation()
{
    auto result_alloc_manager = result_alloc_manager_;
    auto default_iw           = default_integer_width_;
    auto replace_measurement =
        [default_iw, result_alloc_manager](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        // Getting the type pointer
        auto ptr_type = llvm::dyn_cast<llvm::PointerType>(val->getType());
        if (ptr_type == nullptr)
        {
            return false;
        }

        // Computing the index by getting the current index value and offseting by
        // the offset at which the qubit array is allocated.
        auto offset = result_alloc_manager->allocate();

        // Creating a new index APInt that is shifted by the offset of the allocation
        auto idx = llvm::APInt(default_iw, offset);

        // Computing offset
        auto new_index = llvm::ConstantInt::get(builder.getContext(), idx);

        auto instr = new llvm::IntToPtrInst(new_index, ptr_type);

        if (instr == nullptr)
        {
            return false;
        }

        instr->takeName(val);

        auto orig_instr = llvm::dyn_cast<llvm::Instruction>(val);
        if (orig_instr == nullptr)
        {
            return false;
        }

        auto module = orig_instr->getModule();
        auto fnc    = module->getFunction("__quantum__qis__mz__body");

        std::vector<llvm::Value*> arguments;
        arguments.push_back(cap["qubit"]);
        arguments.push_back(instr);

        if (!fnc)
        {
            std::vector<llvm::Type*> types;
            types.resize(arguments.size());
            for (uint64_t i = 0; i < types.size(); ++i)
            {
                types[i] = arguments[i]->getType();
            }

            auto return_type = llvm::Type::getVoidTy(val->getContext());

            llvm::FunctionType* fnc_type = llvm::FunctionType::get(return_type, types, false);
            fnc = llvm::Function::Create(fnc_type, llvm::Function::ExternalLinkage, "__quantum__qis__mz__body", module);
        }

        // Ensuring we are inserting after the instruction being deleted
        builder.SetInsertPoint(llvm::dyn_cast<llvm::Instruction>(val)->getNextNode());

        builder.CreateCall(fnc, arguments);

        // Replacing the instruction with new instruction
        replacements.push_back({llvm::dyn_cast<Instruction>(val), instr});

        return true;
    };

    // This rules identifies result allocations through the function "__quantum__qis__m__body".
    // As an example, the following
    //
    // %result1 = call %Result* @__quantum__qis__m__body(%Qubit* %0)
    //
    // translates into
    //
    // %result1 = inttoptr i64 0 to %Result*
    // call void @__quantum__qis__mz__body(%Qubit* %0, %Result* %result1)

    addRule({call("__quantum__qis__m__body", "qubit"_cap = _), std::move(replace_measurement)});
}

void RuleFactory::optimizeResultZero()
{
    auto replace_branch_negative = [](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        auto cond = llvm::dyn_cast<llvm::Instruction>(val);
        if (cond == nullptr)
        {
            return false;
        }
        auto result = cap["result"];
        // Replacing result
        auto orig_instr = llvm::dyn_cast<llvm::Instruction>(val);
        if (orig_instr == nullptr)
        {
            return false;
        }

        auto                      module = orig_instr->getModule();
        auto                      fnc    = module->getFunction("__quantum__qis__read_result__body");
        std::vector<llvm::Value*> arguments;
        arguments.push_back(result);

        if (!fnc)
        {
            std::vector<llvm::Type*> types;
            types.resize(arguments.size());
            for (uint64_t i = 0; i < types.size(); ++i)
            {
                types[i] = arguments[i]->getType();
            }

            auto return_type = llvm::Type::getInt1Ty(val->getContext());

            llvm::FunctionType* fnc_type = llvm::FunctionType::get(return_type, types, false);
            fnc                          = llvm::Function::Create(
                                         fnc_type, llvm::Function::ExternalLinkage, "__quantum__qis__read_result__body", module);
        }

        builder.SetInsertPoint(llvm::dyn_cast<llvm::Instruction>(val));
        auto new_call = builder.CreateCall(fnc, arguments);
        auto new_cond = builder.CreateNot(new_call);
        new_cond->takeName(cond);

        for (auto& use : cond->uses())
        {
            llvm::User* user = use.getUser();
            user->setOperand(use.getOperandNo(), new_cond);
        }
        cond->replaceAllUsesWith(new_cond);

        // Deleting the previous condition and function to fetch one

        replacements.push_back({cond, nullptr});
        replacements.push_back({cap["zero"], nullptr});

        return true;
    };

    /*
      Here is an example IR for which we want to make a match:

      %1 = call %Result* @__quantum__rt__result_get_zero()
      %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
      br i1 %2, label %then0__1, label %continue__1
    */

    // Variations of get_one
    auto get_zero = call("__quantum__rt__result_get_zero");
    addRule({call("__quantum__rt__result_equal", "result"_cap = _, "zero"_cap = get_zero), replace_branch_negative});

    addRule({call("__quantum__rt__result_equal", "zero"_cap = get_zero, "result"_cap = _), replace_branch_negative});
}

void RuleFactory::optimizeResultOne()
{
    auto replace_branch_positive = [](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        auto cond = llvm::dyn_cast<llvm::Instruction>(val);
        if (cond == nullptr)
        {
            return false;
        }
        auto result = cap["result"];
        // Replacing result
        auto orig_instr = llvm::dyn_cast<llvm::Instruction>(val);
        if (orig_instr == nullptr)
        {
            return false;
        }

        auto                      module = orig_instr->getModule();
        auto                      fnc    = module->getFunction("__quantum__qis__read_result__body");
        std::vector<llvm::Value*> arguments;
        arguments.push_back(result);

        if (!fnc)
        {
            std::vector<llvm::Type*> types;
            types.resize(arguments.size());
            for (uint64_t i = 0; i < types.size(); ++i)
            {
                types[i] = arguments[i]->getType();
            }

            auto return_type = llvm::Type::getInt1Ty(val->getContext());

            llvm::FunctionType* fnc_type = llvm::FunctionType::get(return_type, types, false);
            fnc                          = llvm::Function::Create(
                                         fnc_type, llvm::Function::ExternalLinkage, "__quantum__qis__read_result__body", module);
        }

        builder.SetInsertPoint(llvm::dyn_cast<llvm::Instruction>(val));
        auto new_call = builder.CreateCall(fnc, arguments);

        new_call->takeName(cond);

        for (auto& use : cond->uses())
        {
            llvm::User* user = use.getUser();
            user->setOperand(use.getOperandNo(), new_call);
        }
        cond->replaceAllUsesWith(new_call);

        // Deleting the previous condition and function to fetch one
        replacements.push_back({cond, nullptr});
        replacements.push_back({cap["one"], nullptr});

        return true;
    };

    /*
      Here is an example IR for which we want to make a match:

      %1 = call %Result* @__quantum__rt__result_get_one()
      %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
      br i1 %2, label %then0__1, label %continue__1
    */

    // Variations of get_one
    auto get_one = call("__quantum__rt__result_get_one");
    addRule({call("__quantum__rt__result_equal", "result"_cap = _, "one"_cap = get_one), replace_branch_positive});

    addRule({call("__quantum__rt__result_equal", "one"_cap = get_one, "result"_cap = _), replace_branch_positive});
}

void RuleFactory::optimizeConstantResult()
{
    auto replace_constant_result = [](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        auto f1 = llvm::dyn_cast<llvm::CallInst>(cap["1"]);
        auto f2 = llvm::dyn_cast<llvm::CallInst>(cap["2"]);
        if (f1 == nullptr || f2 == nullptr)
        {
            return false;
        }

        auto n1 = f1->getCalledFunction()->getName();
        auto n2 = f2->getCalledFunction()->getName();

        bool value      = n1 == n2;
        auto llvm_value = llvm::APInt(1, value);

        // Computing offset
        auto new_instr = llvm::ConstantInt::get(builder.getContext(), llvm_value);

        val->replaceAllUsesWith(new_instr);

        replacements.push_back({val, nullptr});
        replacements.push_back({f1, nullptr});
        replacements.push_back({f2, nullptr});
        return true;
    };

    auto get_zero = call("__quantum__rt__result_get_zero");
    auto get_one  = call("__quantum__rt__result_get_one");

    addRule({call("__quantum__rt__result_equal", "1"_cap = get_zero, "2"_cap = get_zero), replace_constant_result});
    addRule({call("__quantum__rt__result_equal", "1"_cap = get_zero, "2"_cap = get_one), replace_constant_result});
    addRule({call("__quantum__rt__result_equal", "1"_cap = get_one, "2"_cap = get_zero), replace_constant_result});
    addRule({call("__quantum__rt__result_equal", "1"_cap = get_one, "2"_cap = get_one), replace_constant_result});
}

void RuleFactory::optimizeResultComparison()
{
    auto replace_comparison = [](Builder& builder, Value* val, Captures& cap, Replacements& replacements)
    {
        auto cond = llvm::dyn_cast<llvm::Instruction>(val);
        if (cond == nullptr)
        {
            return false;
        }
        auto m1 = cap["m1"];
        auto m2 = cap["m2"];

        if (m1 == nullptr || m2 == nullptr)
        {
            return false;
        }

        auto orig_instr = llvm::dyn_cast<llvm::Instruction>(val);
        if (orig_instr == nullptr)
        {
            return false;
        }

        auto module = orig_instr->getModule();
        auto fnc    = module->getFunction("__quantum__qis__read_result__body");

        if (!fnc)
        {
            std::vector<llvm::Type*> types;
            types.resize(1);
            types[0] = m1->getType();

            auto return_type = llvm::Type::getInt1Ty(val->getContext());

            llvm::FunctionType* fnc_type = llvm::FunctionType::get(return_type, types, false);
            fnc                          = llvm::Function::Create(
                                         fnc_type, llvm::Function::ExternalLinkage, "__quantum__qis__read_result__body", module);
        }

        builder.SetInsertPoint(llvm::dyn_cast<llvm::Instruction>(val));
        auto c1       = builder.CreateCall(fnc, {m1});
        auto c2       = builder.CreateCall(fnc, {m2});
        auto new_cond = builder.CreateICmpEQ(c1, c2);

        new_cond->takeName(cond);

        for (auto& use : cond->uses())
        {
            llvm::User* user = use.getUser();
            user->setOperand(use.getOperandNo(), new_cond);
        }

        cond->replaceAllUsesWith(new_cond);

        // Deleting the previous condition and function to fetch one

        replacements.push_back({cond, nullptr});

        return true;
    };

    /*
      Here is an example IR for which we want to make a match:

        %result1 = call %Result* @__quantum__qis__m__body(%Qubit* %q0)
        %result2 = call %Result* @__quantum__qis__m__body(%Qubit* %q1)
        %0 = call i1 @__quantum__rt__result_equal(%Result* %result1, %Result* %result2)
    */

    auto m1 = call("__quantum__qis__m__body", "q1"_cap = _);
    auto m2 = call("__quantum__qis__m__body", "q2"_cap = _);

    addRule({call("__quantum__rt__result_equal", "m1"_cap = m1, "m2"_cap = m2), replace_comparison});
}

void RuleFactory::disableReferenceCounting()
{
    removeFunctionCall("__quantum__rt__array_update_reference_count");
    removeFunctionCall("__quantum__rt__string_update_reference_count");
    removeFunctionCall("__quantum__rt__result_update_reference_count");
}

void RuleFactory::disableAliasCounting()
{
    removeFunctionCall("__quantum__rt__array_update_alias_count");
    removeFunctionCall("__quantum__rt__string_update_alias_count");
    removeFunctionCall("__quantum__rt__result_update_alias_count");
}

void RuleFactory::disableStringSupport()
{
    removeFunctionCall("__quantum__rt__fail");
    removeFunctionCall("__quantum__rt__message");
    removeFunctionCall("__quantum__rt__string_update_alias_count");

    removeFunctionCall("__quantum__rt__string_create");
    removeFunctionCall("__quantum__rt__string_get_data");
    removeFunctionCall("__quantum__rt__string_get_length");
    removeFunctionCall("__quantum__rt__string_update_reference_count");
    removeFunctionCall("__quantum__rt__string_concatenate");
    removeFunctionCall("__quantum__rt__string_equal");

    removeFunctionCall("__quantum__rt__int_to_string");
    removeFunctionCall("__quantum__rt__double_to_string");
    removeFunctionCall("__quantum__rt__bool_to_string");
    removeFunctionCall("__quantum__rt__result_to_string");
    removeFunctionCall("__quantum__rt__pauli_to_string");
    removeFunctionCall("__quantum__rt__qubit_to_string");
    removeFunctionCall("__quantum__rt__range_to_string");
    removeFunctionCall("__quantum__rt__bigint_to_string");
}

void RuleFactory::disableInitializeSupport()
{
    removeFunctionCall("__quantum__rt__initialize");
}

void RuleFactory::disableRecordOutputSupport()
{
    removeFunctionCall("__quantum__rt__result_record_output");
    removeFunctionCall("__quantum__rt__bool_record_output");
    removeFunctionCall("__quantum__rt__integer_record_output");
    removeFunctionCall("__quantum__rt__double_record_output");
    removeFunctionCall("__quantum__rt__tuple_start_record_output");
    removeFunctionCall("__quantum__rt__tuple_end_record_output");
    removeFunctionCall("__quantum__rt__array_start_record_output");
    removeFunctionCall("__quantum__rt__array_end_record_output");
}

ReplacementRulePtr RuleFactory::addRule(ReplacementRule&& rule, RuleSet::ReplaceDirection const& dir)
{
    auto ret = std::make_shared<ReplacementRule>(std::move(rule));

    rule_set_.addRule(ret, dir);

    return ret;
}

void RuleFactory::setDefaultIntegerWidth(uint32_t v)
{
    default_integer_width_ = v;
}

} // namespace microsoft::quantum
