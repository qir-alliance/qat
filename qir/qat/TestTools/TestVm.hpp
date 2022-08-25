#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <stdexcept>
#include <unordered_map>
namespace microsoft::quantum
{
namespace details
{
    inline void initFramework()
    {
        static bool was_initialized{false};
        if (was_initialized)
        {
            return;
        }
        was_initialized = true;

        llvm::InitializeNativeTarget();
        llvm::InitializeNativeTargetAsmPrinter();
    }
} // namespace details
class TestProgram
{
  public:
    TestProgram() = default;
    TestProgram(std::unique_ptr<llvm::Module>&& module, std::unique_ptr<llvm::LLVMContext>&& context)
      : context_{std::move(context)}
      , module_{std::move(module)}
    {
    }
    TestProgram(TestProgram&&)      = default;
    TestProgram(TestProgram const&) = delete;

    ~TestProgram() = default;
    void parseFromScript(String const& name, String const& script)
    {
        context_ = std::make_unique<llvm::LLVMContext>();
        llvm::SMDiagnostic error;
        module_ = llvm::parseIR(llvm::MemoryBufferRef(script, name), error, *context_);

        if (!module_)
        {
            throw std::runtime_error("Failed to parse script");
        }
    }

    llvm::Module& module()
    {
        return *module_;
    }

  private:
    friend class TestVM;
    std::unique_ptr<llvm::LLVMContext> context_;
    std::unique_ptr<llvm::Module>      module_;
};

class TestVM
{
  public:
    explicit TestVM(TestProgram& program)
      : program_{program}
    {
        details::initFramework();
    }

    template <typename T> void                   attachGlobalExternalVariable(String const& name, T* pointer);
    template <typename R, typename X> void       attachRuntimeFunction(String const& name, R (*pointer)(X));
    template <typename R, typename... Args> void attachRuntimeFunction(String const& name, R (*pointer)(Args...));
    template <typename R> void                   attachRuntimeFunction(String const& name, R (*pointer)());

    template <typename R, typename... Args> R run(String const& name, Args&&... args);
    template <typename R> R                   run(String const& name);

  private:
    void buildVm()
    {
        llvm::ExitOnError exit_on_error;

        lljit_ = exit_on_error(llvm::orc::LLJITBuilder().create());
        exit_on_error(lljit_->addIRModule(
            llvm::orc::ThreadSafeModule(std::move(program_.module_), std::move(program_.context_))));

        llvm::orc::SymbolMap symbols_map;
        for (auto const& p : symbols_map_)
        {
            symbols_map.insert({lljit_->mangleAndIntern(p.first), p.second});
        }

        exit_on_error(lljit_->getMainJITDylib().define(absoluteSymbols(std::move(symbols_map))));
    }

    TestProgram&                                         program_;
    std::unique_ptr<llvm::orc::LLJIT>                    lljit_;
    std::unordered_map<String, llvm::JITEvaluatedSymbol> symbols_map_;
};

template <typename T> void TestVM::attachGlobalExternalVariable(String const& name, T* pointer)
{
    auto& module = *program_.module_;

    auto variable = module.getNamedGlobal(name);
    variable->setInitializer(nullptr);
    variable->setVisibility(llvm::GlobalValue::VisibilityTypes::DefaultVisibility);
    variable->setLinkage(llvm::GlobalValue::ExternalLinkage);
    variable->setExternallyInitialized(true);
    variable->setDSOLocal(false);

    // Adding link to external pointer
    symbols_map_.insert({name, llvm::JITEvaluatedSymbol::fromPointer(pointer)});
}

template <typename R, typename... Args> void TestVM::attachRuntimeFunction(String const& name, R (*pointer)(Args...))
{
    symbols_map_.insert({name, llvm::JITEvaluatedSymbol::fromPointer(pointer)});
}

template <typename R, typename X> void TestVM::attachRuntimeFunction(String const& name, R (*pointer)(X))
{
    symbols_map_.insert({name, llvm::JITEvaluatedSymbol::fromPointer(pointer)});
}
template <typename R> void TestVM::attachRuntimeFunction(String const& name, R (*pointer)())
{
    symbols_map_.insert({name, llvm::JITEvaluatedSymbol::fromPointer(pointer)});
}

template <typename R, typename... Args> R TestVM::run(String const& name, Args&&... args)
{
    buildVm();

    llvm::ExitOnError exit_on_error;

    // Calling object constructors
    exit_on_error(lljit_->initialize(lljit_->getMainJITDylib()));

    auto function_symbol = exit_on_error(lljit_->lookup(name));
    using FunctionPtr    = R (*)(Args...);
    auto* function       = static_cast<FunctionPtr>(function_symbol.getAddress());
    auto  ret            = function(std::forward<Args>(args)...);

    // Calling object destructors
    exit_on_error(lljit_->deinitialize(lljit_->getMainJITDylib()));

    return ret;
}

template <typename R> R TestVM::run(String const& name)
{
    buildVm();

    llvm::ExitOnError exit_on_error;

    // Calling object constructors
    exit_on_error(lljit_->initialize(lljit_->getMainJITDylib()));

    auto function_symbol = exit_on_error(lljit_->lookup(name));
    using FunctionPtr    = R (*)();
    auto* function       = reinterpret_cast<FunctionPtr>(function_symbol.getAddress()); // NOLINT
    auto  ret            = function();

    // Calling object destructors
    exit_on_error(lljit_->deinitialize(lljit_->getMainJITDylib()));

    return ret;
}

} // namespace microsoft::quantum
