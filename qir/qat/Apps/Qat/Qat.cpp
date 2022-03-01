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
/// │       ProfileGenerator        │─ ─ ─ ─ ─ ─ ─▶│      TransformationRulesPass     │
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
#include "Generators/ConfigurableProfileGenerator.hpp"
#include "Generators/LlvmPassesConfiguration.hpp"
#include "GroupingPass/GroupingAnalysisPass.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "GroupingPass/GroupingPassConfiguration.hpp"
#include "ModuleLoader/ModuleLoader.hpp"
#include "Profile/Profile.hpp"
#include "Rules/Factory.hpp"
#include "Rules/FactoryConfig.hpp"
#include "TransformationRulesPass/TransformationRulesPass.hpp"
#include "TransformationRulesPass/TransformationRulesPassConfiguration.hpp"
#include "ValidationPass/ValidationPassConfiguration.hpp"
#include "Validator/Validator.hpp"

#include "Llvm/Llvm.hpp"

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
    PassRegistry& registry = *PassRegistry::getPassRegistry();

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

int main(int argc, char** argv)
{

    try
    {
        // Default generator. A future version of QAT may allow the generator to be selected
        // through the command line, but it is hard coded for now.
        auto generator = std::make_shared<ProfileGenerator>();

        // Configuration and command line parsing
        //

        ConfigurationManager& configuration_manager = generator->configurationManager();
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

        // Setting default component pipelines up
        generator->setupDefaultComponentPipeline();

        // Loading components
        //

        if (!config.load().empty())
        {
            // TODO (issue-47): Add support for multiple loads
            void* handle = dlopen(config.load().c_str(), RTLD_LAZY);

            if (handle == nullptr)
            {
                std::cerr << "Invalid component " << config.load() << std::endl;
            }
            else
            {
                using LoadFunctionPtr = void (*)(ProfileGenerator*);
                LoadFunctionPtr load_component;
                load_component = reinterpret_cast<LoadFunctionPtr>(dlsym(handle, "loadComponent"));

                load_component(generator.get());
            }
        }

        // Reconfiguring to get all the arguments of the passes registered
        parser.reset();

        configuration_manager.setupArguments(parser);
        parser.parseArgs(argc, argv);
        configuration_manager.configure(parser, config.isExperimental());

        // Checking that all command line parameters were used
        bool incorrect_settings = false;
        for (auto& prop : parser.unusedSettings())
        {
            llvm::errs() << "Unknown option or flag '" << prop
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
            configuration_manager.printHelp(config.isExperimental());
            std::cerr << "\n";
            exit(-1);
        }

        // Loading IR from file(s).
        //

        LLVMContext context;
        init();

        auto         module = std::make_unique<Module>("qat-link", context);
        ModuleLoader loader(module.get());

        for (auto const& arg : parser.arguments())
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

        // Getting the optimization level
        //
        auto optimization_level = llvm::PassBuilder::OptimizationLevel::O0;

        // Setting the optimization level
        if (config.isOpt1Enabled())
        {
            optimization_level = llvm::PassBuilder::OptimizationLevel::O1;
        }

        if (config.isOpt2Enabled())
        {
            optimization_level = llvm::PassBuilder::OptimizationLevel::O2;
        }

        if (config.isOpt3Enabled())
        {
            optimization_level = llvm::PassBuilder::OptimizationLevel::O3;
        }

        // Profile manipulation
        //

        // Creating the profile that will be used for generation and validation
        auto profile = generator->newProfile(config.profile(), optimization_level, config.isDebugMode());

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
    catch (std::exception const& e)
    {
        std::cerr << "An error occurred: " << e.what() << std::endl;
        exit(-1);
    }

    return 0;
}
