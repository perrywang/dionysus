package com.huixinpn.dionysus;

import javax.validation.ConstraintViolationException;

import org.junit.Assert;
import org.junit.Test;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.user.User;

public class ArticleDomainTest extends AbstractPersistentTest {

	@Test(expected = ConstraintViolationException.class)
	public void testArticleValidation() {
		Article article = new Article();
		entityManager.persist(article);
	}

	@Test
	public void testArticleAddition() {
		Article article = new Article("article title", "article body");
		Category category = new Category("test category");
		entityManager.persist(category);
		
		article.setCategory(category);
		Assert.assertNull(article.getId());

		entityManager.persist(article);
		Assert.assertNotNull(article.getId());
	}

	@Test
	public void testArticleAudit() {
		Article article = new Article("audit article title", "audit article body");
		entityManager.persist(article);
		User user = article.getCreatedBy();
		Assert.assertEquals(user.getUsername(), DEFAULT_USERNAME);
	}
}
