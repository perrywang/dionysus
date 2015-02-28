package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="psychtestitemoptions")
public class PsychTestItemOption extends AbstractPersistable<Long> {

	private static final long serialVersionUID = -6334644839339850311L;
	
	@Column(name = "description")
	private String description;
}
