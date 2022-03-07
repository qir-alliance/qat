namespace SimpleLoop {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    

    @EntryPoint()
    operation Main(): Int
    {
        let x = 2;
        mutable z = 1337;
        if( x == 2)
        {
            set z = 9;
        }

        return z;
    }

}