none:
	echo "Please specify target"
	
test-examples:
	mkdir -p Debug
	cd Debug && cmake .. && make qat
	export QAT_BINARY=${PWD}/Debug/qir/qat/Apps/qat && \
		cd qir/qsharp && \
		make