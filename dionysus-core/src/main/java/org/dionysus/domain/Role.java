package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "roles")
public class Role extends AbstractPersistable<Long> {

	private static final long serialVersionUID = -3617908500064679864L;

	@Column(name = "name", unique = true)
	@NotEmpty(message = "role name is required")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return this.name;
	}
}
