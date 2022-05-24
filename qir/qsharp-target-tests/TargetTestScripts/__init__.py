import os
SCRIPT_DIR = os.path.dirname(__file__)

available1 = [
    "Decompositions/CCNOT.qs",
    "Decompositions/CNOT.qs",
    "Decompositions/CX.qs",
    "Decompositions/CY.qs",
    "Decompositions/CZ.qs",
    "Decompositions/H.qs",
    "Decompositions/I.qs",
    "Decompositions/M.qs",
    "Decompositions/R.qs",
    "Decompositions/R1.qs",
    "Decompositions/R1Frac.qs",
    "Decompositions/RFrac.qs",
    "Decompositions/Rx.qs",
    "Decompositions/Ry.qs",
    "Decompositions/Rz.qs",
    "Decompositions/S.qs",
    "Decompositions/SWAP.qs",
    "Decompositions/T.qs",
    "Decompositions/X.qs",
    "Decompositions/Y.qs",
    "Decompositions/Z.qs",
]

available3 = ["Intrinsic/ApplyControlledX.qs",
              "Intrinsic/ApplyControlledZ.qs",
              "Intrinsic/ApplyUncontrolledH.qs",
              "Intrinsic/ApplyUncontrolledRx.qs", "Intrinsic/ApplyUncontrolledRy.qs", "Intrinsic/ApplyUncontrolledRz.qs", "Intrinsic/ApplyUncontrolledS.qs", "Intrinsic/ApplyUncontrolledSAdj.qs", "Intrinsic/ApplyUncontrolledSWAP.qs", "Intrinsic/ApplyUncontrolledT.qs", "Intrinsic/ApplyUncontrolledTAdj.qs", "Intrinsic/ApplyUncontrolledX.qs", "Intrinsic/ApplyUncontrolledY.qs", "Intrinsic/ApplyUncontrolledZ.qs", "Intrinsic/MZ.qs", "Intrinsic/Reset.qs", "Decompositions/AssertOperationsEqualInPlace.qs", "Decompositions/AssertOperationsEqualReferenced.qs", "Decompositions/CCNOTFromCCZ.qs", "Decompositions/CNOTFromSinglyControlled.qs", "Decompositions/CX.qs", "Decompositions/CYFromCNOT.qs", "Decompositions/CZFromSinglyControlled.qs", "Decompositions/ExpFracFromExpUtil.qs", "Decompositions/ExpFromExpUtil.qs", "Decompositions/ExpUtil.qs",
              "Decompositions/HFromSinglyControlled.qs", "Decompositions/I.qs", "Decompositions/Measure.qs", "Decompositions/MResetXExplicit.qs", "Decompositions/MResetYExplicit.qs", "Decompositions/MResetZExplicit.qs", "Decompositions/MWithPostPrep.qs", "Decompositions/PreparePostMNoop.qs", "Decompositions/RFromSinglyControlledR1.qs", "Decompositions/R1FromSinglyControlled.qs", "Decompositions/R1Frac.qs", "Decompositions/ResetAll.qs", "Decompositions/RFrac.qs", "Decompositions/RxFromSinglyControlled.qs", "Decompositions/RyFromSinglyControlled.qs", "Decompositions/RzFromSinglyControlled.qs", "Decompositions/SFromSinglyControlled.qs", "Decompositions/SWAPFromSinglyControlled.qs", "Decompositions/TFromSinglyControlled.qs", "Decompositions/XFromSinglyControlled.qs", "Decompositions/YFromSinglyControlled.qs", "Decompositions/ZFromSinglyControlled.qs", "Decompositions/SetToBasisState.qs", "Decompositions/Utils.qs"]

available4 = ["Intrinsic/ApplyControlledX.qs", "Intrinsic/ApplyControlledZ.qs", "Intrinsic/ApplyUncontrolledH.qs", "Intrinsic/ApplyUncontrolledRx.qs", "Intrinsic/ApplyUncontrolledRy.qs", "Intrinsic/ApplyUncontrolledRz.qs", "Intrinsic/ApplyUncontrolledS.qs", "Intrinsic/ApplyUncontrolledSAdj.qs", "Intrinsic/ApplyUncontrolledSWAP.qs", "Intrinsic/ApplyUncontrolledT.qs", "Intrinsic/ApplyUncontrolledTAdj.qs", "Intrinsic/ApplyUncontrolledX.qs", "Intrinsic/ApplyUncontrolledY.qs", "Intrinsic/ApplyUncontrolledZ.qs", "Intrinsic/MZ.qs", "Intrinsic/Reset.qs", "Decompositions/AssertOperationsEqualInPlace.qs", "Decompositions/AssertOperationsEqualReferenced.qs", "Decompositions/CCNOTFromCCZ.qs", "Decompositions/CNOTFromSinglyControlled.qs", "Decompositions/CX.qs", "Decompositions/CYFromCNOT.qs", "Decompositions/CZFromSinglyControlled.qs", "Decompositions/ExpFracFromExpUtil.qs", "Decompositions/ExpFromExpUtil.qs",
              "Decompositions/ExpUtil.qs", "Decompositions/HFromSinglyControlled.qs", "Decompositions/I.qs", "Decompositions/M.qs", "Decompositions/MeasureWithNoReuse.qs", "Decompositions/MResetXExplicit.qs", "Decompositions/MResetYExplicit.qs", "Decompositions/MResetZExplicit.qs", "Decompositions/PreparePostMNoop.qs", "Decompositions/RFromSinglyControlledR1.qs", "Decompositions/R1FromSinglyControlled.qs", "Decompositions/R1Frac.qs", "Decompositions/ResetAll.qs", "Decompositions/RFrac.qs", "Decompositions/RxFromSinglyControlled.qs", "Decompositions/RyFromSinglyControlled.qs", "Decompositions/RzFromSinglyControlled.qs", "Decompositions/SFromSinglyControlled.qs", "Decompositions/SWAPFromSinglyControlled.qs", "Decompositions/TFromSinglyControlled.qs", "Decompositions/XFromSinglyControlled.qs", "Decompositions/YFromSinglyControlled.qs", "Decompositions/ZFromSinglyControlled.qs", "Decompositions/SetToBasisState.qs", "Decompositions/Utils.qs"]
