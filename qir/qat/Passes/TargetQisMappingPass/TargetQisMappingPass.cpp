// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

TargetQisMappingPass::TargetQisMappingPass(RuleSet&& rule_set, TargetQisMappingPassConfiguration const& config)
  : rule_set_{std::move(rule_set)}
  , config_{config}
{
}

void TargetQisMappingPass::setupCopyAndExpand()
{
    using namespace microsoft::quantum::notation;
    addConstExprRule(
        {branch("cond"_cap = constInt(), "if_false"_cap = _, "if_true"_cap = _),
         [](Builder& builder, Value* val, Captures& captures, Replacements& replacements)
         {
             auto cst   = llvm::dyn_cast<llvm::ConstantInt>(captures["cond"]);
             auto instr = llvm::dyn_cast<llvm::Instruction>(val);

             if (cst == nullptr || instr == nullptr)
             {
                 return false;
             }

             auto type = instr->getType();
             if (type == nullptr)
             {
                 return false;
             }

             auto branch_cond = cst->getValue().getZExtValue();

             if (branch_cond)
             {
                 auto if_true = llvm::dyn_cast<llvm::BasicBlock>(captures["if_true"]);

                 builder.CreateBr(if_true);
                 instr->replaceAllUsesWith(llvm::UndefValue::get(type));
             }
             else
             {
                 auto if_false = llvm::dyn_cast<llvm::BasicBlock>(captures["if_false"]);

                 builder.CreateBr(if_false);
                 instr->replaceAllUsesWith(llvm::UndefValue::get(type));
             }

             replacements.push_back({val, nullptr});

             return true;
         }});

    if (config_.assumeNoExceptions())
    {
        // Replacing all invokes with calls
        addConstExprRule(
            {unnamedInvoke(), [](Builder& builder, Value* val, Captures&, Replacements& replacements)
             {
                 auto invoke = llvm::dyn_cast<llvm::InvokeInst>(val);
                 if (invoke == nullptr)
                 {
                     return false;
                 }

                 auto callee_function = invoke->getCalledFunction();

                 // List with new call arguments
                 std::vector<llvm::Value*> new_arguments;
                 for (unsigned i = 0; i < invoke->arg_size(); ++i)
                 {
                     // Getting the i'th argument
                     llvm::Value* arg = invoke->getArgOperand(i);

                     new_arguments.push_back(arg);
                 }

                 // Creating a new call
                 auto* new_call = builder.CreateCall(callee_function, new_arguments);
                 builder.CreateBr(invoke->getNormalDest());

                 new_call->takeName(invoke);

                 // Replace all calls to old function with calls to new function
                 invoke->replaceAllUsesWith(new_call);
                 replacements.push_back({invoke, nullptr});
                 return true;
             }});
    }
}

void TargetQisMappingPass::addConstExprRule(ReplacementRule&& rule)
{
    auto ret = std::make_shared<ReplacementRule>(std::move(rule));

    const_expr_replacements_.addRule(ret);
}

void TargetQisMappingPass::constantFoldFunction(llvm::Function& fnc)
{
    std::vector<llvm::Instruction*> to_delete;

    // Folding all constants
    for (auto& basic_block : fnc)
    {

        for (auto& instr : basic_block)
        {
            auto        module = instr.getModule();
            auto const& dl     = module->getDataLayout();
            auto        cst    = llvm::ConstantFoldInstruction(&instr, dl, nullptr);
            if (cst != nullptr)
            {
                instr.replaceAllUsesWith(cst);
                to_delete.push_back(&instr);
            }
        }
    }

    // Deleting constants
    for (auto& x : to_delete)
    {
        x->eraseFromParent();
    }

    // Folding constant expressions
    Replacements replacements;
    for (auto& basic_block : fnc)
    {
        for (auto& instr : basic_block)
        {

            const_expr_replacements_.matchAndReplace(&instr, replacements);
        }
    }

    for (auto& r : replacements)
    {
        if (r.second != nullptr)
        {
            throw std::runtime_error("Real replacements not implemented.");
        }
        auto instr = llvm::dyn_cast<llvm::Instruction>(r.first);
        if (instr != nullptr)
        {
            instr->eraseFromParent();
            continue;
        }

        auto block = llvm::dyn_cast<llvm::BasicBlock>(r.first);
        if (block != nullptr)
        {
            llvm::DeleteDeadBlock(block);
        }
    }
}

