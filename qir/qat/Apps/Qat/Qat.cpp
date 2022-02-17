// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/// QIR Adaptor Tool (QAT)
///
/// QAT is a tool that helps the enduser to easily build and use new profiles. The tool provides a
/// commandline interface which is configurable through YAML files to validate a specific QIR
/// profile and generate a QIR profile compatible IR from a generic IR.
///
/// The tool itself make use of LLVM passes to perform analysis and transformations of the supplied
/// IR. These transfornations are described through high-level tasks such as
/// `useStaticQubitArrayAllocation`.
///
/// To provide an overview of the structure of this tool, we here provide a diagram showing the
/// relation between different instances in the program:
///
///
/// ```
/// ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
///            User input          │                  │      "Use" relation
/// └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─                   ▼
///                 │  argc, argv
///                 ▼                                 ─ ─▶   "Produce" relation
/// ┌──────────────────────────────┐
/// │       ParameterParser        │◀─┐ Setup arguments
/// └──────────────────────────────┘  │
///    Load config  │                 │
///                 ▼                 │
/// ┌──────────────────────────────┐  │            ┌──────────────────────────────────┐
/// │     ConfigurationManager     │──┘    ┌ ─ ─ ─▶│             Ruleset              │
/// └──────────────────────────────┘               └──────────────────────────────────┘
///  Provide config │                      │                         │   Rules for
///                 ▼                                                ▼ transformation
/// ┌───────────────────────────────┐─ ─ ─ ┘       ┌──────────────────────────────────┐
/// │       ProfileGenerator        │─ ─ ─ ─ ─ ─ ─▶│      TransformationRulesPass      │
/// └───────────────────────────────┘              └──────────────────────────────────┘
///                                                                  │  LLVM module
///                                                                  ▼      pass
/// ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─                ┌──────────────────────────────────┐
///              Output            │◀─ ─ ─ ─ ─ ─ ─ ┤  QAT / LLVM Module Pass Manager  │
/// └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─      stdout    └──────────────────────────────────┘
/// ```
///
///

#include "Apps/Qat/QatConfig.hpp"
#include "Commandline/ConfigurationManager.hpp"
#include "Commandline/ParameterParser.hpp"
#include "Generators/DefaultProfileGenerator.hpp"
#include "Generators/LlvmPassesConfiguration.hpp"
#include "GroupingPass/GroupingAnalysisPass.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "GroupingPass/GroupingPassConfiguration.hpp"
#include "Llvm/Llvm.hpp"
#include "ModuleLoader/ModuleLoader.hpp"
#include "Profile/Profile.hpp"
#include "Rules/Factory.hpp"
#include "Rules/FactoryConfig.hpp"
#include "TransformationRulesPass/TransformationRulesPass.hpp"
#include "TransformationRulesPass/TransformationRulesPassConfiguration.hpp"
#include "ValidationPass/ValidationPassConfiguration.hpp"
#include "Validator/Validator.hpp"

#include <dlfcn.h>
#include <iomanip>
#include <iostream>
#include <unordered_map>

using namespace llvm;
using namespace microsoft::quantum;
void init();
void init()
{
  // Initialize LLVM passes
  PassRegistry &registry = *PassRegistry::getPassRegistry();

  initializeCore(registry);

  initializeCoroutines(registry);
  initializeScalarOpts(registry);
  initializeObjCARCOpts(registry);
  initializeVectorization(registry);
  initializeIPO(registry);
  initializeAnalysis(registry);
  initializeTransformUtils(registry);
  initializeInstCombine(registry);
  initializeAggressiveInstCombine(registry);
  initializeInstrumentation(registry);
  initializeTarget(registry);

  initializeExpandMemCmpPassPass(registry);
  initializeScalarizeMaskedMemIntrinPass(registry);
  initializeCodeGenPreparePass(registry);
  initializeAtomicExpandPass(registry);
  initializeRewriteSymbolsLegacyPassPass(registry);
  initializeWinEHPreparePass(registry);
  initializeDwarfEHPreparePass(registry);
  initializeSafeStackLegacyPassPass(registry);
  initializeSjLjEHPreparePass(registry);
  initializePreISelIntrinsicLoweringLegacyPassPass(registry);
  initializeGlobalMergePass(registry);
  initializeIndirectBrExpandPassPass(registry);
  initializeInterleavedLoadCombinePass(registry);
  initializeInterleavedAccessPass(registry);
  initializeEntryExitInstrumenterPass(registry);
  initializePostInlineEntryExitInstrumenterPass(registry);
  initializeUnreachableBlockElimLegacyPassPass(registry);
  initializeExpandReductionsPass(registry);
  initializeWasmEHPreparePass(registry);
  initializeWriteBitcodePassPass(registry);
  initializeHardwareLoopsPass(registry);
  initializeTypePromotionPass(registry);
}

