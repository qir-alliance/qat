lib/stdlib-cxx.ll:
	clang++ -O1 -mllvm -disable-llvm-optzns -S -emit-llvm -c src/stdlib.cpp -o lib/stdlib-cxx.ll
	# --target=i386-pc-linux-gnu
lib/stdlib.ll:
	clang -O1 -mllvm -disable-llvm-optzns -S -emit-llvm  -c src/stdlib.c -o lib/stdlib.ll
	# --target=i386-none-none 
	# --target=i386-pc-linux-gnu

target/stdlib.bc: lib/stdlib.ll
	llvm-as lib/stdlib.ll -o target/stdlib.bc

target/stdlib-cxx.bc: lib/stdlib-cxx.ll
	llvm-as lib/stdlib-cxx.ll -o target/stdlib-cxx.bc

target/stdlib.o: target/stdlib.bc
	mkdir -p target/
	llc -filetype=obj -o target/stdlib.o target/stdlib.bc 

target/stdlib-cxx.o: target/stdlib-cxx.bc
	mkdir -p target/
	llc -filetype=obj -o target/stdlib-cxx.o target/stdlib-cxx.bc 

target/c-test-suite: target/stdlib.o
	clang -O1 target/stdlib.o tests/csuite/test.c -o target/c-test-suite

target/cpp-test-suite: target/stdlib-cxx.o
	clang++ -O1 -Iinclude/ target/stdlib-cxx.o tests/cppsuite/array.cpp -o target/cpp-test-stdlib-cxx
	clang++ -O1 -Iinclude/ target/stdlib.o tests/cppsuite/array.cpp -o target/cpp-test-stdlib


target/ir-test-suite: lib/stdlib.ll
	llvm-link tests/irsuite/test.ll lib/stdlib.ll  -o target/ir-test-suite.bc
	llc -filetype=obj -o target/ir-test-suite.o target/ir-test-suite.bc	
	clang -O1 target/ir-test-suite.o -o target/ir-test-suite


testsuite: target/c-test-suite target/cpp-test-suite

test:
	rm -f ./lib/stdlib*
	rm -f ./target/cpp-test-suite
	make testsuite
	./target/cpp-test-stdlib-cxx
	./target/cpp-test-stdlib

clean:
	rm -rf target