llvm::Value* TargetQisMappingPass::copyAndExpand(
    llvm::Value*           input,
    DeletableInstructions& schedule_instruction_deletion)
{
    llvm::Value* ret        = input;
    auto*        call_instr = llvm::dyn_cast<llvm::CallInst>(input);
    auto         instr_ptr  = llvm::dyn_cast<llvm::Instruction>(input);
    if (call_instr != nullptr && instr_ptr != nullptr)
    {
        auto& instr = *instr_ptr;

        auto callee_function = call_instr->getCalledFunction();
        if (callee_function != nullptr && !callee_function->isDeclaration())
        {
            ConstantArguments     argument_constants{};
            std::vector<uint32_t> remaining_arguments{};

            uint32_t idx = 0;
            auto     n   = static_cast<uint32_t>(callee_function->arg_size());

            // Finding argument constants
            while (idx < n)
            {
                auto arg   = callee_function->getArg(idx);
                auto value = call_instr->getArgOperand(idx);

                auto cst = llvm::dyn_cast<llvm::ConstantInt>(value);
                if (cst != nullptr)
                {
                    argument_constants[arg->getName().str()] = cst;
                }
                else
                {
                    remaining_arguments.push_back(idx);
                }

                ++idx;
            }

            // Making a function copy
            auto new_callee = expandFunctionCall(*callee_function, argument_constants);

            // Replacing call if a new function was created
            if (new_callee != nullptr)
            {

                llvm::IRBuilder<> builder(call_instr);

                // List with new call arguments
                std::vector<llvm::Value*> new_arguments;
                for (auto const& i : remaining_arguments)
                {
                    // Getting the i'th argument
                    llvm::Value* arg = call_instr->getArgOperand(i);

                    // Adding arguments that were not constant
                    if (argument_constants.find(arg->getName().str()) == argument_constants.end())
                    {
                        new_arguments.push_back(arg);
                    }
                }

                // Creating a new call
                auto* new_call = builder.CreateCall(new_callee, new_arguments);
                new_call->takeName(call_instr);
                new_call->setTailCall(call_instr->isTailCall());
                new_call->setTailCallKind(call_instr->getTailCallKind());
                if (call_instr->canReturnTwice())
                {
                    new_call->setCanReturnTwice();
                }

                new_call->setCallingConv(call_instr->getCallingConv());
                new_call->setAttributes(call_instr->getAttributes());

                // Replace all calls to old function with calls to new function
                instr.replaceAllUsesWith(new_call);

                // Deleting instruction
                schedule_instruction_deletion.push_back(&instr);

                // Folding constants in the new function as we may have replaced some of
                // the arguments with constants
                constantFoldFunction(*new_callee);

                // Recursion: Returning the new call as the instruction to be analysed
                ret = new_call;
            }

            // Deleting the function the original function if it is no longer in use
            if (callee_function->use_empty())
            {
                callee_function->eraseFromParent();
            }
        }
    }

    return ret;
}

llvm::Value* TargetQisMappingPass::detectActiveCode(llvm::Value* input, DeletableInstructions&)
{
    active_pieces_.insert(input);
    return input;
}

