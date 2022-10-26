#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/SpecConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

class RemoveDisallowedAttributesPass : public llvm::PassInfoMixin<RemoveDisallowedAttributesPass>
{
  public:
    explicit RemoveDisallowedAttributesPass(SpecConfiguration const& /*spec*/)
      : allowed_attrs_{
            // TODO(issue UNTRACKED): These attributes are deprecated and should be removed once Q# is upgraded
            static_cast<String>("EntryPoint"),
            static_cast<String>("InteropFriendly"),
            static_cast<String>("requiredQubits"),
            static_cast<String>("requiredResults"),
            static_cast<String>("replaceWith"),

            // New attributes
            // TODO(issue UNTRACKED): get these from the specification
            static_cast<String>("entry_point"),
            static_cast<String>("qir_profiles"),
            static_cast<String>("output_labeling_schema"),
            static_cast<String>("required_num_qubits"),
            static_cast<String>("required_num_results"),
            static_cast<String>("replace_with"),
            static_cast<String>("irreversible"),
        }
    {
    }

    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
    {
        for (auto& fnc : module)
        {
            std::unordered_map<String, String> to_keep;
            auto                               name = static_cast<std::string>(fnc.getName());

            // Skipping any LLVM function
            if (fnc.isIntrinsic())
            {
                continue;
            }

            // Finding all valid attributes
            for (auto& attrset : fnc.getAttributes())
            {
                for (auto& attr : attrset)
                {
                    auto        r = static_cast<String>(attr.getAsString());
                    std::string value{};

                    auto p = r.find('=');
                    if (p != std::string::npos)
                    {
                        value = r.substr(p + 1, r.size() - p - 1);
                        r     = r.substr(0, p);
                    }

                    // Stripping quotes
                    if (r.size() >= 2 && r[0] == '"' && r[r.size() - 1] == '"')
                    {
                        r = r.substr(1, r.size() - 2);
                    }

                    if (value.size() >= 2 && value[0] == '"' && value[value.size() - 1] == '"')
                    {
                        value = value.substr(1, value.size() - 2);
                    }

                    // Inserting if allowed
                    if (allowed_attrs_.find(r) != allowed_attrs_.end())
                    {
                        to_keep.insert(std::make_pair(r, value));
                    }
                }
            }

            // Deleting every
            fnc.setAttributes({});
            for (auto& attr : to_keep)
            {
                if (attr.second.empty())
                {
                    fnc.addFnAttr(attr.first);
                }
                else
                {
                    fnc.addFnAttr(attr.first, attr.second);
                }
            }

            // Updating all users attributes
            for (auto user : fnc.users())
            {
                auto call = llvm::dyn_cast<llvm::CallInst>(user);
                if (call != nullptr)
                {
                    call->setAttributes(fnc.getAttributes());
                }
            }
        }

        return llvm::PreservedAnalyses::none();
    }

  private:
    std::unordered_set<String> allowed_attrs_;
};

} // namespace microsoft::quantum
