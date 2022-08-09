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
        "--no-allow-internal-calls",
        "--no-allow-poison",
        "--no-allow-undef",
        "--no-allow-internal-calls",
        "--use-static-result-allocation",
        "--use-static-qubit-allocation",
        "--use-static-qubit-array-allocation",
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
        "--no-allow-internal-calls",
        "--no-allow-poison",
        "--no-allow-undef",
        "--no-allow-internal-calls",
        "--use-static-result-allocation",
        "--use-static-qubit-allocation",
        "--use-static-qubit-array-allocation",
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
        "--use-one-shot-measurements",
        "--entry-point-attr",
        "EntryPoint",
        "--no-allow-internal-calls",
        "--no-allow-poison",
        "--no-allow-undef",
        "--no-allow-internal-calls",
        "--use-static-result-allocation",
        "--use-static-qubit-allocation",
        "--use-static-qubit-array-allocation",
    ],
}


QAT_BINARY = sys.argv[1]
fail = False
if __name__ == "__main__":
    for profile, args in TESTS.items():
        cmd1 = "{} {}  --profile generic --dump-config".format(
            QAT_BINARY, " ".join(args)
        )

        p = subprocess.Popen(
            [QAT_BINARY, "--profile", profile, "--dump-config"] + args,
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
        )
        out1 = p.communicate()[0].decode("utf-8")
        out1 = out1.replace(": generic", ": {}".format(profile))

        p = subprocess.Popen(
            [QAT_BINARY, "--profile", profile, "--dump-config"],
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
        )
        out2 = p.communicate()[0].decode("utf-8")

        if out1 == out2:
            print("Testing " + profile + " " + "." * (20 - len(profile)) + "[  OK  ]")
        else:
            fail = True
            print("Testing " + profile + " " + "." * (20 - len(profile)) + "[ FAIL ]")
            lines1 = out1.split("\n")
            lines2 = out2.split("\n")

            for i in range(min(len(lines1), len(lines2))):
                line1 = lines1[i]
                line2 = lines2[i]

                if line1 != line2:
                    print("- {}".format(line1))
                    print("+ {}".format(line2))

            if len(lines1) > len(lines2):
                for line1 in lines1[i:]:
                    print("- {}".format(line1))

            if len(lines1) < len(lines2):
                for line2 in lines2[i:]:
                    print("+ {}".format(line2))


if fail:
    exit(-1)
