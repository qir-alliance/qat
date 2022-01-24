import os
import json
import subprocess

path = os.path.dirname(__file__)
QAT_BINARY = os.environ['QAT_BINARY']

# Creating stats
all_data = []
for d in os.listdir(path):
    if not os.path.isdir(d):
        continue

    print(d)
    d = os.path.join(path, d)
    for f in os.listdir(d):
        if os.path.isdir(f):
            continue

        print("=> ", f)
        cmd = [
            QAT_BINARY,
            "-S",
            "--apply",
            "-O3",
            "--validate",
            "--save-validation-report",
            "/tmp/validation.json",
            "--profile",
            "base",
            os.path.join(d, f)
        ]

        try:
            x = subprocess.check_output(" ".join(cmd), shell=True)
        except:  # noqa: E722
            pass

        with open("/tmp/validation.json", "r") as fb:
            contents = fb.read()
            data = json.loads(contents)

        all_data.append((len(data), f, data))


opcounts = {

}

all_data.sort()
for c, d, data in all_data:
    print(d.ljust(40), c)

    for err in data:
        err = err["message"]
        if "'" in err:
            _, op, _ = err.split("'", 2)
            if op not in opcounts:
                opcounts[op] = {"count": 0, "op": op, "used_by": []}

            opcounts[op]["count"] += 1
            opcounts[op]["used_by"].append(d)

print()
opcodes = [(b["count"], name, b) for name, b in opcounts.items()]
opcodes.sort()
for count, name, op in opcodes:
    print(op["op"].ljust(40), count, op["used_by"])
