all: QSharpVersion/qir/Example.ll
	${QAT_BINARY} --apply -S --verify-module --validate --always-inline --unroll-loops --adaptor default QSharpVersion/qir/Example.ll  || echo "failed!"
	

stdlib: QSharpVersion/qir/Example.ll
	${QAT_BINARY}  QSharpVersion/qir/Example.ll ${QIR_STDLIB} -S --apply --assume-no-except --no-transform-execution-path-only > combined.ll 
	opt -O3 -S combined.ll > optimized.ll

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json
