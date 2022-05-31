// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {
        use test1 = Qubit[10];
        use test2 = Qubit[10];
        let x = [test1, test2, test1, test2, test1];
        let slice = x[2..4];
        use (q1,q2,q3) = (Qubit(), Qubit(), Qubit());
        let controls = [[q1], slice[0][2..4], slice[0][2..4]][0];        
        Controlled CNOT(controls, (q2, q3));

        return Zero;
    }
}