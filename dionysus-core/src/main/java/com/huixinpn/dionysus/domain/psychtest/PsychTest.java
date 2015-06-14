package com.huixinpn.dionysus.domain.psychtest;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

	public enum PsychTestRenderFormat {
		// 所有的题目显示在一个表格中，例如:SCL——90量表
		TABLE, 
		
		// 一次显示一道题，点击下一题直到结束
		ONE_BY_ONE,
		
		// 所有的题目显示在一个页面
		LIST,
		
		// 依据上一题的选择方式显示下一题
		DEPS
	}
	
	public enum PsychTestApproach {
		MANUAL,		// 纸笔测试

		MACHINE		// 机检
	}
	
	// 有些心理测试是不需要全部做完的
	// 0 表示所有题目都需要填写
	// n 表示至少n道题需要完成
	@Column(name = "min")
	private Integer min = 0;
	
	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob
	@Column(name = "description")
	private String description;
	
	@Enumerated(EnumType.STRING)
	private PsychTestType type;

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
	@Enumerated(EnumType.STRING)
	private PsychTestApproach approach;

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
	
	
	@Enumerated(EnumType.STRING)
	private PsychTestRenderFormat format;

	public double evaluate(/*args*/) {
		// TODO: 在这里进行分数的计算，传入参数为用户输入的答案
		double score = 0;
		return score;
	}
}