bool TargetQisMappingPass::runOnFunction(llvm::Function& function, InstructionModifier const& modifier)
{
    if (function.isDeclaration())
    {
        return false;
    }

    if (depth_ >= config_.maxRecursion())
    {
        requireLogger();
        logger_->errorFunctionInliningMaxRecursion(config_.maxRecursion(), &function);

        return false;
    }
    ++depth_;

    // Keep track of instructions scheduled for deletion
    DeletableInstructions schedule_instruction_deletion;

    // Block queue
    std::deque<llvm::BasicBlock*>         queue;
    std::unordered_set<llvm::BasicBlock*> blocks_queued;
    queue.push_back(&function.getEntryBlock());
    blocks_queued.insert(&function.getEntryBlock());

    // Executing the modifier on the function itsel
    modifier(&function, schedule_instruction_deletion);

    while (!queue.empty())
    {
        auto& basic_block = *(queue.front());
        queue.pop_front();

        // Executing the modifier on the block
        modifier(&basic_block, schedule_instruction_deletion);

        for (auto& instr : basic_block)
        {
            // Modifying instruction as needed
            auto instr_ptr = modifier(&instr, schedule_instruction_deletion);

            // In case the instruction was scheduled for deletion
            if (instr_ptr == nullptr)
            {
                continue;
            }

            // Checking if we are calling a function
            auto call_instr = llvm::dyn_cast<llvm::CallBase>(instr_ptr);
            if (call_instr != nullptr)
            {
                auto callee_function = call_instr->getCalledFunction();
                if (callee_function != nullptr && !callee_function->isDeclaration())
                {
                    runOnFunction(*callee_function, modifier);
                }
            }

            // Following the branches to their basic blocks
            auto* br_instr = llvm::dyn_cast<llvm::BranchInst>(&instr);
            if (br_instr != nullptr)
            {
                for (uint32_t i = 0; i < br_instr->getNumOperands(); ++i)
                {
                    // TODO(issue-19): This may not work on multi path branches (conditional)
                    // as we may accidentally add the final path (contains qubit release)
                    // and we cannot make assumptions since optimization may have rearranged
                    // everything. In this case, we should revert to the order they appear in the
                    // function
                    auto bb = llvm::dyn_cast<llvm::BasicBlock>(br_instr->getOperand(i));
                    if (bb != nullptr)
                    {

                        // Ensuring that we are not scheduling the same block twice
                        if (blocks_queued.find(bb) == blocks_queued.end())
                        {
                            queue.push_back(bb);
                            blocks_queued.insert(bb);
                        }
                    }
                }
                continue;
            }

            // Follow the branches of
            auto* switch_instr = llvm::dyn_cast<llvm::SwitchInst>(&instr);
            if (switch_instr != nullptr)
            {
                for (uint64_t i = 0; i < switch_instr->getNumSuccessors(); ++i)
                {
                    auto bb = switch_instr->getSuccessor(static_cast<uint32_t>(i));
                    // Ensuring that we are not scheduling the same block twice
                    if (blocks_queued.find(bb) == blocks_queued.end())
                    {
                        queue.push_back(bb);
                        blocks_queued.insert(bb);
                    }
                }
                continue;
            }

            // Checking if this is an invoke call
            auto* invoke_inst = llvm::dyn_cast<llvm::InvokeInst>(&instr);
            if (invoke_inst != nullptr)
            {
                // Checking that configuration is correct
                if (!config_.assumeNoExceptions())
                {
                    // TODO(issue-20): Unify error reporting
                    throw std::runtime_error("Exceptions paths cannot be handled at compile time. Either disable "
                                             "transform-execution-path-only or add assumption assume-no-except");
                }

                // Adding the block which is the on the "no except" path
                auto bb = invoke_inst->getNormalDest();
                if (blocks_queued.find(bb) == blocks_queued.end())
                {
                    queue.push_back(bb);
                    blocks_queued.insert(bb);
                }
            }
        }
    }

    // Deleting constants
    for (auto& x : schedule_instruction_deletion)
    {
        x->eraseFromParent();
    }

    --depth_;

    return true;
}

bool TargetQisMappingPass::isActive(llvm::Value* value) const
{
    return active_pieces_.find(value) != active_pieces_.end();
}

