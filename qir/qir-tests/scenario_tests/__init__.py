import glob
import os

import pytest

BASE_DIR = os.path.dirname(__file__)


def generate_test(directory: str):
    @pytest.fixture()
    def response():
        return directory

    return response


all_scenarios = []


for f in glob.glob(os.path.join(BASE_DIR, "scenario*")):
    _, name = f.rsplit("/", 1)

    if not os.path.isdir(f):
        continue

    name = "scenario_" + name.replace("-", "_").replace(".", "_")
    locals()[name] = generate_test(f)

    all_scenarios.append(name)
