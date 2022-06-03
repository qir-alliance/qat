// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {

        use qubits = Qubit[10];
        for i in 0 .. Length(qubits) {   
            use (q1, q2) = (Qubit(), Qubit());
            CNOT(q1, q2);            
        }


        return Zero;
    }
}