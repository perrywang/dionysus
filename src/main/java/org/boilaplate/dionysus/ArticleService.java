package org.boilaplate.dionysus;

import java.util.List;

import org.boilaplate.dionysus.entities.Article;

public interface ArticleService {
	public List<Article> findLatestArticle();
}