import pytest
import os
import glob
BASE_DIR = os.path.dirname(__file__)


def generate_test(filename: str):
    @pytest.fixture()
    def response():
        return filename
    return response


target1_tests = [

]


for f in glob.glob(os.path.join(BASE_DIR, "*.qs")):
    _, name = f.rsplit("/", 1)

    if not os.path.isfile(f):
        continue

    name = "target1_"+name.replace("-", "_").replace(".", "_")
    locals()[name] = generate_test(f)
    target1_tests.append(name)
