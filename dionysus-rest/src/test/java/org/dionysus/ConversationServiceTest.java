package org.dionysus;

import org.dionysus.domain.Conversation;
import org.dionysus.domain.User;
import org.dionysus.repository.ConversationRepository;
import org.dionysus.repository.UserRepository;
import org.dionysus.service.ConversationService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = Application.class)
public class ConversationServiceTest {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ConversationService conversationService;

	@Autowired
	private ConversationRepository conversationRepository;

	@Test
	public void testCreateConversation() {
		User owner = userRepository.save(new User("admin", "admin", "admin@dionysus.org"));
		Conversation conv = conversationService.create("Test Conversation", owner);
		Assert.assertNotNull(conv.getId());
	}
	
}
