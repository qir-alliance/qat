"""
Target definitions to enable stricter C++ standard for internal libraries
"""

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

_CLANG_ADDITIONAL_COPTS = [
    # Enable all warnings be default
    "-Wall",
    "-Wextra",
    "-Weverything",
    "-Wconversion",
    "-Wpedantic",
    "-Werror",

    # ... and then selectively disable those we do not need
    "-Wno-pre-c++17-compat",
    "-Wno-c++98-compat",
    "-Wno-padded",
    "-Wno-documentation-unknown-command",
    "-Wno-exit-time-destructors",
    "-Wno-global-constructors",
    "-Wno-c++98-compat-pedantic",
]

_GCC_ADDITIONAL_COPTS = [
    # Enable all warnings be default
    "-Wall",
    "-Wextra",
    "-Wconversion",
    "-Wpedantic",
    "-Werror",

    # ... and then selectively disable those we do not need
    "-Wno-padded",
]

def ms_cc_library(**kwargs):
    """Wrapper to add strict compile flags to our own libraries.

    Args:
          **kwargs: Target arguments - specified for cc_library
    """
    name = kwargs["name"]
    kwargs.pop("name")
    copts = kwargs.get("copts", []) + select({
        "//:clang_compiler": _CLANG_ADDITIONAL_COPTS,
        "//:gcc_compiler": _GCC_ADDITIONAL_COPTS,
        "//conditions:default": [],
    })

    if "copts" in kwargs:
        kwargs.pop("copts")

    cc_library(
        name = name,
        copts = copts,
        **kwargs
    )

def ms_cc_binary(**kwargs):
    """Wrapper to add strict compile flags to our own executables.

    Args:
          **kwargs: Target arguments - specified for cc_binary
    """

    name = kwargs["name"]
    kwargs.pop("name")
    copts = kwargs.get("copts", []) + select({
        "//:clang_compiler": _CLANG_ADDITIONAL_COPTS,
        "//:gcc_compiler": _GCC_ADDITIONAL_COPTS,
        "//conditions:default": [],
    })

    if "copts" in kwargs:
        kwargs.pop("copts")

    cc_binary(
        name = name,
        copts = copts,
        **kwargs
    )
