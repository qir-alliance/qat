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
      use q1 = Qubit();
      use q2 = Qubit();
      let numerator = 39;
      let power = 3;

      ExpFrac([PauliX], numerator, power, [q1, q2]);

      return Zero;
    }
}

