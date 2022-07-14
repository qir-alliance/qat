// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {

        use qubits = Qubit[10];
        for q in qubits {   
            CNOT(qubits[0], q);            
        }

        return Zero;
    }
}