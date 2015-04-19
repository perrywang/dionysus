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

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "pages")
public class Page extends AbstractDionysusAuditable<User> {

	private static final long serialVersionUID = -3202875103419512957L;

	@NonNull
	@Column(name = "name", unique = true)
	private String name;
	
	@NonNull
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "body")
	private String body;
}
