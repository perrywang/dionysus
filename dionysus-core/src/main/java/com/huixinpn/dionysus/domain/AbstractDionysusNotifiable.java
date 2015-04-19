package com.huixinpn.dionysus.domain;

import java.util.Collection;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.huixinpn.dionysus.domain.event.Notifiable;
import com.huixinpn.dionysus.domain.event.NotificationListener;

@Data
@EqualsAndHashCode(callSuper = true)
@MappedSuperclass
@EntityListeners(NotificationListener.class)
public abstract class AbstractDionysusNotifiable<U> extends
		AbstractDionysusAuditable<U> implements Notifiable<U> {

	private static final long serialVersionUID = 4497363688600667784L;

	public U receiveFrom() {
		return this.getCreatedBy();
	}

	public abstract Collection<U> sendTo();

	public abstract String getSummary();
}
