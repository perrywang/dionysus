package org.dionysus;

import org.dionysus.domain.Article;
import org.dionysus.domain.User;
import org.dionysus.mock.MockAuditorAware;
import org.dionysus.repository.ArticleRepository;
import org.dionysus.repository.UserRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ActiveProfiles("test")
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = MockApplication.class)
public class AuditTest {
	private static final String AUDIT_USER_NAME = "auditUser";

	@Autowired
	protected MockAuditorAware auditorAware;

	@Autowired
	protected UserRepository userService;

	@Autowired
	protected ArticleRepository articleService;

	@Before
	public void wireUpAuditor() {
		User user = new User(AUDIT_USER_NAME, "auditUserPassword", "audit@dionysus.org");
		userService.save(user);
		auditorAware.setCurrentAuditor(user);
	}

	@Test
	public void createArticleWithAudit() {
		Article article = new Article("audit article title", "audit article body");
		articleService.save(article);
		Assert.assertNotNull(article.getId());
		User user = article.getCreatedBy();
		Assert.assertEquals(user.getUsername(), AUDIT_USER_NAME);
	}
}
