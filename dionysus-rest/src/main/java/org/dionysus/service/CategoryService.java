package org.dionysus.service;

import org.dionysus.repository.CategoryRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "categories", path = "categories")
public interface CategoryService extends CategoryRepository {

}
