package com.huixinpn.dionysus.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment extends AbstractDionysusNotifiable<User> {

	private static final long serialVersionUID = -5887975510097345536L;

	@Lob @Column(name = "content")
	private String content;

	@ManyToOne
	private Article article;
	
	public Comment() {}
	
	public Comment(Article article, String content) {
		this.article = article;
		this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public User receiveFrom() {
		return this.getCreatedBy();
	}

	@Override
	public List<User> sendTo() {
		User creator = this.article.getCreatedBy();
		User updator = this.article.getLastModifiedBy();
		List<User> users = new ArrayList<User>();
		if (creator != null) {
			users.add(creator);
		}
		if (updator != null && updator != creator) {
			users.add(updator);
		}
		return users;
	}

	@Override
	public String getSummary() {
		return this.getContent();
	}
}