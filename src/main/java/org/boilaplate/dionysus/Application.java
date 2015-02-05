package org.boilaplate.dionysus;

import org.boilaplate.dionysus.rest.ArticleService;
import org.glassfish.jersey.server.ResourceConfig;

public class Application extends ResourceConfig {

	public Application() {
		register(ArticleService.class);
	}
}
