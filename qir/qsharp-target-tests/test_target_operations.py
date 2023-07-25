import logging
import os
import subprocess

import pytest
from TargetTestScripts import target1_tests, target3_tests, target4_tests

logger = logging.getLogger(__name__)


def validate_circuit(name, profile, filename, args=[], output_file=None):

    qat_binary = os.environ.get("QAT_BINARY")
    cmd = [qat_binary, "-S"] + args + ["--adaptor", profile, filename]
    p = subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    out, errs = p.communicate()
    errs = errs.decode()
    out = out.decode()
    ret = p.returncode == 0

    compare_to = None
    if output_file:
        with open(output_file, "r") as fb:
            compare_to = fb.read()
        reduced_1 = out.replace(" ", "").strip()
        reduced_2 = compare_to.replace(" ", "").strip()

        if reduced_1 != reduced_2:
            ret = False

    if not ret:
        print("Processed file:", filename)
        print("Command:", " ".join(cmd))
        if not os.path.exists(filename):
            print("File does not exists: {}".format(filename))
        else:
            with open(filename, "r") as fb:
                for line in fb.readlines():
                    print("    | {}".format(line.rstrip()))
        print("")

        print("QAT error output:")
        for line in errs.strip().split("\n"):
            print("    | {}".format(line))

        print("")
        print("QAT std output:")
        for line in out.strip().split("\n"):
            print("    | {}".format(line))

        if compare_to is not None:
            print("")
            print("Expected output:")
            for line in compare_to.strip().split("\n"):
                print("    | {}".format(line))

    return ret


VERSION = os.environ.get("QSHARP_VERSION", "0.25.218240")
CHANNEL = os.environ.get("QSHARP_CHANNEL", "")


@pytest.mark.parametrize("test_name", target1_tests)
def test_target1(test_name, request):
    with request.getfixturevalue(test_name)(
        "quantinuum.qpu", VERSION, CHANNEL
    ) as project:
        assert project.compile()
        assert validate_circuit(
            test_name,
            "provider_7ee0",
            project.qir_filename,
            [
                "--no-requires-results",
                "--no-requires-qubits",
                "--disable-record-output-support",
                "--validate",
                "--apply",
            ],
        )


@pytest.mark.parametrize("test_name", target3_tests)
def test_target3(test_name, request):
    with request.getfixturevalue(test_name)("qci.qpu", VERSION, CHANNEL) as project:
        assert project.compile()
        assert validate_circuit(
            test_name,
            "provider_4bf9",
            project.qir_filename,
            [
                "--no-requires-results",
                "--no-requires-qubits",
                "--disable-record-output-support",
                "--validate",
                "--apply",
            ],
        )


@pytest.mark.parametrize("test_name", target4_tests)
def test_target4(test_name, request):
    with request.getfixturevalue(test_name)("rigetti.qpu", VERSION, CHANNEL) as project:
        assert project.compile()
        assert validate_circuit(
            test_name,
            "provider_b340",
            project.qir_filename,
            [
                "--validate",
                "--no-requires-results",
                "--no-requires-qubits",
                "--disable-record-output-support",
                "--disable-grouping",
                "--replace-qubit-on-reset",
                "--reindex-qubits",
                "--apply",
            ],
        )
