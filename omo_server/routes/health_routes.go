package routes

import (
	"github.com/epicseven-cup/omo/omo_server/handlers"
	"github.com/gorilla/mux"
	"net/http"
)

func HealthRoutes(router *mux.Router) {
	router.HandleFunc("/health", handlers.NewHealthHandler().ServeHTTP).Methods(http.MethodGet)
}
