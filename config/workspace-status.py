#!/usr/bin/evn python
import re
import subprocess
import sys


def get_full_version(
    major, minor, revision, channel, patch, commit_hash, is_dirty, **kwargs
):
    full = "%s.%s.%s" % (major, minor, revision)
    if channel != "release":
        full += "-%s" % channel

    if str(patch) != "0":
        full += "-patch-%s-%s" % (patch, commit_hash[:8])

    if is_dirty:
        full += "-wip"

    return full


def main():
    git_hash = get_git_hash(".")
    git_is_dirty = is_git_dirty(".")
    version = get_version(".")
    version.update({"commit_hash": git_hash, "is_dirty": git_is_dirty})
    version["full_version"] = get_full_version(**version)

    print("STABLE_GIT_COMMIT_HASH {}".format(git_hash))
    print("STABLE_GIT_DIRTY {}".format("1" if git_is_dirty else "0"))
    print("STABLE_GIT_MAJOR {major}".format(**version))
    print("STABLE_GIT_MINOR {minor}".format(**version))
    print("STABLE_GIT_REVISION {revision}".format(**version))
    print("STABLE_GIT_CHANNEL {channel}".format(**version))
    print("STABLE_GIT_PATCH {patch}".format(**version))
    print("STABLE_FULL_VERSION {full_version}".format(**version))


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
        "major": "0",
        "minor": "0",
        "revision": "0",
        "channel": "release",
        "patch": "0",
        "build": "unknown",
    }

    pattern = re.compile(
        r"(v\.? ?)?(?P<major>\d+)(\.(?P<minor>\d\d?))(\.(?P<revision>\d\d?))?(\-(?P<channel>\w[\w\d]+))?(\-(?P<patch>\d+)\-(?P<build>[\w\d]{2,64}))?"
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
            ret["patch"] = "0"
        if ret["channel"] is None:
            ret["channel"] = "release"

    return ret


if __name__ == "__main__":
    main()