void TargetQisMappingPass::runCopyAndExpand(llvm::Module& module, llvm::ModuleAnalysisManager&)
{
    replacements_.clear();
    // For every instruction in every block, we attempt a match
    // and replace.
    for (auto& function : module)
    {
        if (function.hasFnAttribute(config_.entryPointAttr()))
        {
            runOnFunction(
                function,
                [this](llvm::Value* value, DeletableInstructions& modifier) { return copyAndExpand(value, modifier); });
        }
    }

    // Active code detection
    for (auto& global : module.globals())
    {
        active_pieces_.insert(&global);
        for (auto& op : global.operands())
        {
            active_pieces_.insert(op);
        }
    }

    for (auto& function : module)
    {
        bool is_active = false;

        // Checking if the function is referenced by a global variable
        for (auto user : function.users())
        {
            // If the user is active, then it should be expected that the function is also active
            if (isActive(user))
            {
                is_active = true;
                break;
            }
        }

        if (is_active || function.hasFnAttribute(config_.entryPointAttr()))
        {
            // Marking function as active
            active_pieces_.insert(&function);

            // Detecting active code
            runOnFunction(
                function, [this](llvm::Value* value, DeletableInstructions& modifier)
                { return detectActiveCode(value, modifier); });
        }
    }

    processReplacements();
}

void TargetQisMappingPass::processReplacements()
{
    // Applying all replacements

    std::unordered_set<llvm::Value*> already_removed;
    for (auto it = replacements_.rbegin(); it != replacements_.rend(); ++it)
    {
        // Ignoring values that were already removed.
        if (already_removed.find(it->first) != already_removed.end())
        {
            continue;
        }
        already_removed.insert(it->first);

        auto instr1 = llvm::dyn_cast<llvm::Instruction>(it->first);

        if (instr1 == nullptr)
        {
            requireLogger();
            logger_->setLocationFromValue(nullptr);
            logger_->internalError("Cannot replace with non-instruction replacements");
            continue;
        }

        // Checking if have a replacement for the instruction
        if (it->second != nullptr)
        {
            // ... if so, we just replace it,
            auto instr2 = llvm::dyn_cast<llvm::Instruction>(it->second);
            if (instr2 == nullptr)
            {
                requireLogger();
                logger_->setLocationFromValue(instr1);
                logger_->internalError("Attempt to replace with non-instruction value. This is not allowed.");
                continue;
            }
            llvm::ReplaceInstWithInst(instr1, instr2);
        }
        else
        {
            // ... otherwize we delete the the instruction
            // Removing all uses

            if (!instr1->use_empty())
            {
                auto type = instr1->getType();
                if (type != nullptr)
                {
                    instr1->replaceAllUsesWith(llvm::UndefValue::get(type));
                }
            }

            // And finally we delete the instruction. The if statement
            // is first and foremost a precaution which prevents the program
            // from seg-faulting in the unlikely case that instr1->getType() is null.
            if (instr1->use_empty())
            {
                instr1->eraseFromParent();
            }
        }
    }

    replacements_.clear();
}

void TargetQisMappingPass::runDetectActiveCode(llvm::Module& module, llvm::ModuleAnalysisManager&)
{
    blocks_to_delete_.clear();
    functions_to_delete_.clear();

    for (auto& function : module)
    {
        if (isActive(&function))
        {
            for (auto& block : function)
            {
                if (!isActive(&block))
                {
                    blocks_to_delete_.push_back(&block);
                }
            }
        }
        else if (!function.isDeclaration())
        {
            functions_to_delete_.push_back(&function);
        }
    }
}

