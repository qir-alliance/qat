// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Arrays;

    @EntryPoint()
    operation Main(): Int
    {
        mutable arr = [1,2,3,4,5,6,7,8,9,10];

        return arr[3];
    }
}