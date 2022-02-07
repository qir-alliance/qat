all: QSharpVersion/qir/Example.ll
	${QAT_BINARY}  QSharpVersion/qir/Example.ll ${QIR_STDLIB} -O3 -S --apply > combined.ll 
	opt -O3 -S combined.ll > optimised.ll
#	${QAT_BINARY} -S --validate --save-validation-report validation.json --profile base QSharpVersion/qir/Example.ll > /dev/null
	@echo "Validation for ConstQubitArray finished"
	

stdlib: QSharpVersion/qir/Example.ll
	${QAT_BINARY}  QSharpVersion/qir/Example.ll ${QIR_STDLIB} -S --apply --assume-no-except --no-transform-execution-path-only > combined.ll 
	opt -O3 -S combined.ll > optimised.ll

QSharpVersion/qir/Example.ll:
	cd QSharpVersion && make qir/Example.ll

clean:
	cd QSharpVersion && make clean
	rm -f combined.ll optimised.ll
	rm -f validation.json
