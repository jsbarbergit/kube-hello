.PHONY: all test build build-test run

image := johnbarber/kube-hello
test_image := iorubs/dgoss
port := 8080

all:
	$(MAKE) test
	$(MAKE) build
	$(MAKE) build-test
	$(MAKE) run

test:
	go test ./app/

build:
	docker build -t ${image}  -f build/Dockerfile .

build-test: pwd = $(shell pwd)
build-test:
	pushd ${pwd}/build && docker run --rm -it -v ${pwd}:/src -v /var/run/docker.sock:/var/run/docker.sock ${test_image} run ${image} && popd

run:
	docker run --rm -it -p ${port}:${port} ${image}:latest	