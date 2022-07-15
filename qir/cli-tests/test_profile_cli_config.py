import subprocess
import sys

TESTS = {
    "provider_4bf9": [
        "--apply",
        "--verify-module",
        "--validate",
        "--disable-grouping",
        "--always-inline",
        "--reindex-qubits",
        "--requires-qubits",
        "--requires-results",
        "--no-disable-record-output-support",
        "--reuse-qubits",
        "--entry-point-attr",
        "EntryPoint",
    ],
    "provider_7ee0": [
        "--apply",
        "--verify-module",
        "--validate",
        "--disable-grouping",
        "--always-inline",
        "--reindex-qubits",
        "--requires-qubits",
        "--requires-results",
        "--no-disable-record-output-support",
        "--unroll-loops",
        "--reuse-qubits",
        "--entry-point-attr",
        "EntryPoint",
    ],
    "provider_b340": [
        "--apply",
        "--verify-module",
        "--validate",
        "--disable-grouping",
        "--always-inline",
        "--reindex-qubits",
        "--requires-qubits",
        "--requires-results",
        "--no-disable-record-output-support",
        "--unroll-loops",
        "--replace-qubit-on-reset",
        "--pull-records-back",
        "--entry-point-attr",
        "EntryPoint",
    ],
}


QAT_BINARY = sys.argv[1]
fail = False
if __name__ == "__main__":
    for profile, args in TESTS.items():
        cmd1 = "{} {} --profile {} --dump-config".format(
            QAT_BINARY, " ".join(args), profile
        )

        p = subprocess.Popen(
            [QAT_BINARY, "--profile", profile, "--dump-config"] + args,
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
        )
        out1 = p.communicate()[0]

        p = subprocess.Popen(
            [QAT_BINARY, "--profile", profile, "--dump-config"],
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
        )
        out2 = p.communicate()[0]

        if out1 == out2:
            print("Testing " + profile + " " + "." * (20 - len(profile)) + "[  OK  ]")
        else:
            fail = True
            print("Testing " + profile + " " + "." * (20 - len(profile)) + "[ FAIL ]")

if fail:
    exit(-1)
