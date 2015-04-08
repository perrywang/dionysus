package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity 
@Table(name = "roles") 
public class Role extends AbstractDionysusPersistable {
	
	private static final long serialVersionUID = -4397869977138590249L;
	
	@NotNull
 	@Column(name="name") 
 	private String name; 
		 
 	public Role() { 
 	} 
 	 
 	public Role(String name) { 
 		this.name = name;
 	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Role: " + this.name;
	}
} 

