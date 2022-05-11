import os
import glob
import shutil
import tempfile

import subprocess
import pytest

BASE_DIR = os.path.dirname(__file__)
TEMPLATE_DIR = os.path.join(BASE_DIR, "..", "template")


class QsharpProject(object):
    def __init__(self, filename):
        self.filename = filename

    def __enter__(self):
        self.project_dir = tempfile.mkdtemp()

        # Copying project
        shutil.copytree(TEMPLATE_DIR, self.project_dir, dirs_exist_ok=True)
        self.project_file = os.path.join(self.project_dir, "Example.qs")
        shutil.copyfile(os.path.join(BASE_DIR, self.filename), self.project_file)

        if not os.path.isfile(self.project_file):
            raise BaseException("{} does not exist".format(self.project_file))

        base, _ = self.filename.rsplit(".", 1)
        self.qir_filename = os.path.join(self.project_dir, "qir",  "Example.ll")

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
            shell=True)

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
        _, filename = project_file.rsplit("/", 1)
        return QsharpProject(filename)

    return response


target1_tests = [

]

for f in glob.glob(os.path.join(BASE_DIR, "*.qs")):
    _, name = f.rsplit("/", 1)

    if not os.path.isfile(f):
        continue

    name = "target1_"+name.replace("-", "_").replace(".", "_")
    locals()[name] = generate_test(f)
    print(locals())
    target1_tests.append(name)
