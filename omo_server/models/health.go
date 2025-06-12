package models

type Health struct {
	Header map[string][]string `json:"header"`
	Body   []byte              `json:"body"`
}
