# kube hello
A Simple Go HTTP Server

## Purpose

Accept requests and serve a hello message with some details about the request

## Testing

Run Go Unit Tests with `make test`

## Build

A docker container for the application is built using the following Makefile command: `make build`


## Deployment

The server is designed to run as a docker container using your favourite orchestrator, such as k8s. An example k8s deployment is included in the code base.

It can also be run locally as follows:

`docker run --rm -it johnb/kube-hello:latest`

or by using the Makefile command: `make run`

## Logging
The Server logs to standard out and these messages should be collected from the docker host as required