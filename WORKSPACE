workspace(name = "microsoft")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "bazel_gazelle",
    sha256 = "d8c45ee70ec39a57e7a05e5027c32b1576cc7f16d9dd37135b0eddde45cf1b10",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
    ],
)

# ================================================================
# LLVM
# ================================================================

# Replace with the LLVM commit you want to use.
LLVM_COMMIT = "81d5412439efd0860c0a8dd51b831204f118d485"

# The easiest way to calculate this for a new commit is to set it to empty and
# then run a bazel build and it will report the digest necessary to cache the
# archive and make the build reproducible.
LLVM_SHA256 = "50b3ef31b228ea0c96ae074005bfac087c56e6a4b1c147592dd33f41cad0706b"

http_archive(
    name = "llvm-raw",
    build_file_content = "# empty",
    sha256 = LLVM_SHA256,
    strip_prefix = "llvm-project-" + LLVM_COMMIT,
    urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
)

load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure", "llvm_disable_optional_support_deps")

llvm_configure(name = "llvm-project")

# Disables optional dependencies for Support like zlib and terminfo. You may
# instead want to configure them using the macros in the corresponding bzl
# files.
llvm_disable_optional_support_deps()

# ================================================================
# Python
# ================================================================
rules_python_version = "740825b7f74930c62f44af95c9a4c1bd428d2c53"  # Latest @ 2021-06-23

http_archive(
    name = "rules_python",
    sha256 = "09a3c4791c61b62c2cbc5b2cbea4ccc32487b38c7a2cc8f87a794d7a659cc742",
    strip_prefix = "rules_python-{}".format(rules_python_version),
    url = "https://github.com/bazelbuild/rules_python/archive/{}.zip".format(rules_python_version),
)

# ================================================================
# Google
# ================================================================

http_archive(
    name = "googletest",
    build_file = "@//:config/BUILD.googletest",
    sha256 = "94c634d499558a76fa649edb13721dce6e98fb1e7018dfaeba3cd7a083945e91",
    strip_prefix = "googletest-release-1.10.0",
    url = "https://github.com/google/googletest/archive/release-1.10.0.zip",
)