void TargetQisMappingPass::runDeleteDeadCode(llvm::Module&, llvm::ModuleAnalysisManager&)
{

    // Removing all function references and scheduling blocks for deletion
    for (auto& function : functions_to_delete_)
    {
        // Schedule for deletion
        function->replaceAllUsesWith(llvm::UndefValue::get(function->getType()));

        function->clearGC();
        function->clearMetadata();

        // Deleteing blocks in reverse order
        std::vector<llvm::BasicBlock*> blocks;
        for (auto& block : *function)
        {
            blocks.push_back(&block);
        }

        // Removing backwards to avoid segfault
        for (auto it = blocks.rbegin(); it != blocks.rend(); ++it)
        {
            auto& block = **it;
            // Deleting instructions in reverse order (needed because it is a DAG structure)
            std::vector<llvm::Instruction*> instructions;
            for (auto& instr : block)
            {
                instructions.push_back(&instr);
            }

            // Removing all instructions
            for (auto it2 = instructions.rbegin(); it2 != instructions.rend(); ++it2)
            {
                auto& instr = **it2;
                instr.replaceAllUsesWith(llvm::UndefValue::get(instr.getType()));
                instr.eraseFromParent();
            }

            // Removing all block references
            block.replaceAllUsesWith(llvm::UndefValue::get(block.getType()));

            // Scheduling block deletion
            blocks_to_delete_.push_back(&block);
        }
    }

    // Deleting all blocks
    for (auto block : blocks_to_delete_)
    {
        if (block->use_empty())
        {
            block->eraseFromParent();
        }
        else
        {
            requireLogger();
            logger_->setLocationFromValue(block);
            logger_->internalError("Block was supposed to be unused");
        }
    }

    // Removing functions
    for (auto& function : functions_to_delete_)
    {
        if (function->isDeclaration() && function->use_empty())
        {
            function->eraseFromParent();
        }
    }
}

void TargetQisMappingPass::runReplacePhi(llvm::Module& module, llvm::ModuleAnalysisManager&)
{
    using namespace microsoft::quantum::notation;
    auto                            rule = phi("b1"_cap = _, "b2"_cap = _);
    IOperandPrototype::Captures     captures;
    std::vector<llvm::Instruction*> to_delete;

    std::unordered_map<llvm::Instruction*, llvm::Value*> replacements;

    for (auto& function : module)
    {
        for (auto& block : function)
        {
            std::vector<llvm::Instruction*> instrs;

            for (auto& instr : block)
            {

                if (rule->match(&instr, captures))
                {
                    auto phi = llvm::dyn_cast<llvm::PHINode>(&instr);
                    if (phi == nullptr)
                    {
                        continue;
                    }

                    auto val1 = captures["b1"];
                    auto val2 = captures["b2"];

                    auto block1 = phi->getIncomingBlock(0); // TODO(issue-21): Make sure that block1 matches val1
                    auto block2 = phi->getIncomingBlock(1);

                    if (!isActive(block1))
                    {
                        val2->takeName(&instr);

                        replacements[&instr] = val2;

                        to_delete.push_back(&instr);
                    }
                    else if (!isActive(block2))
                    {
                        val1->takeName(&instr);

                        replacements[&instr] = val2;
                        to_delete.push_back(&instr);
                    }

                    captures.clear();
                }
            }
        }
    }

    for (auto& r : replacements)
    {
        r.first->replaceAllUsesWith(r.second);
    }

    for (auto& x : to_delete)
    {
        x->eraseFromParent();
    }
}

void TargetQisMappingPass::runApplyRules(llvm::Module& module, llvm::ModuleAnalysisManager&)
{

    replacements_.clear();

    std::unordered_set<llvm::Value*> already_visited;
    for (auto& function : module)
    {

        if (function.hasFnAttribute(config_.entryPointAttr()))
        {
            runOnFunction(
                function,
                [this, &already_visited](llvm::Value* value, DeletableInstructions&)
                {
                    auto instr = llvm::dyn_cast<llvm::Instruction>(value);

                    // Sanity check
                    if (already_visited.find(value) != already_visited.end())
                    {
                        requireLogger();
                        logger_->setLocationFromValue(value);
                        logger_->internalError("Instruction was visited twice while applying rule to function.");
                        return value;
                    }
                    already_visited.insert(value);

                    // Checking if we should analyse
                    if (instr != nullptr)
                    {
                        rule_set_.matchAndReplace(instr, replacements_);
                    }
                    return value;
                });
        }
    }

    processReplacements();
}

