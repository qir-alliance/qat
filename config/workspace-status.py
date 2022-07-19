import re
import subprocess
import sys


def get_full_version(
    major, minor, revision, channel, patch, commit_hash, is_dirty, **kwargs
):
    # TODO: Replicated code from version-lib-generator
    full = "%s.%s.%s" % (major, minor, revision)
    if channel != "release":
        full += "-%s" % channel

    if patch != "0":
        full += "-patch-%s-%s" % (patch, commit_hash[:10])

    if is_dirty:
        full += "-wip"

    return full


def main():
    print("STABLE_GIT_COMMIT_HASH unknown")
    print("STABLE_GIT_DIRTY 1")
    print("STABLE_GIT_MAJOR 0")
    print("STABLE_GIT_MINOR 0")
    print("STABLE_GIT_REVISION 0")
    print("STABLE_GIT_CHANNEL release")
    print("STABLE_GIT_PATCH 0")
    print("STABLE_FULL_VERSION unknown")




def get_git_hash(path):
    p = subprocess.Popen(["git", "rev-parse", "HEAD"], cwd=path, stdout=subprocess.PIPE)
    (out, err) = p.communicate()
    if p.returncode != 0:
        sys.exit(p.returncode)
    return out.decode("ascii").strip()


def is_git_dirty(path):
    p = subprocess.Popen(["git", "status", "-s"], cwd=path, stdout=subprocess.PIPE)
    (out, err) = p.communicate()
    if p.returncode != 0:
        sys.exit(p.returncode)
    return out.decode("ascii").strip() != ""


def get_version(path):
    ret = {
        "major": 0,
        "minor": 0,
        "revision": 0,
        "channel": "release",
        "patch": 0,
        "build": "unkown",
    }

    pattern = re.compile(
        r"(v\.? ?)?(?P<major>\d+)(\.(?P<minor>\d\d?))(\.(?P<revision>\d\d?))?(\-(?P<channel>\w[\w\d]+))?(\-(?P<patch>\d+)\-(?P<build>[\w\d]{10}))?"
    )
    p = subprocess.Popen(
        ["git", "describe"], cwd=path, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )

    (out, err) = p.communicate()
    if p.returncode != 0:
        return ret

    out = out.decode("ascii").strip()

    if "fatal" in out.lower():
        return ret

    m = pattern.search(out)
    if m:
        ret["channel"] = "release"
        ret.update(m.groupdict())
        if ret["patch"] is None:
            ret["patch"] = 0
        if ret["channel"] is None:
            ret["channel"] = "release"

    return ret


if __name__ == "__main__":
    main()
