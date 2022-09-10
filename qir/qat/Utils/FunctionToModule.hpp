#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
namespace microsoft::quantum
{

class FunctionToModule : public llvm::PassInfoMixin<FunctionToModule>
{
  public:
    // Construction and destruction configuration.
    //

    explicit FunctionToModule(llvm::FunctionPassManager&& manager)
      : manager_{std::move(manager)}
    {
    }

    /// Copy construction is banned.
    FunctionToModule(FunctionToModule const&) = delete;

    /// We allow move semantics.
    FunctionToModule(FunctionToModule&&) = default;

    /// Default destruction.
    ~FunctionToModule() = default;
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
    {
        llvm::FunctionAnalysisManager& fam =
            mam.getResult<llvm::FunctionAnalysisManagerModuleProxy>(module).getManager();

        for (auto& f : module)
        {
            if (f.isDeclaration())
            {
                continue;
            }

            auto ret = manager_.run(f, fam);
            fam.invalidate(f, ret);
        }

        return llvm::PreservedAnalyses::none();
    }
    /// Whether or not this pass is required to run.
    static bool isRequired()
    {
        return true;
    }

  private:
    llvm::FunctionPassManager manager_;
};
} // namespace microsoft::quantum
