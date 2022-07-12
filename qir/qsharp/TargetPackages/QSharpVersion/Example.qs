// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

namespace QATSample {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;


@EntryPoint()
operation Main() : Result[] {
    use r0= Qubit();
    use r1= Qubit();
    use r2= Qubit();
    use r3= Qubit();
    use r4= Qubit();    
    use auxiliary = Qubit();
    H(r0);
    H(r1);
    H(r2);
    H(r3);
    H(r4);

    H(auxiliary);
    Z(auxiliary);
    CNOT(r0, auxiliary);
    CNOT(r2, auxiliary);
    CNOT(r4, auxiliary);
    H(r0);
    H(r1);
    H(r2);
    H(r3);
    H(r4);
    return [
    MResetZ(r0),
    MResetZ(r1),
    MResetZ(r2),
    MResetZ(r3),
    MResetZ(r4)
    ] ;
//    let ret = [
//        MResetZ(r0) == One,
//        MResetZ(r1) == One,
//        MResetZ(r2) == One,
//        MResetZ(r3) == One,
//        MResetZ(r4) == One
//    ];
//
//    return ret;
}

}

