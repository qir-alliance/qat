// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Result[]
    {
        use q1 = Qubit[10];


        let r1 = MResetZ(q1[0..2..10][1]);

        return [r1];
    }
}