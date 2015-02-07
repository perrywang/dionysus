package org.dionysus;

import java.util.List;

import org.dionysus.config.ApplicationContext;
import org.dionysus.config.TestJPAEnvironment;
import org.dionysus.model.Article;
import org.dionysus.model.Category;
import org.dionysus.service.ArticleService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@ContextConfiguration(classes = { ApplicationContext.class,
		TestJPAEnvironment.class }, loader = AnnotationConfigContextLoader.class)
public class ArticleServiceTest {

	@Autowired
	private ArticleService articleService;
	

//	@Test(expected = ConstraintViolationException.class)
//	public void testArticleValidation() {
//		Article article = new Article("article title", "article body");
//		articleService.save(article);
//	}

	@Test
	public void testAddArticle() {
		List<Article> articles = articleService.findLatestArticle();
		int count = articles.size();

		Article aricle = new Article("article title", "article body");
		Category category = new Category("test category");
		aricle.setCategory(category);

		Assert.assertNull(aricle.getId());

		articleService.save(aricle);
		Assert.assertNotNull(aricle.getId());

		articles = articleService.findLatestArticle();
		Assert.assertEquals(articles.size(), count + 1);
	}
}
