package com.huixinpn.dionysus;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestItem;
import com.huixinpn.dionysus.domain.psychtest.PsychTestItemOption;
import com.huixinpn.dionysus.domain.site.Menu;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;

@Configuration
@Import(RepositoryRestMvcConfiguration.class)
public class RestfulConfiguration extends RepositoryRestMvcConfiguration {

	@Override
	protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
		config.exposeIdsFor(Article.class, Category.class, Menu.class,
				PsychTest.class, PsychTestItem.class,
				PsychTestItemOption.class, Consultant.class, User.class);
		try {
			config.setBaseUri(new URI("/api/v1"));
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
	}
}