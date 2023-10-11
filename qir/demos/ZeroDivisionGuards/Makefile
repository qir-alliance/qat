all:
		${QAT_BINARY} --experimental --division-by-zero-guards  --apply -S --adaptor default  --entry-point-attr entry_point  input.ll
debug:
		${QAT_BINARY} --experimental --adaptor none --enable-target-profile-mapping --division-by-zero-guards  --apply -S --entry-point-attr entry_point input.ll
