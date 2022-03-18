// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    operation MiniCircuit(q1: Qubit,q2: Qubit): Unit
    {
        H(q1);
        H(q2);
        CNOT(q1, q2);
    }

    @EntryPoint()
    operation Main(): Unit
    {
        use q1 = Qubit();
        use q2 = Qubit();

        MiniCircuit(q1, q2);
        MiniCircuit(q1, q2);
    }

}