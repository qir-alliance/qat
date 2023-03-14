# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
#

try:
    from test_circuits import core_tests as CIRCUITS
except:  # noqa: E722
    raise BaseException("Could not find Qiskit QIR tests")

import logging
import os
import subprocess
import tempfile

import pytest
from qiskit_qir import to_qir_module

logger = logging.getLogger(__name__)


def validate_circuit(name, profile, circuit):
    module, _ = to_qir_module(circuit)
    qir = str(module)

    with tempfile.NamedTemporaryFile() as tmp:
        filename = tmp.name
        tmp.write(qir.encode())

        qat_binary = os.environ.get("QAT_BINARY")

        p = subprocess.Popen(
            [qat_binary, "-S", "--validate", "--apply", "--adaptor", profile, filename],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )

        out, errs = p.communicate()
        ret = p.returncode == 0

        if not ret:
            print("QAT error output:")
            errs = errs.decode()
            for line in errs.strip().split("\n"):
                print("    | {}".format(line))

            print("")
            print("QAT std output:")
            out = out.decode()
            for line in out.strip().split("\n"):
                print("    | {}".format(line))

    return ret


@pytest.mark.parametrize("circuit_name", CIRCUITS)
def test_qat_validation(circuit_name, request):
    circuit = request.getfixturevalue(circuit_name)
    module, _ = to_qir_module(circuit)
    generated_ir = str(module)
    logger.debug(generated_ir)
    assert validate_circuit(circuit_name, "default", circuit)
