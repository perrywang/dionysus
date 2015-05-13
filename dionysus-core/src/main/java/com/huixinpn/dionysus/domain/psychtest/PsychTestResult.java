package com.huixinpn.dionysus.domain.psychtest;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;

@Entity
@Table(name = "psytestresults")
public class PsychTestResult extends AbstractDionysusAuditable<User>{

	private static final long serialVersionUID = -4860166336073876229L;

	@OneToOne
	private PsychTest test;

	@OneToMany
	@JoinColumn(name = "result_id")
	private List<PsychTestCategory> categories;

	//serialized json format {itemid:optionid,...}
	@Lob
	private String result;

	@Enumerated(EnumType.STRING)
	private PsychTestingState state;

	public List<PsychTestCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<PsychTestCategory> categories) {
		this.categories = categories;
	}
}
