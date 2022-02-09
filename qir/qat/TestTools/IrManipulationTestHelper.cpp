// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "TestTools/IrManipulationTestHelper.hpp"
#include "Utils/Trim.hpp"

#include "Llvm/Llvm.hpp"

namespace microsoft
{
namespace quantum
{

    IrManipulationTestHelper::IrManipulationTestHelper()
    {
        pass_builder_.registerModuleAnalyses(module_analysis_manager_);
        pass_builder_.registerCGSCCAnalyses(gscc_analysis_manager_);
        pass_builder_.registerFunctionAnalyses(function_analysis_manager_);
        pass_builder_.registerLoopAnalyses(loop_analysis_manager_);

        pass_builder_.crossRegisterProxies(
            loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);
    }

    bool IrManipulationTestHelper::fromString(String const& data)
    {
        module_             = llvm::parseIR(llvm::MemoryBufferRef(data, "IrManipulationTestHelper"), error_, context_);
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

    IrManipulationTestHelper::Strings IrManipulationTestHelper::toBodyInstructions()
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
        pos = data.find("entry:", pos);
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
            trim(val);

            if (val != "")
            {
                ret.emplace_back(std::move(val));
            }

            last_pos = next_pos;
            next_pos = data.find('\n', last_pos + 1);
        }

        return ret;
    }

    bool IrManipulationTestHelper::hasInstructionSequence(Strings const& instructions)
    {
        auto     body_instructions = toBodyInstructions();
        uint64_t i                 = 0;
        uint64_t j                 = 0;

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

    void IrManipulationTestHelper::applyProfile(
        GeneratorPtr const&      generator,
        OptimizationLevel const& optimisation_level,
        bool                     debug)
    {
        auto profile = generator->newProfile("generic", optimisation_level, debug);
        profile.apply(*module_);

        // Verifying that the module is valid
        if (isModuleBroken())
        {
            throw std::runtime_error("Module was broken after applying result");
        }
    }

    bool IrManipulationTestHelper::validateProfile(
        GeneratorPtr const& generator,
        String const&       profile_name,
        bool                debug)
    {
        auto profile = generator->newProfile(profile_name, OptimizationLevel::O0, debug);

        return profile.validate(*module_);
    }

    bool IrManipulationTestHelper::hasValidationErrors(
        GeneratorPtr const& generator,
        String const&       profile_name,
        Strings const&      errors,
        bool                debug) const
    {

        auto  profile               = generator->newProfile(profile_name, OptimizationLevel::O0, debug);
        auto& configuration_manager = generator->configurationManager();
        auto  validator =
            std::make_unique<Validator>(configuration_manager.get<ValidationPassConfiguration>(), true, debug);
        validator->validate(*module_);

        auto logger = validator->logger();
        if (!logger)
        {
            throw std::runtime_error("Logger not present. Cannot test the presence of errors without a logger.");
        }

        std::unordered_set<String> hints;

        for (auto& message : logger->messages())
        {
            hints.insert(message.location.llvm_hint);
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
                llvm::errs() << message.location.llvm_hint << "\n";
                llvm::errs() << "  - " << message.message << "\n";
            }
            llvm::errs() << "\n";
        }

        return ret;
    }

    bool IrManipulationTestHelper::hasExactValidationErrors(
        GeneratorPtr const& generator,
        String const&       profile_name,
        Strings const&      errors,
        bool                debug) const
    {
        auto  profile               = generator->newProfile(profile_name, OptimizationLevel::O0, debug);
        auto& configuration_manager = generator->configurationManager();
        auto  validator =
            std::make_unique<Validator>(configuration_manager.get<ValidationPassConfiguration>(), true, debug);
        validator->validate(*module_);

        auto logger = validator->logger();
        if (!logger)
        {
            throw std::runtime_error("Logger not present. Cannot test the presence of errors without a logger.");
        }

        auto                       ret = true;
        std::unordered_set<String> hints;
        std::unordered_set<String> error_set{errors.begin(), errors.end()};

        for (auto const& message : logger->messages())
        {
            hints.insert(message.location.llvm_hint);

            if (error_set.find(message.location.llvm_hint) == error_set.end())
            {
                ret = false;
                if (debug)
                {
                    llvm::errs() << "Missing '" << message.location.llvm_hint << "' in expected errors.\n";
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
            for (auto error : errors)
            {
                llvm::errs() << error << "\n";
            }
            llvm::errs() << "\nActual errors: \n";
            for (auto& message : logger->messages())
            {
                llvm::errs() << message.location.llvm_hint << "\n";
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
        script += "\nattributes #0 = { \"InteropFriendly\" }\n";
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

        llvm::VerifierAnalysis verifier;
        auto                   result = verifier.run(*module_, module_analysis_manager_);
        return result.IRBroken;
    }

} // namespace quantum
} // namespace microsoft
