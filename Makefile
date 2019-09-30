.PHONY: all test build build-test publish deploy run

image := johnbarber/kube-hello
test_image := iorubs/dgoss
port := 8080
build := ee

all:
	$(MAKE) test
	$(MAKE) build
	$(MAKE) build-test
	$(MAKE) publish

test:
	golint ./app/
	go test ./app/
	go build -o ./app/hello ./app/hello.go

build:
	docker build -t ${image}  -f build/Dockerfile .

build-test: pwd := $(shell pwd)
build-test:
	pushd ${pwd}/build && docker run --rm -it -v ${pwd}/build:/src -v /var/run/docker.sock:/var/run/docker.sock ${test_image} run ${image} && popd

publish:
	docker tag ${image} ${image}:${build}
	docker push ${image}

deploy:
	pushd deploy && ./deploy.sh && popd

run:
	docker run --rm -it -p ${port}:${port} ${image}:latest	