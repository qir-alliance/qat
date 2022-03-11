all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
#	${QAT_BINARY} --apply -S --disable-grouping --profile base QSharpVersion/qir/Example.ll  || echo "failed!"

	${QAT_BINARY} --apply -S -O3 --verify-module --validate --always-inline --unroll-loops --profile base QSharpVersion/qir/Example.ll  || echo "failed!"

ungrouped: QSharpVersion/qir/Example.ll
	${QAT_BINARY} --apply -S -O3 --always-inline --unroll-loops --disable-grouping --profile base QSharpVersion/qir/Example.ll  > ungrouped.ll
	
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json