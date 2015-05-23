package com.huixinpn.dionysus.domain.psychtest;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
@Table(name = "psychtests")
public class PsychTest extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob
	@Column(name = "description")
	private String description;

	// 测试针对对象
	@Column(name = "object")
	private String object;

	// 测试时长
	@Column(name = "duration")
	private String duration;

	// 测试收费
	@Column(name = "cost")
	private String cost;

	// 测试方式 纸笔还是机检
	@Column(name = "approach")
	private String approach;

	// 备注
	@Column(name = "comment")
	private String comment;

	@OneToMany(mappedBy = "test")
	private Collection<PsychTestQuestion> questions = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "suite_test",
		joinColumns = @JoinColumn(name = "test_id"), 
		inverseJoinColumns = @JoinColumn(name = "suite_id"))
	private Collection<PsychTestSuite> suite = new ArrayList<>();
	
	public double evaluate(/*args*/) {
		// TODO: 在这里进行分数的计算，传入参数为用户输入的答案
		double score = 0;
		for (PsychTestQuestion question : questions) {
			for (PsychTestQuestionOption option : question.getOptions()) {
				score += option.getScore();
			}
		}
		return score;
	}
}
