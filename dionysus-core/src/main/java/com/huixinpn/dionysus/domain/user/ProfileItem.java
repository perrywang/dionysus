package com.huixinpn.dionysus.domain.user;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;

@Entity
@Table(name = "profileitem")
public class ProfileItem extends AbstractDionysusAuditable<User>{
	
	private static final long serialVersionUID = 4546633052695670043L;
	
	@NotNull
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Consultant consultant;

	@Lob
	@Column(name = "summary")
	private String summary;

	//表明是测试，课程，或者咨询模块
	@NotNull
	@Column(name = "module")
	private String module;

	//指明具体模块的链接ID, 比如test_id, course_id...
	@NotNull
	@Column(name = "linkid")
	private String linkid;
	
	public Consultant getConsultant() {
		return consultant;
	}

	public void setConsultant(Consultant consultant) {
		this.consultant = consultant;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getLinkid() {
		return linkid;
	}

	public void setLinkid(String linkid) {
		this.linkid = linkid;
	}
}
