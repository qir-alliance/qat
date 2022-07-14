// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Int[]
    {
        use q1 = Qubit();
        let r1 = MResetZ(q1);

        return [r1 == One? 1 | 2, r1 == Zero? 3 | 4];
    }
}