class PrePostLlvmPasses
{
public:
  void setup(ConfigurationManager &config)
  {
    config.setSectionName("LLVM optimisations",
                          "Enables specific LLVM optimisations before and after transformation.");

    // LLVM transformations
    config.addParameter(unroll_loops_, "unroll-loops", "Aggressively unroll loops.");
    config.addParameter(
        unroll_allow_partial_, "allow-partial",
        "Enables or disables partial unrolling. When disabled only full unrolling is allowed.");
    config.addParameter(unroll_allow_peeling_, "allow-peeling",
                        "Enables or disables loop peeling.");
    config.addParameter(unroll_allow_runtime_, "allow-runtime",
                        "Enables or disables unrolling of loops with runtime trip count.");
    config.addParameter(unroll_allow_upper_bound_, "allow-upper-bound",
                        "Enables or disables the use of trip count upper bound in loop unrolling.");
    config.addParameter(unroll_allow_profile_based_peeling_, "allow-profile-based-peeling",
                        "Enables or disables loop peeling basing on profile.");
    config.addParameter(unroll_full_unroll_count_, "full-unroll-count",
                        "Sets the max full unroll count.");
    config.addParameter(unroll_opt_level_, "unroll-opt-level",
                        "Sets the optimisation level for loop unrolling.");
    config.addParameter(
        unroll_only_when_forced_, "only-when-forced",
        "If true, only loops that explicitly request unrolling via metadata are considered.");
    config.addParameter(
        unroll_forget_scev_, "forget-scev",
        "If true, forget all loops when unrolling. If false, forget top-most loop of "
        "the currently processed loops.");

    config.addParameter(always_inline_, "always-inline", "Aggressively inline function calls.");

    config.addParameter(inline_parameter_, "inlining-parameter",
                        "Number of code lines acceptable when inlining.");

    config.addExperimentalParameter(use_llvm_opt_pipeline_, false, false, "use-llvm-opt-pipeline",
                                    "Disables the the default pipeline.");

    config.addExperimentalParameter(opt_pipeline_config_, static_cast<String>(""),
                                    static_cast<String>(""), "opt-pipeline-config",
                                    "LLVM passes pipeline to use upon applying this component.");
  }

  /// Whether or not the LLVM AlwaysInline pass should be added to the profile.
  bool alwaysInline() const
  {
    return always_inline_;
  }

  /// Whether or not the LLVM LoopUnroll pass should be added to the profile
  bool unrollLoops() const
  {
    return unroll_loops_;
  }

  /// Parameter that defines the maximum number of lines of code allowed for inlining.
  int32_t inlineParameter() const
  {
    return inline_parameter_;
  }

  bool unrollAllowPartial() const
  {
    return unroll_allow_partial_;
  }

  bool unrollAllowPeeling() const
  {
    return unroll_allow_peeling_;
  }

  bool unrollAllowRuntime() const
  {
    return unroll_allow_runtime_;
  }

  bool unrollAllowUpperBound() const
  {
    return unroll_allow_upper_bound_;
  }

  bool unrollAllowProfilBasedPeeling() const
  {
    return unroll_allow_profile_based_peeling_;
  }

  uint64_t unrolFullUnrollCount() const
  {
    return unroll_full_unroll_count_;
  }

  int32_t unrollOptLevel() const
  {
    return unroll_opt_level_;
  }

  bool unrollOnlyWhenForced() const
  {
    return unroll_only_when_forced_;
  }

  bool unrollForgeScev() const
  {
    return unroll_forget_scev_;
  }

  bool useLlvmOptPipeline() const
  {
    return use_llvm_opt_pipeline_;
  }

  String optPipelineConfig() const
  {
    return opt_pipeline_config_;
  }

private:
  bool    always_inline_{false};  ///< Whether or not LLVM component should inline.
  int32_t inline_parameter_{std::numeric_limits<int32_t>::max()};

  bool     unroll_loops_{false};  ///< Whether or not LLVM should unroll loops
  bool     unroll_allow_partial_{true};
  bool     unroll_allow_peeling_{true};
  bool     unroll_allow_runtime_{true};
  bool     unroll_allow_upper_bound_{true};
  bool     unroll_allow_profile_based_peeling_{true};
  uint64_t unroll_full_unroll_count_{1024};
  int32_t  unroll_opt_level_{3};
  bool     unroll_only_when_forced_{false};
  bool     unroll_forget_scev_{false};

