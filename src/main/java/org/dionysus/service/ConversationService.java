package org.dionysus.service;

import org.dionysus.model.Conversation;
import org.dionysus.model.User;

public interface ConversationService {
	
	Conversation create(String title, User owner);
	
	void joinConversation(Long convId, Long userId);

	void leaveConversation(Long convId, Long userId);
}
