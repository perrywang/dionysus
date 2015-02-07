package org.dionysus.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.model.Conversation;
import org.dionysus.model.User;
import org.dionysus.service.ConversationService;
import org.dionysus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConversationServiceImpl implements ConversationService {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private UserService userService;
	
	@Override
	@Transactional(readOnly=false)
	public void joinConversation(Long convId, Long userId) {
		Conversation conversation = this.find(convId);
		User user = userService.find(userId);
		conversation.join(user);
		entityManager.persist(conversation);
	}

	@Override
	@Transactional(readOnly=false)
	public void leaveConversation(Long convId, Long userId) {
		Conversation conversation = this.find(convId);
		User user = userService.find(userId);
		conversation.leave(user);
		entityManager.persist(conversation);
	}

	@Override
	public Conversation find(Long id) {
		return entityManager.find(Conversation.class, id);
	}

	@Override
	@Transactional(readOnly=false)
	public Conversation create(String title, User owner) {
		Conversation conversation = new Conversation(title, owner);
		entityManager.persist(conversation);
		return conversation;
	}

	@Override
	@Transactional(readOnly=false)
	public void save(Conversation conversation) {
		entityManager.persist(conversation);
	}
}
