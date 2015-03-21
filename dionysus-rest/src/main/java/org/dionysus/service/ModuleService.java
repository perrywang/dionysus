package org.dionysus.service;

import org.dionysus.repository.ModuleRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "modules", path = "modules")
public interface ModuleService extends ModuleRepository {

}
