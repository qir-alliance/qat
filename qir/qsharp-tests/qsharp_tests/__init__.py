import glob
import os
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET

import pytest

BASE_DIR = os.path.dirname(__file__)
QSHARP_SAMPLES = os.environ.get("QSHARP_SAMPLES")


class QsharpProject(object):
    def __init__(self, project_dir, filename):
        self.original_project_dir = project_dir
        self.filename = filename
        self.has_relative_dependencies = False
        self.skip = False

    def __enter__(self):
        self.project_dir = tempfile.mkdtemp()

        # Copying project
        shutil.copytree(self.original_project_dir, self.project_dir, dirs_exist_ok=True)
        self.project_file = os.path.join(self.project_dir, self.filename)

        if not os.path.isfile(self.project_file):
            raise BaseException("{} does not exist".format(self.project_file))

        # Updating project to emitting QIR
        tree = ET.parse(self.project_file)
        root = tree.getroot()

        # Updating to QIR generation
        for group in root.iter("PropertyGroup"):
            qir_generation = group.find("QirGeneration")
            if qir_generation is None:
                qir_generation = ET.SubElement(group, "QirGeneration")
            qir_generation.text = "true"

            library_type = group.find("OutputType")
            if library_type is not None:
                library_type.text = "Exe"

        for group in root.iter("ItemGroup"):
            if group.find("ProjectReference") is not None:
                self.has_relative_dependencies = True
                self.skip = True

            if group.find("Compile") is not None:
                self.skip = True

        # Dumping tree
        tree.write(self.project_file)
        with open(self.project_file, "r") as fb:
            self.config = fb.read()

        base, _ = self.filename.rsplit(".", 1)
        self.qir_filename = os.path.join(self.project_dir, "qir", base + ".ll")

        return self

    def __exit__(self, type, value, traceback):
        shutil.rmtree(self.project_dir)

    def compile(self):
        olddir = os.getcwd()
        os.chdir(self.project_dir)
        p = subprocess.Popen(
            " ".join(["dotnet", "build", self.filename]),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True,
        )

        out, errs = p.communicate()
        errs = errs.decode()
        out = out.decode()
        ret = p.returncode == 0
        if not ret:
            print("FAILED COMPILING", self.filename)

            print("Q# config:")
            for line in self.config.strip().split("\n"):
                print("    | {}".format(line))

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
        project_dir, filename = project_file.rsplit("/", 1)
        return QsharpProject(project_dir, filename)

    return response


all_qsharp = []

ignore_files = ["CHSHGame.csproj"]  # TODO(tfr): debug this example

for project_file in glob.glob(
    os.path.join(QSHARP_SAMPLES, "**", "*.csproj"), recursive=True
):
    project_dir, name = project_file.rsplit("/", 1)
    filename = name

    if filename in ignore_files:
        continue

    if not os.path.isfile(project_file):
        continue

    with QsharpProject(project_dir, filename) as project:
        print(project.filename, project.has_relative_dependencies)
        if project.skip:
            continue

    name = "qsharp_" + name.replace("-", "_").replace(".", "_")
    locals()[name] = generate_test(project_file)

    all_qsharp.append(name)
all_qsharp.reverse()
