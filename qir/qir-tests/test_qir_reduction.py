import logging
import os
import subprocess

import pytest
from comparison_tests import all_comparison as COMPARISON_CIRCUITS
from reduction_tests import all_reduction as REDUCTION_CIRCUITS
from validation_tests import all_validation as VALIDATION_CIRCUITS

logger = logging.getLogger(__name__)


def validate_circuit(name, profile, filename, args=[], output_file=None):

    qat_binary = os.environ.get("QAT_BINARY")

    cmd = [qat_binary, "-S"] + args + ["--adaptor", profile, filename]
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

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


@pytest.mark.parametrize("test_name", REDUCTION_CIRCUITS)
def test_qat_reduction(test_name, request):
    input_file = request.getfixturevalue(test_name)
    assert validate_circuit(
        test_name,
        "default",
        input_file,
        ["--validate", "--unroll-loops", "--always-inline", "--apply"],
    )


@pytest.mark.parametrize("test_name", VALIDATION_CIRCUITS)
def test_qat_validation(test_name, request):
    input_file = request.getfixturevalue(test_name)
    assert validate_circuit(
        test_name,
        "default",
        input_file,
        ["--validate", "--unroll-loops", "--always-inline"],
    )


@pytest.mark.parametrize("test_name", COMPARISON_CIRCUITS)
def test_qat_comparison(test_name, request):
    input_file = request.getfixturevalue(test_name)
    output_file = input_file.replace("-input.ll", "-output.ll")
    assert validate_circuit(
        test_name,
        "default",
        input_file,
        ["--unroll-loops", "--always-inline", "--apply"],
        output_file,
    )
