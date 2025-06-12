package models

type ChatSession struct {
	SessionId string    `json:"sessionId"`
	Users     []string  `json:"users"`
	Messages  []Message `json:"messages"`
}
