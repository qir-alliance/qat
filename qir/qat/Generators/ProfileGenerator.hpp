#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/Profile/Profile.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

class ProfileGenerator
{
  public:
    // LLVM types
    //
    using PassBuilder             = llvm::PassBuilder;
    using OptimizationLevel       = llvm::OptimizationLevel;
    using FunctionAnalysisManager = llvm::FunctionAnalysisManager;

    /// Setup function that uses a configuration type R to
    /// configure the profile and/or generator.
    template <typename R> using SetupFunction = std::function<void(R const&, ProfileGenerator&, Profile&)>;

    /// Wrapper function type for invoking the profile setup function
    using SetupFunctionWrapper = std::function<void(ProfileGenerator&, Profile&)>;

    /// List of components to be configured.
    using Components = std::vector<std::pair<String, SetupFunctionWrapper>>;

    using ILoggerPtr = ILogger::ILoggerPtr;

    // Construction, moves and copies
    //

    ProfileGenerator()                        = default;
    ~ProfileGenerator()                       = default;
    ProfileGenerator(ProfileGenerator const&) = delete;
    ProfileGenerator(ProfileGenerator&&)      = delete;
    ProfileGenerator& operator=(ProfileGenerator const&) = delete;
    ProfileGenerator& operator=(ProfileGenerator&&) = delete;

    // Profile generation interface
    //

    /// Reference to configuration manager. This property allows to access and modify configurations
    /// of the generator. This property is intended for managing the configuration.
    ConfigurationManager& configurationManager();

    /// Constant reference to the configuration manager. This property allows read access to the
    /// configuration manager and is intended for profile generation.
    ConfigurationManager const& configurationManager() const;

    /// Creates a new profile based on the registered components, optimization level and debug
    /// requirements. The returned profile can be applied to an IR to transform it in accordance with
    /// the configurations given.
    std::shared_ptr<Profile> newProfile(String const& name, OptimizationLevel const& optimization_level, bool debug);

    // Defining the generator

    //

    /// Registers a new profile component with a given configuration R. The profile component is
    /// given a name and a setup function which is responsible for configuring the profile in
    /// accordance with the configuration.
    template <typename R> void registerProfileComponent(String const& id, SetupFunction<R> setup);

    /// Replaces a profile component. This function is useful for testing purposes and alteration to
    /// the default set of components. For instance, one can setup a production set of components and
    /// then replace a single component to test the effects of this single replacement while keeping
    /// all other components actually as they are in production.
    template <typename R> void replaceProfileComponent(String const& id, SetupFunction<R> setup);

    /// Registers a new profile component with a given configuration R. Unlike
    /// `registerProfileComponent` this component will not have an ID.
    template <typename R> void registerAnonymousProfileComponent(SetupFunction<R> setup);

    /// Replicates an existing component as an anonymous component. The original component is found by
    /// its id and then copied as an anonymous component which is appended to the list of components.
    void replicateProfileComponent(String const& id);

    // Support properties for generators
    //

    /// Returns the module pass manager.
    llvm::ModulePassManager& modulePassManager();

    /// Returns the module pass manager.
    llvm::FunctionPassManager& functionPassManager();

    /// Returns the pass builder.
    llvm::PassBuilder& passBuilder();

    /// Returns the optimization level.
    OptimizationLevel optimizationLevel() const;

    /// Flag indicating whether we are operating in debug mode or not.
    bool isDebugMode() const;

    /// Sets the default pipeline up.
    void setupDefaultComponentPipeline();

    void setLogger(ILoggerPtr const& logger = nullptr);

  protected:
    /// Internal function that creates a module pass for QIR transformation. The module pass is
    /// defined through the profile, the optimization level and whether or not we are in debug mode.
    void configureGeneratorFromProfile(Profile& profile, OptimizationLevel const& optimization_level, bool debug);

    /// Internal function that creates a module pass for QIR validation. At the moment, this function
    /// is a placeholder for future functionality.
    llvm::ModulePassManager createValidationModulePass(
        PassBuilder&             pass_builder,
        OptimizationLevel const& optimization_level,
        bool                     debug);

  private:
    ILoggerPtr           logger_{nullptr};       ///< Logger used to output messages
    ConfigurationManager configuration_manager_; ///< Holds the configuration that defines the profile
    Components           components_;            ///< List of registered components that configures the profile

    /// Pointer to the module pass manager the profile will use
    llvm::ModulePassManager* module_pass_manager_{nullptr};

    /// Pointer to the module pass manager the profile will use
    llvm::FunctionPassManager* function_pass_manager_{nullptr};

    /// Pointer to the pass builder the profile is based on
    llvm::PassBuilder* pass_builder_{nullptr};

    /// Optimization level used by LLVM
    OptimizationLevel optimization_level_{OptimizationLevel::O0};

    /// Whether or not we are in debug mode
    bool debug_{false};
};

template <typename R> void ProfileGenerator::registerProfileComponent(String const& id, SetupFunction<R> setup)
{
    configuration_manager_.addConfig<R>(id);

    auto setup_wrapper = [setup](ProfileGenerator& generator, Profile& profile)
    {
        if (generator.configuration_manager_.isActive<R>())
        {
            auto& config = generator.configuration_manager_.get<R>();

            setup(config, generator, profile);
        }
    };

    components_.push_back({id, std::move(setup_wrapper)});
}

template <typename R> void ProfileGenerator::replaceProfileComponent(String const& id, SetupFunction<R> setup)
{
    auto setup_wrapper = [setup](ProfileGenerator& generator, Profile& profile)
    {
        if (generator.configuration_manager_.isActive<R>())
        {
            auto& config = generator.configuration_manager_.get<R>();

            setup(config, generator, profile);
        }
    };

    for (auto& component : components_)
    {
        if (component.first == id)
        {
            component.second = std::move(setup_wrapper);
            return;
        }
    }

    throw std::runtime_error("Could not find component " + id);
}

template <typename R> void ProfileGenerator::registerAnonymousProfileComponent(SetupFunction<R> setup)
{
    if (!configuration_manager_.configWasRegistered<R>())
    {
        throw std::runtime_error("Configuration '" + static_cast<String>(typeid(R).name()) + "' does not exist.");
    }

    auto setup_wrapper = [setup](ProfileGenerator& generation, Profile& profile)
    {
        if (generation.configuration_manager_.isActive<R>())
        {
            auto& config = generation.configuration_manager_.get<R>();

            setup(config, generation, profile);
        }
    };

    components_.push_back({"__unnamed__", std::move(setup_wrapper)});
}

} // namespace microsoft::quantum
