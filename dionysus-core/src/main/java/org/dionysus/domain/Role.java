package org.dionysus.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "roles")
public class Role implements Serializable {

	private static final long serialVersionUID = -3617908500064679864L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "name")
	@NotEmpty(message = "role name is required")
	private String name;

	@Override
	public String toString() {
		return this.name;
	}
}
