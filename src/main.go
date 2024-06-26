package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/sleroq/matrix-wiki/src/handlers"
)

func main() {
	h := handlers.New()

	server := &http.Server{
		Addr:         "localhost:6969",
		Handler:      h,
		ReadTimeout:  time.Second * 10,
		WriteTimeout: time.Second * 10,
	}

	fmt.Printf("Listening on http://%v\n", server.Addr)
	server.ListenAndServe()
}
