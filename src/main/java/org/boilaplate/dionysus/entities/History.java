package org.boilaplate.dionysus.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="histories")
public class History implements Serializable {

	private static final long serialVersionUID = -3558156230583594674L;

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
}
