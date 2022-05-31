// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {

        for i in 0 .. 10 {
            use (q1,q2,q3) = (Qubit(), Qubit(), Qubit());               
            CNOT(q2, q3);
        }

        return Zero;
    }
}