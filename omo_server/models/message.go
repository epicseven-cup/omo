package models

type Message struct {
	Id      string `json:"id"`
	Sender  string `json:"owner"`
	Content string `json:"content"`
}
