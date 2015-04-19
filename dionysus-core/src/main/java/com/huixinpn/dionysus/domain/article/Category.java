package com.huixinpn.dionysus.domain.article;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import org.hibernate.validator.constraints.NotBlank;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(of = { "name" })
@RequiredArgsConstructor
@Entity
@Table(name = "categories")
public class Category extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -1815965724911284764L;

	@NonNull
	@NotBlank
	@Column(name = "name", unique = true)
	private String name;

	@ManyToOne
	private Category parent;
}
