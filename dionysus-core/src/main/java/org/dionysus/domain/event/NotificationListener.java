package org.dionysus.domain.event;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;

import org.dionysus.domain.Inbox;
import org.dionysus.domain.Notifiable;
import org.dionysus.domain.Notification;
import org.dionysus.domain.User;
import org.springframework.stereotype.Component;

@Component
public class NotificationListener {

	@PersistenceContext
	private EntityManager em;
	
	@PostPersist
	public void sendNotification(Notifiable<User> entity) {
		AutowireHelper.autowire(this, this.em);
		
		User from = entity.receiveFrom();
		List<User> tos = entity.sendTo();
		String summary = entity.getSummary();
		
		for (User to : tos) {
			Inbox inbox = to.getInbox();
			inbox.addNotification(new Notification(inbox, from, to, summary));
			em.persist(inbox);
		}
	}
}
