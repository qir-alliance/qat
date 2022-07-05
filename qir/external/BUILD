load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "gtest",
    hdrs = glob(["gtest.hpp"]),
    copts = [
        "-Iexternal/googletest/googletest/include",
        "-Iexternal/googlemock/googlemock/include",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@googletest",
    ],
)

cc_library(
    name = "gmock",
    hdrs = glob([
        "g*.hpp",
    ]),
    copts = [
        "-Iexternal/googletest/googletest/include",
        "-Iexternal/googlemock/googlemock/include",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@googletest//:googlemock",
    ],
)
