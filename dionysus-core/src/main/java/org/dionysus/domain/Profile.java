package org.dionysus.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="profiles")
public class Profile extends AbstractPersistable<Long> {

	private static final long serialVersionUID = 4546633052695670043L;
	
}
