package com.huixinpn.dionysus.domain.user;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
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
@Table(name = "profile")
public class Profile extends AbstractDionysusPersistable {

	private static final long serialVersionUID = 4546633052695670043L;

	@NonNull
	@OneToOne(mappedBy = "profile")
	@JsonIgnore
	private User user;
	
	@OneToMany(mappedBy = "profile")
	private Collection<ProfileItem> items = new ArrayList<>();
	
	

}
