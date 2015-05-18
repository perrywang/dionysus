package com.huixinpn.dionysus.domain.psychtest;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "psychtestcategories16pf")
public class PsychTestCategory_16PF  extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336043876229L;
	
	@NotEmpty
	@Column(name = "name", unique = true)
	private String name;
	
	@Column(name = "topname")
	private String topname;
	
	@OneToMany
	@JoinColumn(name = "category16pf_id")
	private List<PsychTestCategory> categories;
	
	@Lob
	private String result;
	
	public PsychTestCategory_16PF() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<PsychTestCategory> getCategories() {
		return categories;
	}


	public void setCategories(List<PsychTestCategory> categories) {
		this.categories = categories;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}

	public String getTopname() {
		return topname;
	}

	public void setTopname(String topname) {
		this.topname = topname;
	}

}
