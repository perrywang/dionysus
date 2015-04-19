package com.huixinpn.dionysus.domain.site;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "menu")
public class Menu extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 7107260692015612645L;

	@NonNull
	@Column(name = "name")
	private String name;

	@NonNull
	@Column(name = "href")
	private String href;
}
