// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {
        use q = Qubit();
        use qubits1 = Qubit[10];
        use qubits2 = Qubit[10];
        use qubits3 = Qubit[10];

        let arrays = [qubits1, qubits2, qubits3];
        let x = 10;
        mutable z = x + 1;
        if(x == z)
        {
            H(arrays[1][5]);
        }
        else
        {
            H(arrays[2][5]);
        }



        return Zero;
    }
}