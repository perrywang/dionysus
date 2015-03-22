package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "pages")
public class Page extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -3202875103419512957L;

	@Column(name = "title")
	private String title;

	@Lob @Column(name = "body")
	private String body;

	// used to find static page by name
	// such like "about page"
	@Column(name = "name", unique = true)
	private String name;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
