package com.huixinpn.dionysus.domain.site;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "modules")
public class Module extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -3202875103419512957L;

	@NonNull
	@Column(name = "title")
	private String title;

	@Column(name = "subtitle")
	private String subtitle;

	@Column(name = "image")
	private String image;

	@Column(name = "href")
	private String href;

	@Lob @Column(name = "body")
	private String body;
}
