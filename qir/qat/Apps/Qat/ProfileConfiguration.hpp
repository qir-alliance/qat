#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/ValidationPass/ValidationPassConfiguration.hpp"

namespace microsoft::quantum
{

inline void configureGenericProfile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("generic"));
}

inline void configureDefaultProfile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("default"));
}

inline void configureProvider4bf9Profile(ConfigurationManager& configuration_manager)
{

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_4bf9"));

    // Transformation
    configuration_manager.disableSectionById("grouping");

    configuration_manager.updateParameter("apply", true);
    configuration_manager.updateParameter("validate", true);
    configuration_manager.updateParameter("S", false);
    configuration_manager.updateParameter("O0", false);
    configuration_manager.updateParameter("O1", false);
    configuration_manager.updateParameter("O2", false);
    configuration_manager.updateParameter("O3", false);
    configuration_manager.updateParameter("verify-module", true);
    configuration_manager.updateParameter("experimental", false);
    configuration_manager.updateParameter("dump-config", true);
    configuration_manager.updateParameter("add-ir-debug", false);
    configuration_manager.updateParameter("strip-existing-dbg", false);

    configuration_manager.updateParameter("optimize-result-one", true);
    configuration_manager.updateParameter("optimize-result-zero", true);
    configuration_manager.updateParameter("optimize-result-comparison", true);
    configuration_manager.updateParameter("use-static-qubit-array-allocation", true);
    configuration_manager.updateParameter("use-static-qubit-allocation", true);
    configuration_manager.updateParameter("use-static-result-allocation", true);
    configuration_manager.updateParameter("disable-reference-counting", true);
    configuration_manager.updateParameter("disable-alias-counting", true);
    configuration_manager.updateParameter("disable-string-support", true);
    configuration_manager.updateParameter("disable-record-output-support", false);

    configuration_manager.updateParameter("unroll-loops", false);
    configuration_manager.updateParameter("allow-partial", true);
    configuration_manager.updateParameter("allow-peeling", true);
    configuration_manager.updateParameter("allow-runtime", true);
    configuration_manager.updateParameter("allow-upper-bound", true);
    configuration_manager.updateParameter("allow-profile-based-peeling", true);
    configuration_manager.updateParameter<uint64_t>("full-unroll-count", 1024);
    configuration_manager.updateParameter<int32_t>("unroll-opt-level", 3);
    configuration_manager.updateParameter("only-when-forced", false);
    configuration_manager.updateParameter("forget-scev", false);
    configuration_manager.updateParameter("always-inline", true);
    configuration_manager.updateParameter<int32_t>("inlining-parameter", 2147483647);
    configuration_manager.updateParameter("eliminate-constants", true);
    configuration_manager.updateParameter("eliminate-dead-code", true);
    configuration_manager.updateParameter("eliminate-memory", true);

    configuration_manager.updateParameter("delete-dead-code", false);
    configuration_manager.updateParameter("clone-functions", false);
    configuration_manager.updateParameter("transform-execution-path-only", false);
    configuration_manager.updateParameter<uint64_t>("max-recursion", 1);
    configuration_manager.updateParameter("assume-no-except", false);
    configuration_manager.updateParameter("reuse-qubits", true);
    configuration_manager.updateParameter("reuse-results", false);

    configuration_manager.updateParameter("lower-switch", true);
    configuration_manager.updateParameter("should-eleminate-zext-i1", true);
    configuration_manager.updateParameter("pull-records-back", false);

    configuration_manager.updateParameter("annotate-qubit-use", true);
    configuration_manager.updateParameter("annotate-result-use", true);
    configuration_manager.updateParameter("annotate-max-qubit-index", true);
    configuration_manager.updateParameter("annotate-max-result-index", true);
    configuration_manager.updateParameter("reindex-qubits", true);
    configuration_manager.updateParameter("replace-qubit-on-reset", false);
    configuration_manager.updateParameter("inline-after-id-change", true);

    configuration_manager.updateParameter("separate-circuits", true);

    configuration_manager.updateParameter("allow-internal-calls", false);
    configuration_manager.updateParameter("requires-qubits", true);
    configuration_manager.updateParameter("requires-results", true);
    configuration_manager.updateParameter("allow-poison", true);
    configuration_manager.updateParameter("allow-undef", true);
}

