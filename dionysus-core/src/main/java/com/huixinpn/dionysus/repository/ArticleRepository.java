package com.huixinpn.dionysus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.user.User;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

	List<Article> findByCategory(@Param("category") Category category);

	@PreAuthorize("#author.username == principal.username or hasRole('ADMIN')")
	List<Article> findByCreatedBy(@Param("author") User author);
}
