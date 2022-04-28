// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;


    @EntryPoint()
    operation Main(): Unit
    {
        use q1 = Qubit();
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);
        let _ = MResetZ(q1);


    }

}