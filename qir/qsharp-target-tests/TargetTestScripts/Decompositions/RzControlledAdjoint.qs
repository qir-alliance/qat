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
      use control = Qubit();
      let theta = 0.6796677106520194;
      use qubit = Qubit();

      Controlled Adjoint Rz([control], (theta, qubit));

      return Zero;
    }
}

