package com.huixinpn.dionysus;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.junit.Assert;
import org.junit.Test;

import com.huixinpn.dionysus.domain.Article;
import com.huixinpn.dionysus.domain.Category;
import com.huixinpn.dionysus.domain.Comment;
import com.huixinpn.dionysus.domain.Course;
import com.huixinpn.dionysus.domain.CourseState;
import com.huixinpn.dionysus.domain.Inbox;
import com.huixinpn.dionysus.domain.Notification;
import com.huixinpn.dionysus.domain.User;

public class NotificationTest extends AbstractPersistentTest {

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

	@Test
	public void testSendNotificationOnCourse() {
		Course course = new Course("course title", "course description");
		List<User> users = new ArrayList<User>();
		for (int i = 0; i < 3; i++) {
			users.add(createUser(UUID.randomUUID().toString()));
		}
		course.setUsers(users);
		course.setState(CourseState.IN_PROGRESS);

		entityManager.persist(course);

		for (User user : users) {
			Assert.assertTrue(user.getInbox().getNotifications().size() >= 1);
		}
	}
}
