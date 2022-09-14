// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

void TargetProfileConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Validation configuration", "");
    /// CLI and config accessible
    config.addParameter(requires_qubits_, "requires-qubits", "Whether or not qubits are required in the IR.");
    config.addParameter(requires_results_, "requires-results", "Whether or not results are required in the IR.");

    config.addParameter(allow_internal_calls_, "allow-internal-calls", "Whether or not internal calls are allowed.");
    config.addParameter(allow_poison_, "allow-poison", "Whether or not poison values are allowed.");
    config.addParameter(allow_undef_, "allow-undef", "Whether or not undef values are allowed.");

    /// Config accessible
    config.addParameter(opcodes_, "opcodes", "Allowed opcodes", ConfigurationManager::ParameterVisibility::ConfigOnly);

    config.addParameter(
        allowlist_opcodes_, "allowlist-opcodes", "Whether or not to use allow list for op-codes.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
    config.addParameter(
        allowlist_external_calls_, "allowlist-external-calls", "Whether or not to use allow list external calls.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);

    config.addParameter(
        allowlist_pointer_types_, "allowlist-pointer-types", "Whether or not to use allow list pointer types.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);

    config.addParameter(
        allow_primitive_return_, "allow-primitive-return", "Whether or not primitive return types are allowed.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
    config.addParameter(
        allow_struct_return_, "allow-struct-return", "Whether or not struct return types are allowed.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
    config.addParameter(
        allow_pointer_return_, "allow-pointer-return", "Whether or not pointer return types are allowed.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);

    config.addParameter(
        external_calls_, "external-calls", "Allowed external calls.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
    config.addParameter(
        allowed_pointer_types_, "allowed-pointer-types", "Allowed pointer types.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
}

String TargetProfileConfiguration::adaptorName() const
{
    return adaptor_name_;
}

TargetProfileConfiguration TargetProfileConfiguration::fromQirAdaptorName(String const& name)
{

    auto adaptor = TargetProfileConfiguration();
    if (name == "generic")
    {
        adaptor.opcodes_               = OpcodeSet{};
        adaptor.external_calls_        = Set{};
        adaptor.allowed_pointer_types_ = Set{};

        adaptor.allowlist_opcodes_        = true;
        adaptor.allowlist_external_calls_ = false;
        adaptor.allow_internal_calls_     = true;
        adaptor.allowlist_pointer_types_  = false;
        adaptor.allow_primitive_return_   = true;
        adaptor.allow_struct_return_      = true;
        adaptor.allow_pointer_return_     = true;
    }
    else if (name == "default")
    {
        adaptor.allow_internal_calls_     = false;
        adaptor.allowlist_external_calls_ = true;
        adaptor.allowlist_opcodes_        = true;
        adaptor.opcodes_                  = OpcodeSet({
            {"ret"},
            {"call"},
            {"inttoptr"},
            {"br"},
            {"add"},
            {"sub"},
            {"mul"},
            {"fadd"},
            {"fsub"},
            {"fmul"},
            {"lshr"},
            {"and"},
            {"or"},
            {"xor"},
            /*
            {"icmp", "eq"},  {"icmp", "ne"},  {"icmp", "ugt"}, {"icmp", "uge"}, {"icmp", "ult"},
            {"icmp", "ule"}, {"fcmp", "oeq"}, {"fcmp", "ogt"}, {"fcmp", "oge"}, {"fcmp", "olt"},
            {"fcmp", "ole"}, {"fcmp", "one"},
            */
        });
        adaptor.external_calls_           = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cx__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cy__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",

        };
        adaptor.allowlist_pointer_types_ = true;
        adaptor.allowed_pointer_types_   = {"i8*", "i16*", "i32*", "i64*", "Qubit*", "Qubit**", "Result*", "Result**"};
    }
    else if (name == "provider_4bf9")
    {
        // Supported LLVM instructions: ret, br, phi, add, sub, mul, fadd, fsub, fmul, lshr, and, or,
        // xor, icmp eq, icmp ne, icmp ugt, icmp uge, icmp ult, icmp ule, fcmp oeq, fcmp ogt, fcmp oge,
        // fcmp olt, fcmp ole, fcmp one
        adaptor.allow_internal_calls_     = false;
        adaptor.allowlist_external_calls_ = true;
        adaptor.allowlist_opcodes_        = true;
        adaptor.opcodes_        = OpcodeSet({{"call"}, {"ret"},  {"inttoptr"}, {"br"},   {"phi"},    {"add"}, {"sub"},
                                      {"mul"},  {"fadd"}, {"fsub"},     {"fmul"}, {"lshr"},   {"shl"}, {"and"},
                                      {"or"},   {"xor"},  {"icmp"},     {"fcmp"}, {"select"}, {"zext"}});
        adaptor.external_calls_ = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__swap__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",
            "__quantum__rt__result_record_output:void (%Result*)",
            "__quantum__rt__bool_record_output:void (i1)",
            "__quantum__rt__int_record_output:void (i64)",
            "__quantum__rt__double_record_output:void (double)",
            "__quantum__rt__tuple_start_record_output:void ()",
            "__quantum__rt__tuple_end_record_output:void ()",
            "__quantum__rt__array_start_record_output:void ()",
            "__quantum__rt__array_end_record_output:void ()",

        };
        adaptor.allowlist_pointer_types_ = true;
        adaptor.allowed_pointer_types_   = {"Qubit*", "Result*"};
    }
    else if (name == "provider_7ee0")
    {
        // Supported LLVM types: i64 (integer), double, i1 (bool), %Qubit*, %Result*.
        // Supported LLVM instructions: ret, br, phi, add, sub, mul, and, or, xor, lshr, shl, icmp eq, icmp
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

        adaptor.allow_internal_calls_     = false;
        adaptor.allowlist_external_calls_ = true;
        adaptor.allowlist_opcodes_        = true;
        adaptor.opcodes_                  = OpcodeSet(
                             {{"call"},
             {"ret"},
             {"inttoptr"},
             {"br"},
             {"phi"},
             {"add"},
             {"sub"},
             {"mul"},
             {"and"},
             {"or"},
             {"xor"},
             {"lshr"},
             {"shl"},
             {"icmp"},
             {"select"},
             {"zext"}});
        adaptor.external_calls_ = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",
            "__quantum__rt__result_record_output:void (%Result*)",
            "__quantum__rt__bool_record_output:void (i1)",
            "__quantum__rt__int_record_output:void (i64)",
            "__quantum__rt__tuple_start_record_output:void ()",
            "__quantum__rt__tuple_end_record_output:void ()",
            "__quantum__rt__array_start_record_output:void ()",
            "__quantum__rt__array_end_record_output:void ()",
            "__quantum__rt__result_record_output:void (%Result*, i8*)",
            "__quantum__rt__bool_record_output:void (i1, i8*)",
            "__quantum__rt__int_record_output:void (i64, i8*)",

        };
        adaptor.allowlist_pointer_types_ = true;
        adaptor.allowed_pointer_types_   = {"Qubit*", "Result*", "i8*"};
    }
    else if (name == "provider_b340")
    {
        adaptor.allow_internal_calls_     = false;
        adaptor.allowlist_external_calls_ = true;
        adaptor.allowlist_opcodes_        = true;
        adaptor.opcodes_                  = OpcodeSet({
            {"call"},
            {"ret"},
            {"inttoptr"},
        });
        adaptor.external_calls_           = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__swap__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",
            "__quantum__rt__result_record_output:void (%Result*)",
            "__quantum__rt__tuple_start_record_output:void ()",
            "__quantum__rt__tuple_end_record_output:void ()",
            "__quantum__rt__array_start_record_output:void ()",
            "__quantum__rt__array_end_record_output:void ()",

        };
        adaptor.allowlist_pointer_types_ = true;
        adaptor.allowed_pointer_types_   = {"Qubit*", "Result*"};
    }
    else
    {
        throw std::runtime_error("Invalid adaptor " + name);
    }

    adaptor.adaptor_name_ = name;

    return adaptor;
}

OpcodeSet const& TargetProfileConfiguration::allowedOpcodes() const
{
    return opcodes_;
}

TargetProfileConfiguration::Set const& TargetProfileConfiguration::allowedExternalCallNames() const
{
    return external_calls_;
}

bool TargetProfileConfiguration::allowInternalCalls() const
{
    return allow_internal_calls_;
}

bool TargetProfileConfiguration::allowlistOpcodes() const
{
    return allowlist_opcodes_;
}

bool TargetProfileConfiguration::allowlistExternalCalls() const
{
    return allowlist_external_calls_;
}

bool TargetProfileConfiguration::allowlistPointerTypes() const
{
    return allowlist_pointer_types_;
}

TargetProfileConfiguration::Set const& TargetProfileConfiguration::allowedPointerTypes() const
{
    return allowed_pointer_types_;
}

void TargetProfileConfiguration::addAllowedExternalCall(String const& name)
{
    external_calls_.insert(name);
}

void TargetProfileConfiguration::addAllowedOpcode(String const& name)
{
    opcodes_.data().insert(name);
}

void TargetProfileConfiguration::addAllowedPointerType(String const& name)
{
    allowed_pointer_types_.insert(name);
}

bool TargetProfileConfiguration::requiresQubits() const
{
    return requires_qubits_;
}

bool TargetProfileConfiguration::requiresResults() const
{
    return requires_results_;
}

bool TargetProfileConfiguration::allowPoison() const
{
    return allow_poison_;
}

bool TargetProfileConfiguration::allowUndef() const
{
    return allow_undef_;
}

} // namespace microsoft::quantum
