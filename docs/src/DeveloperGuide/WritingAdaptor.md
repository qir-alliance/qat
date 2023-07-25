# Tutorial: Writing a new adaptor

In this tutorial we will develop a new QAT profile adaptor. We will make the
adaptor a separate library which is dynamically loaded through the command line
interface. All examples in this tutorial can be found in `AdaptorExamples`. This
tutorial is outlined as follows:

1. Write an adaptor that just loads a configuration file
2. Write an adaptor that adds passes to the adaptor
3. Integrating the new adaptor into the QAT core

Our first "adaptor" will be a "hello world" boilerplate which serves the purpose
of giving the reader an understanding of how to define configurations for our
adaptor. We will demonstrate how to use this adaptor from the command line.

For our second adaptor, we will use a standard LLVM pass to demonstrate how to
load these. We will show how the registered configuration can be used to enable
or disable the pass. To show that the effect of the pass, we use the inliner
pipeline. We will see how enabling the pass results in inlining all the function
calls.

## Hello world

Our first adaptor will not do anything except for printing out a custom message
upon configuring the profile. To this end, we need a configuration which allows
the user to specify the message and we capture this configuration in a class
which we name `HelloWorldConfig`:

```c++
using String = std::string;
class HelloWorldConfig
{
public:
  // ...
private:
  String message_{"Hello world"};
};
```

We note the default value of our configuration is captured through the
initialization of the class member. That is, if not overridden by the command
line arguments, the message will be `"Hello world"`.

To fulfil the concept of being a configuration, a configuration must implement a
`setup` function taking a reference to a `ConfigurationManager` as its only
argument. For our configuration, this looks like

```c++
class HelloWorldConfig
{
public:
  void setup(ConfigurationManager &config)
  {
    config.setSectionName("Hello world configuration",
                          "Demonstrating how configuration works.");
    config.addParameter(message_, "message",
                        "Message which is printed when setting the adaptor up.");
  }

  // ...
};
```

The purpose of the `setup(config)` function is to inform the configuration
manager about what the name of the configuration section and its description is
as well as defining all settings and bind them to C++ variables. The benefit of
this approach is that all configuration parameters for the adaptor will be
available immediately after the adaptor is loaded by the tool.

The final code to manage the configuration reads:

```c++
class HelloWorldConfig
{
public:
  using String = std::string;

  void setup(ConfigurationManager &config)
  {
    config.setSectionName("Hello world configuration",
                          "Demonstrating how configuration works.");
    config.addParameter(message_, "message",
                        "Message which is printed when setting the adaptor up.");
  }

  String const& message() const
  {
    return message_;
  }

private:
  String message_{"Hello world"};
};
```

With the configuration in place, the next thing we concern ourselves with is
loading the adaptor. This is the functionality that registers the configuration
together with an ID and a profile setup function. In our case, the setup
function should just print a message given a `HelloWorldConfig` instance. The
corresponding adaptor registration reads:

```c++
extern "C" void loadAdaptor(IQirAdaptorFactory *factory)
{
  factory->registerAdaptorComponent<HelloWorldConfig>(
      "adaptor.hello-world",
      [](HelloWorldConfig const &cfg, IQirAdaptorFactory * /*factory*/, Profile & /*profile*/) {
        std::cout << "Message: " << cfg.message() << std::endl;
      });
}
```

In this example, we will only concern ourselves with how to use the
configuration and we will ignore `factory` and `profile` for now. These will be
covered in the later sections. The full source code to this example can be found
in `AdaptorExamples/HelloWorld` and it can be compiled through following steps
(startig from the Passes root folder):

```sh
mkdir Debug
cd Debug
cmake ..
make HelloWorld
```

This will generate a `HelloWorld` dynamic library with path
`./AdaptorExamples/libHelloWorld.(dylib|so|dll)`.

## Loading the adaptor

Executing `qat` and loading the `libHelloWorld` library, we see that our new
settings are added to help page:

```sh
% ./qir/qat/Apps/qat --load ./AdaptorExamples/libHelloWorld.dylib -h
Usage: ./qir/qat/Apps/qat [options] filename

...

Hello world configuration - Demonstration configuration for building a adaptor boilerplate.

--message                                         Message which is printed when setting the adaptor up. Default: Hello world


...
```

For the next part, we assume that you have a QIR located in
`../qir/qir-tests/reduction_tests/inlining-input.ll`. To test that the setup
function is invoked upon setting the profile up, we run

