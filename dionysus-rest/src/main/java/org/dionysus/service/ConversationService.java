package org.dionysus.service;

import org.dionysus.domain.Conversation;
import org.dionysus.domain.User;

public interface ConversationService {
	
	Conversation create(String title, User owner);
	
	void joinConversation(Long convId, Long userId);

	void leaveConversation(Long convId, Long userId);
}
