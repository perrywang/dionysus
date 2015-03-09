package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.dionysus.domain.event.AbstractNotifiable;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "courses")
@EntityListeners(AuditingEntityListener.class)
public class Course extends AbstractNotifiable<User, Long> {

	private static final long serialVersionUID = 2523934617928638918L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "description")
	private String description;

	@NotBlank
	@Column(name = "state")
	@Enumerated(EnumType.STRING)
	private CourseState state;

	@ManyToOne(fetch = FetchType.EAGER)
	private Consultant consultant;
	
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
		return this.users;
	}

	@Override
	public String getSummary() {
		return this.getDescription();
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

	public Consultant getConsultant() {
		return consultant;
	}

	public void setConsultant(Consultant consultant) {
		this.consultant = consultant;
	}

	@Override
	public String toString() {
		return "course:" + this.getTitle() + ":" + this.getState();
	}
}
