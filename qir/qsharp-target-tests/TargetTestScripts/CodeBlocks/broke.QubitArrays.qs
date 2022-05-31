// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(): Result[]
    {
        use q = Qubit();
        use qubits1 = Qubit[10];
        use qubits2 = Qubit[10];
        use qubits3 = Qubit[10];

        /// 3D array
        let z = [[ qubits1, qubits2, qubits3, qubits1, qubits2, qubits3], [ qubits1, qubits2, qubits3, qubits1, qubits2, qubits3], [ qubits1, qubits2, qubits3, qubits1, qubits2, qubits3], [ qubits1, qubits2, qubits3, qubits1, qubits2, qubits3]];

        /// Eliminate 1D
        let x = z[2][0..3..6];

        let r1 = MResetZ(x[1][5]);

        return [r1, r1,r1,r1];
    }
}