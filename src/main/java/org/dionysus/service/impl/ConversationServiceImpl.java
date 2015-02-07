package org.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.model.Conversation;
import org.dionysus.model.User;
import org.dionysus.repositories.ConversationRepository;
import org.dionysus.repositories.UserRepository;
import org.dionysus.service.ConversationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConversationServiceImpl implements ConversationService {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private UserRepository userService;
	
	@Autowired
	private ConversationRepository conversationRepository;
	
	@Override
	@Transactional(readOnly=false)
	public void joinConversation(Long convId, Long userId) {
		Conversation conversation = conversationRepository.findOne(convId);
		User user = userService.findOne(userId);
		conversation.join(user);
		entityManager.persist(conversation);
	}

	@Override
	@Transactional(readOnly=false)
	public void leaveConversation(Long convId, Long userId) {
		Conversation conversation = conversationRepository.findOne(convId);
		User user = userService.findOne(userId);
		conversation.leave(user);
		entityManager.persist(conversation);
	}

	@Override
	@Transactional(readOnly=false)
	public Conversation create(String title, User owner) {
		Conversation conversation = new Conversation(title, owner);
		conversationRepository.save(conversation);
		return conversation;
	}

}
