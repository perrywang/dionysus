package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "messages")
public class Message extends AbstractPersistable<Long> {

	private static final long serialVersionUID = 7438768194716828137L;

	@Column(name="text")
	private String text;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
