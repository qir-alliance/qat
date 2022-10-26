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
    config.setSectionName("Target profile validation", "Configuration for profile validation");

    /// CLI and config accessible

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

String TargetProfileConfiguration::targetName() const
{
    return target_name_;
}

TargetProfileConfiguration TargetProfileConfiguration::fromQirTargetName(String const& name)
{

    auto adaptor = TargetProfileConfiguration();
    if (name == "generic")
    {
        adaptor.opcodes_               = OpcodeSet{};
        adaptor.external_calls_        = Set{};
        adaptor.allowed_pointer_types_ = Set{};

        adaptor.allowlist_opcodes_        = false;
        adaptor.allowlist_external_calls_ = false;
        adaptor.allowlist_pointer_types_  = false;
        adaptor.allow_internal_calls_     = true;
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
        adaptor.external_calls_           = Set{};
        adaptor.allowlist_pointer_types_  = true;
        adaptor.allowed_pointer_types_    = {"i8*", "i16*", "i32*", "i64*", "Qubit*", "Qubit**", "Result*", "Result**"};
    }
    else
    {
        throw std::runtime_error("Invalid adaptor " + name);
    }

    adaptor.target_name_ = name;

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

bool TargetProfileConfiguration::allowPoison() const
{
    return allow_poison_;
}

bool TargetProfileConfiguration::allowUndef() const
{
    return allow_undef_;
}

} // namespace microsoft::quantum
