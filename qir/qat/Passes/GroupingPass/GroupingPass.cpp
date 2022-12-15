// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingAnalysisPass.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

bool GroupingPass::isRequired()
{
    return true;
}

bool GroupingPass::isQuantumRegister(llvm::Type const* type)
{
    if (type->isPointerTy())
    {
        auto element_type = type->getPointerElementType();
        if (element_type->isStructTy())
        {
            auto type_name = static_cast<String const>(element_type->getStructName());
            return quantum_register_types_.find(type_name) != quantum_register_types_.end();
        }
    }

    return false;
}

int64_t GroupingPass::classifyInstruction(llvm::Instruction const* instr)
{
    int64_t ret = PureClassical;

    auto irreversible_operations = config_.irreversibleOperations();

    // Checking all operations
    bool any_quantum         = false;
    bool any_classical       = false;
    bool is_void             = instr->getType()->isVoidTy();
    bool returns_quantum     = isQuantumRegister(instr->getType());
    bool destructive_quantum = false;

    auto call = llvm::dyn_cast<llvm::CallBase>(instr);
    if (call != nullptr)
    {
        auto f = call->getCalledFunction();
        if (f == nullptr)
        {
            throw std::runtime_error("Function pointer was null during logic separation analysis.");
        }

        // Checking if it is an irreversabile operation
        auto name = static_cast<std::string>(f->getName());
        if (irreversible_operations.find(name) != irreversible_operations.end())
        {
            destructive_quantum = true;
        }

        for (auto& arg : call->args())
        {
            auto q = isQuantumRegister(arg->getType());
            any_quantum |= q;
            any_classical |= !q;
        }

        if (returns_quantum || (is_void && !any_classical && any_quantum))
        {
            ret |= DestQuantum;
        }
    }
    else
    {
        for (auto& op : instr->operands())
        {
            auto q = isQuantumRegister(op->getType());
            any_quantum |= q;
            any_classical |= !q;
        }

        // Setting the destination platform
        if (returns_quantum)
        {
            ret |= DestQuantum;

            // If no classical or quantum arguments present, then destination dictates
            // source
            if (!any_quantum && !any_classical)
            {
                ret |= SourceQuantum;
            }
        }
    }

    if (destructive_quantum)
    {
        return TransferQuantumToClassical;
    }

    if (any_quantum && any_classical)
    {
        if (ret != DestQuantum)
        {
            ret = InvalidMixedLocation;
        }
    }

    else if (any_quantum)
    {
        ret |= SourceQuantum;
    }

    return ret;
}

void GroupingPass::prepareSourceSeparation(llvm::Module& module, llvm::BasicBlock* tail_classical)
{
    // Creating replacement blocks
    auto& context = module.getContext();
    post_classical_block_ =
        llvm::BasicBlock::Create(context, "post-classical", tail_classical->getParent(), tail_classical);
    quantum_block_ = llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), post_classical_block_);
    pre_classical_block_ =
        llvm::BasicBlock::Create(context, "pre-classical", tail_classical->getParent(), quantum_block_);

    // Storing the blocks for later processing
    quantum_blocks_.push_back(quantum_block_);
    classical_blocks_.push_back(pre_classical_block_);
    classical_blocks_.push_back(post_classical_block_);

    // Renaming the block
    pre_classical_block_->takeName(tail_classical);

    // Preparing builders
    post_classical_builder_->SetInsertPoint(post_classical_block_);
    quantum_builder_->SetInsertPoint(quantum_block_);
    pre_classical_builder_->SetInsertPoint(pre_classical_block_);

    // Replacing entry
    tail_classical->setName("exit_quantum_grouping");
    tail_classical->replaceUsesWithIf(
        pre_classical_block_,
        [](llvm::Use& use)
        {
            auto* phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
            return (phi_node == nullptr);
        });
}

