package com.huixinpn.dionysus.domain.user;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "profiles")
public class Profile extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 4546633052695670043L;

	@NonNull
	@OneToOne(mappedBy = "profile")
	@JsonIgnore
	private User user;

}
