.PHONY: all go-test go-build docker-build docker-test docker-publish docker-run k8s-deploy

image := johnbarber/kube-hello
test_image := iorubs/dgoss
port := 8080
build := ee

all:
	$(MAKE) go-test
	$(MAKE) go-build
	$(MAKE) docker-build
	$(MAKE) docker-test
	$(MAKE) docker-publish
	$(MAKE) k8s-deploy

go-test:
	golint ./app/
	go test ./app/

go-build:
	go build -o ./app/hello ./app/hello.go

docker-build:
	docker build -t ${image}  -f build/Dockerfile .

docker-test: pwd := $(shell pwd)
docker-test:
	pushd ${pwd}/build && docker run --rm -it -v ${pwd}/build:/src -v /var/run/docker.sock:/var/run/docker.sock ${test_image} run ${image} && popd

docker-publish:
	docker tag ${image} ${image}:${build}
	docker push ${image}

docker-run:
	docker run --rm -it -p ${port}:${port} ${image}:latest	

k8s-deploy:
	pushd deploy && ./deploy.sh && popd