import os
import shutil
import subprocess
import tempfile

import pytest

SCRIPT_DIR = os.path.dirname(__file__)
# TODO(issue-93): Activate remaining codeblock examples.

available1 = [
    "Decompositions/CCNOT.qs",
    "Decompositions/CCNOTAdjoint.qs",
    "Decompositions/CCNOTControlled.qs",
    "Decompositions/CCNOTAdjointControlled.qs",
    "Decompositions/CCNOTControlledAdjoint.qs",
    "Decompositions/CNOT.qs",
    "Decompositions/CNOTAdjoint.qs",
    "Decompositions/CNOTControlled.qs",
    "Decompositions/CNOTAdjointControlled.qs",
    "Decompositions/CNOTControlledAdjoint.qs",
    "Decompositions/CX.qs",
    "Decompositions/CXAdjoint.qs",
    "Decompositions/CXControlled.qs",
    "Decompositions/CXAdjointControlled.qs",
    "Decompositions/CXControlledAdjoint.qs",
    "Decompositions/CY.qs",
    "Decompositions/CYAdjoint.qs",
    "Decompositions/CYControlled.qs",
    "Decompositions/CYAdjointControlled.qs",
    "Decompositions/CYControlledAdjoint.qs",
    "Decompositions/CZ.qs",
    "Decompositions/CZAdjoint.qs",
    "Decompositions/CZControlled.qs",
    "Decompositions/CZAdjointControlled.qs",
    "Decompositions/CZControlledAdjoint.qs",
    "Decompositions/H.qs",
    "Decompositions/HAdjoint.qs",
    "Decompositions/HControlled.qs",
    "Decompositions/HAdjointControlled.qs",
    "Decompositions/HControlledAdjoint.qs",
    "Decompositions/I.qs",
    "Decompositions/IAdjoint.qs",
    "Decompositions/IControlled.qs",
    "Decompositions/IAdjointControlled.qs",
    "Decompositions/IControlledAdjoint.qs",
    "Decompositions/Measure.qs",
    "Decompositions/MeasureEachZ.qs",
    "Decompositions/M.qs",
    "Decompositions/MResetX.qs",
    "Decompositions/MResetY.qs",
    "Decompositions/MResetZ.qs",
    "Decompositions/R.qs",
    "Decompositions/RAdjoint.qs",
    "Decompositions/RControlled.qs",
    "Decompositions/RAdjointControlled.qs",
    "Decompositions/RControlledAdjoint.qs",
    "Decompositions/R1.qs",
    "Decompositions/R1Adjoint.qs",
    "Decompositions/R1Controlled.qs",
    "Decompositions/R1AdjointControlled.qs",
    "Decompositions/R1ControlledAdjoint.qs",
    "Decompositions/R1Frac.qs",
    "Decompositions/R1FracAdjoint.qs",
    "Decompositions/R1FracControlled.qs",
    "Decompositions/R1FracAdjointControlled.qs",
    "Decompositions/R1FracControlledAdjoint.qs",
    "Decompositions/RFrac.qs",
    "Decompositions/RFracAdjoint.qs",
    "Decompositions/RFracControlled.qs",
    "Decompositions/RFracAdjointControlled.qs",
    "Decompositions/RFracControlledAdjoint.qs",
    "Decompositions/Reset.qs",
    "Decompositions/ResetAdjoint.qs",
    "Decompositions/ResetControlled.qs",
    "Decompositions/ResetAdjointControlled.qs",
    "Decompositions/ResetControlledAdjoint.qs",
    "Decompositions/Rx.qs",
    "Decompositions/RxAdjoint.qs",
    "Decompositions/RxControlled.qs",
    "Decompositions/RxAdjointControlled.qs",
    "Decompositions/RxControlledAdjoint.qs",
    "Decompositions/Ry.qs",
    "Decompositions/RyAdjoint.qs",
    "Decompositions/RyControlled.qs",
    "Decompositions/RyAdjointControlled.qs",
    "Decompositions/RyControlledAdjoint.qs",
    "Decompositions/Rz.qs",
    "Decompositions/RzAdjoint.qs",
    "Decompositions/RzControlled.qs",
    "Decompositions/RzAdjointControlled.qs",
    "Decompositions/RzControlledAdjoint.qs",
    "Decompositions/S.qs",
    "Decompositions/SAdjoint.qs",
    "Decompositions/SControlled.qs",
    "Decompositions/SAdjointControlled.qs",
    "Decompositions/SControlledAdjoint.qs",
    "Decompositions/SWAP.qs",
    "Decompositions/SWAPAdjoint.qs",
    "Decompositions/SWAPControlled.qs",
    "Decompositions/SWAPAdjointControlled.qs",
    "Decompositions/SWAPControlledAdjoint.qs",
    "Decompositions/SetToBasisState.qs",
    "Decompositions/T.qs",
    "Decompositions/TAdjoint.qs",
    "Decompositions/TControlled.qs",
    "Decompositions/TAdjointControlled.qs",
    "Decompositions/TControlledAdjoint.qs",
    "Decompositions/X.qs",
    "Decompositions/XAdjoint.qs",
    "Decompositions/XControlled.qs",
    "Decompositions/XAdjointControlled.qs",
    "Decompositions/XControlledAdjoint.qs",
    "Decompositions/Y.qs",
    "Decompositions/YAdjoint.qs",
    "Decompositions/YControlled.qs",
    "Decompositions/YAdjointControlled.qs",
    "Decompositions/YControlledAdjoint.qs",
    "Decompositions/Z.qs",
    "Decompositions/ZAdjoint.qs",
    "Decompositions/ZControlled.qs",
    "Decompositions/ZAdjointControlled.qs",
    "Decompositions/ZControlledAdjoint.qs",
    "CodeBlocks/ArrayConcatenation.qs",
    "CodeBlocks/ArrayConcatenation2.qs",
    "CodeBlocks/Branching1.qs",
    "CodeBlocks/BranchingAndQubitArrays.qs",
    "CodeBlocks/ConstantCircuitUsingMutables1.qs",
    "CodeBlocks/ForLoop1.qs",
    "CodeBlocks/ForLoop2.qs",
    "CodeBlocks/ForLoopConstExpr.qs",
    "CodeBlocks/ForLoopQubits.qs",
    "CodeBlocks/OffsetBySix.qs",
    "CodeBlocks/QubitArray2.qs",
    "CodeBlocks/QubitArrays1.qs",
    # "CodeBlocks/Range1.qs",
    # "CodeBlocks/ReadResultAsBool.qs",
    "CodeBlocks/Select1.qs",
    "CodeBlocks/TwoDArray.qs",
    "CodeBlocks/TwoDArray2.qs",
]

