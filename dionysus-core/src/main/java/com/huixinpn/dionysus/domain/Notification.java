package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class Notification extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -7457760948182175014L;

	@Column(name="inbox_id")
	private Long inbox;
	
	@Column(name="from_user_id")
	private Long from;
	
	@Column(name="summary")
	private String summary;
	
	public Notification() {}
	
	public Notification(Inbox inbox, User from, String summary) {
		this.inbox = inbox.getId();
		this.from = from.getId();
		this.summary = summary;
	}

	public Long getInbox() {
		return inbox;
	}

	public void setInbox(Inbox inbox) {
		this.inbox = inbox.getId();
	}

	public Long getFrom() {
		return from;
	}

	public void setFrom(User owner) {
		this.from = owner.getId();
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
		sb.append("  from: " + from.toString() + "\n");
		sb.append("  inbox: " + inbox.toString() + "\n");
		sb.append("  summary: " + summary + "\n");
		return sb.toString();
	}
}
