package org.dionysus.domain.event;

import java.util.Collection;

import javax.persistence.PostPersist;

import org.dionysus.domain.Inbox;
import org.dionysus.domain.Notification;
import org.dionysus.domain.User;

public class NotificationListener {

	@PostPersist
	public void sendNotification(Notifiable<User> entity) {
		User from = entity.receiveFrom();
		Collection<User> tos = entity.sendTo();
		String summary = entity.getSummary();

		for (User to : tos) {
			Inbox inbox = to.getInbox();
			inbox.addNotification(new Notification(inbox, from, summary));
		}
	}
}
