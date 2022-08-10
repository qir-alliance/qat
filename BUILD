# Compiler settings
config_setting(
    name = "clang_compiler",
    flag_values = {"@bazel_tools//tools/cpp:compiler": "clang"},
)

config_setting(
    name = "gcc_compiler",
    flag_values = {"@bazel_tools//tools/cpp:compiler": "gcc"},
)

# Standard library constraints
constraint_setting(name = "stdlib")

constraint_value(
    name = "glibc",
    constraint_setting = ":stdlib",
)

constraint_value(
    name = "musl",
    constraint_setting = ":stdlib",
)

# Platform constraints
platform(
    name = "apple-silicon",
    constraint_values = [
        "@//:glibc",
        "@platforms//cpu:aarch64",
        "@platforms//os:osx",
    ],
)

platform(
    name = "apple-x86",
    constraint_values = [
        "@//:glibc",
        "@platforms//cpu:x86_64",
        "@platforms//os:osx",
    ],
)

platform(
    name = "linux-x86",
    constraint_values = [
        "@//:glibc",
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
)
