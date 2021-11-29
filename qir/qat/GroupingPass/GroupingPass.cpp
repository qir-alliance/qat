// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "GroupingPass/GroupingAnalysisPass.hpp"
#include "GroupingPass/GroupingPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    bool GroupingPass::isRequired()
    {
        return true;
    }

    void GroupingPass::prepareBlockModification(llvm::Module& module, llvm::BasicBlock* tail_classical)
    {
        // Creating replacement blocks
        auto& context = module.getContext();
        post_classical_block_ =
            llvm::BasicBlock::Create(context, "post-classical", tail_classical->getParent(), tail_classical);

        readout_block_ =
            llvm::BasicBlock::Create(context, "readout", tail_classical->getParent(), post_classical_block_);

        quantum_block_ = llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), readout_block_);

        pre_classical_block_ =
            llvm::BasicBlock::Create(context, "pre-classical", tail_classical->getParent(), quantum_block_);

        // Renaming the block
        pre_classical_block_->takeName(tail_classical);

        // Preparing builders
        post_classical_builder_->SetInsertPoint(post_classical_block_);
        readout_builder_->SetInsertPoint(readout_block_);
        quantum_builder_->SetInsertPoint(quantum_block_);
        pre_classical_builder_->SetInsertPoint(pre_classical_block_);

        // Replacing entry
        tail_classical->setName("exit_quantum_grouping");
        tail_classical->replaceUsesWithIf(pre_classical_block_, [](llvm::Use& use) {
            auto* phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
            return (phi_node == nullptr);
        });
    }

    void GroupingPass::nextQuantumCycle(llvm::Module& module, llvm::BasicBlock* tail_classical)
    {
        auto& context = module.getContext();

        pre_classical_builder_->CreateBr(quantum_block_);
        quantum_builder_->CreateBr(readout_block_);
        readout_builder_->CreateBr(post_classical_block_);

        //
        pre_classical_block_ = post_classical_block_;

        // Creating replacement blocks
        post_classical_block_ =
            llvm::BasicBlock::Create(context, "post-classical", tail_classical->getParent(), tail_classical);

        readout_block_ =
            llvm::BasicBlock::Create(context, "readout", tail_classical->getParent(), post_classical_block_);

        quantum_block_ = llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), readout_block_);

        // Preparing builders
        post_classical_builder_->SetInsertPoint(post_classical_block_);
        readout_builder_->SetInsertPoint(readout_block_);
        quantum_builder_->SetInsertPoint(quantum_block_);
        pre_classical_builder_->SetInsertPoint(pre_classical_block_);
    }

    void GroupingPass::expandBlockQuantumMeasureClassical(llvm::Module& module, llvm::BasicBlock* tail_classical)
    {
        prepareBlockModification(module, tail_classical);

        // Variables used for the modifications
        std::vector<llvm::Instruction*>  to_delete;
        std::unordered_set<llvm::Value*> depends_on_qc;
        std::unordered_set<llvm::Value*> post_classical_instructions;

        for (auto& instr : *tail_classical)
        {

            // Ignoring terminators
            // Only the terminator survives in the tail block
            if (instr.isTerminator())
            {
                continue;
            }

            // Analysing calls
            auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
            if (call_instr != nullptr)
            {
                auto f = call_instr->getCalledFunction();
                if (f != nullptr)
                {

                    // Checking if it is a QIS instruction
                    auto name = static_cast<std::string>(f->getName());
                    bool is_quantum =
                        (name.size() >= GroupingAnalysisPass::QIS_START.size() &&
                         name.substr(0, GroupingAnalysisPass::QIS_START.size()) == GroupingAnalysisPass::QIS_START);

                    if (is_quantum)
                    {
                        // Checking if we are starting a new quantum program
                        for (auto& op : instr.operands())
                        {
                            if (post_classical_instructions.find(op) != post_classical_instructions.end())
                            {
                                nextQuantumCycle(module, tail_classical);
                                depends_on_qc.clear();
                                post_classical_instructions.clear();
                                break;
                            }
                        }

                        // Marking dependencies as going into post section
                        bool is_readout = false;

                        // We expect pure quantum instructions to be void.
                        if (!instr.getType()->isVoidTy())
                        {
                            is_readout = true;
                        }

                        // Marking all instructions that depend on a a read out
                        for (auto user : instr.users())
                        {
                            depends_on_qc.insert(user);
                        }

                        // Moving the instruction to
                        auto new_instr = instr.clone();
                        new_instr->takeName(&instr);

                        if (is_readout)
                        {
                            readout_builder_->Insert(new_instr);
                        }
                        else
                        {
                            quantum_builder_->Insert(new_instr);
                        }

                        instr.replaceAllUsesWith(new_instr);
                        to_delete.push_back(&instr);
                        continue;
                    }
                }
            }

            //
            // Check if depends on readout
            if (depends_on_qc.find(&instr) != depends_on_qc.end())
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
                to_delete.push_back(&instr);

                post_classical_instructions.insert(new_instr);
                continue;
            }

            // Post quantum section
            // Moving remaining to pre-section
            auto new_instr = instr.clone();
            new_instr->takeName(&instr);
            pre_classical_builder_->Insert(new_instr);
            instr.replaceAllUsesWith(new_instr);
            to_delete.push_back(&instr);
        }

        pre_classical_builder_->CreateBr(quantum_block_);
        quantum_builder_->CreateBr(readout_block_);
        readout_builder_->CreateBr(post_classical_block_);
        post_classical_builder_->CreateBr(tail_classical);

        for (auto it = to_delete.rbegin(); it != to_delete.rend(); ++it)
        {
            auto ptr = *it;
            if (!ptr->use_empty())
            {
                llvm::errs() << ";; Error: Could not delete " << *ptr << "\n";
            }
            else
            {
                ptr->eraseFromParent();
            }
        }
    }

    llvm::PreservedAnalyses GroupingPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
    {
        auto& result = mam.getResult<GroupingAnalysisPass>(module);

        // Preparing builders
        auto& context           = module.getContext();
        pre_classical_builder_  = std::make_shared<llvm::IRBuilder<>>(context);
        quantum_builder_        = std::make_shared<llvm::IRBuilder<>>(context);
        readout_builder_        = std::make_shared<llvm::IRBuilder<>>(context);
        post_classical_builder_ = std::make_shared<llvm::IRBuilder<>>(context);

        for (auto* block : result.qc_cc_blocks)
        {
            expandBlockQuantumMeasureClassical(module, block);
        }

        for (auto* block : result.qc_mc_cc_blocks)
        {
            expandBlockQuantumMeasureClassical(module, block);
        }

        return llvm::PreservedAnalyses::none();
    }

} // namespace quantum
} // namespace microsoft
