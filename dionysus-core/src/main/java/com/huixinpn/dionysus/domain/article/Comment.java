package com.huixinpn.dionysus.domain.article;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.user.User;

@Data
@EqualsAndHashCode(callSuper = true)
@RequiredArgsConstructor
@Entity
@Table(name = "comments")
public class Comment extends AbstractDionysusNotifiable<User> {

	private static final long serialVersionUID = -5887975510097345536L;

	@NonNull
	@Lob @Column(name = "content")
	private String content;

	@NonNull
	@ManyToOne
	private Article article;

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
