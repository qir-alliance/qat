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
      let theta = 0.3901831256818906;
      use qubit = Qubit();

      Controlled Adjoint  R([control], (pauli, theta, qubit));

      return Zero;
    }
}

