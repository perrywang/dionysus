package org.dionysus;

import java.util.List;

import org.dionysus.config.ApplicationContext;
import org.dionysus.config.TestJPAEnvironment;
import org.dionysus.model.Article;
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
@ContextConfiguration(
classes = { ApplicationContext.class, TestJPAEnvironment.class }, 
loader = AnnotationConfigContextLoader.class)
public class ArticleTest {

	@Autowired
	ArticleService service;

	@Test
	public void testAddArticle() {
		List<Article> articles = service.findLatestArticle();
		Assert.assertEquals(articles.size(), 0);
		
		Article a = new Article();
		a.setTitle("test article");
		a.setBody("This is article body");
		
		service.add(a);
		Assert.assertNotNull(a.getId());
		
		articles = service.findLatestArticle();
		Assert.assertEquals(articles.size(), 1);
	}
}
