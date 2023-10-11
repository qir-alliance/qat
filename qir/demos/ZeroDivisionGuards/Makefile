all:
		${QAT_BINARY} --experimental --division-by-zero-guards  --apply -S --adaptor default  input.ll
debug:
		${QAT_BINARY} --experimental --adaptor none --enable-target-profile-mapping --division-by-zero-guards  --apply -S  input.ll
