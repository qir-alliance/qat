// Licensed under the MIT License.

namespace QATSample {

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