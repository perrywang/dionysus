package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;

@RepositoryRestResource(collectionResourceRel = "consultants", path = "consultants")
public interface ConsultantService {
	public User registerconsultant(User consultant);

}
