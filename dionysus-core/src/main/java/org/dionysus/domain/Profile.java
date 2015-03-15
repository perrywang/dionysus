package org.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="profiles")
public class Profile extends AbstractPersistable<String> {

	private static final long serialVersionUID = 4546633052695670043L;
	
	@OneToOne
	private User user;
	
	public Profile() {}
	
	public Profile(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}	
}
