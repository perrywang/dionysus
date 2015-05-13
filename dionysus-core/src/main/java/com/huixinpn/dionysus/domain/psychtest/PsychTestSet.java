package com.huixinpn.dionysus.domain.psychtest;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "psychtestset")
public class PsychTestSet  extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;
	
	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob
	@Column(name = "description")
	private String description;
	  
	@OneToMany
	@JoinColumn(name = "set_id")
	private List<PsychTest> tests;
	
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

	public PsychTestSet() {
	}

	public List<PsychTest> getTests() {
		return tests;
	}

	public void setTests(List<PsychTest> tests) {
		this.tests = tests;
	}
	
}
