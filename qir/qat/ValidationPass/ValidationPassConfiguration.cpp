// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"
#include "ValidationPass/ValidationPassConfiguration.hpp"

namespace microsoft
{
namespace quantum
{

    void ValidationPassConfiguration::setup(ConfigurationManager& config)
    {
        config.setSectionName("Validation configuration", "");
        config.addParameter(
            allow_internal_calls_, "allow-internal-calls", "Whether or not internal calls are allowed.");
    }

    String ValidationPassConfiguration::profileName() const
    {
        return profile_name_;
    }

    ValidationPassConfiguration ValidationPassConfiguration::fromProfileName(String const& name)
    {

        auto profile = ValidationPassConfiguration();
        if (name == "generic")
        {
            profile.opcodes_               = Set{};
            profile.external_calls_        = Set{};
            profile.allowed_pointer_types_ = Set{};

            profile.allowlist_opcodes_        = true;
            profile.allowlist_external_calls_ = false;
            profile.allow_internal_calls_     = true;
            profile.allowlist_pointer_types_  = false;
            profile.allow_primitive_return_   = true;
            profile.allow_struct_return_      = true;
            profile.allow_pointer_return_     = true;
        }
        else if (name == "base")
        {
            profile.allow_internal_calls_     = false;
            profile.allowlist_external_calls_ = true;
            profile.allowlist_opcodes_        = true;
            profile.opcodes_        = Set{"br", "call", "unreachable", "ret", "inttoptr"}; //  "phi", "select",
            profile.external_calls_ = Set{
                "__quantum__qis__cnot__body",  "__quantum__qis__cz__body", "__quantum__qis__cx__body",
                "__quantum__qis__cy__body",    "__quantum__qis__h__body",  "__quantum__qis__s__body",
                "__quantum__qis__s__adj",      "__quantum__qis__t__body",  "__quantum__qis__t__adj",
                "__quantum__qis__x__body",     "__quantum__qis__y__body",  "__quantum__qis__z__body",
                "__quantum__qis__rx__body",    "__quantum__qis__ry__body", "__quantum__qis__rz__body",
                "__quantum__qis__reset__body", "__quantum__qis__mz__body", "__quantum__qis__read_result__body",

            };
            profile.allowlist_pointer_types_ = true;
            profile.allowed_pointer_types_   = {"i8*",    "i16*",    "i32*",    "i64*",
                                              "Qubit*", "Qubit**", "Result*", "Result**"};
        }
        else if (name == "provider_4bf9")
        {
            // Supported LLVM instructions: ret, br, phi, add, sub, mul, fadd, fsub, fmul, ashr, and, or,
            // xor, icmp eq, icmp ne, icmp ugt, icmp uge, icmp ult, icmp ule, fcmp oeq, fcmp ogt, fcmp oge,
            // fcmp olt, fcmp ole, fcmp one
            profile.allow_internal_calls_     = false;
            profile.allowlist_external_calls_ = true;
            profile.allowlist_opcodes_        = true;
            profile.opcodes_                  = Set{"ret",  "inttoptr", "br",   "phi", "add", "sub", "mul",  "fadd",
                                   "fsub", "fmul",     "ashr", "and", "or",  "xor", "icmp", "fcmp"};
            profile.external_calls_           = Set{
                "__quantum__qis__cnot__body",
                "__quantum__qis__cz__body",
                "__quantum__qis__swap__body",
                "__quantum__qis__h__body",
                "__quantum__qis__s__body",
                "__quantum__qis__s__adj",
                "__quantum__qis__t__body",
                "__quantum__qis__t__adj",
                "__quantum__qis__x__body",
                "__quantum__qis__y__body",
                "__quantum__qis__z__body",
                "__quantum__qis__rx__body",
                "__quantum__qis__ry__body",
                "__quantum__qis__rz__body",
                "__quantum__qis__reset__body",
                "__quantum__qis__mz__body",
                "__quantum__qis__read_result__body",
                "__quantum__rt__result_record_output",
                "__quantum__rt__bool_record_output",
                "__quantum__rt__integer_record_output",
                "__quantum__rt__double_record_output",
                "__quantum__rt__tuple_start_record_output",
                "__quantum__rt__tuple_end_record_output",
                "__quantum__rt__array_start_record_output",
                "__quantum__rt__array_end_record_output",

            };
            profile.allowlist_pointer_types_ = true;
            profile.allowed_pointer_types_   = {"Qubit*", "Result*"};
        }

        else if (name == "provider_7ee0")
        {
            // Supported LLVM types: i64 (integer), double, i1 (bool), %Qubit*, %Result*.
            // Supported LLVM instructions: ret, br, add, sub, mul, and, or, xor, lshr, shl, icmp eq, icmp
            // ne, icmp ule, icmp ult, icmp uge, icmp ugt. Restrictions: rotation convention using radians,
            // ret should appear only once (no conditional early return). Supported quantum intrinsic
            // functions:
            // __quantum__qis__cnot__body(%Qubit*, %Qubit*),
            // __quantum__qis__cz__body(%Qubit*, %Qubit*),
            // __quantum__qis__h__body(%Qubit*),
            // __quantum__qis__s__body(%Qubit*),
            // __quantum__qis__s__adj(%Qubit*),
            // __quantum__qis__t__body(%Qubit*),
            // __quantum__qis__t__adj(%Qubit*),
            // __quantum__qis__x__body(%Qubit*),
            // __quantum__qis__y__body(%Qubit*),
            // __quantum__qis__z__body(%Qubit*),
            // __quantum__qis__rx__body(double, %Qubit*),
            // __quantum__qis__ry__body(double, %Qubit*),
            // __quantum__qis__rz__body(double, %Qubit*),
            // __quantum__qis__reset__body(%Qubit*),
            // __quantum__qis__mz__body(%Qubit*, %Result*),
            // %i1 __quantum__qis__read_result__body(%Result*)

            profile.allow_internal_calls_     = false;
            profile.allowlist_external_calls_ = true;
            profile.allowlist_opcodes_        = true;
            profile.opcodes_ =
                Set{"ret", "inttoptr", "br", "add", "sub", "mul", "and", "or", "xor", "lshr", "shl", "icmp"};
            profile.external_calls_ = Set{
                "__quantum__qis__cnot__body",
                "__quantum__qis__cz__body",
                "__quantum__qis__h__body",
                "__quantum__qis__s__body",
                "__quantum__qis__s__adj",
                "__quantum__qis__t__body",
                "__quantum__qis__t__adj",
                "__quantum__qis__x__body",
                "__quantum__qis__y__body",
                "__quantum__qis__z__body",
                "__quantum__qis__rx__body",
                "__quantum__qis__ry__body",
                "__quantum__qis__rz__body",
                "__quantum__qis__reset__body",
                "__quantum__qis__mz__body",
                "__quantum__qis__read_result__body",
                "__quantum__rt__result_record_output",
                "__quantum__rt__bool_record_output",
                "__quantum__rt__integer_record_output",
                "__quantum__rt__tuple_start_record_output",
                "__quantum__rt__tuple_end_record_output",
                "__quantum__rt__array_start_record_output",
                "__quantum__rt__array_end_record_output",

            };
            profile.allowlist_pointer_types_ = true;
            profile.allowed_pointer_types_   = {"Qubit*", "Result*"};
        }
        else if (name == "provider_b340")
        {
            profile = ValidationPassConfiguration::fromProfileName("base");
            // profile.addAllowedExternalCall("__quantum__qis__[name]")
        }
        else
        {
            throw std::runtime_error("Invalid profile " + name);
        }

        profile.profile_name_ = name;

        return profile;
    }

