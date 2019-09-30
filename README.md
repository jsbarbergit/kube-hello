# kube hello
A simple Go HTTP Server which accepts requests and serves a hello message with some details about the request

## Pre-requisites

- Golang
- Docker
- Kubectl
- A working minikube deployment with correctly configured kubectl

## Unit Testing

Run Go Unit Tests with `make test`

## Docker Build

A docker container for the application is built using the following Makefile command: `make build build-test`

Goss is used for testing the docker image.


## Deployment

The server is designed to run as a docker container using your favourite orchestrator, such as k8s. An example k8s deployment is included in the code base.

Deploy by using the Makefile command: `make deploy`

## Logging
The Server logs to standard out and these messages should be collected from the docker host as required

## How to run
Tested as follows on OSX:

```
brew cask install minikube;
minikube start --vm-driver=hyperkit;
make deploy;
```

To verify the service is functioning correctly, review the output of the `make deploy` command for the externally accessible URL.
Use a command line tool such as curl to browse to the service endpoint, e.g. `curl http://<MINIKUBE_CLUSTER_IP>:<SERVICE_NODE_PORT>`
A browser can also be used, but caching may prevent the user from seeing the load balancing in action
