package com.huixinpn.dionysus.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "notification")
public class Notification extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -7457760948182175014L;

	@ManyToOne
	@JoinColumn(name = "inbox_id")
	private Inbox inbox;
	
	/*Each notification has the only sender*/
	@OneToOne
	@JoinColumn(name = "user_id")
	private User from;
	
	@Column(name="summary")
	private String summary;
	
	public Notification() {}
	
	public Notification(Inbox inbox, User from, String summary) {
		this.inbox = inbox;
		this.from = from;
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
