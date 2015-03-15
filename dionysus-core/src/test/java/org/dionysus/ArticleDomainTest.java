package org.dionysus;

import javax.validation.ConstraintViolationException;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.domain.User;
import org.junit.Assert;
import org.junit.Test;

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
