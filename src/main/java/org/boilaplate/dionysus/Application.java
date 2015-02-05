package org.boilaplate.dionysus;

import org.boilaplate.dionysus.rest.ArticleResources;
import org.glassfish.jersey.server.ResourceConfig;

public class Application extends ResourceConfig {

	public Application() {
		register(ArticleResources.class);
	}
}
