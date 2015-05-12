package com.huixinpn.dionysus.domain.psychtest;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "psychtestset")
public class PsychTestSet  extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;
	
	@OneToMany
	private List<PsychTest> tests;
	
	public PsychTestSet() {
	}

	public List<PsychTest> getTests() {
		return tests;
	}

	public void setTests(List<PsychTest> tests) {
		this.tests = tests;
	}
	
}
