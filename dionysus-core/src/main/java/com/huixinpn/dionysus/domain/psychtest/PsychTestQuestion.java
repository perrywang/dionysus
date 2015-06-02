package com.huixinpn.dionysus.domain.psychtest;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestquestions")
public class PsychTestQuestion extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -3202875107419512957L;

	public enum PsychTestQuestionType {
		SINGLE_CHOICE, MULTIPLE_CHOICE, GAPFILL
	}
	
	@Column(name = "description")
	private String description;

	@ManyToOne
	private PsychTest test;
	
	@Enumerated(EnumType.STRING)
	private PsychTestQuestionType type;

	@OneToMany(mappedBy = "question", fetch = FetchType.EAGER)
	private Collection<PsychTestQuestionOption> options = new ArrayList<>();

	public void addQuestionOption(PsychTestQuestionOption option) {
		options.add(option);
	}

	public void removeQuestionOption(PsychTestQuestionOption option) {
		options.remove(option);
	}
}