void GroupingPass::nextQuantumCycle(llvm::Module& module, llvm::BasicBlock* tail_classical)
{
    auto& context = module.getContext();
    pre_classical_builder_->CreateBr(quantum_block_);
    quantum_builder_->CreateBr(post_classical_block_);

    //
    pre_classical_block_ = post_classical_block_;

    // Creating replacement blocks
    post_classical_block_ =
        llvm::BasicBlock::Create(context, "post-classical", tail_classical->getParent(), tail_classical);

    quantum_block_ = llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), post_classical_block_);

    // Storing the blocks for later processing
    quantum_blocks_.push_back(quantum_block_);
    classical_blocks_.push_back(post_classical_block_);

    // Preparing builders
    post_classical_builder_->SetInsertPoint(post_classical_block_);
    quantum_builder_->SetInsertPoint(quantum_block_);
    pre_classical_builder_->SetInsertPoint(pre_classical_block_);
}

GroupingPass::ResourceAnalysis GroupingPass::operandAnalysis(llvm::Value* val) const
{
    // Determining if this is a static resource
    auto* instruction_ptr = llvm::dyn_cast<llvm::IntToPtrInst>(val);
    auto* operator_ptr    = llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(val);
    auto* nullptr_cast    = llvm::dyn_cast<llvm::ConstantPointerNull>(val);

    ResourceAnalysis ret{};
    ret.is_const = (instruction_ptr != nullptr) || (operator_ptr != nullptr) || (nullptr_cast != nullptr);

    // Extracting the type and index
    if (!val->getType()->isPointerTy())
    {
        return ret;
    }

    llvm::Type* element_type = val->getType()->getPointerElementType();

    if (!element_type->isStructTy())
    {
        return ret;
    }

    if (ret.is_const)
    {
        auto type_name = static_cast<String>(element_type->getStructName());

        if (type_name == "Qubit")
        {
            ret.type = ResourceType::QUBIT;
        }
        else if (type_name == "Result")
        {
            ret.type = ResourceType::RESULT;
        }

        if (ret.type != ResourceType::UNDEFINED)
        {
            auto user = llvm::dyn_cast<llvm::User>(val);
            ret.id    = 0;

            if (user && user->getNumOperands() == 1)
            {
                auto cst = llvm::dyn_cast<llvm::ConstantInt>(user->getOperand(0));

                if (cst)
                {
                    ret.id = cst->getValue().getZExtValue();
                }
            }
        }
    }

    return ret;
}

