package com.huixinpn.dionysus.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import lombok.Data;

@Data
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
}
