package org.dionysus.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "replies")
public class Reply implements Serializable {

	private static final long serialVersionUID = 173375477700239586L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@ManyToOne
//	@NotEmpty(message = "reply should have user associated")
	private User user;

	@ManyToOne
//	@NotEmpty(message = "reply should have conversation associated")
	private Conversation conversation;

	@ManyToOne
	private Reply parent;
}
