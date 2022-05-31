// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Result[]
    {
        use q = Qubit[10];

        // Expecting measure on qubit 7
        let r1 = MResetZ(q[0..-1..10][2]);

        let z = q[0..-1..10];

        // Expecting measure on qubit 1
        let r2 = MResetZ(z[8]);
        return [r1];
    }
}