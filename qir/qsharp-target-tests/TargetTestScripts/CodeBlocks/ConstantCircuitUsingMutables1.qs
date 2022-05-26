// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation F4(q: Qubit, n: Int): Int
    {
      H(q);
      return n + 1;
    }


    operation F3(q: Qubit, n: Int): Int
    {
      H(q);      
      return F4(q,n+1);
    }

    operation F2(q: Qubit, n: Int): Int
    {
      H(q);      
      return F3(q, n+1);
    }


    operation F1(q: Qubit, n: Int): Int
    {
      H(q);      
      return F2(q,n+1);
    }

    @EntryPoint()
    operation Main(): Result
    {
      use qubits = Qubit[10];  
      use control2 = Qubit();
      use target = Qubit();
      mutable x = F1(target, 0);

      if(x == 4)
      {
        set x = 3;

        if(x == 4)
        {
          set x = 1;
        }
        else
        {
          set x = 2;
        }
      }

      if(x == 2)
      {
        set x = 4;
        Adjoint Controlled CX(qubits, (control2, target));
      }

      if(x == 4)
      {
        set x = 9;
      }

      if(x == 9)
      {
        ResetAll(qubits);
      }

      return Zero;
    }
}

