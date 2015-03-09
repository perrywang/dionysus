package org.dionysus;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.dionysus.domain.Article;
import org.dionysus.domain.Category;
import org.dionysus.domain.User;
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

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("test")
@SpringApplicationConfiguration(classes = DomainApplicationContext.class)
public class ArticleDomainTest {

	private static final String AUDIT_USER_NAME = "auditUser";

	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private UserRepository userRepository;

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
		Assert.assertEquals(user.getUsername(), AUDIT_USER_NAME);
	}
}
