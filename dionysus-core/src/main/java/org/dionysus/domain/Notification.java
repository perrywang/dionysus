package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Notification extends AbstractPersistable<Long> {

	private static final long serialVersionUID = -7457760948182175014L;

	@ManyToOne
	private Inbox inbox;
	
	@ManyToOne
	private User from;
	
	@ManyToOne
	private User to;
	
	@Column(name="summary")
	private String summary;
	
	public Notification() {}
	
	public Notification(Inbox inbox, User from, User to, String summary) {
		this.inbox = inbox;
		this.from = from;
		this.to = to;
		this.summary = summary;
	}

	public Inbox getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox;
	}

	public User getFrom() {
		return from;
	}

	public void setFrom(User owner) {
		this.from = owner;
	}

	public User getTo() {
		return to;
	}

	public void setTo(User to) {
		this.to = to;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Notification: \n");
		sb.append("  from: " + from.getId() + "\n");
		sb.append("  to: " + to.getId() + "\n");
		sb.append("  inbox: " + inbox.getId() + "\n");
		sb.append("  summary: " + summary + "\n");
		return sb.toString();
	}
}
