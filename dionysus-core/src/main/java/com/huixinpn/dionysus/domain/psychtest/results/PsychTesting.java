package com.huixinpn.dionysus.domain.psychtest.results;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.user.User;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestings")
public class PsychTesting extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -4860166336073876229L;

	@OneToOne
	private PsychTest test;

	@OneToMany(mappedBy = "testing")
	private Collection<PsychTestingSelection> selections = new ArrayList<>();

	@ManyToOne
	private PsychTestSetTesting setTesting;

	@Enumerated(EnumType.STRING)
	private PsychTestingState state;

	public PsychTesting(Long id) {
		super(id);
	}

}
