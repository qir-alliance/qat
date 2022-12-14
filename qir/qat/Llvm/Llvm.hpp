#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#if defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-value"
#pragma GCC diagnostic ignored "-Wsign-compare"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wall"
#endif

#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wconversion"
#pragma clang diagnostic ignored "-Wpedantic"
#pragma clang diagnostic ignored "-Werror"
#pragma clang diagnostic ignored "-Wshadow"
#pragma clang diagnostic ignored "-Wreturn-std-move"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wall"
#pragma clang diagnostic ignored "-Weverything"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// Building
#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"

// Reader tool
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

// QirAdaptors
#include "llvm/LinkAllPasses.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Scalar/DCE.h"
#include "llvm/Transforms/Utils/LowerSwitch.h"

// Const folding
#include "llvm/Analysis/ConstantFolding.h"

// Linking
#include "llvm/Linker/Linker.h"

// Bitcode output
#include "llvm/Bitcode/BitcodeWriter.h"

/// Initialization

#include "llvm/InitializePasses.h"
#include "llvm/LinkAllIR.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/MC/SubtargetFeature.h"
#include "llvm/Passes/StandardInstrumentations.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Target/TargetMachine.h"

// Debugging
#include "llvm/IR/DebugInfoMetadata.h"

// Passes
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/Analysis/InlineCost.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/JITLink/JITLinkMemoryManager.h"
#include "llvm/ExecutionEngine/JITSymbol.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/Orc/CompileOnDemandLayer.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/ExecutionEngine/Orc/EPCDynamicLibrarySearchGenerator.h"
#include "llvm/ExecutionEngine/Orc/EPCIndirectionUtils.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/ExecutionEngine/Orc/ExecutorProcessControl.h"
#include "llvm/ExecutionEngine/Orc/IRCompileLayer.h"
#include "llvm/ExecutionEngine/Orc/IRTransformLayer.h"
#include "llvm/ExecutionEngine/Orc/JITTargetMachineBuilder.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/ObjectLinkingLayer.h"
#include "llvm/ExecutionEngine/Orc/OrcABISupport.h"
#include "llvm/ExecutionEngine/Orc/RTDyldObjectLinkingLayer.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/InitializePasses.h"
#include "llvm/LinkAllIR.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/Linker/Linker.h"
#include "llvm/MC/SubtargetFeature.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Passes/StandardInstrumentations.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Transforms/IPO/ForceFunctionAttrs.h"
#include "llvm/Transforms/IPO/GlobalDCE.h"
#include "llvm/Transforms/IPO/InferFunctionAttrs.h"
#include "llvm/Transforms/IPO/Inliner.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Instrumentation.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Scalar/DCE.h"
#include "llvm/Transforms/Scalar/EarlyCSE.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"
#include "llvm/Transforms/Scalar/Reassociate.h"
#include "llvm/Transforms/Scalar/SCCP.h"
#include "llvm/Transforms/Scalar/SROA.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/LowerSwitch.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"

#if defined(__clang__)
#pragma Clang diagnostic pop
#endif

#if defined(__GNUC__)
#pragma GCC diagnostic pop
#endif
