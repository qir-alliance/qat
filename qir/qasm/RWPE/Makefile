all:
		${QAT_BINARY} --apply -S -O3 --always-inline --unroll-loops --disable-grouping --profile base  input.ll


group:
		${QAT_BINARY} --apply -S -O3 --always-inline --unroll-loops --profile base  input.ll


validate:
		${QAT_BINARY} --apply -S -O3 --verify-module --validate --always-inline --unroll-loops --profile base  input.ll > /dev/null
