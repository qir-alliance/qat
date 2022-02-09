namespace LoopCase {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(nrIter: Int): Int
    {
        mutable ret = 1;
        use q = Qubit();
        H(q);
        let _ = MResetZ(q);

        return 9;
    }

}