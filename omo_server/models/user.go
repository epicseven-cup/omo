package models

type User struct {
	Id      string `json:"id"`
	Name    string `json:"name"`
	Handle  string `json:"handle"`
	Profile string `json:"profile"`
}
