load("@rules_python//python:defs.bzl", "py_test")

py_test(
    name = "test-profile-cli-config",
    srcs = [
        "test_profile_cli_config.py",
    ],
    args = [
        "$(location //qir/qat:qat)",
        "$(location //targets:target_4bf9.yaml)",
        "$(location //targets:target_7ee0.yaml)",
        "$(location //targets:target_b340.yaml)",
    ],
    data = [
        "//qir/qat",
        "//targets:target_4bf9.yaml",
        "//targets:target_7ee0.yaml",
        "//targets:target_b340.yaml",
    ],
    main = "test_profile_cli_config.py",
)
