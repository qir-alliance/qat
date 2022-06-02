// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
   open Microsoft.Quantum.Intrinsic;
   open Microsoft.Quantum.Diagnostics;

   @EntryPoint()
   operation MultiQubitDumpMachineDemo() : Unit {
       use qubits = Qubit[2];

       X(qubits[0]);
       H(qubits[1]);

       R1Frac(1, 2, qubits[1]);
       
       ResetAll(qubits);

       X(qubits[0]);
       H(qubits[1]);

       R1Frac(1, 2, qubits[1]);
       
       ResetAll(qubits);

   }
}