inline void configureProvider7ee0Profile(ConfigurationManager& configuration_manager)
{
    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_7ee0"));

    // Transform
    configuration_manager.disableSectionById("grouping");

    configuration_manager.updateParameter("apply", true);
    configuration_manager.updateParameter("validate", true);
    configuration_manager.updateParameter("S", false);
    configuration_manager.updateParameter("O0", false);
    configuration_manager.updateParameter("O1", false);
    configuration_manager.updateParameter("O2", false);
    configuration_manager.updateParameter("O3", false);
    configuration_manager.updateParameter("verify-module", true);
    configuration_manager.updateParameter("experimental", false);
    configuration_manager.updateParameter("dump-config", true);
    configuration_manager.updateParameter("add-ir-debug", false);
    configuration_manager.updateParameter("strip-existing-dbg", false);

    configuration_manager.updateParameter("optimize-result-one", true);
    configuration_manager.updateParameter("optimize-result-zero", true);
    configuration_manager.updateParameter("optimize-result-comparison", true);
    configuration_manager.updateParameter("use-static-qubit-array-allocation", true);
    configuration_manager.updateParameter("use-static-qubit-allocation", true);
    configuration_manager.updateParameter("use-static-result-allocation", true);
    configuration_manager.updateParameter("disable-reference-counting", true);
    configuration_manager.updateParameter("disable-alias-counting", true);
    configuration_manager.updateParameter("disable-string-support", true);
    configuration_manager.updateParameter("disable-record-output-support", false);

    configuration_manager.updateParameter("unroll-loops", true);
    configuration_manager.updateParameter("allow-partial", true);
    configuration_manager.updateParameter("allow-peeling", true);
    configuration_manager.updateParameter("allow-runtime", true);
    configuration_manager.updateParameter("allow-upper-bound", true);
    configuration_manager.updateParameter("allow-profile-based-peeling", true);
    configuration_manager.updateParameter<uint64_t>("full-unroll-count", 1024);
    configuration_manager.updateParameter<int32_t>("unroll-opt-level", 3);
    configuration_manager.updateParameter("only-when-forced", false);
    configuration_manager.updateParameter("forget-scev", false);
    configuration_manager.updateParameter("always-inline", true);
    configuration_manager.updateParameter<int32_t>("inlining-parameter", 2147483647);
    configuration_manager.updateParameter("eliminate-constants", true);
    configuration_manager.updateParameter("eliminate-dead-code", true);
    configuration_manager.updateParameter("eliminate-memory", true);

    configuration_manager.updateParameter("delete-dead-code", false);
    configuration_manager.updateParameter("clone-functions", false);
    configuration_manager.updateParameter("transform-execution-path-only", false);
    configuration_manager.updateParameter<uint64_t>("max-recursion", 1);
    configuration_manager.updateParameter("assume-no-except", false);
    configuration_manager.updateParameter("reuse-qubits", true);
    configuration_manager.updateParameter("reuse-results", false);

    configuration_manager.updateParameter("lower-switch", true);
    configuration_manager.updateParameter("should-eleminate-zext-i1", true);
    configuration_manager.updateParameter("pull-records-back", false);

    configuration_manager.updateParameter("annotate-qubit-use", true);
    configuration_manager.updateParameter("annotate-result-use", true);
    configuration_manager.updateParameter("annotate-max-qubit-index", true);
    configuration_manager.updateParameter("annotate-max-result-index", true);
    configuration_manager.updateParameter("reindex-qubits", true);
    configuration_manager.updateParameter("replace-qubit-on-reset", false);
    configuration_manager.updateParameter("inline-after-id-change", true);

    configuration_manager.updateParameter("separate-circuits", true);

    configuration_manager.updateParameter("allow-internal-calls", false);
    configuration_manager.updateParameter("requires-qubits", true);
    configuration_manager.updateParameter("requires-results", true);
    configuration_manager.updateParameter("allow-poison", true);
    configuration_manager.updateParameter("allow-undef", true);
}

