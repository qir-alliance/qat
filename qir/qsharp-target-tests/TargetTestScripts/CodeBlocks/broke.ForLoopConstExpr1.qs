// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {

        use qubits = Qubit[10];
        for i in 0 .. Length(qubits) {         
            CNOT(qubits[0], qubits[i]);
        }

        return Zero;
    }
}