package org.dionysus;

import org.dionysus.domain.Conversation;
import org.dionysus.domain.User;
import org.dionysus.repository.ConversationRepository;
import org.dionysus.repository.UserRepository;
import org.dionysus.service.ConversationService;
import org.junit.Assert;
import org.junit.Before;
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

	private User owner;
	private User userA;
	private User userB;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ConversationService conversationService;
	
	@Autowired
	private ConversationRepository conversationRepository;

	@Before
	public void setUp() {
		owner = userRepository.save(new User("admin", "admin",
				"admin@dionysus.org"));
		userA = userRepository.save(new User("userA", "userA",
				"usera@dionysus.org"));
		userB = userRepository.save(new User("userB", "userB",
				"userb@dionysus.org"));
	}

	@Test
	public void testCreateConversation() {
		Conversation conv = conversationService.create("Test Conversation",
				owner);
		Assert.assertNotNull(conv.getId());
	}

	@Test
	public void testJoinAndLeaveConversation() {
		Conversation conv = conversationService.create("test conversation",
				owner);

		conversationService.joinConversation(conv.getId(), userA.getId());
		conversationService.joinConversation(conv.getId(), userB.getId());
		conv = conversationRepository.findOne(conv.getId());
		Assert.assertEquals(conv.getParticipants().size(), 2);

		conversationService.leaveConversation(conv.getId(), userA.getId());
		conv = conversationRepository.findOne(conv.getId());
		Assert.assertEquals(conv.getParticipants().size(), 1);
	}
}
