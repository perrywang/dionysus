package com.huixinpn.dionysus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.Article;
import com.huixinpn.dionysus.domain.Category;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

	List<Article> findByCategory(@Param("category") Category category);
}
