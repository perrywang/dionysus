package org.boilaplate.dionysus.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="articles")
public class Article implements Serializable {

	private static final long serialVersionUID = 4106093798545531113L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Long id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="body")
	@Lob
	private String body;
}
