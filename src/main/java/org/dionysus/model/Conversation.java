package org.dionysus.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "conversations")
public class Conversation implements Serializable {

	private static final long serialVersionUID = 2523934617928738918L;

	// XXX: may use uuid generator
	// otherwise conversation id can be guessed
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "title")
	@NotBlank(message = "conversation title is required")
	private String title;

	@Column(name = "description")
	@Lob
	private String description;

	@NotNull(message = "conversation owner cannot be null")
	private User owner;
}
