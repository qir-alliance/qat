all:
		${QAT_BINARY} --apply -S --target-def target.yaml input.ll


validate-output:
		${QAT_BINARY} --apply -S --always-inline --target-def target.yaml --validate input.ll lib.ll


validate-input:
		${QAT_BINARY} -S --target-def target.yaml --validate input.ll lib.ll
