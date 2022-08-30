nothing:
	@echo "Preventing the user from accidentality running the first command."


documentation:
	docker build -f Docker/Docs.dockerfile -t qir-passes-docs:latest .	

documentation-shell: documentation
	docker run --rm -i -t qir-passes-docs:latest sh

serve-docs:  documentation
	docker run -it --rm -p 8080:80 --name qir-documentation -t qir-passes-docs:latest

doxygen:
	doxygen doxygen.cfg


linux-docker-no-cache:
	docker build --no-cache -f Docker/CI.Ubuntu22.dockerfile -t qir-passes-ubuntu:latest .

linux-docker:
	docker build -f Docker/CI.Ubuntu22.dockerfile -t qir-passes-ubuntu:latest .

linux-ci: linux-docker
	docker run -it -v ${PWD}:/src --rm -t qir-passes-ubuntu:latest /bin/bash

format-in-docker: linux-docker
	docker run -it --rm -v ${PWD}:/src/ -t qir-passes-ubuntu:latest ./manage stylecheck --fix-issues


qat-docker:
	docker run --rm -it --platform linux/amd64 bazel/qir/qat:qat-image /bin/sh

test-examples:
	mkdir -p Debug
	cd Debug && cmake .. && make qat
	export QAT_BINARY=${PWD}/Debug/qir/qat/Apps/qat && \
		cd qir/qsharp && \
		make

add-newlines-eof:
	git ls-files -z "*.cpp" "*.hpp" | while IFS= read -rd '' f; do tail -c1 < "$f" | read -r _ || echo >> "$f"; done	


clean:
	rm -rf Release/
	rm -rf Debug/
	find . | grep ".profraw" | xargs rm	
	cd QirExamples && make clean

