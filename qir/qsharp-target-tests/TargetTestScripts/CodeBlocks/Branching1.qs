// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
   open Microsoft.Quantum.Intrinsic;
   open Microsoft.Quantum.Diagnostics;

   @EntryPoint()
   operation MultiQubitDumpMachineDemo(x: Int) : Unit {
       use qubits = Qubit[2];

       if(x == 1)
       {
         X(qubits[0]);
         H(qubits[1]);
       }
       else
       {
         X(qubits[1]);
         H(qubits[0]);
       }

       R1Frac(1, 2, qubits[1]);
       
       ResetAll(qubits);

   }
}