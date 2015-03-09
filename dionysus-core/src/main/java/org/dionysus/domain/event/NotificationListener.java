package org.dionysus.domain.event;

import javax.persistence.PostPersist;

import org.dionysus.domain.User;
import org.springframework.data.domain.Auditable;

public class NotificationListener {

	@PostPersist
	public void sendNotification(Auditable<User, Long> entity) {
		System.out.println(entity);
	}
}
