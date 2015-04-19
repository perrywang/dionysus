package com.huixinpn.dionysus.domain.site;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Entity
@Table(name = "menu")
public class Menu extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 7107260692015612645L;

	@Column(name = "name")
	private String name;

	@Column(name = "href")
	private String href;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
}
