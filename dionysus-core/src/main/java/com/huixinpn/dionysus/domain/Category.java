package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "categories")
public class Category extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -1815965724911284764L;

	@NotEmpty
	@Column(name = "name", unique = true)
	private String name;

	@ManyToOne
	private Category parent;


	public Category() {
	}

	public Category(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		StringBuilder out = new StringBuilder();
		if (this.getParent() != null) {
			out.append(this.getParent()).append(" > ");
		}
		out.append(this.name);
		return out.toString();
	}
}
