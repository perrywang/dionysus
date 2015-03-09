package org.dionysus;

import java.util.Collection;
import java.util.UUID;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.domain.Comment;
import org.dionysus.domain.Inbox;
import org.dionysus.domain.Notification;
import org.dionysus.domain.User;
import org.junit.Assert;
import org.junit.Test;

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
		runAs(username);
		
		Comment comment = new Comment(article, "from some one");
		entityManager.persist(comment);
		
		Inbox inbox = user.getInbox();
		
		Collection<Notification> notifications = inbox.getNotifications();
		Assert.assertTrue(notifications.size() >= 1);
	}
}
