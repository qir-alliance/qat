// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/ModuleLoader/DebugInfoUpdater.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/ModuleLoader/InstructionLocationTable.hpp"

namespace microsoft::quantum
{

DebugInfoUpdater::DebugInfoUpdater(
    InstructionLocationTablePtr const& debug_info,
    Module&                            module,
    StringRef const&                   directory,
    StringRef const&                   filename)
  : debug_info_{debug_info}
  , module_{module}
  , builder_(module)
{
    file_unit_    = builder_.createFile(filename, directory);
    compile_unit_ = builder_.createCompileUnit(llvm::dwarf::DW_LANG_C, file_unit_, "qat", false, "", 0);
}

void DebugInfoUpdater::update()
{
    finder_.processModule(module_);
    visit(&module_);
    builder_.finalize();
}

llvm::DISubroutineType* DebugInfoUpdater::createFunctionType(Function const* function)
{
    llvm::SmallVector<llvm::Metadata*, 4> parameters;
    llvm::DIType*                         return_type = getOrCreateType(function->getReturnType());
    parameters.push_back(return_type);

    for (auto const& arg : function->args())
    {
        parameters.push_back(getOrCreateType(arg.getType()));
    }

    auto params_array = builder_.getOrCreateTypeArray(parameters);
    return builder_.createSubroutineType(params_array);
}

llvm::DIType* DebugInfoUpdater::getType(llvm::Type* type)
{

    auto it = type_debug_info_.find(type);
    if (it != type_debug_info_.end())
    {
        return it->second;
    }

    return nullptr;
}

llvm::DIType* DebugInfoUpdater::createVoidType(llvm::Type* type)
{
    auto ret               = builder_.createUnspecifiedType("void");
    type_debug_info_[type] = ret;
    return ret;
}

llvm::DIType* DebugInfoUpdater::createPointerType(llvm::Type* type)
{
    auto pointee_type = type->getPointerElementType();
    auto element_type = getOrCreateType(pointee_type);
    auto ret          = builder_.createPointerType(element_type, 64);

    type_debug_info_[type] = ret;
    return ret;
}

llvm::DIType* DebugInfoUpdater::createOpaqueType(llvm::Type* type)
{
    auto ret               = builder_.createUnspecifiedType("opaque");
    type_debug_info_[type] = ret;
    return ret;
}

llvm::DIType* DebugInfoUpdater::getOrCreateType(llvm::Type* type)
{
    DIType* di_type = getType(type);
    if (di_type != nullptr)
    {
        return di_type;
    }

    if (type->isVoidTy())
    {
        return createVoidType(type);
    }

    if (type->isStructTy() || type->isArrayTy())
    {
        // TODO(tfr): Consider more comprehensive support for structs and arrays
        return createOpaqueType(type);
    }

    if (type->isPointerTy())
    {
        return createPointerType(type);
    }

    auto encoding = llvm::dwarf::DW_ATE_signed;

    if (type->isIntegerTy())
    {
        encoding = llvm::dwarf::DW_ATE_unsigned;
    }
    else if (type->isFloatingPointTy())
    {
        encoding = llvm::dwarf::DW_ATE_float;
    }

    auto ret = builder_.createBasicType("PrimitiveType", type->getPrimitiveSizeInBits(), encoding);

    type_debug_info_[type] = ret;
    return ret;
}

void DebugInfoUpdater::visitFunction(Function& function)
{
    // Skipping declarations and already annotated functions
    if (function.isDeclaration() || function_debug_info_.find(&function) != function_debug_info_.end())
    {
        return;
    }

    // Preserving existing subprograms
    if (function.getSubprogram() != nullptr)
    {
        function_debug_info_[&function] = function.getSubprogram();
        return;
    }

    // Creating new subprogram
    auto position      = debug_info_->getPosition(&function);
    auto program_flags = llvm::DISubprogram::SPFlagDefinition;

    if (function.hasPrivateLinkage() || function.hasInternalLinkage())
    {
        program_flags |= llvm::DISubprogram::SPFlagLocalToUnit;
    }

    auto subprogram = builder_.createFunction(
        file_unit_, function.getName(), StringRef(), file_unit_, static_cast<uint32_t>(position.line()),
        createFunctionType(&function), static_cast<uint32_t>(position.line()), llvm::DINode::FlagZero, program_flags);
    function.setSubprogram(subprogram);

    function_debug_info_[&function] = subprogram;
}

void DebugInfoUpdater::visitInstruction(Instruction& instr)
{
    auto position = debug_info_->getPosition(&instr);
    if (position)
    {
        auto location = instr.getDebugLoc();

        // Skipping instructions with existing debug locations
        if (location)
        {
            return;
        }

        // Copying scope and inlined at if possible
        llvm::DILocalScope* scope{nullptr};
        llvm::DILocation*   inlined_at{nullptr};

        auto block    = instr.getParent();
        auto function = block->getParent();
        auto it       = function_debug_info_.find(function);

        // Sanity check
        if (it == function_debug_info_.end())
        {
            throw std::runtime_error("Could not find parent function - this is not supposed to happen.");
        }

        auto subprogram = it->second;
        scope           = subprogram;

        // Sanity check
        if (scope == nullptr)
        {
            throw std::runtime_error("Could not determine scope - this is not supposed to happen.");
        }

        // Updating the debug location
        auto new_debug_loc = llvm::DebugLoc(llvm::DILocation::get(
            module_.getContext(), static_cast<uint32_t>(position.line()), static_cast<uint32_t>(position.column()),
            scope, inlined_at));

        instr.setDebugLoc(new_debug_loc);
    }
}

} // namespace microsoft::quantum
