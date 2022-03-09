from qiskit import ClassicalRegister, QuantumCircuit, QuantumRegister
from qiskit_qir import to_qir
from qiskit import transpile
from qiskit.circuit.random import random_circuit
from qiskit_qir.visitor import SUPPORTED_INSTRUCTIONS
import subprocess
import os
import sys


def ghz():
    circuit = QuantumCircuit(4, 3)
    circuit.name = "Qiskit Sample - 3-qubit GHZ circuit"
    circuit.h(0)
    circuit.cx(0, 1)
    circuit.cx(1, 2)
    circuit.measure([0, 1, 2], [0, 1, 2])

    return circuit


def teleport():
    q = QuantumRegister(3, name="q")
    cr = ClassicalRegister(2, name="cr")
    circuit = QuantumCircuit(q, cr, name="Teleport")
    circuit.h(1)
    circuit.cx(1, 2)
    circuit.cx(0, 1)
    circuit.h(0)
    circuit.measure(0, 0)
    circuit.measure(1, 1)
    circuit.x(2).c_if(cr, int("10", 2))
    circuit.z(2).c_if(cr, int("01", 2))

    return circuit


def unroll():
    circ = QuantumCircuit(3)
    circ.ccx(0, 1, 2)
    circ.crz(theta=0.1, control_qubit=0, target_qubit=1)
    circ.id(0)

    return circ.decompose()


def simple_circuit():
    circuit = QuantumCircuit(3, 3, name="my-circuit")
    circuit.h(0)
    circuit.cx(0, 1)
    circuit.cx(1, 2)
    circuit.measure([0, 1, 2], [0, 1, 2])
    return circuit


def generate_random_fixture(num_qubits, depth):
    def random():
        circuit = random_circuit(num_qubits, depth, measure=True)
        return transpile(circuit, basis_gates=SUPPORTED_INSTRUCTIONS)
    return random


TEST_CIRCUITS = [("Ghz", "base", ghz),
                 ("Teleport", "base", teleport),
                 ("Unroll", "base",  unroll),
                 ("Simple circuit", "base",  simple_circuit)]

for num_qubits, depth in [(i+2, j+2) for i in range(9) for j in range(9)]:
    name = f"random_{num_qubits}x{depth}"
    TEST_CIRCUITS.append((name, "base", generate_random_fixture(num_qubits, depth)))

fails = 0
for name, profile, generator in TEST_CIRCUITS:
    circuit = generator()
    qir = to_qir(circuit)
    filename = "test.ll"
    with open(filename, "w") as fb:
        fb.write(qir)

    qat_binary = os.environ.get("QAT_BINARY")
    sys.stdout.write("Running " + name.ljust(40).replace(" ", "."))
    sys.stdout.flush()

    p = subprocess.Popen(
        [qat_binary, "-S", "--validate", "--profile",
         profile, filename],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)

    out, errs = p.communicate()
    if p.returncode == 0:
        sys.stdout.write("[  OK  ]\n")
        sys.stdout.flush()
        continue

    sys.stdout.write("[ FAIL ]\n")
    sys.stdout.flush()

    print("")
    print("Errors:")
    errs = errs.decode('utf-8').strip()
    for line in errs.split("\n"):
        print("    | {}".format(line))
    print("")
    fails += 1


if fails != 0:
    print("")
    print("{} out of {} FAILED.".format(fails, len(TEST_CIRCUITS)))
    exit(-1)
