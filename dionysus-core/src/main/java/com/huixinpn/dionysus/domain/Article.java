package com.huixinpn.dionysus.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "articles")
public class Article extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 4106093798545531113L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "summary")
	private String summary;

	@Valid
	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	private Category category;

	@NotBlank
	@Lob @Column(name = "body")
	private String body;

	@Version
	@Column(name = "version", columnDefinition = "integer DEFAULT 0", nullable = false)
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
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

	@Override
	public String toString() {
		return this.title;
	}
}
