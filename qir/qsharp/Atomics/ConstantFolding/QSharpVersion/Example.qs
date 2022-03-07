namespace SimpleLoop {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(): Int
    {
        let x = 2;
        mutable y =3;
        set y = x * y + 2;
        set y = y * y - y;
        return y;
    }

}