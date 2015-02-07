package org.dionysus.service;

import java.util.List;

import org.dionysus.model.Article;

public interface ArticleService {
	List<Article> findLatestArticle();
	
	void save(Article article);
}