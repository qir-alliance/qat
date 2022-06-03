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
      let pauli = PauliX;
      let numerator = 17;
      let power = 19;
      use qubit = Qubit();

      Adjoint Controlled RFrac([control], (pauli, numerator, power, qubit));

      return Zero;
    }
}

