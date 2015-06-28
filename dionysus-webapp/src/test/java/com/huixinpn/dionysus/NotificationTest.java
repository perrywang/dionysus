package com.huixinpn.dionysus;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.huixinpn.dionysus.domain.appointment.Appointment;
import com.huixinpn.dionysus.domain.appointment.AppointmentApproach;
import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.article.Comment;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseState;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.Inbox;
import com.huixinpn.dionysus.domain.user.Notification;
import com.huixinpn.dionysus.domain.user.User;

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

		Comment comment = new Comment("from some one", article);
		entityManager.persist(comment);

		Inbox checkingInbox = user.getInbox();
		entityManager.refresh(user);

		Collection<Notification> notifications = checkingInbox.getNotifications();
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
			entityManager.refresh(user);
			Assert.assertTrue(user.getInbox().getNotifications().size() >= 1);
		}
	}

    @Test
    public void testSendNotificationOnAppointment(){

        User user = createUser(UUID.randomUUID().toString());
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(new UsernamePasswordAuthenticationToken(user, "some token"));


        Consultant consultant = new Consultant("consultant","password");
        consultantRepository.save(consultant);
        String name="hehe";
        String phone="233";
        Integer age = 12;
        String gender = "male";
        
        
        Appointment appointment = new Appointment(user, consultant, AppointmentApproach.OFFLINE,Calendar.getInstance(),"reason", name, age, phone, gender);

        entityManager.persist(appointment);
        entityManager.refresh(user);
        Assert.assertTrue(user.getInbox().getNotifications().size() >= 1);
    }
}
