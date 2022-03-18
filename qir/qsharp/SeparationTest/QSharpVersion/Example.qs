// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;


    @EntryPoint()
    operation Main(angle: Double): Double
    {
        use q1 = Qubit();
        let x = angle * 2.0;

        Rx(x, q1);

        let result = MResetZ(q1);

        let classical_result = result   == One;
        let retval = classical_result? 9.2 | 3.4;
        return retval;
    }

}