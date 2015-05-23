package com.huixinpn.dionysus.domain.psychtest;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import org.hibernate.validator.constraints.NotBlank;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestquestionoptions")
public class PsychTestQuestionOption extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -3002875103419512957L;

	@NotBlank
	private String description;

	private Integer score;

	private Integer weight;

	@ManyToOne
	private PsychTestQuestion question;
	
	public PsychTestQuestionOption(Long id) {
		super(id);
	}
}
