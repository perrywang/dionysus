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
public class PsychTest extends AbstractPersistable<Long> {

	private static final long serialVersionUID = -4860066336073876229L;

	@Column(name = "title")
	@NotBlank
	private String title;

	@Column(name = "descriptoin")
	@Lob
	private String description;

	@ElementCollection
	@CollectionTable(name = "psychtestitems")
	private List<PsychTestItem> items;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<PsychTestItem> getItems() {
		return items;
	}

	public void setItems(List<PsychTestItem> items) {
		this.items = items;
	}
	
}
