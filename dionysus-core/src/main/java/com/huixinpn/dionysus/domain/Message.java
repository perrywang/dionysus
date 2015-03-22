package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "messages")
public class Message extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 7438768194716828137L;

	@Column(name="content")
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
