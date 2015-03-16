package org.dionysus.service;

import org.dionysus.repository.PageRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "pages", path = "pages")
public interface PageService extends PageRepository {

}
