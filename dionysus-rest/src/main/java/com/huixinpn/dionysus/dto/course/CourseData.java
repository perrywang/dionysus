package com.huixinpn.dionysus.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Calendar;

@Data
@NoArgsConstructor
public class CourseData extends EntityData {

  private String title;

  private String description;

  private String state;

  private String approach;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
  private Calendar date;

  private CourseCategoryData category;

  private UserData consultant;

  public CourseData(Course course){
    super(course);
    this.title = course.getTitle();
    this.description = course.getDescription();
    this.state = course.getState() == null ? "unknown" : course.getState().toString();
    this.approach = course.getApproach() == null ? "unknown" : course.getApproach().toString();
    this.date = course.getDate();
    this.category = new CourseCategoryData(course.getCategory());
    this.consultant = new UserData(course.getConsultant());
  }
}
