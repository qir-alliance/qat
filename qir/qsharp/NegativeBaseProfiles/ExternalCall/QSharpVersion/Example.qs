// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(): Int
    {
        use q = Qubit();
        H(q);
        let _ = MResetZ(q);

        return 9;
    }

}