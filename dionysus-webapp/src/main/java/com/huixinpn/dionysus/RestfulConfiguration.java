package com.huixinpn.dionysus;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestItem;
import com.huixinpn.dionysus.domain.psychtest.PsychTestItemOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestSet;
import com.huixinpn.dionysus.domain.site.Menu;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

import java.net.URI;
import java.net.URISyntaxException;

@Configuration
@Import(RepositoryRestMvcConfiguration.class)
public class RestfulConfiguration extends RepositoryRestMvcConfiguration {

  @Override
  protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
    config.exposeIdsFor(Article.class, Category.class, Menu.class,
        PsychTest.class, PsychTestItem.class,
        PsychTestItemOption.class, Consultant.class, User.class, 
        CourseCategory.class, Course.class, 
        PsychTestSet.class);
    try {
      config.setReturnBodyOnCreate(true);
      config.setReturnBodyOnUpdate(true);
      config.setBaseUri(new URI("/api/v1"));
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }
  }
}