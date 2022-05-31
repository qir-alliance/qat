// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Result[]
    {
        use q1 = Qubit[10];

        // This should not require classical capabilities
        let r1 = MResetZ(q1[...2...][1]);

        return [r1];
    }
}