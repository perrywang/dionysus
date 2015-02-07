package org.dionysus.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 6546337477936620570L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@NotBlank(message = "name is required")
	@Length(min = 6, max = 20, message = "name length should have {min}-{max} characters")
	@Column(name = "name")
	private String name;

	@NotBlank(message = "password is required")
	private String password;

	@Email(message = "mail format is not correct")
	@Column(name = "email")
	private String email;
}
