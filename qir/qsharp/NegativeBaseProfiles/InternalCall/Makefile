all: qat-qsharp

qat-qsharp: QSharpVersion/qir/Example.ll
	opt -S QSharpVersion/qir/Example.ll > optimized.ll
	${QAT_BINARY} -S --validate --save-validation-report validation.json  --profile base optimized.ll || echo "failed!"
	@echo "Validation for SimpleLoop finished"
	
	

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimized.ll
	rm -f validation.json