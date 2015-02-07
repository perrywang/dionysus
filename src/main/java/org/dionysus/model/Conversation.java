package org.dionysus.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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

	
}
