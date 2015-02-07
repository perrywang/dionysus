package org.dionysus.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.dionysus.model.Article;
import org.dionysus.service.ArticleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleServiceImpl implements ArticleService {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional(readOnly = true)
	public List<Article> findLatestArticle() {
		String qlString = "SELECT a FROM Article a ORDER BY a.id desc";
		return entityManager.createQuery(qlString, Article.class)
				.getResultList();
	}

	@Override
	@Transactional(readOnly = false)
	public void save(Article article) {
		entityManager.persist(article);
	}
}
