package org.boilaplate.dionysus.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="replies")
public class Reply implements Serializable {

	private static final long serialVersionUID = 173375477700239586L;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Long id;

	@ManyToOne
	private User user;
}
