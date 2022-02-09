namespace LoopCase {
    operation Value(q: Int): Int
    {
       return q == 0 ? 1337 | q*q;
    }

    @EntryPoint()
    operation Main(nrIter: Int): Int
    {
        let a = 2;
        let ret = Value(a);
        
        return ret;
    }

}