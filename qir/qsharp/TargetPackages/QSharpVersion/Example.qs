
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Bool[]
    {
        use q1 = Qubit();
        let r1 = [MResetZ(q1) == One, MResetZ(q1) == Zero, MResetZ(q1) == One, MResetZ(q1) == Zero];

        return r1;        
    }
}