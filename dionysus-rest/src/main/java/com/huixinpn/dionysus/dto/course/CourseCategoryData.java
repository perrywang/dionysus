package com.huixinpn.dionysus.dto.course;

import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CourseCategoryData extends EntityData {
  private String name;

  public CourseCategoryData(CourseCategory courseCategory) {
    super(courseCategory);
    this.name = courseCategory.getName();
  }
}