void GroupingPass::expandBasedOnSource(llvm::Module& module, llvm::BasicBlock* tail_classical)
{
    prepareSourceSeparation(module, tail_classical);

    auto qir_rt_start = config_.qirRuntimePrefix();

    // Variables used for the modifications
    to_delete_.clear();
    std::unordered_set<llvm::Value*> depends_on_qc;
    bool                             destruction_sequence_begun = false;
    std::unordered_set<llvm::Value*> destroyed_resources{};
    std::unordered_set<uint64_t>     destroyed_qubits{};
    std::unordered_set<uint64_t>     destroyed_results{};

    std::unordered_set<llvm::Value*> post_classical_instructions{};

    for (auto& instr : *tail_classical)
    {

        // Ignoring terminators
        // Only the terminator survives in the tail block
        if (instr.isTerminator())
        {
            continue;
        }

        auto instr_class = classifyInstruction(&instr);
        if ((instr_class & SourceQuantum) != 0)
        {
            // Checking if we are starting a new quantum program
            for (auto& op : instr.operands())
            {
                if (post_classical_instructions.find(op) != post_classical_instructions.end())
                {
                    nextQuantumCycle(module, tail_classical);
                    depends_on_qc.clear();
                    destroyed_resources.clear();
                    destroyed_qubits.clear();
                    destroyed_results.clear();
                    post_classical_instructions.clear();
                    destruction_sequence_begun = false;
                    break;
                }
            }

            // Checking if the instruction is destructive
            if (instr_class == TransferQuantumToClassical)
            {
                for (auto& op : instr.operands())
                {
                    destroyed_resources.insert(op);
                    auto analysis = operandAnalysis(op);

                    // Taking note of destroyed statically allocated resources
                    if (analysis.is_const)
                    {
                        switch (analysis.type)
                        {
                        case ResourceType::QUBIT:
                            destroyed_qubits.insert(analysis.id);
                            break;
                        case ResourceType::RESULT:
                            destroyed_results.insert(analysis.id);
                            break;
                        case ResourceType::UNDEFINED:
                            break;
                        }
                    }
                }
                destruction_sequence_begun = true;
            }
            else
            {
                bool relies_on_destroyed_resource = false;

                for (auto& op : instr.operands())
                {
                    // Skipping function pointers
                    if (llvm::dyn_cast<llvm::Function>(op))
                    {
                        continue;
                    }

                    auto analysis = operandAnalysis(op);

                    // Note that we are forced to create a new cycle if a destructive
                    // instruction is encountered. The reason is that we cannot garantuee
                    // whether a qubit reference is to a to destroyed resource or not.
                    // Consider for instance, %a1.i.i = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
                    // which could refer to qubit 0 or qubit 1 depending on %0. If %0 is not known
                    // at compile time, we will not be able to determine its value.

                    if (!analysis.is_const && destruction_sequence_begun)
                    {
                        relies_on_destroyed_resource = true;
                        break;
                    }

                    // If it was marked as destroyed, we break right away
                    if (destroyed_resources.find(op) != destroyed_resources.end())
                    {
                        relies_on_destroyed_resource = true;
                        break;
                    }

                    // In case we are dealing with a constant (statically allocated)
                    // we check if the resource was destroyed.
                    if (analysis.is_const)
                    {
                        switch (analysis.type)
                        {
                        case ResourceType::QUBIT:
                            if (destroyed_qubits.find(analysis.id) != destroyed_qubits.end())
                            {
                                relies_on_destroyed_resource = true;
                            }
                            break;
                        case ResourceType::RESULT:
                            if (destroyed_results.find(analysis.id) != destroyed_results.end())
                            {
                                relies_on_destroyed_resource = true;
                            }
                            break;
                        case ResourceType::UNDEFINED:
                            break;
                        }

                        if (relies_on_destroyed_resource)
                        {
                            break;
                        }
                    }
                }

                if (relies_on_destroyed_resource)
                {
                    nextQuantumCycle(module, tail_classical);
                    depends_on_qc.clear();
                    post_classical_instructions.clear();
                    destroyed_resources.clear();
                    destroyed_qubits.clear();
                    destroyed_results.clear();
                    destruction_sequence_begun = false;
                }
            }

            // Marking all instructions that depend on a a read out
            for (auto user : instr.users())
            {
                depends_on_qc.insert(user);
            }

            // Moving the instruction to
            auto new_instr = instr.clone();
            new_instr->takeName(&instr);

            quantum_builder_->Insert(new_instr);

            instr.replaceAllUsesWith(new_instr);
            to_delete_.push_back(&instr);
        }
        else if (instr_class != InvalidMixedLocation)
        {
            // Check if depends on readout
            bool is_post_quantum_instruction = depends_on_qc.find(&instr) != depends_on_qc.end();

            // Calls which starts with __quantum__rt__ cannot be moved to
            // the pre-calculation section becuase they might have side effects
            // such as recording output helper functions.
            auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
            if (call_instr != nullptr)
            {
                auto f = call_instr->getCalledFunction();
                if (f == nullptr)
                {
                    continue;
                }

                auto name = static_cast<std::string>(f->getName());
                is_post_quantum_instruction |=
                    (name.size() >= qir_rt_start.size() && name.substr(0, qir_rt_start.size()) == qir_rt_start);
            }

            // Checking if we are inserting the instruction before or after
            // the quantum block
            if (is_post_quantum_instruction)
            {
                for (auto user : instr.users())
                {
                    depends_on_qc.insert(user);
                }

                // Inserting to post section
                auto new_instr = instr.clone();
                new_instr->takeName(&instr);
                post_classical_builder_->Insert(new_instr);
                instr.replaceAllUsesWith(new_instr);
                to_delete_.push_back(&instr);

                post_classical_instructions.insert(new_instr);
                continue;
            }

            // Post quantum section
            // Moving remaining to pre-section
            auto new_instr = instr.clone();

            new_instr->takeName(&instr);
            pre_classical_builder_->Insert(new_instr);

            instr.replaceAllUsesWith(new_instr);
            to_delete_.push_back(&instr);
        }
        else
        {
            throw std::runtime_error("Unsupported occurring while grouping instructions");
        }
    }

    pre_classical_builder_->CreateBr(quantum_block_);
    quantum_builder_->CreateBr(post_classical_block_);
    post_classical_builder_->CreateBr(tail_classical);

    deleteInstructions();
}

