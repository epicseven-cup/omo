package handlers

import (
	"encoding/json"
	"github.com/epicseven-cup/omo/omo_server/models"
	"io"
	"log"
	"net/http"
)

type HealthHandler struct {
}

func NewHealthHandler() *HealthHandler {
	return &HealthHandler{}
}

func (h *HealthHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	_, err := w.Write([]byte("OK"))

	if err != nil {
		log.Println(err)
		return
	}

	var headers map[string][]string
	for name, values := range r.Header {
		headers[name] = values
	}

	body, err := io.ReadAll(r.Body)
	if err != nil {
		log.Println(err)
		return
	}
	d := models.Health{
		Header: headers,
		Body:   body,
	}

	dj, err := json.Marshal(d)
	if err != nil {
		log.Println(err)
		return
	}

	_, err = w.Write(dj)
	if err != nil {
		log.Println(err)
		return
	}
}
