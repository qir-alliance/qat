all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
	${QAT_BINARY} --apply -S --verify-module --validate --always-inline --unroll-loops --full-unroll-count 900000000000 --adaptor default QSharpVersion/qir/Example.ll  || echo "failed!"
	
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json