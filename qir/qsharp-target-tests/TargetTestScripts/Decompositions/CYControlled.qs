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
      use control1 = Qubit();
      use control2 = Qubit();
      use target = Qubit();

      Controlled CY([control1], (control2, target));

      return Zero;
    }
}

