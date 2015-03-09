package org.dionysus.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.dionysus.domain.event.NotificationListener;
import org.springframework.data.jpa.domain.AbstractAuditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "comments")
@EntityListeners({ AuditingEntityListener.class, NotificationListener.class })
public class Comment extends AbstractAuditable<User, Long> implements Notifiable<User> {

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
	public String getSummary() {
		return this.getContent();
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
}
