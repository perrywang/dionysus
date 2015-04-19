package com.huixinpn.dionysus.domain.user;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "inbox")
public class Inbox extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 8365840187902479233L;

	@NonNull
	@OneToOne(mappedBy = "inbox")
	private User user;

	@OneToMany
	private Collection<Notification> notifications = new ArrayList<Notification>();;

	public void addNotification(Notification notification) {
		this.notifications.add(notification);
	}

}
