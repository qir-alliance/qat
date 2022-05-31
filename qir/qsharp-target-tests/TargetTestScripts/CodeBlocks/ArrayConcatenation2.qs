// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Result[]
    {
        use q1 = Qubit[5];
        use q2 = Qubit[5];
        let q =  q2 + q1;
        let z = q1 + q + q + q1;
        let w = [1] + [2,7] + [9, 10, 100];
        let r1 = MResetZ(z[w[2]]);

        return [r1];
    }
}