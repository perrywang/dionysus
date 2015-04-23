package com.huixinpn.dionysus.domain.user;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ToString(of = "name")
@Entity
@Table(name = "roles")
public class Role extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4397869977138590249L;

	@NonNull
	@NotBlank
	@Column(name = "name")
	private String name;

	@ManyToMany(mappedBy = "roles")
	@JsonIgnore
	private Collection<User> users = new ArrayList();
}
