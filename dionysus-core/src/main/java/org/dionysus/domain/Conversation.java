package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.AbstractAuditable;

@Entity
@Table(name = "conversations")
public class Conversation extends AbstractAuditable<User, Long> {

	private static final long serialVersionUID = 2523934617928738918L;

	@Column(name = "title")
	@NotBlank(message = "conversation title is required")
	private String title;

	@NotNull(message = "conversation owner cannot be null")
	@ManyToOne
	@JoinColumn(name = "owner_id")
	private User owner;

	@Column(name = "description")
	@Lob
	private String description;

	@OneToMany(fetch = FetchType.EAGER)
	private Collection<User> participants;

	@OneToMany(fetch = FetchType.LAZY)
	private List<Reply> replies;

	public Conversation() {
		this.participants = new ArrayList<User>();
		this.replies = new ArrayList<Reply>();
	}

	public Conversation(String title, User owner) {
		super();
		this.title = title;
		this.owner = owner;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Collection<User> getParticipants() {
		return participants;
	}

	public void setParticipants(Collection<User> participants) {
		this.participants = participants;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public void join(User user) {
		participants.add(user);
	}

	public void leave(User user) {
		participants.remove(user);
	}

	public void addReply(Reply reply) {
		this.replies.add(reply);
	}

	@Override
	public String toString() {
		return "Conversation: " + this.title;
	}
}
