package com.huixinpn.dionysus.domain.psychtest;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

import javax.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "psychtestcategories")
public class PsychTestCategory extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336043876229L;

	@NotEmpty
	@Column(name = "name", unique = true)
	private String name;

	@ManyToOne
	private PsychTestCategory parent;

	@OneToMany
	@JoinColumn(name = "category_id")
	private Collection<PsychTestItem> testitems;
	
	@NotBlank
	@Column(name = "categoryweights")
	private String categoryweights;

	@Lob
	private String result;
  
	public PsychTestCategory() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PsychTestCategory getParent() {
		return parent;
	}

	public void setParent(PsychTestCategory parent) {
		this.parent = parent;
	}

	public Collection<PsychTestItem> getTestitems() {
		return testitems;
	}

	public void setTestitems(Collection<PsychTestItem> testitems) {
		this.testitems = testitems;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
   
}
