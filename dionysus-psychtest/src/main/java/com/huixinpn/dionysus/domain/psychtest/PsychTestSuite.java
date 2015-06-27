package com.huixinpn.dionysus.domain.psychtest;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
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
@Table(name = "psychtestsuites")
public class PsychTestSuite extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;

	@NotBlank
	private String title;

	@Lob
	private String description;

	@ManyToMany(mappedBy = "suite")
	private Collection<PsychTest> tests = new ArrayList<>();

}