    ValidationPassConfiguration::Set const& ValidationPassConfiguration::allowedOpcodes() const
    {
        return opcodes_;
    }

    ValidationPassConfiguration::Set const& ValidationPassConfiguration::allowedExternalCallNames() const
    {
        return external_calls_;
    }

    bool ValidationPassConfiguration::allowInternalCalls() const
    {
        return allow_internal_calls_;
    }

    bool ValidationPassConfiguration::allowlistOpcodes() const
    {
        return allowlist_opcodes_;
    }

    bool ValidationPassConfiguration::allowlistExternalCalls() const
    {
        return allowlist_external_calls_;
    }

    bool ValidationPassConfiguration::allowlistPointerTypes() const
    {
        return allowlist_pointer_types_;
    }

    ValidationPassConfiguration::Set const& ValidationPassConfiguration::allowedPointerTypes() const
    {
        return allowed_pointer_types_;
    }

    void ValidationPassConfiguration::addAllowedExternalCall(String const& name)
    {
        external_calls_.insert(name);
    }

    void ValidationPassConfiguration::addAllowedOpcode(String const& name)
    {
        opcodes_.insert(name);
    }

    void ValidationPassConfiguration::addAllowedPointerType(String const& name)
    {
        allowed_pointer_types_.insert(name);
    }

} // namespace quantum
} // namespace microsoft