available3 = [
    "Decompositions/CCNOT.qs",
    "Decompositions/CCNOTAdjoint.qs",
    "Decompositions/CCNOTControlled.qs",
    "Decompositions/CCNOTAdjointControlled.qs",
    "Decompositions/CCNOTControlledAdjoint.qs",
    "Decompositions/CNOT.qs",
    "Decompositions/CNOTAdjoint.qs",
    "Decompositions/CNOTControlled.qs",
    "Decompositions/CNOTAdjointControlled.qs",
    "Decompositions/CNOTControlledAdjoint.qs",
    "Decompositions/CX.qs",
    "Decompositions/CXAdjoint.qs",
    "Decompositions/CXControlled.qs",
    "Decompositions/CXAdjointControlled.qs",
    "Decompositions/CXControlledAdjoint.qs",
    "Decompositions/CY.qs",
    "Decompositions/CYAdjoint.qs",
    "Decompositions/CYControlled.qs",
    "Decompositions/CYAdjointControlled.qs",
    "Decompositions/CYControlledAdjoint.qs",
    "Decompositions/CZ.qs",
    "Decompositions/CZAdjoint.qs",
    "Decompositions/CZControlled.qs",
    "Decompositions/CZAdjointControlled.qs",
    "Decompositions/CZControlledAdjoint.qs",
    "Decompositions/H.qs",
    "Decompositions/HAdjoint.qs",
    "Decompositions/HControlled.qs",
    "Decompositions/HAdjointControlled.qs",
    "Decompositions/HControlledAdjoint.qs",
    "Decompositions/I.qs",
    "Decompositions/IAdjoint.qs",
    "Decompositions/IControlled.qs",
    "Decompositions/IAdjointControlled.qs",
    "Decompositions/IControlledAdjoint.qs",
    "Decompositions/Measure.qs",
    "Decompositions/MeasureEachZ.qs",
    "Decompositions/M.qs",
    "Decompositions/MResetX.qs",
    "Decompositions/MResetY.qs",
    "Decompositions/MResetZ.qs",
    "Decompositions/R.qs",
    "Decompositions/RAdjoint.qs",
    "Decompositions/RControlled.qs",
    "Decompositions/RAdjointControlled.qs",
    "Decompositions/RControlledAdjoint.qs",
    "Decompositions/R1.qs",
    "Decompositions/R1Adjoint.qs",
    "Decompositions/R1Controlled.qs",
    "Decompositions/R1AdjointControlled.qs",
    "Decompositions/R1ControlledAdjoint.qs",
    "Decompositions/R1Frac.qs",
    "Decompositions/R1FracAdjoint.qs",
    "Decompositions/R1FracControlled.qs",
    "Decompositions/R1FracAdjointControlled.qs",
    "Decompositions/R1FracControlledAdjoint.qs",
    "Decompositions/RFrac.qs",
    "Decompositions/RFracAdjoint.qs",
    "Decompositions/RFracControlled.qs",
    "Decompositions/RFracAdjointControlled.qs",
    "Decompositions/RFracControlledAdjoint.qs",
    "Decompositions/Reset.qs",
    "Decompositions/ResetAdjoint.qs",
    "Decompositions/ResetControlled.qs",
    "Decompositions/ResetAdjointControlled.qs",
    "Decompositions/ResetControlledAdjoint.qs",
    "Decompositions/Rx.qs",
    "Decompositions/RxAdjoint.qs",
    "Decompositions/RxControlled.qs",
    "Decompositions/RxAdjointControlled.qs",
    "Decompositions/RxControlledAdjoint.qs",
    "Decompositions/Ry.qs",
    "Decompositions/RyAdjoint.qs",
    "Decompositions/RyControlled.qs",
    "Decompositions/RyAdjointControlled.qs",
    "Decompositions/RyControlledAdjoint.qs",
    "Decompositions/Rz.qs",
    "Decompositions/RzAdjoint.qs",
    "Decompositions/RzControlled.qs",
    "Decompositions/RzAdjointControlled.qs",
    "Decompositions/RzControlledAdjoint.qs",
    "Decompositions/S.qs",
    "Decompositions/SAdjoint.qs",
    "Decompositions/SControlled.qs",
    "Decompositions/SAdjointControlled.qs",
    "Decompositions/SControlledAdjoint.qs",
    "Decompositions/SWAP.qs",
    "Decompositions/SWAPAdjoint.qs",
    "Decompositions/SWAPControlled.qs",
    "Decompositions/SWAPAdjointControlled.qs",
    "Decompositions/SWAPControlledAdjoint.qs",
    "Decompositions/SetToBasisState.qs",
    "Decompositions/T.qs",
    "Decompositions/TAdjoint.qs",
    "Decompositions/TControlled.qs",
    "Decompositions/TAdjointControlled.qs",
    "Decompositions/TControlledAdjoint.qs",
    "Decompositions/X.qs",
    "Decompositions/XAdjoint.qs",
    "Decompositions/XControlled.qs",
    "Decompositions/XAdjointControlled.qs",
    "Decompositions/XControlledAdjoint.qs",
    "Decompositions/Y.qs",
    "Decompositions/YAdjoint.qs",
    "Decompositions/YControlled.qs",
    "Decompositions/YAdjointControlled.qs",
    "Decompositions/YControlledAdjoint.qs",
    "Decompositions/Z.qs",
    "Decompositions/ZAdjoint.qs",
    "Decompositions/ZControlled.qs",
    "Decompositions/ZAdjointControlled.qs",
    "Decompositions/ZControlledAdjoint.qs",
    "CodeBlocks/ArrayConcatenation.qs",
    "CodeBlocks/ArrayConcatenation2.qs",
    "CodeBlocks/Branching1.qs",
    "CodeBlocks/BranchingAndQubitArrays.qs",
    "CodeBlocks/ConstantCircuitUsingMutables1.qs",
    "CodeBlocks/ForLoop1.qs",
    "CodeBlocks/ForLoop2.qs",
    "CodeBlocks/ForLoopConstExpr.qs",
    "CodeBlocks/ForLoopQubits.qs",
    "CodeBlocks/OffsetBySix.qs",
    "CodeBlocks/QubitArray2.qs",
    "CodeBlocks/QubitArrays1.qs",
    # "CodeBlocks/Range1.qs",
    # "CodeBlocks/ReadResultAsBool.qs",
    "CodeBlocks/Select1.qs",
    "CodeBlocks/TwoDArray.qs",
    "CodeBlocks/TwoDArray2.qs",
]

