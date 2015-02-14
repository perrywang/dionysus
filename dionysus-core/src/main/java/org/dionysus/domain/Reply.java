package org.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.jpa.domain.AbstractAuditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "replies")
public class Reply extends AbstractAuditable<User, Long> {

	private static final long serialVersionUID = 173375477700239586L;

	@ManyToOne
	@NotEmpty(message = "reply should have user associated")
	private User user;

	@ManyToOne
	@NotEmpty(message = "reply should have conversation associated")
	private Conversation conversation;

	@ManyToOne
	private Reply parent;
}
