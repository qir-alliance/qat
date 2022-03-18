// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(nrIter: Int): Int
    {
        mutable ret = 1;
        if (nrIter == 1) {
            use q = Qubit();
            H(q);
            set ret = 9;
        }

        return ret;
    }

}