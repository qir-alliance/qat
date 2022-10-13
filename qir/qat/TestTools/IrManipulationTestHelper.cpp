// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"
#include "qir/qat/Utils/Trim.hpp"

namespace microsoft::quantum
{

bool IrManipulationTestHelper::fromString(String const& data)
{
    context_ = std::make_unique<llvm::LLVMContext>();
    module_  = llvm::parseIR(llvm::MemoryBufferRef(data, "IrManipulationTestHelper"), error_, *context_.get());
    compilation_failed_ = (module_ == nullptr);
    return !compilation_failed_;
}

String IrManipulationTestHelper::toString() const
{
    String                   str;
    llvm::raw_string_ostream ostream(str);
    ostream << *module_;
    ostream.flush();
    return str;
}

TestProgram IrManipulationTestHelper::toProgram()
{
    TestProgram ret{std::move(module_), std::move(context_)};
    return ret;
}

IrManipulationTestHelper::Strings IrManipulationTestHelper::toBodyInstructions(String const& block_name)
{
    if (isModuleBroken())
    {
        return {};
    }

    String  data = toString();
    Strings ret;

    auto pos = data.find("define i8 @Main() local_unnamed_addr");

    if (pos == String::npos)
    {
        return {};
    }

    // Skipping entry
    if (block_name.empty())
    {
        pos = data.find("entry:", pos);
    }
    else
    {
        pos = data.find(block_name + ":", pos);
    }

    if (pos == String::npos)
    {
        return {};
    }

    auto last_pos = data.find('\n', pos);
    assert(last_pos != String::npos);

    auto next_pos   = data.find('\n', last_pos + 1);
    auto terminator = data.find('}', pos);

    while ((next_pos != String::npos) && (next_pos < terminator))
    {
        auto val = data.substr(last_pos, next_pos - last_pos);

        // Removing comments
        auto comment_p = val.find(';');
        if (comment_p != String::npos)
        {
            val = val.substr(0, comment_p);
        }

        trim(val);

        if (val != "")
        {
            // Breaking at the next block if we are only extracting a specified block
            if (!block_name.empty() && val[val.size() - 1] == ':')
            {
                break;
            }

            ret.emplace_back(std::move(val));
        }

        last_pos = next_pos;
        next_pos = data.find('\n', last_pos + 1);
    }

    return ret;
}

bool IrManipulationTestHelper::hasInstructionSequence(Strings const& instructions, String const& block_name)
{
    auto body_instructions = toBodyInstructions(block_name);

    uint64_t i = 0;
    uint64_t j = 0;

    while (i < instructions.size() && j < body_instructions.size())
    {
        auto& a = instructions[i];
        auto& b = body_instructions[j];
        if (a == b)
        {
            ++i;
        }

        ++j;
    }

    if (i < instructions.size())
    {
        return false;
    }

    return true;
}

void IrManipulationTestHelper::applyQirAdaptor(
    GeneratorPtr const&      generator,
    OptimizationLevel const& optimization_level,
    bool                     debug)
{

    auto adaptor = generator->newQirAdaptor("generic", optimization_level, debug);
    adaptor->apply(*module_);

    // Verifying that the module is valid
    if (isModuleBroken())
    {
        throw std::runtime_error("Module was broken after applying result");
    }
}

bool IrManipulationTestHelper::validateQirAdaptor(GeneratorPtr const& generator, String const& target_name, bool debug)
{
    auto adaptor = generator->newQirAdaptor(target_name, OptimizationLevel::O0, debug);

    return adaptor->validate(*module_);
}

bool IrManipulationTestHelper::containsValidationErrors(
    GeneratorPtr const& generator,
    String const&       target_name,
    Strings const&      errors,
    bool                debug) const
{

    auto  adaptor               = generator->newQirAdaptor(target_name, OptimizationLevel::O0, debug);
    auto& configuration_manager = generator->configurationManager();

    auto logger    = std::make_shared<LogCollection>();
    auto validator = std::make_unique<Validator>(
        configuration_manager.get<TargetProfileConfiguration>(), configuration_manager.get<TargetQisConfiguration>(),
        logger, debug);
    validator->validate(*module_);

    if (!logger)
    {
        throw std::runtime_error("Logger not present. Cannot test the presence of errors without a logger.");
    }

    std::unordered_set<String> hints;

    for (auto& message : logger->messages())
    {
        hints.insert(message.location.llvmHint());
    }

    auto ret = true;
    for (auto const& error : errors)
    {
        if (hints.find(error) == hints.end())
        {
            ret = false;
            if (debug)
            {
                llvm::errs() << "Missing '" << error << "' in LLVM output.\n";
            }
        }
    }

    if (!ret && debug)
    {
        llvm::errs() << "\nExpected errors: \n";
        for (auto const& error : errors)
        {
            llvm::errs() << error << "\n";
        }
        llvm::errs() << "\nActual errors: \n";
        for (auto const& message : logger->messages())
        {
            llvm::errs() << message.location.llvmHint() << "\n";
            llvm::errs() << "  - " << message.message << "\n";
        }
        llvm::errs() << "\n";
    }

    return ret;
}

bool IrManipulationTestHelper::containsExactValidationErrors(
    GeneratorPtr const& generator,
    String const&       target_name,
    Strings const&      errors,
    bool                debug) const
{
    auto  adaptor               = generator->newQirAdaptor(target_name, OptimizationLevel::O0, debug);
    auto& configuration_manager = generator->configurationManager();
    auto  logger                = std::make_shared<LogCollection>();

    auto validator = std::make_unique<Validator>(
        configuration_manager.get<TargetProfileConfiguration>(), configuration_manager.get<TargetQisConfiguration>(),
        logger, debug);
    validator->validate(*module_);

    if (!logger)
    {
        throw std::runtime_error("Logger not present. Cannot test the presence of errors without a logger.");
    }

    auto                       ret = true;
    std::unordered_set<String> hints;
    std::unordered_set<String> error_set{errors.begin(), errors.end()};

    for (auto const& message : logger->messages())
    {
        hints.insert(message.location.llvmHint());

        if (error_set.find(message.location.llvmHint()) == error_set.end())
        {
            ret = false;
            if (debug)
            {
                llvm::errs() << "Missing '" << message.location.llvmHint() << "' in expected errors.\n";
            }
        }
    }

    for (auto const& error : errors)
    {
        if (hints.find(error) == hints.end())
        {
            ret = false;
            if (debug)
            {
                llvm::errs() << "Missing '" << error << "' in LLVM output.\n";
            }
        }
    }

    if (!ret && debug)
    {
        llvm::errs() << "\nExpected errors: \n";
        for (auto const& error : errors)
        {
            llvm::errs() << error << "\n";
        }
        llvm::errs() << "\nActual errors: \n";
        for (auto const& message : logger->messages())
        {
            llvm::errs() << message.location.llvmHint() << "\n";
            llvm::errs() << "  - " << message.message << "\n";
        }
        llvm::errs() << "\n";
    }

    return ret;
}

void IrManipulationTestHelper::declareOpaque(String const& name)
{
    opaque_declarations_.insert(name);
}

void IrManipulationTestHelper::declareFunction(String const& declaration)
{
    function_declarations_.insert(declaration);
}

String IrManipulationTestHelper::generateScript(String const& body, String const& args) const
{
    String script = R"script(
; ModuleID = 'IrManipulationTestHelper'
source_filename = "IrManipulationTestHelper.ll"

)script";

