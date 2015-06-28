package com.huixinpn.dionysus;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.article.OfficialArticle;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.site.Menu;
import com.huixinpn.dionysus.domain.user.ConsExpertise;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.Profile;
import com.huixinpn.dionysus.domain.user.ProfileItem;
import com.huixinpn.dionysus.domain.user.User;

@Configuration
@Import(RepositoryRestMvcConfiguration.class)
public class RestfulConfiguration extends RepositoryRestMvcConfiguration {

  @Override
  protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
    config.exposeIdsFor(Article.class, Category.class, Menu.class,
        PsychTest.class, PsychTestQuestion.class, PsychTestResult.class, PsychTestQuestionOption.class, 
        Consultant.class, Profile.class, ProfileItem.class, User.class, 
        CourseCategory.class, Course.class, OfficialArticle.class, Blog.class, ConsExpertise.class);
    try {
      config.setReturnBodyOnCreate(true);
      config.setReturnBodyOnUpdate(true);
      config.setBaseUri(new URI("/api/v1"));
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }
  }
}