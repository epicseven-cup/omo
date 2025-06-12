package routes

import (
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

func HealthRoutes(router *mux.Router) {
	router.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		_, err := w.Write([]byte("Healthy"))
		if err != nil {
			log.Println(err)
			return
		}
	}).Methods(http.MethodGet)
}