available4 = [
    "Decompositions/CCNOT.qs",
    "Decompositions/CCNOTAdjoint.qs",
    "Decompositions/CCNOTControlled.qs",
    "Decompositions/CCNOTAdjointControlled.qs",
    "Decompositions/CCNOTControlledAdjoint.qs",
    "Decompositions/CNOT.qs",
    "Decompositions/CNOTAdjoint.qs",
    "Decompositions/CNOTControlled.qs",
    "Decompositions/CNOTAdjointControlled.qs",
    "Decompositions/CNOTControlledAdjoint.qs",
    "Decompositions/CX.qs",
    "Decompositions/CXAdjoint.qs",
    "Decompositions/CXControlled.qs",
    "Decompositions/CXAdjointControlled.qs",
    "Decompositions/CXControlledAdjoint.qs",
    "Decompositions/CY.qs",
    "Decompositions/CYAdjoint.qs",
    "Decompositions/CYControlled.qs",
    "Decompositions/CYAdjointControlled.qs",
    "Decompositions/CYControlledAdjoint.qs",
    "Decompositions/CZ.qs",
    "Decompositions/CZAdjoint.qs",
    "Decompositions/CZControlled.qs",
    "Decompositions/CZAdjointControlled.qs",
    "Decompositions/CZControlledAdjoint.qs",
    "Decompositions/H.qs",
    "Decompositions/HAdjoint.qs",
    "Decompositions/HControlled.qs",
    "Decompositions/HAdjointControlled.qs",
    "Decompositions/HControlledAdjoint.qs",
    "Decompositions/I.qs",
    "Decompositions/IAdjoint.qs",
    "Decompositions/IControlled.qs",
    "Decompositions/IAdjointControlled.qs",
    "Decompositions/IControlledAdjoint.qs",
    "Decompositions/Measure.qs",
    "Decompositions/MeasureEachZ.qs",
    "Decompositions/M.qs",
    "Decompositions/MResetX.qs",
    "Decompositions/MResetY.qs",
    "Decompositions/MResetZ.qs",
    "Decompositions/R.qs",
    "Decompositions/RAdjoint.qs",
    "Decompositions/RControlled.qs",
    "Decompositions/RAdjointControlled.qs",
    "Decompositions/RControlledAdjoint.qs",
    "Decompositions/R1.qs",
    "Decompositions/R1Adjoint.qs",
    "Decompositions/R1Controlled.qs",
    "Decompositions/R1AdjointControlled.qs",
    "Decompositions/R1ControlledAdjoint.qs",
    "Decompositions/R1Frac.qs",
    "Decompositions/R1FracAdjoint.qs",
    "Decompositions/R1FracControlled.qs",
    "Decompositions/R1FracAdjointControlled.qs",
    "Decompositions/R1FracControlledAdjoint.qs",
    "Decompositions/RFrac.qs",
    "Decompositions/RFracAdjoint.qs",
    "Decompositions/RFracControlled.qs",
    "Decompositions/RFracAdjointControlled.qs",
    "Decompositions/RFracControlledAdjoint.qs",
    "Decompositions/Reset.qs",
    "Decompositions/ResetAdjoint.qs",
    "Decompositions/ResetControlled.qs",
    "Decompositions/ResetAdjointControlled.qs",
    "Decompositions/ResetControlledAdjoint.qs",
    "Decompositions/Rx.qs",
    "Decompositions/RxAdjoint.qs",
    "Decompositions/RxControlled.qs",
    "Decompositions/RxAdjointControlled.qs",
    "Decompositions/RxControlledAdjoint.qs",
    "Decompositions/Ry.qs",
    "Decompositions/RyAdjoint.qs",
    "Decompositions/RyControlled.qs",
    "Decompositions/RyAdjointControlled.qs",
    "Decompositions/RyControlledAdjoint.qs",
    "Decompositions/Rz.qs",
    "Decompositions/RzAdjoint.qs",
    "Decompositions/RzControlled.qs",
    "Decompositions/RzAdjointControlled.qs",
    "Decompositions/RzControlledAdjoint.qs",
    "Decompositions/S.qs",
    "Decompositions/SAdjoint.qs",
    "Decompositions/SControlled.qs",
    "Decompositions/SAdjointControlled.qs",
    "Decompositions/SControlledAdjoint.qs",
    "Decompositions/SWAP.qs",
    "Decompositions/SWAPAdjoint.qs",
    "Decompositions/SWAPControlled.qs",
    "Decompositions/SWAPAdjointControlled.qs",
    "Decompositions/SWAPControlledAdjoint.qs",
    # TODO(issue-92): Not supported by hardware "Decompositions/SetToBasisState.qs",
    "Decompositions/T.qs",
    "Decompositions/TAdjoint.qs",
    "Decompositions/TControlled.qs",
    "Decompositions/TAdjointControlled.qs",
    "Decompositions/TControlledAdjoint.qs",
    "Decompositions/X.qs",
    "Decompositions/XAdjoint.qs",
    "Decompositions/XControlled.qs",
    "Decompositions/XAdjointControlled.qs",
    "Decompositions/XControlledAdjoint.qs",
    "Decompositions/Y.qs",
    "Decompositions/YAdjoint.qs",
    "Decompositions/YControlled.qs",
    "Decompositions/YAdjointControlled.qs",
    "Decompositions/YControlledAdjoint.qs",
    "Decompositions/Z.qs",
    "Decompositions/ZAdjoint.qs",
    "Decompositions/ZControlled.qs",
    "Decompositions/ZAdjointControlled.qs",
    "Decompositions/ZControlledAdjoint.qs",
    # "CodeBlocks/ArrayConcatenation.qs",
    # "CodeBlocks/ArrayConcatenation2.qs",
    # "CodeBlocks/Branching1.qs",
    # "CodeBlocks/BranchingAndQubitArrays.qs",
    # "CodeBlocks/ConstantCircuitUsingMutables1.qs",
    "CodeBlocks/ForLoop1.qs",
    "CodeBlocks/ForLoop2.qs",
    # "CodeBlocks/ForLoopConstExpr.qs",
    "CodeBlocks/ForLoopQubits.qs",
    "CodeBlocks/OffsetBySix.qs",
    "CodeBlocks/QubitArray2.qs",
    "CodeBlocks/QubitArrays1.qs",
    # "CodeBlocks/Range1.qs",
    # "CodeBlocks/ReadResultAsBool.qs",
    # "CodeBlocks/Select1.qs",
    "CodeBlocks/TwoDArray.qs",
    "CodeBlocks/TwoDArray2.qs",
]


