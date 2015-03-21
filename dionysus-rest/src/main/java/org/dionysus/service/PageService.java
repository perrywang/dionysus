package org.dionysus.service;

import org.dionysus.domain.Page;
import org.dionysus.repository.PageRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "pages", path = "pages")
public interface PageService extends PageRepository{
	public Page findByName(String name);
}
