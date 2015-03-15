package org.dionysus.repository;

import java.util.List;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRepository extends JpaRepository<Article, String> {

	List<Article> findByCategory(@Param("category") Category category);
}
