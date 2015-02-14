package org.dionysus.service.impl;

import org.dionysus.domain.Conversation;
import org.dionysus.domain.User;
import org.dionysus.repository.ConversationRepository;
import org.dionysus.repository.UserRepository;
import org.dionysus.service.ConversationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConversationServiceImpl implements ConversationService {
	
	@Autowired
	private UserRepository userService;
	
	@Autowired
	private ConversationRepository conversationRepository;

//	@Override
	@Transactional(readOnly=false)
	public void joinConversation(Long convId, Long userId) {
		Conversation conversation = conversationRepository.findOne(convId);
		User user = userService.findOne(userId);
		conversation.join(user);
		conversationRepository.save(conversation);
	}

//	@Override
	@Transactional(readOnly=false)
	public void leaveConversation(Long convId, Long userId) {
		Conversation conversation = conversationRepository.findOne(convId);
		User user = userService.findOne(userId);
		conversation.leave(user);
		conversationRepository.save(conversation);
	}

//	@Override
	public Conversation create(String title, User owner) {
		Conversation conversation = new Conversation(title, owner);
		conversationRepository.save(conversation);
		return conversation;
	}

}