inline void configureProviderb340Profile(ConfigurationManager& configuration_manager)
{
    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_b340"));

    // Transformation
    configuration_manager.disableSectionById("grouping");

    configuration_manager.updateParameter("apply", true);
    configuration_manager.updateParameter("validate", true);
    configuration_manager.updateParameter("S", false);
    configuration_manager.updateParameter("O0", false);
    configuration_manager.updateParameter("O1", false);
    configuration_manager.updateParameter("O2", false);
    configuration_manager.updateParameter("O3", false);
    configuration_manager.updateParameter("verify-module", true);
    configuration_manager.updateParameter("experimental", false);
    configuration_manager.updateParameter("dump-config", true);
    configuration_manager.updateParameter("add-ir-debug", false);
    configuration_manager.updateParameter("strip-existing-dbg", false);

    configuration_manager.updateParameter("optimize-result-one", true);
    configuration_manager.updateParameter("optimize-result-zero", true);
    configuration_manager.updateParameter("optimize-result-comparison", true);
    configuration_manager.updateParameter("use-static-qubit-array-allocation", false);
    configuration_manager.updateParameter("use-static-qubit-allocation", false);
    configuration_manager.updateParameter("use-static-result-allocation", false);

    configuration_manager.updateParameter("disable-reference-counting", false);
    configuration_manager.updateParameter("disable-alias-counting", false);
    configuration_manager.updateParameter("use-static-result-allocation", false);

    configuration_manager.updateParameter("disable-reference-counting", true);
    configuration_manager.updateParameter("disable-alias-counting", true);
    configuration_manager.updateParameter("disable-string-support", true);
    configuration_manager.updateParameter("disable-record-output-support", false);

    configuration_manager.updateParameter("allow-internal-calls", false);
    configuration_manager.updateParameter("requires-qubits", true);
    configuration_manager.updateParameter("requires-results", true);
    configuration_manager.updateParameter("allow-poison", true);
    configuration_manager.updateParameter("allow-undef", true);

    configuration_manager.updateParameter("unroll-loops", true);
    configuration_manager.updateParameter("allow-partial", true);
    configuration_manager.updateParameter("allow-peeling", true);
    configuration_manager.updateParameter("allow-runtime", true);
    configuration_manager.updateParameter("allow-upper-bound", true);
    configuration_manager.updateParameter("allow-profile-based-peeling", true);
    configuration_manager.updateParameter<uint64_t>("full-unroll-count", 1024);
    configuration_manager.updateParameter<int32_t>("unroll-opt-level", 3);
    configuration_manager.updateParameter("only-when-forced", false);
    configuration_manager.updateParameter("forget-scev", false);
    configuration_manager.updateParameter("always-inline", true);
    configuration_manager.updateParameter<int32_t>("inlining-parameter", 2147483647);
    configuration_manager.updateParameter("eliminate-constants", true);
    configuration_manager.updateParameter("eliminate-dead-code", true);
    configuration_manager.updateParameter("eliminate-memory", true);

    configuration_manager.updateParameter("delete-dead-code", false);
    configuration_manager.updateParameter("clone-functions", false);
    configuration_manager.updateParameter("transform-execution-path-only", false);
    configuration_manager.updateParameter<uint64_t>("max-recursion", 1);
    configuration_manager.updateParameter("assume-no-except", false);
    configuration_manager.updateParameter("reuse-qubits", false);
    configuration_manager.updateParameter("reuse-results", false);

    configuration_manager.updateParameter("lower-switch", true);
    configuration_manager.updateParameter("should-eleminate-zext-i1", true);
    configuration_manager.updateParameter("pull-records-back", true);

    configuration_manager.updateParameter("annotate-qubit-use", true);
    configuration_manager.updateParameter("annotate-result-use", true);
    configuration_manager.updateParameter("annotate-max-qubit-index", true);
    configuration_manager.updateParameter("annotate-max-result-index", true);
    configuration_manager.updateParameter("reindex-qubits", true);
    configuration_manager.updateParameter("replace-qubit-on-reset", true);
    configuration_manager.updateParameter("inline-after-id-change", true);

    configuration_manager.updateParameter("separate-circuits", true);

    configuration_manager.updateParameter("allow-internal-calls", false);
    configuration_manager.updateParameter("requires-qubits", true);
    configuration_manager.updateParameter("requires-results", true);
    configuration_manager.updateParameter("allow-poison", true);
    configuration_manager.updateParameter("allow-undef", true);
}

inline void configureProfile(String const& name, ConfigurationManager& configuration_manager)
{
    if (name == "generic")
    {
        configureGenericProfile(configuration_manager);
    }
    else if (name == "default")
    {
        configureDefaultProfile(configuration_manager);
    }
    else if (name == "provider_4bf9")
    {
        configureProvider4bf9Profile(configuration_manager);
    }
    else if (name == "provider_7ee0")
    {
        configureProvider7ee0Profile(configuration_manager);
    }
    else if (name == "provider_b340")
    {
        configureProviderb340Profile(configuration_manager);
    }
    else
    {
        throw std::runtime_error("Invalid profile " + name);
    }
}

} // namespace microsoft::quantum