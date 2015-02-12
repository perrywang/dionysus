package org.dionysus.repositories;

import org.dionysus.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "articles", path = "articles")
public interface ArticleRepository extends JpaRepository<Article, Long> {

}
