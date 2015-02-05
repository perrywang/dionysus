package org.boilaplate.dionysus;

import java.util.List;

import org.boilaplate.dionysus.entities.Article;

public interface ArticleDao {
	public List<Article> findLatestArticle();
}