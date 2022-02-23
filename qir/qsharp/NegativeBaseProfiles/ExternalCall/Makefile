all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
	opt -O3 -S QSharpVersion/qir/Example.ll > optimised.ll
	${QAT_BINARY} -S --validate --save-validation-report validation.json  --profile base optimised.ll || echo "failed!"
	@echo "Validation for SimpleLoop finished"
	
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimised.ll
	rm -f validation.json