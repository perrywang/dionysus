package org.boilaplate.dionysus.rest;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.spring.scope.RequestContextFilter;

public class Application extends ResourceConfig {

	public Application() {
		register(RequestContextFilter.class);
		register(ArticleResources.class);
		register(JacksonFeature.class);	
	}
}
