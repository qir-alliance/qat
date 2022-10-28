// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/// QIR Adaptor Tool (QAT)
///
/// QAT is a tool that helps the enduser to easily build and use new adaptors. The tool provides a
/// commandline interface which is configurable through YAML files to validate a specific QIR
/// adaptor and generate a QIR adaptor compatible IR from a generic IR.
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
/// ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
///                          User input
/// └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┬ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
/// ┌─────────────────────────────▼─────────────────────────────┐
/// │            Configuration and paramater parser             │
/// └─────────────┬───────────────────────────────┬─────────────┘
/// ┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
/// │        LLVM (Q)IRs        │   │      QirAdaptor config    │
/// └─────────────┬─────────────┘   └─────────────┬─────────────┘
/// ┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
/// │       Module loader       │   │     QirAdaptor Generator  │
/// └─────────────┬─────────────┘   └─────────────┬─────────────┘
/// ┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
/// │       Single module       │   │          QirAdaptor       │
/// │      transformations      │   └──────┬──────────────┬─────┘
/// └─────────────┬─────────────┘   ┌──────▼─────┐ ┌──────▼─────┐
/// ┌─────────────▼─────────────┐   │            │ │            │
/// │   Adding debug symbols    ├───▶ Generation ├─┼▶Validation ├─────┐
/// └───────────────────────────┘   │            │ │            │     │
///                                 └──────┬─────┘ └──────┬─────┘     │
///                                 ┌──────▼──────────────▼─────┐     │
///                                 │          Logger           │     │
///                                 └───────────────────────────┘     │
///                                               │                   │
///                                               ▼                   ▼
///                                      ┌ ─ ─ ─ ─ ─ ─ ─ ─ ┐┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
///                                        Standard error     Standard Output:
///                                      │    or file:     ││   Resulting IR    │
///                                           JSON Logs
///                                      └ ─ ─ ─ ─ ─ ─ ─ ─ ┘└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
/// ```
///
///

#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Apps/Qat/QatConfig.hpp"
#include "qir/qat/Apps/Qat/QirAdaptorConfiguration.hpp"
#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Commandline/ParameterParser.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/CommentLogger.hpp"
#include "qir/qat/ModuleLoader/ModuleLoader.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingAnalysisPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPass.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"
#include "qir/qat/QirAdaptor/QirAdaptor.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"
#include "qir/qat/Validator/Validator.hpp"
#include "qir/qat/Version/Version.hpp"

#ifndef _WIN32
#include <dlfcn.h>
#endif

#include <fstream>
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
    initializeCodeGenPreparePass(registry);
    initializeAtomicExpandPass(registry);
    initializeRewriteSymbolsLegacyPassPass(registry);
    initializeWinEHPreparePass(registry);

    initializeWasmEHPreparePass(registry);
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

