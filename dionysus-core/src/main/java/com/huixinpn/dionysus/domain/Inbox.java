package com.huixinpn.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Inbox extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 8365840187902479233L;

/*	@Column(name = "user_id")
	private long userId;*/

	@OneToMany
	private Collection<Notification> notifications;
	
	public Inbox() {
		this.notifications = new ArrayList<Notification>();
	}
	
	public Inbox(User user) {
		this();
//		this.userId = user.getId();
	}

 /*   public long getUserId() {
        return userId;
    }
*/
 /*   public void setUserId(long userId) {
        this.userId = userId;
    }*/

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
