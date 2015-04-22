package com.huixinpn.dionysus.domain.course;

import org.springframework.data.rest.core.config.Projection;

@Projection(name = "summary", types = Course.class)
public interface CourseSummary {
  Long getId();

  String getTitle();

  String getDescription();

}
