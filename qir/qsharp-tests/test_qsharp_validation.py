from qsharp_tests import all_qsharp as CIRCUITS


import subprocess
import os
import tempfile

import pytest
import logging


logger = logging.getLogger(__name__)


def validate_circuit(name, profile, filename, args=[], output_file=None):

    qat_binary = os.environ.get("QAT_BINARY")

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


@pytest.mark.parametrize("test_name", CIRCUITS)
def test_qsharp_reduction(test_name, request):
    with request.getfixturevalue(test_name) as project:
        if project.has_relative_dependencies:
            return

        if not project.compile():
            raise BaseException("Could not compile Q# program: {}".format(project.filename))

        assert validate_circuit(test_name, "base", project.qir_filename, [
                                "--unroll-loops", "--always-inline", "--apply"])
