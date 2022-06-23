// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

 @EntryPoint()
    operation Main() : Int {
        use q = Qubit();
        H(q);

        mutable i = 0;
        if M(q) == One {
            set i = 1;
        }

        return i;
    }
}