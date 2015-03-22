package com.huixinpn.dionysus;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale.Category;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

import com.huixinpn.dionysus.domain.Article;

@Configuration
@Import(RepositoryRestMvcConfiguration.class)
public class RestfulConfiguration  extends RepositoryRestMvcConfiguration {

  @Override
  protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
    config.exposeIdsFor(Article.class, Category.class);
    try {
      config.setBaseUri(new URI("/api/v1"));
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }
  }
}