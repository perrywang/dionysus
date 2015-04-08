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
 	@Column(name="user_id") 
 	private String user_id; 
	
	@NotNull
 	@Column(name="role_name") 
 	private String role_name; 
		 
 	public Role() { 
 	} 
 	 
 	public Role(String role_name, String user_id) { 
 		this.role_name = role_name;
 		this.user_id = user_id;
 	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	 

} 

