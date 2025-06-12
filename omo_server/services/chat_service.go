package services

import "github.com/epicseven-cup/omo/omo_server/models"

type ChatService struct {
}

// NewChatService returns a new ChatService instance handling chat interface
func NewChatService() *ChatService {
	return &ChatService{}
}

// CreateChatSession create new ChatSession
func (c *ChatService) CreateChatSession(chatSession *models.ChatSession) *models.ChatSession {
	return &models.ChatSession{}
}

// GetChatSession return ChatSession base on input id
func (c *ChatService) GetChatSession(id string) *models.ChatSession {
	return &models.ChatSession{}
}

// DeleteChatSession delete ChatSession
func (c *ChatService) DeleteChatSession(id string) error {
	return nil
}

// AddUser add user to ChatSession
func (c *ChatService) AddUser(id string, userId string) error {
	return nil
}

// RemoveUser remove use from ChatSession
func (c *ChatService) RemoveUser(id string) error {
	return nil
}

func (c *ChatService) AddMessage(id string, message *models.Message) *models.Message {
	return nil
}
