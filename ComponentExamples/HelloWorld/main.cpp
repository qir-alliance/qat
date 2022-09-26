// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/QirAdaptorFactory.hpp"
#include "qir/qat/Commandline/ConfigurationManager.hpp"
using namespace microsoft::quantum;

extern "C" void loadComponent(QirAdaptorFactory* generator);

class HelloWorldConfig
{
  public:
    using String = std::string;

    void setup(ConfigurationManager& config)
    {
        config.setSectionName(
            "Hello world configuration", "Demonstration configuration for building a component boilerplate.");
        config.addParameter(message_, "message", "Message which is printed when setting the component up.");
    }

    String message() const
    {
        return message_;
    }

  private:
    String message_{"Hello world"};
};

extern "C" void loadComponent(QirAdaptorFactory* generator)
{
    generator->registerAdaptorComponent<HelloWorldConfig>(
        "hello-world", [](HelloWorldConfig const& cfg, QirAdaptor& /*profile*/)
        { std::cout << "Message: " << cfg.message() << std::endl; });
}
