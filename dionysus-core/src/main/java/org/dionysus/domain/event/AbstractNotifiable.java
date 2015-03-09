package org.dionysus.domain.event;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.jpa.domain.AbstractAuditable;

@MappedSuperclass
@EntityListeners(NotificationListener.class)
public abstract class AbstractNotifiable<U, PK extends Serializable> extends
		AbstractAuditable<U, PK> implements Notifiable<U> {

	private static final long serialVersionUID = 4497363688600667784L;

	public U receiveFrom() {
		return this.getCreatedBy();
	}

	public abstract Collection<U> sendTo();

	public abstract String getSummary();
}
