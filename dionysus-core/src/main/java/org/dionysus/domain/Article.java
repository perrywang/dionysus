package org.dionysus.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.AbstractAuditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "articles")
public class Article extends AbstractAuditable<User, Long> {

	private static final long serialVersionUID = 4106093798545531113L;

	@Column(name = "title")
	@NotBlank(message = "article title is required")
	private String title;

	@Column(name = "body")
	@Lob
	@NotBlank(message = "article body is required")
	private String body;

	@ManyToOne(cascade = { CascadeType.PERSIST })
	@Valid
	private Category category;

	@Version
	private Long version;

	public Article() {
	}

	public Article(String title, String body) {
		this.title = title;
		this.body = body;
	}

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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}
}
