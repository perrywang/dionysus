package org.dionysus.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="psychtestitems")
public class PsychTestItem extends AbstractPersistable<Long>{

	private static final long serialVersionUID = 2389269330877343503L;

	@Column(name="description")
	private String description;

	@OneToMany
	private List<PsychTestItemOption> options;
}
