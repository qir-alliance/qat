// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    operation Test(): Unit
    {
        use q3 = Qubit();
        use q4 = Qubit();
        H(q3);
        H(q4);        
    }

    @EntryPoint()
    operation Main(): Int
    {
        use q1 = Qubit();
        use q2 = Qubit();
        H(q1);
        H(q2);

        Test();
        Test();

        return 0;
    }

}