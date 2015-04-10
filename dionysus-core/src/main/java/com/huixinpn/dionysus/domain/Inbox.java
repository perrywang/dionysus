package com.huixinpn.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="inbox")
public class Inbox extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 8365840187902479233L;

	@OneToOne(mappedBy = "inbox")
	private User user;

	@OneToMany
	private Collection<Notification> notifications;

	public Inbox() {
		this.notifications = new ArrayList<Notification>();
	}

	public Inbox(User user) {
		this();
		this.user = user;
	}

	public User getUser() {
		return this.user;
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
