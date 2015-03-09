package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Inbox extends AbstractPersistable<Long> {

	private static final long serialVersionUID = 8365840187902479233L;

	@OneToOne
	private User user;

	@OneToMany(mappedBy = "inbox")
	private Collection<Notification> notifications;
	
	public Inbox() {
		this.notifications = new ArrayList<Notification>();
	}
	
	public Inbox(User user) {
		this();
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Collection<Notification> getNotifications() {
		return notifications;
	}

	public void setNotifications(Collection<Notification> notifications) {
		this.notifications = notifications;
	}
	
	public void addNotification(Notification notification) {
		this.notifications.add(notification);
	}
	
	@Override
	public String toString() {
		return "Inbox: " + this.getId();
	}
}
