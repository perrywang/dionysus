package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractAuditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "comments")
@EntityListeners(AuditingEntityListener.class)
public class Comment extends AbstractAuditable<User, Long> {

	private static final long serialVersionUID = -5887975510097345536L;

	@Lob @Column(name="body")
	private String body;
	
	@ManyToOne
	private Article article;

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
}