    // Adding opaque types
    for (auto const& op : opaque_declarations_)
    {
        script += "%" + op + " = type opaque\n";
    }

    script += "define i8 @Main(" + args + ") local_unnamed_addr #0 {\nentry:\n";
    script += body;
    script += "\n  ret i8 0\n";
    script += "\n}\n\n";

    for (auto const& op : function_declarations_)
    {
        script += "declare " + op + "\n";
    }
    script += "\nattributes #0 = { \"EntryPoint\" }\n";
    return script;
}

String IrManipulationTestHelper::getErrorMessage() const
{
    String                   str;
    llvm::raw_string_ostream ostream(str);
    switch (error_.getKind())
    {
    case llvm::SourceMgr::DiagKind::DK_Error:
        ostream << "Error at ";
        break;
    case llvm::SourceMgr::DiagKind::DK_Warning:
        ostream << "Warning at ";
        break;
    case llvm::SourceMgr::DiagKind::DK_Remark:
        ostream << "Remark at ";
        break;
    case llvm::SourceMgr::DiagKind::DK_Note:
        ostream << "Note at ";
        break;
    }

    ostream << error_.getLineNo() << ":" << error_.getColumnNo() << ": ";
    ostream << error_.getMessage() << "\n\n";
    ostream << error_.getLineContents();
    ostream.flush();

    return str;
}

bool IrManipulationTestHelper::fromBodyString(String const& body, String const& args)
{
    auto script = generateScript(body, args);
    return fromString(script);
}

IrManipulationTestHelper::ModulePtr& IrManipulationTestHelper::module()
{
    return module_;
}

bool IrManipulationTestHelper::isModuleBroken()
{
    if (compilation_failed_)
    {
        return compilation_failed_;
    }

    llvm::LoopAnalysisManager     loop_analysis_manager;
    llvm::FunctionAnalysisManager function_analysis_manager;
    llvm::CGSCCAnalysisManager    gscc_analysis_manager;
    llvm::ModuleAnalysisManager   module_analysis_manager;

    auto pass_builder = std::make_unique<llvm::PassBuilder>();

    pass_builder->registerModuleAnalyses(module_analysis_manager);
    pass_builder->registerCGSCCAnalyses(gscc_analysis_manager);
    pass_builder->registerFunctionAnalyses(function_analysis_manager);
    pass_builder->registerLoopAnalyses(loop_analysis_manager);

    pass_builder->crossRegisterProxies(
        loop_analysis_manager, function_analysis_manager, gscc_analysis_manager, module_analysis_manager);

    llvm::VerifierAnalysis verifier;
    auto                   result = verifier.run(*module_, module_analysis_manager);
    return result.IRBroken;
}

} // namespace microsoft::quantum
