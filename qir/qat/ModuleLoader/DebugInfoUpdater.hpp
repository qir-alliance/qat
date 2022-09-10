#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/ModuleLoader/InstructionLocationTable.hpp"

namespace microsoft::quantum
{

class DebugInfoUpdater : public llvm::InstVisitor<DebugInfoUpdater>
{
  public:
    using DIBuilder   = llvm::DIBuilder;
    using DataLayout  = llvm::DataLayout;
    using Module      = llvm::Module;
    using Function    = llvm::Function;
    using Instruction = llvm::Instruction;
    using DIType      = llvm::DIType;
    using StringRef   = llvm::StringRef;

    DebugInfoUpdater(
        InstructionLocationTablePtr const& debug_info,
        Module&                            module,
        StringRef const&                   directory,
        StringRef const&                   filename);

    void update();

    // Visitor implementation
    //

    void visitFunction(Function& function);
    void visitInstruction(Instruction& instr);

  protected:
    // Creating and getting types
    //

    llvm::DISubroutineType* createFunctionType(Function const* function);
    DIType*                 createVoidType(llvm::Type* type);
    DIType*                 createPointerType(llvm::Type* type);
    DIType*                 createOpaqueType(llvm::Type* type);
    DIType*                 getOrCreateType(llvm::Type* type);
    DIType*                 getType(llvm::Type* type);

  private:
    InstructionLocationTablePtr debug_info_{nullptr};
    llvm::Module&               module_;
    llvm::DIBuilder             builder_;
    llvm::DebugInfoFinder       finder_{};

    llvm::DICompileUnit* compile_unit_;
    llvm::DIFile*        file_unit_;

    llvm::ValueMap<llvm::Function const*, llvm::DISubprogram*> function_debug_info_{};
    llvm::DenseMap<llvm::Type const*, llvm::DIType*>           type_debug_info_{};
};

} // namespace microsoft::quantum
