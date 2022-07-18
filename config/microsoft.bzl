"""
Target definitions to enable stricter C++ stanard for internal libraries
"""

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

_CLANG_ADDITIONAL_COPTS = [
    "-Wall",
    "-Wextra",
    "-Wconversion",
    "-Wpedantic",
    "-Werror",
]

def ms_cc_library(**kwargs):
    """Wrapper to add strict compile flags to our own libraries.

    Args:
          **kwargs: Target arguments - specified for cc_library
    """
    name = kwargs["name"]
    kwargs.pop("name")
    copts = kwargs.get("copts", []) + select({
        "@bazel_tools//src/conditions:windows": [],
        "//conditions:default": _CLANG_ADDITIONAL_COPTS,
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
        "@bazel_tools//src/conditions:windows": [],
        "//conditions:default": _CLANG_ADDITIONAL_COPTS,
    })

    if "copts" in kwargs:
        kwargs.pop("copts")

    cc_binary(
        name = name,
        copts = copts,
        **kwargs
    )
