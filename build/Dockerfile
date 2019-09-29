FROM golang:alpine
COPY app/ /go/app/
RUN go build -o /go/hello app/hello.go
EXPOSE 8080
ENTRYPOINT ["/go/hello"]