BASE_DIR = os.path.dirname(__file__)
TEMPLATE_DIR = os.path.join(BASE_DIR, "..", "template")


class QsharpProject(object):
    def __init__(self, filename, execution_target, version, channel):
        self.filename = filename
        self.execution_target = execution_target
        self.version = version
        self.channel = ""
        if channel:
            self.channel = "-{}".format(channel)

    def __enter__(self):
        self.project_dir = tempfile.mkdtemp()

        # Copying project
        shutil.copytree(TEMPLATE_DIR, self.project_dir, dirs_exist_ok=True)

        # Updating project file
        with open(os.path.join(TEMPLATE_DIR, "Example.csproj"), "r") as fb:
            project_template = fb.read()

        with open(os.path.join(self.project_dir, "Example.csproj"), "w") as fb:
            project_template = project_template.replace(
                "{{executionTarget}}", self.execution_target
            )
            project_template = project_template.replace("{{version}}", self.version)
            project_template = project_template.replace("{{channel}}", self.channel)

            extra_fields = ""
            if self.execution_target == "quantinuum.qpu":
                extra_fields = "<TargetCapability>AdaptiveExecution</TargetCapability>"
            project_template = project_template.replace("{{extraFields}}", extra_fields)

            fb.write(project_template)

        self.project_file = os.path.join(self.project_dir, "Example.qs")

        shutil.copyfile(self.filename, self.project_file)

        if not os.path.isfile(self.project_file):
            raise BaseException("{} does not exist".format(self.project_file))

        self.qir_filename = os.path.join(self.project_dir, "qir", "Example.ll")

        return self

    def __exit__(self, type, value, traceback):
        shutil.rmtree(self.project_dir)

    def compile(self):
        olddir = os.getcwd()
        os.chdir(self.project_dir)
        p = subprocess.Popen(
            " ".join(["dotnet", "build", "."]),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True,
        )

        out, errs = p.communicate()
        errs = errs.decode()
        out = out.decode()
        ret = p.returncode == 0
        if not ret or not os.path.exists(self.qir_filename):
            if not os.path.exists(self.qir_filename):
                print("FAILED GENERATING", self.qir_filename)

            print("Failure while compiling ", self.filename)

            print("Q# input:")
            with open(self.filename, "r") as fb:
                for line in fb.readlines():
                    print("    | {}".format(line.rstrip()))

            print("Q# error output:")
            for line in errs.strip().split("\n"):
                print("    | {}".format(line))

            print("")
            print("Q# std output:")
            for line in out.strip().split("\n"):
                print("    | {}".format(line))

        else:
            print("Compiled - finished.", self.filename)

        os.chdir(olddir)
        return ret


def generate_test(project_file: str):
    @pytest.fixture()
    def response():
        def x(type, version, channel):
            return QsharpProject(project_file, type, version, channel)

        return x

    return response


def create_test_set(prefix, availables):
    targets = []
    for fr in availables:
        f = os.path.join(SCRIPT_DIR, fr)
        _, name = f.rsplit("/", 1)

        if not os.path.isfile(f):
            continue

        name = prefix + "_" + name.replace("-", "_").replace(".", "_")
        globals()[name] = generate_test(f)
        print(name)

        targets.append(name)

    return targets


target1_tests = create_test_set("target1", available1)
target3_tests = create_test_set("target3", available3)
target4_tests = create_test_set("target4", available4)
