package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "courses")
@EntityListeners(AuditingEntityListener.class)
public class Course extends AbstractDionysusNotifiable<User> {

	private static final long serialVersionUID = 2523934617928638918L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "description")
	private String description;

	@Column(name = "state")
	@Enumerated(EnumType.STRING)
	private CourseState state;
	
	@ManyToMany
	private Collection<User> users;

	public Course() {
		this.state = CourseState.OPEN;
		this.users = new ArrayList<User>();
	}

	public Course(String title, String description) {
		this();
		this.setTitle(title);
		this.setDescription(description);
	}

	@Override
	public Collection<User> sendTo() {
		if (this.state == CourseState.IN_PROGRESS) {
			return this.getUsers();
		} else {
			return new ArrayList<User>();
		}
	}

	@Override
	public String getSummary() {
		return this.getTitle();
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

	public CourseState getState() {
		return state;
	}

	public void setState(CourseState state) {
		this.state = state;
	}

	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return this.getTitle() + " (" + this.getState() + ")";
	}
}
