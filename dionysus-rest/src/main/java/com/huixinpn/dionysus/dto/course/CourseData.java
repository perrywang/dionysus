package com.huixinpn.dionysus.dto.course;

import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CourseData extends EntityData {

  private String title;

  private String description;

  private CourseCategoryData category;

  private UserData consultant;

  public CourseData(Course course){
    super(course);
    this.title = course.getTitle();
    this.description = course.getDescription();
    this.category = new CourseCategoryData(course.getCategory());
    this.consultant = new UserData(course.getConsultant());
  }
}
