package com.huixinpn.dionysus.service;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.huixinpn.dionysus.repository.ModuleRepository;

@RepositoryRestResource(collectionResourceRel = "modules", path = "modules")
public interface ModuleService extends ModuleRepository {

}
