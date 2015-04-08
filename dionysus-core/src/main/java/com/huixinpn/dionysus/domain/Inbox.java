package com.huixinpn.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Inbox extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 8365840187902479233L;

	@Column(name = "user_id")
	private Long user_id;

	@OneToMany
	private Collection<Notification> notifications;
	
	public Inbox() {
		this.notifications = new ArrayList<Notification>();
	}
	
	public Inbox(Long user_id) {
		this();
		this.user_id = user_id;
	}

    public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
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
