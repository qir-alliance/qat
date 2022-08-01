load(":cc_toolchain_config.bzl", "cc_toolchain_config")
cc_toolchain_config(name = "k8_toolchain_config")


constraint_setting(name = "stdlib")

constraint_value(
    name = "glibc",
    constraint_setting = ":stdlib",
)

constraint_value(
    name = "musl",
    constraint_setting = ":stdlib",
)

cc_toolchain_suite(
    name = "clang_suite",
    toolchains = {
        "k8": ":k8_toolchain",
    },
)

filegroup(name = "empty")

cc_toolchain(
    name = "k8_toolchain",
    toolchain_identifier = "k8-toolchain",
    toolchain_config = ":k8_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)
