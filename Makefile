.PHONY: all build

image := johnb/kube-hello
port := 8080

all:
	$(MAKE) build

test:
  go test ./app/

build:
	docker build -t ${image}  -f build/Dockerfile .

test:
  go test 
run:
	docker run --rm -it -p ${port}:${port} ${image}:latest	