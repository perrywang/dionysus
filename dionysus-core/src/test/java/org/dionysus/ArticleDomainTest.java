package org.dionysus;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.domain.User;
import org.dionysus.repository.ArticleRepository;
import org.dionysus.repository.UserRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = DomainApplicationContext.class)
public class ArticleValidationTest {

	private static final String AUDIT_USER_NAME = "auditUser";

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ArticleRepository articleRepository;

	@Before
	public void wireUpAuditor() {
		User user = userRepository.findByUsername(AUDIT_USER_NAME);
		if (user == null) {
			user = new User(AUDIT_USER_NAME, "auditUserPassword", "audit@dionysus.org");
			userRepository.save(user);
		}
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(new UsernamePasswordAuthenticationToken(user, "password"));
	}

	@Test(expected = ConstraintViolationException.class)
	public void testArticleValidation() {
		Article article = new Article();
		articleRepository.save(article);
	}

	@Test
	public void testAddArticle() {
		List<Article> articles = articleRepository.findAll();
		int count = articles.size();

		Article article = new Article("article title", "article body");
		Category category = new Category("test category");
		article.setCategory(category);

		Assert.assertNull(article.getId());

		articleRepository.save(article);
		Assert.assertNotNull(article.getId());

		articles = articleRepository.findAll();
		Assert.assertEquals(articles.size(), count + 1);
	}
}
