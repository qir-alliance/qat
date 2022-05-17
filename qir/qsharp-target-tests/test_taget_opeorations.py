from target1 import target1_tests
from target3 import target3_tests
from target4 import target4_tests


import subprocess
import os
import tempfile

import pytest
import logging


logger = logging.getLogger(__name__)


def validate_circuit(name, profile, filename, args=[], output_file=None):

    qat_binary = os.environ.get("QAT_BINARY")
    logger.debug("TEST")
    p = subprocess.Popen(
        [qat_binary, "-S"] + args + ["--profile",
                                     profile, filename],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)

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


@pytest.mark.parametrize("test_name", target1_tests)
def test_taget_opeorations(test_name, request):
    with request.getfixturevalue(test_name) as project:

        assert validate_circuit(test_name, "default", project.qir_filename, [
                                "--validate", "--entry-point-attr", "EntryPoint", "--unroll-loops", "--always-inline", "--apply"])
