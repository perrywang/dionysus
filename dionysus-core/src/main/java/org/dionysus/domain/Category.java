package org.dionysus.domain;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "categories")
public class Category extends AbstractPersistable<Long> {

	private static final long serialVersionUID = 2384283567572219724L;

	@NotEmpty
	@Column(name = "name", unique = true)
	private String name;

	@ManyToOne
	private Category parent;

	@OneToMany(mappedBy = "category")
	private Collection<Article> articles;

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
