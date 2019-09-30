# kube hello
A simple Go HTTP Server which accepts requests and serves a hello message with some details about the request.

This repo also includes deployment scripts for runing and accessing the server on a minikube cluster. The k8s manifests will work with any k8s cluster, but you will need to rework extrnal access to the service as required if not a minikube platform.

## Pre-Requisites

- Golang (incl. golint)
- Docker
- Kubectl
- A working minikube deployment with correctly configured kubectl

## Application Testing

Run Go Lint and Unit Tests with `make go-test`

golint tool can be installed as follows: `go get -u golang.org/x/lint/golint`

## Application Build

A binary artefact can be created by the following command: `make go-build`

## CI Build

Example CircleCI config is included to perform go test and build steps

## Docker Build

A docker container for the application is built using the following Makefile command: `make docker-build docker-test`

Goss is used for testing the docker image.


## Deployment

The Server is designed to run as a docker container deployed using your favourite orchestrator, such as k8s. K8S manifests are included to deploy the following resources:
- Separate namespace: `kube-hello`
- Deployment (Size 3)
- Service (Type: NodePort)

Deploy by using the Makefile command: `make k8s-deploy`

## Logging
The Server logs to standard out and these messages should be collected from the k8s/docker host(s) as required

## Running on minikube
A deployment of 3 kube-hello pods with NodePort Service, exposed via minikube has been tested as follows on OSX:

```
brew cask install minikube;
minikube start --vm-driver=hyperkit;
make all;
```

To verify the service is functioning correctly, review the output of the `make all` command for the externally accessible URL.

Use a command line tool such as curl to browse to the service endpoint, e.g. 

`curl http://<MINIKUBE_CLUSTER_IP>:<SERVICE_NODE_PORT>`

A browser can also be used, but caching may prevent the user from verifying load balancing is taking effect
