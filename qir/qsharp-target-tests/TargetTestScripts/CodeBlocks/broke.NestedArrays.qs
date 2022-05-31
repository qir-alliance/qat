// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {

        use qubits = Qubit[10];
        let xx = [[[[[[[[[[[[ [qubits, qubits] ]]]]]]]]]]]];
        
        CNOT(xx[0][0][0][0][0][0][0][0][0][0][0][0][Length(xx[0][0][0][0][0][0][0][0][0][0][0][0]) -1][Length(xx[0][0][0][0][0][0][0][0][0][0][0][0][Length(xx[0][0][0][0][0][0][0][0][0][0][0][0]) - 1]) - 1], q);            

        return Zero;
    }
}