void GroupingPass::expandBasedOnDest(
    llvm::Module&     module,
    llvm::BasicBlock* block,
    bool              move_quatum,
    String const&     name)
{
    auto& context = module.getContext();
    to_delete_.clear();

    auto extra_block = llvm::BasicBlock::Create(context, "unnamed", block->getParent(), block);
    extra_block->takeName(block);
    block->replaceUsesWithIf(
        extra_block,
        [](llvm::Use& use)
        {
            auto* phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
            return (phi_node == nullptr);
        });

    block->setName(name);

    llvm::IRBuilder<> first_builder{context};
    first_builder.SetInsertPoint(extra_block);

    for (auto& instr : *block)
    {
        if (instr.isTerminator())
        {
            continue;
        }

        auto instr_class     = classifyInstruction(&instr);
        bool dest_is_quantum = (instr_class & DestQuantum) != 0;

        if (dest_is_quantum == move_quatum)
        {
            auto new_instr = instr.clone();

            new_instr->takeName(&instr);
            first_builder.Insert(new_instr);

            instr.replaceAllUsesWith(new_instr);
            to_delete_.push_back(&instr);
        }
    }

    first_builder.CreateBr(block);

    deleteInstructions();
}

void GroupingPass::deleteInstructions()
{
    for (auto it = to_delete_.rbegin(); it != to_delete_.rend(); ++it)
    {
        auto ptr = *it;
        if (!ptr->use_empty())
        {
            if (logger_)
            {
                logger_->errorCouldNotDeleteNode(ptr);
            }
            else
            {
                throw std::runtime_error("No logger present - Error: Unable to delete instruction.\n");
            }
        }
        else
        {
            ptr->eraseFromParent();
        }
    }
}

llvm::PreservedAnalyses GroupingPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
{
    if (!config_.groupQis())
    {
        return llvm::PreservedAnalyses::all();
    }

    auto& result = mam.getResult<GroupingAnalysisPass>(module);

    // Preparing builders
    auto& context           = module.getContext();
    pre_classical_builder_  = std::make_shared<llvm::IRBuilder<>>(context);
    quantum_builder_        = std::make_shared<llvm::IRBuilder<>>(context);
    post_classical_builder_ = std::make_shared<llvm::IRBuilder<>>(context);

    for (auto* block : result.qc_cc_blocks)
    {

        quantum_blocks_.clear();
        classical_blocks_.clear();

        // First split
        expandBasedOnSource(module, block);

        // Second splits
        for (auto* readout_block : quantum_blocks_)
        {
            expandBasedOnDest(module, readout_block, true, "readout");
        }

        // Last classical block does not contain any loads
        classical_blocks_.pop_back();
        for (auto* load_block : classical_blocks_)
        {
            expandBasedOnDest(module, load_block, false, "load");
        }
    }

    for (auto* block : result.qc_mc_cc_blocks)
    {
        quantum_blocks_.clear();
        classical_blocks_.clear();

        // First split
        expandBasedOnSource(module, block);

        // Second splits
        for (auto* readout_block : quantum_blocks_)
        {
            expandBasedOnDest(module, readout_block, true, "readout");
        }

        // Last classical block does not contain any loads
        classical_blocks_.pop_back();
        for (auto* load_block : classical_blocks_)
        {
            expandBasedOnDest(module, load_block, false, "load");
        }
    }

    return llvm::PreservedAnalyses::none();
}

void GroupingPass::setLogger(ILoggerPtr logger)
{
    logger_ = std::move(logger);
}

} // namespace microsoft::quantum
