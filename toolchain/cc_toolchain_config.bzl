"""
This file defines the K8 C++ toolchain
"""

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-cc",
        ),
        tool_path(
            name = "ld",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-ld",
        ),
        tool_path(
            name = "ar",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-ar",
        ),
        tool_path(
            name = "cpp",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-cpp",
        ),
        tool_path(
            name = "gcov",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-gcov",
        ),
        tool_path(
            name = "nm",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-nm",
        ),
        tool_path(
            name = "objdump",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-objdump",
        ),
        tool_path(
            name = "strip",
            path = "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/bin/x86_64-unknown-linux-gnu-strip",
        ),
    ]

    features = [
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,  # NEW
        cxx_builtin_include_directories = [
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/toolchain/x86_64-unknown-linux-gnu/include/c++/11.2.0/",
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0/toolchain/lib/gcc/x86_64-unknown-linux-gnu/11.2.0/include",
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0//toolchain/x86_64-unknown-linux-gnu/sysroot/usr/include",
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0//toolchain/lib/gcc/x86_64-unknown-linux-gnu/11.2.0/plugin/include",
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0//toolchain/lib/gcc/x86_64-unknown-linux-gnu/11.2.0/install-tools/include",
            "/opt/homebrew/Cellar/x86_64-unknown-linux-gnu/11.2.0//toolchain/lib/gcc/x86_64-unknown-linux-gnu/11.2.0/include-fixed/",
        ],
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
