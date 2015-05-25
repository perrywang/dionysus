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
@Table(name = "psychtestcategory")
//包括人格类，心理健康评定类。。。。每个类别下面的测试用户可以选择。做完一个测试，用户再选择某个类别的下一个测试。
public class PsychTestCategory extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;

	@NotBlank
	private String title;

	@Lob
	private String description;

	@ManyToMany(mappedBy = "category")
	private Collection<PsychTest> tests = new ArrayList<>();

}
