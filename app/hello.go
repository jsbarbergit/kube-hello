package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

const servePort = "8080"

// KubeHello Send a HTTP Response with Requester's details and the server's hostname
func kubeHello(w http.ResponseWriter, r *http.Request) {
	hostName, err := os.Hostname()
	if err != nil {
		panic(err)
	}
	reqtime := time.Now()
	path := r.URL.Path
	src := r.RemoteAddr
	agent := r.Header.Get("User-Agent")

	// Log to stdout
	// TODO make this JSON object for easier consumption
	fmt.Println(reqtime.String() + "," + path + "," + src + agent)

	// Server message
	message := "Hello " + src + " from URI:" + path + " on Host:" + hostName
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(message))
}

func main() {
	// Server default page
	http.HandleFunc("/", kubeHello)

	// Start Server
	starttime := time.Now()
	fmt.Println(starttime.String() + "- Starting kube-hello server on port: " + servePort)
	if err := http.ListenAndServe(":"+servePort, nil); err != nil {
		panic(err)
	}
}
