load("@rules_python//python:defs.bzl", "py_test")

py_test(
    name = "test-profile-cli-config",
    srcs = [
        "test_profile_cli_config.py",
    ],
    args = [
        "$(location //qir/qat:qat)",
    ],
    data = [
        "//qir/qat",
    ],
    main = "test_profile_cli_config.py",
)
