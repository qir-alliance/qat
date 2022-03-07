namespace SimpleLoop {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main(x: Int): Int
    {
        mutable ret = x;
        if(x == 2)
        {
            set ret = 9;
        }

        return ret;
    }

}