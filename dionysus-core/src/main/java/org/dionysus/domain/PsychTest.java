package org.dionysus.domain;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "pychtests")
public class PsychTest extends AbstractPersistable<String> {

	private static final long serialVersionUID = -4860066336073876229L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "descriptoin")
	private String description;

	@ElementCollection
	@CollectionTable(name = "psychtestitems")
	private List<PsychTestItem> items;	
}
