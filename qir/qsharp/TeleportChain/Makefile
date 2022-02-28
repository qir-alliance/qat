all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
	${QAT_BINARY} --apply -S -O3 --verify-module --always-inline --unroll-loops --profile base QSharpVersion/qir/Example.ll #> combined.ll
#	${QAT_BINARY} -S --apply --validate --save-validation-report validation.json --profile base combined.ll
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json