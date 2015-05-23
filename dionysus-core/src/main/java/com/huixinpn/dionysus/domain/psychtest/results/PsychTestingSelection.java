package com.huixinpn.dionysus.domain.psychtest.results;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestingselections")
public class PsychTestingSelection extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860166636073876229L;

	// when tester modify the answer we need be able to quickly find which item he
	// is modifying
	// no need to iterate all the answered items to find.
	@OneToOne
	private PsychTestQuestion item;

	@OneToOne
	private PsychTestQuestionOption selected;

	// if some option need input text
	@Lob
	private String answer;

	@ManyToOne
	private PsychTesting testing;

}
