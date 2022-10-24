#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"
#include "qir/qat/QirAdaptor/QirAdaptor.hpp"

namespace microsoft::quantum
{

class QirAdaptorFactory
{
  public:
    // LLVM types
    //
    using PassBuilder               = llvm::PassBuilder;
    using OptimizationLevel         = llvm::OptimizationLevel;
    using FunctionAnalysisManager   = llvm::FunctionAnalysisManager;
    using QirAdaptorPtr             = std::shared_ptr<QirAdaptor>;
    using BasicAllocationManagerPtr = std::shared_ptr<BasicAllocationManager>;
    using FunctionPassManager       = llvm::FunctionPassManager;

    /// Setup function that uses a configuration type R to
    /// configure the adaptor and/or generator.
    template <typename R> using SetupFunction = std::function<void(R const&, QirAdaptor&)>;

    /// Wrapper function type for invoking the adaptor setup function
    using SetupFunctionWrapper = std::function<void(QirAdaptorFactory&, QirAdaptor&)>;

    /// List of components to be configured.
    using Components = std::vector<std::pair<String, SetupFunctionWrapper>>;

    using ILoggerPtr = ILogger::ILoggerPtr;

    // Construction, moves and copies
    //

    explicit QirAdaptorFactory(ConfigurationManager& configuration_manager)
      : configuration_manager_{configuration_manager}
    {
    }
    ~QirAdaptorFactory()                        = default;
    QirAdaptorFactory(QirAdaptorFactory const&) = delete;
    QirAdaptorFactory(QirAdaptorFactory&&)      = delete;
    QirAdaptorFactory& operator=(QirAdaptorFactory const&) = delete;
    QirAdaptorFactory& operator=(QirAdaptorFactory&&) = delete;

    // QirAdaptor generation interface
    //

    /// Reference to configuration manager. This property allows to access and modify configurations
    /// of the generator. This property is intended for managing the configuration.
    ConfigurationManager& configurationManager();

    /// Constant reference to the configuration manager. This property allows read access to the
    /// configuration manager and is intended for adaptor generation.
    ConfigurationManager const& configurationManager() const;

    /// Creates a new adaptor based on the registered components, optimization level and debug
    /// requirements. The returned adaptor can be applied to an IR to transform it in accordance with
    /// the configurations given.
    QirAdaptorPtr newQirAdaptor(String const& name, OptimizationLevel const& optimization_level, bool debug);

    /// Prepares a new adaptor context
    void newAdaptorContext(String const& name, bool debug = false);

    /// Adds a component to the current context
    void addComponent(String const& name);

    /// Finalizes the context and returns the QIR adaptor.
    QirAdaptorPtr finalizeAdaptor();

    // Defining the generator

    //

    /// Registers a new adaptor component with a given configuration R. The adaptor component is
    /// given a name and a setup function which is responsible for configuring the adaptor in
    /// accordance with the configuration.
    template <typename R> void registerAdaptorComponent(String const& id, SetupFunction<R> setup);

    /// Replaces a adaptor component. This function is useful for testing purposes and alteration to
    /// the default set of components. For instance, one can setup a production set of components and
    /// then replace a single component to test the effects of this single replacement while keeping
    /// all other components actually as they are in production.
    template <typename R> void replaceAdaptorComponent(String const& id, SetupFunction<R> setup);

    /// Registers a new adaptor component with a given configuration R. Unlike
    /// `registerAdaptorComponent` this component will not have an ID.
    template <typename R> void registerAnonymousAdaptorComponent(SetupFunction<R> setup);

    /// Replicates an existing component as an anonymous component. The original component is found by
    /// its id and then copied as an anonymous component which is appended to the list of components.
    void replicateAdaptorComponent(String const& id);

    /// Flag indicating whether we are operating in debug mode or not.
    bool isDebugMode() const;

    /// Sets the default pipeline up.
    void setupDefaultComponentPipeline();

    void setLogger(ILoggerPtr const& logger = nullptr);

  protected:
    /// Internal function that creates a module pass for QIR validation. At the moment, this function
    /// is a placeholder for future functionality.
    llvm::ModulePassManager createValidationModulePass(
        PassBuilder&             pass_builder,
        OptimizationLevel const& optimization_level,
        bool                     debug);

  private:
    ILoggerPtr            logger_{nullptr};       ///< Logger used to output messages
    ConfigurationManager& configuration_manager_; ///< Holds the configuration that defines the adaptor
    Components            components_;            ///< List of registered components that configures the adaptor

    /// Whether or not we are in debug mode
    bool debug_{false};

    //// TODO:
    BasicAllocationManagerPtr qubit_allocation_manager_;
    BasicAllocationManagerPtr result_allocation_manager_;
    QirAdaptorPtr             adaptor_{};
};

template <typename R> void QirAdaptorFactory::registerAdaptorComponent(String const& id, SetupFunction<R> setup)
{
    configuration_manager_.addConfig<R>(id);

    // Ensuring that the adaptor configuration section can be disabled from the commandline
    configuration_manager_.allowDisableSectionById(id);

    auto setup_wrapper = [setup](QirAdaptorFactory& generator, QirAdaptor& adaptor)
    {
        if (generator.configuration_manager_.isActive<R>())
        {
            auto& config = generator.configuration_manager_.get<R>();

            setup(config, adaptor);
        }
    };

    components_.push_back({id, std::move(setup_wrapper)});
}

template <typename R> void QirAdaptorFactory::replaceAdaptorComponent(String const& id, SetupFunction<R> setup)
{
    auto setup_wrapper = [setup](QirAdaptorFactory& generator, QirAdaptor& adaptor)
    {
        if (generator.configuration_manager_.isActive<R>())
        {
            auto& config = generator.configuration_manager_.get<R>();

            setup(config, adaptor);
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

template <typename R> void QirAdaptorFactory::registerAnonymousAdaptorComponent(SetupFunction<R> setup)
{
    if (!configuration_manager_.configWasRegistered<R>())
    {
        throw std::runtime_error("Configuration '" + static_cast<String>(typeid(R).name()) + "' does not exist.");
    }

    auto setup_wrapper = [setup](QirAdaptorFactory& generation, QirAdaptor& adaptor)
    {
        if (generation.configuration_manager_.isActive<R>())
        {
            auto& config = generation.configuration_manager_.get<R>();

            setup(config, adaptor);
        }
    };

    components_.push_back({"__unnamed__", std::move(setup_wrapper)});
}

} // namespace microsoft::quantum
