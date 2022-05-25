import os
import glob
import shutil
import tempfile

import subprocess
import pytest
from TargetTestScripts import available1, available3, available4, SCRIPT_DIR

BASE_DIR = os.path.dirname(__file__)
TEMPLATE_DIR = os.path.join(BASE_DIR, "..", "template")


class QsharpProject(object):
    def __init__(self, filename, type, version, channel):
        self.filename = filename
        self.type = type
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
            project_template = project_template.replace("{{type}}", self.type)
            project_template = project_template.replace("{{version}}", self.version)
            project_template = project_template.replace("{{channel}}", self.channel)

            fb.write(project_template)

        self.project_file = os.path.join(self.project_dir, "Example.qs")

        shutil.copyfile(self.filename, self.project_file)

        if not os.path.isfile(self.project_file):
            raise BaseException("{} does not exist".format(self.project_file))

        self.qir_filename = os.path.join(self.project_dir, "qir",  "Example.ll")

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
            shell=True)

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
    for fr in available1:
        f = os.path.join(SCRIPT_DIR, fr)
        _, name = f.rsplit("/", 1)

        if not os.path.isfile(f):
            continue

        name = prefix + "_" + name.replace("-", "_").replace(".", "_")
        globals()[name] = generate_test(f)
        targets.append(name)

    return targets


target1_tests = create_test_set("target1", available1)
target3_tests = create_test_set("target3", available3)
target4_tests = create_test_set("target4", available4)
