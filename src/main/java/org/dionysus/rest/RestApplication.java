package org.dionysus.rest;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.spring.scope.RequestContextFilter;

public class RestApplication extends ResourceConfig {
	public RestApplication () {
        register(RequestContextFilter.class);
        register(ArticleResources.class);
        register(CategoryResources.class);
        register(JacksonFeature.class);
    }
}
