all: QSharpVersion/qir/Example.ll
#	${QAT_BINARY} --apply -S --verify-module --validate --always-inline --unroll-loops --disable-grouping --adaptor provider_b340 QSharpVersion/qir/Example.ll  || echo "failed!"
	${QAT_BINARY} --apply -S --verify-module --validate --always-inline --replace-qubit-on-reset --reindex-qubits --unroll-loops --disable-grouping --adaptor provider_b340 QSharpVersion/qir/Example.ll  || echo "failed!"
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f *.ll
	rm -f validation.json