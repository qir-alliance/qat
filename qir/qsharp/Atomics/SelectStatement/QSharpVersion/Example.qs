// Licensed under the MIT License.

namespace QATSample {

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