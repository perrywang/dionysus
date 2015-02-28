package org.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PsychTestItem {

	@Column(name="description")
	private String description;

}
