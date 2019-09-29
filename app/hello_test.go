package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestSayHelloHandler(t *testing.T) {
	t.Run("return 200", func(t *testing.T) {
		request, _ := http.NewRequest(http.MethodGet, "/hello", nil)
		response := httptest.NewRecorder()

		kubeHello(response, request)

		got := response.Code
		want := 200

		if got != want {
			t.Errorf("got %q, want %q", got, want)
		}
	})
}