  bool   use_llvm_opt_pipeline_{false};
  String opt_pipeline_config_{""};
};

int main(int argc, char **argv)
{

  try
  {
    // Default generator. A future version of QAT may allow the generator to be selected
    // through the command line, but it is hard coded for now.
    auto generator = std::make_shared<ProfileGenerator>();

    // Configuration and command line parsing
    //

    ConfigurationManager &configuration_manager = generator->configurationManager();
    configuration_manager.addConfig<QatConfig>();
    configuration_manager.addConfig<FactoryConfiguration>();

    ParameterParser parser;
    configuration_manager.setupArguments(parser);
    parser.parseArgs(argc, argv);
    configuration_manager.configure(parser);

    // Getting the main configuration
    auto config = configuration_manager.get<QatConfig>();

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName(config.profile()));

    // Loading components
    //

    generator->registerProfileComponent<PrePostLlvmPasses>(
        "llvm-optimisation",
        [](PrePostLlvmPasses const &cfg, ProfileGenerator *ptr, Profile &profile) {
          // Always inline
          if (cfg.alwaysInline())
          {
            auto &mpm          = ptr->modulePassManager();
            auto &pass_builder = ptr->passBuilder();
            mpm.addPass(llvm::AlwaysInlinerPass());
            auto                           inline_param = getInlineParams(cfg.inlineParameter());
            llvm::ModuleInlinerWrapperPass inliner_pass = ModuleInlinerWrapperPass(inline_param);
            mpm.addPass(std::move(inliner_pass));
          }

          // Unroll loop
          if (cfg.unrollLoops())
          {
            auto &mpm          = ptr->modulePassManager();
            auto &pass_builder = ptr->passBuilder();

            /// More unroll parameters
            /// https://llvm.org/doxygen/LoopUnrollPass_8cpp.html

            /// Header
            /// https://llvm.org/doxygen/LoopUnrollPass_8h.html

            llvm::LoopUnrollOptions loop_config(cfg.unrollOptLevel(), cfg.unrollOnlyWhenForced(),
                                                cfg.unrollForgeScev());

            loop_config.setPartial(cfg.unrollAllowPartial())
                .setPeeling(cfg.unrollAllowPeeling())
                .setRuntime(cfg.unrollAllowRuntime())
                .setUpperBound(cfg.unrollAllowUpperBound())
                .setProfileBasedPeeling(cfg.unrollAllowProfilBasedPeeling())
                .setFullUnrollMaxCount(cfg.unrolFullUnrollCount());

            mpm.addPass(createModuleToFunctionPassAdaptor(llvm::LoopUnrollPass(loop_config)));
          }

          if (cfg.useLlvmOptPipeline())
          {
            auto                                 pass_pipeline = cfg.optPipelineConfig();
            llvm::PassBuilder::OptimizationLevel opt           = ptr->optimisationLevel();
            if (!pass_pipeline.empty())
            {
              auto &pass_builder = ptr->passBuilder();
              auto &npm          = ptr->modulePassManager();

              if (auto err = pass_builder.parsePassPipeline(npm, pass_pipeline, false, false))
              {
                throw std::runtime_error("Failed to set pass pipeline up. Value: '" +
                                         pass_pipeline + "', error: " + toString(std::move(err)));
              }
            }
            else
            {
              auto &mpm = ptr->modulePassManager();

              // If not explicitly disabled, we fall back to the default LLVM pipeline
              auto                   &pass_builder = ptr->passBuilder();
              llvm::ModulePassManager pipeline1 = pass_builder.buildPerModuleDefaultPipeline(opt);
              mpm.addPass(std::move(pipeline1));

              llvm::ModulePassManager pipeline2 = pass_builder.buildModuleSimplificationPipeline(
                  opt, llvm::PassBuilder::ThinLTOPhase::None);
              mpm.addPass(std::move(pipeline2));

              llvm::ModulePassManager pipeline3 =
                  pass_builder.buildModuleOptimizationPipeline(opt, ptr->isDebugMode());
              mpm.addPass(std::move(pipeline3));
            }
          }
        });

    generator->registerProfileComponent<TransformationRulesPassConfiguration>(
        "transformation-rules", [](TransformationRulesPassConfiguration const &cfg,
                                   ProfileGenerator *ptr, Profile &profile) {
          auto &ret = ptr->modulePassManager();

          // Defining the mapping
          RuleSet rule_set;
          auto    factory = RuleFactory(rule_set, profile.getQubitAllocationManager(),
                                        profile.getResultAllocationManager());
          factory.usingConfiguration(ptr->configurationManager().get<FactoryConfiguration>());

          // Creating profile pass
          ret.addPass(TransformationRulesPass(std::move(rule_set), cfg, &profile));
        });

    generator->replicateProfileComponent("llvm-optimisation");

    if (!config.load().empty())
    {
      // TODO (issue-47): Add support for multiple loads
      void *handle = dlopen(config.load().c_str(), RTLD_LAZY);

      if (handle == nullptr)
      {
        std::cerr << "Invalid component " << config.load() << std::endl;
      }
      else
      {
        using LoadFunctionPtr = void (*)(ProfileGenerator *);
        LoadFunctionPtr load_component;
        load_component = reinterpret_cast<LoadFunctionPtr>(dlsym(handle, "loadComponent"));

        load_component(generator.get());
      }
    }

    generator->registerProfileComponent<GroupingPassConfiguration>(
        "grouping",
        [](GroupingPassConfiguration const &cfg, ProfileGenerator *ptr, Profile &profile) {
          auto &mam = profile.moduleAnalysisManager();
          mam.registerPass([&] { return GroupingAnalysisPass(cfg); });
          auto &ret = ptr->modulePassManager();

          ret.addPass(GroupingPass(cfg));
        });

    // Reconfiguring to get all the arguments of the passes registered
    parser.reset();

    configuration_manager.setupArguments(parser);
    parser.parseArgs(argc, argv);
    configuration_manager.configure(parser, config.isExperimental());

    // Checking that all command line parameters were used
    bool incorrect_settings = false;
    for (auto &prop : parser.unusedSettings())
    {
      llvm::errs()
          << "Unknown option or flag '" << prop
          << "'. If this is an experimental feature remember to add `--experimental` to enable it."
             "\n";
      incorrect_settings = true;
    }

    if (incorrect_settings)
    {
      return -1;
    }

    // In case we debug, we also print the settings to allow provide a full
    // picture of what is going. This step deliberately comes before validating
    // the input to allow dumping the configuration if something goes wrong.
    if (config.shouldDumpConfig())
    {
      configuration_manager.printConfiguration();
    }

    // Checking that we have sufficient information to proceed. If not we print
    // usage instructions and the corresponding description of how to use the tool.
    if (parser.arguments().empty())
    {
      std::cerr << "Usage: " << argv[0] << " [options] filename" << std::endl;
      configuration_manager.printHelp();
      std::cerr << "\n";
      exit(-1);
    }

    // Loading IR from file(s).
    //

    LLVMContext context;
    init();

    auto         module = std::make_unique<Module>("qat-link", context);
    ModuleLoader loader(module.get());

    for (auto const &arg : parser.arguments())
    {
      if (!loader.addIrFile(arg))
      {
        llvm::errs() << "Could not load " << arg << "\n";
        return -1;
      }
    }

    if (!module)
    {
      std::cerr << "Invalid IR." << std::endl;
      exit(-1);
    }

    // Getting the optimisation level
    //
    auto optimisation_level = llvm::PassBuilder::OptimizationLevel::O0;

    // Setting the optimisation level
    if (config.isOpt1Enabled())
    {
      optimisation_level = llvm::PassBuilder::OptimizationLevel::O1;
    }

    if (config.isOpt2Enabled())
    {
      optimisation_level = llvm::PassBuilder::OptimizationLevel::O2;
    }

    if (config.isOpt3Enabled())
    {
      optimisation_level = llvm::PassBuilder::OptimizationLevel::O3;
    }

    // Profile manipulation
    //

    // Creating the profile that will be used for generation and validation
    auto profile =
        generator->newProfile(config.profile(), optimisation_level, config.isDebugMode());

    if (config.shouldGenerate())
    {
      profile.apply(*module);
    }

    // We deliberately emit LLVM prior to verification and validation
    // to allow output the IR for debugging purposes.
    if (config.shouldEmitLlvm())
    {
      llvm::outs() << *module << "\n";
    }
    else
    {
      llvm::WriteBitcodeToFile(*module, llvm::outs());
    }

    if (config.verifyModule())
    {
      if (!profile.verify(*module))
      {
        std::cerr << "IR is broken." << std::endl;
        exit(-1);
      }
    }

    if (config.shouldValidate())
    {
      if (!profile.validate(*module))
      {
        std::cerr << "IR did not validate to the profile constraints." << std::endl;
        exit(-1);
      }
    }
  }
  catch (std::exception const &e)
  {
    std::cerr << "An error occurred: " << e.what() << std::endl;
    exit(-1);
  }

  return 0;
}
