package org.dionysus;

import org.dionysus.domain.Article;
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

@ActiveProfiles("test")
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = DomainApplicationContext.class)
public class ArticleAuditTest {
	private static final String AUDIT_USER_NAME = "auditUser";

	@Autowired
	protected UserRepository userRepository;

	@Autowired
	protected ArticleRepository articleRepository;

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

	// could use @WithMockUser in spring security 4.0
	@Test
	public void createArticleWithAudit() {
		Article article = new Article("audit article title", "audit article body");
		articleRepository.save(article);
		User user = article.getCreatedBy();
		Assert.assertEquals(user.getUsername(), AUDIT_USER_NAME);
	}
}
