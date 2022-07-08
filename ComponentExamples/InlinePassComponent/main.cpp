// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Generators/ProfileGenerator.hpp"
using namespace microsoft::quantum;

extern "C" void loadComponent(ProfileGenerator* generator);

class InlinerConfig
{
  public:
    using String = std::string;

    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Inliner component", "Adds the LLVM Always Inline Pass to the profile");
        config.addParameter(inline_, "custom-inliner", "Activating the custom inliner.");
    }

    bool shouldInline() const
    {
        return inline_;
    }

  private:
    bool inline_{false}; ///< Default behaviour is that we do not add the inliner pass
};

extern "C" void loadComponent(ProfileGenerator* generator)
{
    generator->registerProfileComponent<InlinerConfig>(
        "inliner",
        [](InlinerConfig const& cfg, ProfileGenerator& generator, Profile& /*profile*/)
        {
            if (cfg.shouldInline())
            {
                auto& module_pass_manager = generator.modulePassManager();

                // Adds the inline pipeline
                auto& pass_builder = generator.passBuilder();
                auto  inliner_pass =
                    pass_builder.buildInlinerPipeline(generator.optimizationLevel(), llvm::ThinOrFullLTOPhase::None);

                module_pass_manager.addPass(std::move(inliner_pass));
            }
        });
}
