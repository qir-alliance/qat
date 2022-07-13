namespace Testing {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;

@EntryPoint
operation BernsteinVazirani() : Result[] {
    use register = Qubit[5];
    use auxiliary = Qubit();
    for q in register {
        H(q);
    }
    H(auxiliary);
    Z(auxiliary);
    SecretFunction(register, auxiliary);
    for q in register {
        H(q);
    }
    let results = MeasureEachZ(register);
    return results;
}
operation SecretFunction(register : Qubit[], auxiliary : Qubit) : Unit {
    CNOT(register[0], auxiliary);
    CNOT(register[2], auxiliary);
    CNOT(register[4], auxiliary);
}
}