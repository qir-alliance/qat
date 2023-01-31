import glob
import json
import logging
import os
import subprocess

import pytest
from scenario_tests import all_scenarios as SCENARIOS

logger = logging.getLogger(__name__)


def run_scenario(name, profile, directory):
    files = [
        x for x in reversed(sorted(glob.glob(os.path.join(directory, "*.input.ll"))))
    ]
    args = []
    qat_binary = os.environ.get("QAT_BINARY")

    output_file = None
    if os.path.isfile(os.path.join(directory, "output.ll")):
        output_file = os.path.join(directory, "output.ll")

    output = {
        "stdoutContains": "",
        "stderrContains": "",
        "expectFail": False,
        "args": [],
    }

    if os.path.isfile(os.path.join(directory, "output.json")):
        with open(os.path.join(directory, "output.json"), "r") as fb:
            output = json.loads(fb.read())

    if "args" in output:
        args = output["args"]
    cmd = [qat_binary, "-S", "--apply"] + args + files
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    out, errs = p.communicate()
    errs = errs.decode()
    out = out.decode()
    ret = p.returncode == 0
    if output["expectFail"]:
        ret = not ret

    stdout_contains = output["stdoutContains"]
    if isinstance(stdout_contains, str):
        stdout_contains = [stdout_contains]
    for x in stdout_contains:
        if x not in out:
            ret = False

    stderr_contains = output["stderrContains"]
    if isinstance(stderr_contains, str):
        stderr_contains = [stderr_contains]
    for x in stderr_contains:
        if x not in errs:
            ret = False

    compare_to = None
    if output_file:
        with open(output_file, "r") as fb:
            compare_to = fb.read()
        reduced_1 = out.replace(" ", "").strip()
        reduced_2 = compare_to.replace(" ", "").strip()

        if reduced_1 != reduced_2:
            print("Reduced mismatch!")
            ret = False

    if not ret:
        print("Processed files:", ", ".join(files))
        print("Command:", " ".join(cmd))
        print("Error code:", p.returncode)
        print("")
        print(output)
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

        if not all(line in out for line in stdout_contains):
            print("\nExpected '{}' in stdout".format("', '".join(stdout_contains)))

        if not all(line in errs for line in stderr_contains):
            print("\nExpected '{}' in stderr".format("', '".join(stderr_contains)))

    return ret


@pytest.mark.parametrize("test_name", SCENARIOS)
def test_qat_scenarios(test_name, request):
    input_directory = request.getfixturevalue(test_name)
    assert run_scenario(test_name, "default", input_directory)
