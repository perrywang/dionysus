package com.huixinpn.dionysus.domain.psychtest;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "psychtestcategories16pf")
public class PsychTestCategory_16PF  extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336043876229L;
	
	@OneToMany
	private List<PsychTestCategory> categories;
	
	//serialized json format {itemid:optionid,...}
	@Lob
	String result;
	
	  
	public PsychTestCategory_16PF() {
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
	
	
}
