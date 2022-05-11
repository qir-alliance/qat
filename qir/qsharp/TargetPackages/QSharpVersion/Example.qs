namespace QATSample {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main(): Result
    {
        use (q1,q2,q3) = (Qubit(), Qubit(), Qubit());
        CCNOT(q1, q2, q3);

        return Zero;
    }
}