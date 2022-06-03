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
      use controls = Qubit[10];  

      use control2 = Qubit();
      use target = Qubit();

      Adjoint Controlled CX(controls, (control2, target));

      return Zero;
    }
}

