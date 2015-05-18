package com.huixinpn.dionysus.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@MappedSuperclass
public abstract class AbstractDionysusPersistable implements Serializable {

	private static final long serialVersionUID = -8503475553298415513L;

	@Id
	@GeneratedValue
	private Long id;

	@Transient
	public boolean isNew() {
		return null == getId();
	}

	public AbstractDionysusPersistable(Long id){
		this.id = id;
	}
}
