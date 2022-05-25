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
      let numerator = 18;
      let power = 20;
      use qubit = Qubit();

      Adjoint Controlled R1Frac([control], (numerator, power, qubit));

      return Zero;
    }
}

