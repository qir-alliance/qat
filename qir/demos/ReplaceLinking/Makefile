all:
		${QAT_BINARY} --apply -S --target-def target.yaml main.ll


validate-output:
		${QAT_BINARY} --apply -S --always-inline --target-def target.yaml --validate main.ll lib.ll


validate-input:
		${QAT_BINARY} -S --target-def target.yaml --validate main.ll lib.ll
