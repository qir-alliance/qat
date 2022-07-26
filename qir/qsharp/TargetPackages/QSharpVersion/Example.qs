
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Bool[]
    {
        use q1 = Qubit();
        H(q1);
        let r1 = MResetZ(q1) == One;

        use q2 = Qubit();
        H(q2);
        let r2 = MResetZ(q2) == One;

        use q3 = Qubit();
        H(q3);
        let r3 = MResetZ(q3) == One;

        return [r1, r2, r3];        
    }
}