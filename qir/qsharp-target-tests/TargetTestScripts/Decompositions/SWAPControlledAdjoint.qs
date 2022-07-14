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
      use qubit1 = Qubit();
      use qubit2 = Qubit();

      Controlled Adjoint SWAP([control], (qubit1, qubit2));

      return Zero;
    }
}

