


namespace ConstArrayReduction {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;

    operation Meas2(pauli1 : Pauli, pauli2 : Pauli, scratch : Qubit, q1 : Qubit, q2 : Qubit) : Result {
        H(scratch);

        if pauli1 == PauliX {
            CNOT(scratch, q1);
        } elif pauli1 == PauliY {
            S(q1);
            CNOT(scratch, q1);
            Adjoint S(q1);
        } elif pauli1 == PauliZ {
            CZ(scratch, q1);
        }

        if pauli2 == PauliX {
            CNOT(scratch, q2);
        } elif pauli2 == PauliY {
            S(q2);
            CNOT(scratch, q2);
            Adjoint S(q2);
        } elif pauli2 == PauliZ {
            CZ(scratch, q2);
        }

        H(scratch);
        return MResetZ(scratch);
    }


    operation Meas3(pauli1 : Pauli, pauli2 : Pauli, pauli3 : Pauli, scratch : Qubit, q1 : Qubit, q2 : Qubit, q3 : Qubit) : Result {
        H(scratch);

        if pauli1 == PauliX {
            CNOT(scratch, q1);
        } elif pauli1 == PauliY {
            S(q1);
            CNOT(scratch, q1);
            Adjoint S(q1);
        } elif pauli1 == PauliZ {
            CZ(scratch, q1);
        }

        if pauli2 == PauliX {
            CNOT(scratch, q2);
        } elif pauli2 == PauliY {
            S(q2);
            CNOT(scratch, q2);
            Adjoint S(q2);
        } elif pauli2 == PauliZ {
            CZ(scratch, q2);
        }

        if pauli3 == PauliX {
            CNOT(scratch, q3);
        } elif pauli3 == PauliY {
            S(q3);
            CNOT(scratch, q3);
            Adjoint S(q3);
        } elif pauli3 == PauliZ {
            CZ(scratch, q3);
        }

        H(scratch);
        return MResetZ(scratch);
    }


    @EntryPoint()
    operation Main(z:Int): Int
    {
        use (
            q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11
            )        = (Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(), Qubit() );

        use (
            a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11
            )        = (Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(),Qubit(), Qubit() );

        mutable countsNeg = 0;
        mutable countsPos = 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a0, q1, q2, q3) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a1, q8, q9, q10) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a2, q5, q6, q7) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a3, q4, q5, q6) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a4, q9, q10, q11) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a5, q9, q10, q11) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a6, q1, q2, q3) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a7, q0, q1, q2) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a8, q4, q5, q6) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a9, q8, q9, q10) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliY, PauliZ, PauliY, a10, q0, q1, q2) == Zero ? 1 | 0;
        set countsNeg += Meas3(PauliX, PauliZ, PauliX, a11, q5, q6, q7) == Zero ? 1 | 0;


        set countsPos += Meas2(PauliZ, PauliZ, a0, q4, q5) == Zero ? 1 | 0;
        set countsPos += Meas2(PauliZ, PauliZ, a1, q6, q7) == Zero ? 1 | 0;
        set countsPos += Meas2(PauliZ, PauliZ, a2, q8, q9) == Zero ? 1 | 0;
        set countsNeg += Meas2(PauliZ, PauliZ, a3, q2, q3) == Zero ? 1 | 0;
        // Place all single-qubit measurements last!
        set countsNeg += MResetZ(q3) == Zero ? 1 | 0;
        set countsPos += MResetZ(q9) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q6) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q2) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q5) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q4) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q7) == Zero ? 1 | 0;
        set countsNeg += MResetZ(q8) == Zero ? 1 | 0;

        Reset(q0);
        Reset(q1);
        Reset(q2);
        Reset(q3);
        Reset(q4);
        Reset(q5);
        Reset(q6);
        Reset(q7);
        Reset(q8);
        Reset(q9);
        Reset(q10);
        Reset(q11);        

        return countsNeg + countsPos;
    }
}

