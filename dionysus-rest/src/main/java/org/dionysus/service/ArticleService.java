package org.dionysus.service;

import org.dionysus.repository.ArticleRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "articles", path = "articles")
public interface ArticleService extends ArticleRepository {

}
