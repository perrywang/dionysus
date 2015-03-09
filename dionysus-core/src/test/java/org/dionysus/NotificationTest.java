package org.dionysus;

import java.util.Collection;
import java.util.UUID;

import javax.transaction.Transactional;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.domain.Comment;
import org.dionysus.domain.Inbox;
import org.dionysus.domain.Notification;
import org.dionysus.domain.User;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = DomainApplicationContext.class)
public class NotificationTest extends AbstractAuthenticatedTest{

	@Test
	public void testSendNotificationOnArticleComment() {
		Article article = new Article("notifiable article title", "this is article body");
		Category category = new Category("notification");
		article.setCategory(category);
		entityManager.persist(article);
		
		User user = article.getCreatedBy();
		Assert.assertEquals(user.getUsername(), DEFAULT_USERNAME);
		
		String username = UUID.randomUUID().toString();
		User other = this.createUser(username);
		
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(new UsernamePasswordAuthenticationToken(other, "password"));
		
		Comment comment = new Comment(article, "from some one");
		entityManager.persist(comment);
		
		Inbox inbox = user.getInbox();
		
		Collection<Notification> notifications = inbox.getNotifications();
		Assert.assertTrue(notifications.size() >= 1);
	}
}
