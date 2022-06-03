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
      let theta = 0.3901831256818906;
      use qubit = Qubit();

      R(pauli, theta, qubit);

      return Zero;
    }
}