```sh
./qir/qat/Apps/qat -S --adaptor-pipeline hello-world --load ./AdaptorExamples/libHelloWorld.dylib ../qir/qir-tests/reduction_tests/inlining-input.ll
Message: Hello world
```

We note that in order for our new component to be loaded we need to add it to
the adaptor pipeline by using adding `--adaptor-pipeline hello-world` to the
commandline arguments.

## Creating a Pass Component

Next, we make an adaptor that just runs a single LLVM pass. We we will use the
inline pipeline to this end.

We create a single option for activating the pass:

```c++
class InlinerConfig
{
public:
  using String = std::string;

  void setup(ConfigurationManager &config)
  {
    config.setSectionName("Inliner adaptor", "Adds the LLVM Always Inline Pass to the profile");
    config.addParameter(inline_, "custom-inliner", "Activating the custom inliner.");
  }

  bool shouldInline() const
  {
    return inline_;
  }

private:
  bool inline_{false};  ///< Default behaviour is that we do not add the inliner pass
};
```

The implementation itself is

```c++
extern "C" void loadAdaptor(IQirAdaptorFactory *factory)
{
  factory->registerAdaptorComponent<InlinerConfig>(
      "adaptor.inliner", [](InlinerConfig const &cfg, IQirAdaptorFactory *factory, Profile & /*profile*/) {
        if (cfg.shouldInline())
        {
          auto &module_pass_manager = factory->modulePassManager();

          // Adds the inline pipeline
          auto &pass_builder = factory->passBuilder();
          auto  inliner_pass = pass_builder.buildInlinerPipeline(
              factory->optimizationLevel(), llvm::PassBuilder::ThinLTOPhase::None, ptr->debug());
          module_pass_manager.addPass(std::move(inliner_pass));
        }
      });
}

```

To build this pass run

```sh
make InlinePassAdaptor
```

To run this pass,

```sh
./qir/qat/Apps/qat -S  --adaptor-pipeline inliner --custom-inliner --load ./AdaptorExamples/libInlinePassAdaptor.dylib --apply ../qir/qir-tests/reduction_tests/inlining-input.ll
```

With `--adaptor-pipeline inliner` we load the inliner adaptor and adding
`--custom-inliner` activates the inliner as per the code above. To verify that
the adaptor does its job, compare the output against the output of

```sh
./qir/qat/Apps/qat -S  --adaptor-pipeline inliner --load ./AdaptorExamples/libInlinePassAdaptor.dylib --apply ../qir/qir-tests/reduction_tests/inlining-input.ll
```

where we have removed the flag `--custom-inliner`.

## QAT native adaptor

Up until now we have built our adaptor as an external component without making
any changes to the QAT source code. The last step we will touch in this section
is how to integrate the adaptor as a permanent part of QAT. We will assume that
we are moving inliner adaptor described above. The following does not have
corresponding example source code as this would be intrusive.

As the first step, we create a new folder to contain sources related to our
adaptor: `qir/qat/InlinerAdaptor`. We then create
`qir/qat/InlinerAdaptor/InlinerConfig.hpp` and copy the `InlinerConfig` class
into this file. Remember to add a `#pragma once` in the top of the file.

Next, we open `qir/qat/AdapatorFactory/QirAdaptorFactor.cpp`. First we include
the `InlinerConfig.hpp` and then we locate the function
`setupDefaultComponentPipeline`. Inside this function, we add following code:

```c++
registerAdaptorComponent<InlinerConfig>(
      "adaptor.inliner", [](InlinerConfig const &cfg, IQirAdaptorFactory *ptr, Profile & /*profile*/) {
        if (cfg.shouldInline())
        {
          auto &module_pass_manager = ptr->modulePassManager();

          // Adds the inline pipeline
          auto &pass_builder = ptr->passBuilder();
          auto  inliner_pass = pass_builder.buildInlinerPipeline(
              ptr->optimizationLevel(), llvm::PassBuilder::ThinLTOPhase::None, ptr->debug());
          module_pass_manager.addPass(std::move(inliner_pass));
        }
      });
```

Recompile QAT and the adaptor is now QAT native. The final step is adding the
adaptor to the pipeline: Open `qat/qir/Apps/Qat/QatConfig.cpp` and locate the
line starting with `config.addParameter(adapter_pipeline_,`. Add the adaptor at
the appropriate place. This will make the adaptor loaded by default.
