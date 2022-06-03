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
      let pauli = PauliX;
      let numerator = 17;
      let power = 19;
      use qubit = Qubit();

      Adjoint RFrac(pauli, numerator, power, qubit);

      return Zero;
    }
}

