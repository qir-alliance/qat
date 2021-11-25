#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Llvm/Llvm.hpp"
#include "QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_set>
#include <vector>

namespace microsoft {
namespace quantum {

class RemoveDisallowedAttributesPass : public llvm::PassInfoMixin<RemoveDisallowedAttributesPass>
{
public:
  RemoveDisallowedAttributesPass()
    : allowed_attrs_{{static_cast<String>("EntryPoint"), static_cast<String>("InteropFriendly")}}
  {}

  llvm::PreservedAnalyses run(llvm::Module &module, llvm::ModuleAnalysisManager & /*mam*/)
  {
    std::string const LLVM_FUNC_NAME = "@llvm.";
    for (auto &fnc : module)
    {
      std::unordered_set<String> to_keep;
      auto                       name = static_cast<std::string>(fnc.getName());

      // Skipping any LLVM function
      /*
      if (name.size() >= LLVM_FUNC_NAME.size() &&
          name.substr(0, LLVM_FUNC_NAME.size()) == LLVM_FUNC_NAME)
      {
        continue;
      }
      */
      // Finding all valid attributes
      for (auto &attrset : fnc.getAttributes())
      {
        for (auto &attr : attrset)
        {
          auto r = static_cast<String>(attr.getAsString());

          // Stripping quotes
          if (r.size() >= 2 && r[0] == '"' && r[r.size() - 1] == '"')
          {
            r = r.substr(1, r.size() - 2);
          }

          // Inserting if allowed
          if (allowed_attrs_.find(r) != allowed_attrs_.end())
          {
            to_keep.insert(r);
          }
        }
      }

      // Deleting every
      fnc.setAttributes({});
      for (auto &attr : to_keep)
      {
        fnc.addFnAttr(attr);
      }
      /*
      // Updating all users attributes
      for (auto user : fnc.users())
      {
        auto call = llvm::dyn_cast<llvm::CallInst>(user);
        if (call != nullptr)
        {
          call->setAttributes(fnc.getAttributes());
        }
      }
      */
    }

    return llvm::PreservedAnalyses::none();
  }

private:
  std::unordered_set<String> allowed_attrs_;
};

}  // namespace quantum
}  // namespace microsoft
