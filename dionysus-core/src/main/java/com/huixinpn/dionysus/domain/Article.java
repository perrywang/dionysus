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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonView;
import com.huixinpn.dionysus.view.View;

@Entity
@Table(name = "articles")
@JsonInclude(value = Include.NON_NULL)
public class Article extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = 4106093798545531113L;

	@JsonView({ View.Summary.class, View.Detail.class })
	@NotBlank @Column(name = "title")
	private String title;

	@JsonView({ View.Summary.class, View.Detail.class })
	@Column(name = "summary")
	private String summary;

	@JsonView(View.Detail.class)
	@Valid @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	private Category category;

	@JsonView(View.Detail.class)
	@NotBlank @Lob @Column(name = "body")
	private String body;

	@Version
	@JsonIgnore
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
