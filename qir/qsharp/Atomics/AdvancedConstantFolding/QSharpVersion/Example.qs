// Licensed under the MIT License.

namespace QATSample {
    operation Noop(x: Int): Int 
    {
        mutable ret = x;

        if(x == 2)
        {
            set ret = 2;
        }

        return ret;
    }

    operation No(x: Int): Int 
    {
        mutable ret = x * x;

        if(x == 1)
        {
            set ret = 1;
        }
        elif(x == 2)
        {
            set ret = 4;
        }
        elif(x == 3)
        {
            set ret = 9;
        }


        return ret / x;
    }


    @EntryPoint()
    operation Main(z: Int): Int
    {
        let x = 2;
        mutable y = Noop(3);
        set y = No(Noop(Noop(x) * y + No(2)));
        set y = Noop(y * No(y) - Noop(Noop(z)));
        return y + Noop(z);
    }

}