# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

import sys
from string import Template

version_file, template, output = sys.argv[1:]
with open(version_file, "r") as fb:
	values = [x.strip().split(" ", 1) for x in fb.readlines() if " " in x.strip()]
	kwargs = dict(values)

with open(template, "r") as fb:
	template = Template(fb.read())

with open(output, "w") as f:
	commit_hash = kwargs["STABLE_GIT_COMMIT_HASH"] if "STABLE_GIT_COMMIT_HASH" in kwargs else "unknown"
	is_dirty = kwargs["STABLE_GIT_DIRTY"].strip() == '1'
	major = kwargs["STABLE_GIT_MAJOR"]
	minor = kwargs["STABLE_GIT_MINOR"]
	revision = kwargs["STABLE_GIT_REVISION"]
	channel = kwargs["STABLE_GIT_CHANNEL"]	
	patch = kwargs["STABLE_GIT_PATCH"]	
	full = kwargs["STABLE_FULL_VERSION"]	

	f.write(
	    template.substitute(
	        commit_hash=commit_hash,
	        hash_len=len(commit_hash),
	        is_dirty="true" if is_dirty else "false",
	        major=major,
	        minor=minor,
	        revision=revision,
	        channel=channel,
	        patch=patch,
	        full_version=full
	    )
	)