package org.dionysus.domain;

import javax.persistence.Entity;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class InvalidEntity extends AbstractPersistable<Long> {

	private static final long serialVersionUID = 8952248082458853674L;

}
