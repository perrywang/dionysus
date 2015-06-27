package com.huixinpn.dionysus.domain.psychtest.results;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.results.eval.PsychTestValueVisitor;
import com.huixinpn.dionysus.domain.user.User;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestresults")
public class PsychTestResult extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -4860166336073876229L;

	@ManyToOne
	private PsychTest test;

	@ElementCollection
	@CollectionTable(name = "psychtestresultoptions", 
		joinColumns = @JoinColumn(name = "answer_id"))
	private Collection<PsychTestQuestionResult> answers = new ArrayList<>();

	@Enumerated(EnumType.STRING)
	private PsychTestState state;
	
	public void accept(PsychTestValueVisitor visitor) {
		Collection<PsychTestQuestionResult> answers = this.getAnswers();
		for (PsychTestQuestionResult answer : answers) {
			answer.accept(visitor);
		}
	}
}