llvm::PreservedAnalyses TargetQisMappingPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
{
    // In case the module is instructed to clone functions,
    if (config_.shouldCloneFunctions())
    {
        setupCopyAndExpand();
        runCopyAndExpand(module, mam);
    }

    // Deleting dead code if configured to do so. This process consists
    // of three steps: detecting dead code, removing phi nodes (and references)
    // and finally deleting the code. This implementation is aggressive in the sense
    // that any code that we cannot prove to be active is considered dead.
    if (config_.shouldDeleteDeadCode())
    {
        runDetectActiveCode(module, mam);
        runReplacePhi(module, mam);
        runDeleteDeadCode(module, mam);
    }

    // Applying rule set

    if (config_.shouldTransformExecutionPathOnly())
    {
        // TODO(tfr): This implementation path lacks backwards replacement (see else section)

        // We only apply transformation rules to code which is reachable
        // via the execution path.
        runApplyRules(module, mam);
    }
    else
    {

        // Otherwise we apply to all sections of the code.
        replacements_.clear();
        for (auto& function : module)
        {

            // Creating a list of all instructions in the function
            // and matching rules in forward direction
            for (auto& block : function)
            {
                for (auto& instr : block)
                {
                    rule_set_.matchAndReplace(&instr, replacements_);
                }
            }

            // Matching in reverse order
            std::vector<llvm::Instruction*> instructions;
            for (auto& block : function)
            {
                for (auto& instr : block)
                {
                    instructions.push_back(&instr);
                }
            }

            std::reverse(instructions.begin(), instructions.end());
            for (auto instr : instructions)
            {
                rule_set_.matchAndReplace(instr, replacements_, RuleSet::ReplaceDirection::ReplaceBackwards);
            }
        }

        processReplacements();
    }

    return llvm::PreservedAnalyses::none();
}

llvm::Function* TargetQisMappingPass::expandFunctionCall(llvm::Function& callee, ConstantArguments const& const_args)
{
    auto              module  = callee.getParent();
    auto&             context = module->getContext();
    llvm::IRBuilder<> builder(context);

    // Copying the original function
    llvm::ValueToValueMapTy  remapper;
    std::vector<llvm::Type*> arg_types;

    // The user might be deleting arguments to the function by specifying them in
    // the VMap.  If so, we need to not add the arguments to the arg ty vector
    //
    for (auto const& arg : callee.args())
    {
        // Skipping constant arguments

        if (const_args.find(arg.getName().str()) != const_args.end())
        {
            continue;
        }

        arg_types.push_back(arg.getType());
    }

    // Creating a new function
    llvm::FunctionType* function_type = llvm::FunctionType::get(
        callee.getFunctionType()->getReturnType(), arg_types, callee.getFunctionType()->isVarArg());
    auto function =
        llvm::Function::Create(function_type, callee.getLinkage(), callee.getAddressSpace(), callee.getName(), module);

    // Copying the non-const arguments
    auto dest_args_it = function->arg_begin();

    for (auto const& arg : callee.args())
    {
        auto const_it = const_args.find(arg.getName().str());
        if (const_it == const_args.end())
        {
            // Mapping remaining function arguments
            dest_args_it->setName(arg.getName());
            remapper[&arg] = &*dest_args_it++;
        }
        else
        {
            remapper[&arg] = llvm::ConstantInt::get(context, const_it->second->getValue());
        }
    }

    llvm::SmallVector<llvm::ReturnInst*, 8> returns; // Ignore returns cloned.

    llvm::CloneFunctionInto(
        function, &callee, remapper, llvm::CloneFunctionChangeType::LocalChangesOnly, returns, "", nullptr);

    verifyFunction(*function);

    return function;
}

void TargetQisMappingPass::setLogger(ILoggerPtr logger)
{
    logger_ = std::move(logger);
}

bool TargetQisMappingPass::isRequired()
{
    return true;
}

void TargetQisMappingPass::requireLogger()
{
    if (logger_ == nullptr)
    {
        throw std::runtime_error("TargetQisMappingPass does not have a logger, but need it to emit messages.");
    }
}

} // namespace microsoft::quantum
