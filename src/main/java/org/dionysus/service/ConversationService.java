package org.dionysus.service;

import org.dionysus.model.Conversation;
import org.dionysus.model.User;

public interface ConversationService {
	Conversation find(Long id);
	
	Conversation create(String title, User owner);
	
	void save(Conversation conversation);
	
	void joinConversation(Long convId, Long userId);

	void leaveConversation(Long convId, Long userId);
}