int main(int argc, char const** argv)
{
    int ret = 0;

    try
    {
        ConfigurationManager configuration_manager;

        // Default generator. A future version of QAT may allow the generator to be selected
        // through the command line, but it is hard coded for now.
        auto generator = std::make_unique<QirAdaptorFactory>(configuration_manager);

        // Configuration and command line parsing
        //

        configuration_manager.addConfig<QatConfig>("qat");

        ParameterParser parser;
        configuration_manager.setupArguments(parser);
        parser.parseArgs(argc, argv);
        configuration_manager.configure(parser);

        // Getting the main configuration
        auto config = configuration_manager.get<QatConfig>();

        if (config.showVersion())
        {
            llvm::errs() << "v. " << microsoft::quantum::version::FULL << "\n\n";
            exit(0);
        }

        // Setting logger up
        std::shared_ptr<ILogger> logger{nullptr};

        // Updating logger based on whether we are dumping output
        if (!config.saveReportTo().empty())
        {
            logger = std::make_shared<LogCollection>();
        }
        else
        {
            logger = std::make_shared<CommentLogger>();
        }

        generator->setLogger(logger);

        // Setting default component pipelines up
        generator->setupDefaultComponentPipeline();

        // Loading components
        //

        if (!config.load().empty())
        {
#ifndef _WIN32
            // TODO (issue-47): Add support for multiple loads
            void* handle = dlopen(config.load().c_str(), RTLD_LAZY);

            if (handle == nullptr)
            {
                std::cerr << "Invalid component " << config.load() << std::endl;
            }
            else
            {
                using LoadFunctionPtr = void (*)(QirAdaptorFactory*);
                LoadFunctionPtr load_component;
                load_component = reinterpret_cast<LoadFunctionPtr>(dlsym(handle, "loadAdaptor"));

                load_component(generator.get());
            }
#else
            throw std::runtime_error("Dynamic modules not supported on the Windows platform.");
#endif
        }

        // Setting adaptor validation configuration
        configuration_manager.addConfig<TargetProfileConfiguration>(
            "target.profile", TargetProfileConfiguration::fromQirTargetName("generic"));
        configuration_manager.addConfig<TargetQisConfiguration>(
            "target.qis", TargetQisConfiguration::fromQirTargetName("generic"));

        // Reconfiguring to get all the arguments of the passes registered
        parser.reset();

        configuration_manager.setupArguments(parser);
        parser.parseArgs(argc, argv);

        // Loading configuration file if needed
        if (!config.targetDefinition().empty())
        {
            configuration_manager.loadConfig(config.targetDefinition());
        }

        // Configure the manager based on the commandline arguments
        configuration_manager.configure(parser, config.isExperimental());

        // Reloading config to ensure that target QAT section is correctly loaded
        config = configuration_manager.get<QatConfig>();

        // Saving configuration if requested to do so
        if (!config.saveConfigTo().empty())
        {
            configuration_manager.saveConfig(config.saveConfigTo());
        }

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
            std::cerr << "\n";
        }

        // Shows help if needed
        if (config.showHelp())
        {
            configuration_manager.printHelp(config.isExperimental());
        }

        // Returns from program if no input files were provided
        if (parser.arguments().empty())
        {
            exit(-1);
        }

        // Loading IR from file(s).
        //

        LLVMContext context;
        init();

        auto         spec   = configuration_manager.get<SpecConfiguration>();
        auto         module = std::make_unique<Module>("qat-link", context);
        ModuleLoader loader(spec, module.get(), config.stripExistingDebugInfo(), config.addIrDebugInfo());

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

        // Making LLVM locations resolvable
        auto location_table = loader.locationTable();
        logger->setLocationResolver([location_table](llvm::Value const* val)
                                    { return location_table->getPosition(val); });
        logger->setLocationFromNameResolver([location_table](String const& name)
                                            { return location_table->getPositionFromFunctionName(name); });

        // Getting the optimization level
        //
        auto optimization_level = llvm::OptimizationLevel::O0;

        // Setting the optimization level
        if (config.isOpt1Enabled())
        {
            optimization_level = llvm::OptimizationLevel::O1;
        }

        if (config.isOpt2Enabled())
        {
            optimization_level = llvm::OptimizationLevel::O2;
        }

        if (config.isOpt3Enabled())
        {
            optimization_level = llvm::OptimizationLevel::O3;
        }

        // QirAdaptor manipulation
        //

        // Creating the adaptor that will be used for generation and validation
        generator->newAdaptorContext(config.targetName(), config.isDebugMode());

        for (auto& pipeline_name : config.adaptorPipeline())
        {
            generator->addComponent("adaptor." + pipeline_name);
        }

        auto adaptor = generator->finalizeAdaptor();

        if (config.shouldGenerate())
        {
            adaptor->apply(*module);

            //  Preventing subsequent routines to run if errors occurred.
            if (logger && logger->hadErrors())
            {
                ret = -1;
            }
        }

        // We deliberately emit LLVM prior to verification and validation
        // to allow output the IR for debugging purposes.
        if (ret == 0)
        {
            if (config.outputFile().empty())
            {
                if (config.shouldEmitHumanReadibleLlvm())
                {
                    llvm::outs() << *module << "\n";
                }
                else
                {
                    llvm::WriteBitcodeToFile(*module, llvm::outs());
                }
            }
            else
            {
                std::error_code      ec;
                llvm::raw_fd_ostream fout(config.outputFile(), ec);

                if (config.shouldEmitHumanReadibleLlvm())
                {
                    fout << *module << "\n";
                }
                else
                {
                    llvm::WriteBitcodeToFile(*module, fout);
                }

                if (ec.value() != 0)
                {
                    throw std::runtime_error("Failed to write output to file.");
                }
            }
        }

        if (ret == 0 && config.verifyModule())
        {
            if (!adaptor->verify(*module))
            {
                std::cerr << "IR is broken." << std::endl;
                ret = -1;
            }
        }

        if (ret == 0 && config.shouldValidate())
        {
            if (!adaptor->validate(*module))
            {
                std::cerr << "IR did not validate to the adaptor constraints." << std::endl;
                ret = -1;
            }
        }

        // Safety pre-caution to ensure that all errors and warnings reported
        // results in failure.
        if (logger && logger->hadErrors())
        {
            ret = -1;
        }

        // Saving output
        if (logger && !config.saveReportTo().empty())
        {
            std::fstream fout(config.saveReportTo(), std::ios::out);
            logger->dump(fout);
            fout.close();
        }
    }
    catch (std::exception const& e)
    {
        std::cerr << "An error occurred: " << e.what() << std::endl;
        ret = -1;
    }

    return ret;
}
