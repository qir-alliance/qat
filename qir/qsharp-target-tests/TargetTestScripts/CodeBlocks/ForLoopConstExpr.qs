// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Int
    {

        use qubits = Qubit[10];
        mutable z = 0;
        for i in 0..10
        {
            set z = i + z;
        }

        return z;
    }
}