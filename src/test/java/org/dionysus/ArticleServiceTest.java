package org.dionysus;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.repository.ArticleRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = Application.class)
public class ArticleServiceTest {

	@Autowired
	private ArticleRepository articleRepository;

	@Test(expected = ConstraintViolationException.class)
	public void testArticleValidation() {
		Article article = new Article();
		articleRepository.save(article);
	}

	@Test
	public void testAddArticle() {
		List<Article> articles = articleRepository.findAll();
		int count = articles.size();

		Article aricle = new Article("article title", "article body");
		Category category = new Category("test category");
		aricle.setCategory(category);

		Assert.assertNull(aricle.getId());

		articleRepository.save(aricle);
		Assert.assertNotNull(aricle.getId());

		articles = articleRepository.findAll();
		Assert.assertEquals(articles.size(), count + 1);
	}
}
