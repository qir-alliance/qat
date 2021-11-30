#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#if defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-value"
#pragma GCC diagnostic ignored "-Wsign-compare"
#pragma GCC diagnostic ignored "-Wunknown-warning-option"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wall"
#pragma GCC diagnostic ignored "-Weverything"
#endif

#if defined(__clang__)
#pragma Clang diagnostic push
#pragma Clang diagnostic ignored "-Wconversion"
#pragma Clang diagnostic ignored "-Wpedantic"
#pragma Clang diagnostic ignored "-Werror"
#pragma Clang diagnostic ignored "-Wshadow"
#pragma Clang diagnostic ignored "-Wreturn-std-move"
#pragma Clang diagnostic ignored "-Wunknown-warning-option"
#pragma Clang diagnostic ignored "-Wunused-parameter"
#pragma Clang diagnostic ignored "-Wall"
#pragma Clang diagnostic ignored "-Weverything"
#endif

// Passes
#include "llvm/Analysis/InlineCost.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/Inliner.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"

// Building
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"

// Reader tool
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Transforms/IPO/Inliner.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"

// Profiles
#include "llvm/LinkAllPasses.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Scalar/DCE.h"

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

#if defined(__clang__)
#pragma Clang diagnostic pop
#endif

#if defined(__GNUC__)
#pragma GCC diagnostic pop
#endif
