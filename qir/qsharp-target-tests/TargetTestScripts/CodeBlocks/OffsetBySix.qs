// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation OffsetBySix(q: Qubit[]): Qubit[]
    {
      let z = q[3...];
      return z[3...];
    }

    @EntryPoint()
    operation Main(): Result
    {
      use qubits = Qubit[10];  
      use control2 = Qubit();
      use target = Qubit();
      let controls = OffsetBySix(qubits);

      Adjoint Controlled CX(controls, (control2, target));
      ResetAll(controls);

      return Zero;
    }
}

