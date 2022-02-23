namespace InternalFunctions {
    operation Value(q: Int): Int
    {
       return q == 0 ? 1337 | q*q;
    }

    @EntryPoint()
    operation Main(): Int
    {
        let a = 2;
        let ret = Value(a);
        
        return ret;
    }

}