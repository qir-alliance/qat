// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(): Result
    {
      use qubits = Qubit[10];  
      let controls = qubits[1..7];  

      use control2 = Qubit();
      use target = Qubit();

      Adjoint Controlled CX(controls[1..2...], (control2, target));

      return Zero;
    }
}

