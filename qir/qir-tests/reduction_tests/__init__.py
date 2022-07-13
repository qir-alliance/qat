import glob
import os

import pytest

BASE_DIR = os.path.dirname(__file__)


def generate_test(filename: str):
    @pytest.fixture()
    def response():
        return filename

    return response


all_reduction = []


for f in glob.glob(os.path.join(BASE_DIR, "*")):
    _, name = f.rsplit("/", 1)

    if not os.path.isfile(f):
        continue

    if not f.endswith("input.ll"):
        continue

    name = "reduction_" + name.replace("-", "_").replace(".", "_")
    locals()[name] = generate_test(f)
    all_reduction.append(name)
