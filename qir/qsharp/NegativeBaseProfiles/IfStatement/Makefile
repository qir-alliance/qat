all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
	${QAT_BINARY} --apply -S --verify-module --always-inline --disable-grouping --profile base QSharpVersion/qir/Example.ll > combined.ll
	opt -O3 -S combined.ll > optimized.ll
	${QAT_BINARY} -S --validate --save-logs validation.json  --profile base optimized.ll || echo "failed!"
	@echo "Validation for SimpleLoop finished"
	
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json