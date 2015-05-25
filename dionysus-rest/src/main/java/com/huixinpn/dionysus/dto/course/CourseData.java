package com.huixinpn.dionysus.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.course.CourseState;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.util.Calendar;

@Data
@NoArgsConstructor
public class CourseData extends EntityData {

  private String title;

  private String description;

  private String body;

  private String state;

  private String approach;

  private String cover;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
  private Calendar date;

  private CourseCategoryData category;

  private UserData consultant;

  public CourseData(Course course) {
    super(course);
    this.title = course.getTitle();
    this.description = course.getDescription();
    this.body = course.getBody();
    this.state = course.getState() == null ? "unknown" : course.getState().toString();
    this.approach = course.getApproach() == null ? "unknown" : course.getApproach().toString();
    this.date = course.getDate();
    this.category = new CourseCategoryData(course.getCategory());
    this.consultant = new UserData(course.getConsultant());
    this.cover = course.getCover();
  }

  public Course toEntity() {
    Course course = new Course();
    course.setId(this.getId());
    course.setTitle(this.getTitle());
    course.setDescription(this.getDescription());
    course.setBody(this.getBody());
    course.setState(CourseState.valueOf(state));
    course.setDate(this.getDate());
    course.setCategory(new CourseCategory(this.getCategory().getId()));
    course.setConsultant(new Consultant(this.getConsultant().getId()));
    course.setCover(ExtractCover(body));
    return course;
  }

  private String ExtractCover(String body) {
    Document doc = Jsoup.parse(body);
    String img = null;
    Element el = doc.select("img").first();
    if (el != null) {
      img = el.attr("src");
    }
    return img;
  }
}
