package com.huixinpn.dionysus.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.course.Course;
import com.huixinpn.dionysus.domain.course.CourseApproach;
import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.domain.course.CourseState;
import com.huixinpn.dionysus.domain.tag.Tag;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.tag.TagData;
import com.huixinpn.dionysus.dto.user.UserData;
import com.huixinpn.dionysus.repository.course.CourseRepository;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

@Data
@NoArgsConstructor
@Component
public class CourseData extends EntityData<Course> {

  @Autowired
  private CourseRepository courseRepository;

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

  private Integer capacity;

  private Float price;

  private Collection<TagData> tags = new ArrayList<>();

  private Long readCount;

  public CourseData(Course course) {
    super(course);
    this.title = course.getTitle();
    this.description = course.getDescription();
    this.body = course.getBody();
    this.state = course.getState() == null ? "unknown" : course.getState().toString();
    this.approach = course.getApproach() == null ? "unknown" : course.getApproach().toString();
    this.date = course.getDate();
    if(course.getCategory() != null){
      this.category = new CourseCategoryData(course.getCategory());
    }
    if(course.getConsultant() != null){
      this.consultant = new UserData(course.getConsultant());
    }
    this.capacity = course.getCapacity();
    this.price = course.getPrice();
    this.tags = new EntityCollectionData<TagData>(course.getTags(), TagData.class).toDTOCollection();
    this.cover = course.getCover();
    this.readCount = course.getReadCount();
  }

  @Override
  public void update(Course course){
    course.setTitle(this.getTitle());
    course.setDescription(this.getDescription());
    course.setBody(this.getBody());
    if(this.getApproach() != null){
      course.setApproach(CourseApproach.valueOf(this.getApproach()));
    }
    if(this.state != null){
      course.setState(CourseState.valueOf(state));
    }
    course.setDate(this.getDate());
    course.setCapacity(this.getCapacity());
    course.setPrice(this.getPrice());
    if(this.getCategory() != null){
      course.setCategory(new CourseCategory(this.getCategory().getId()));
    }
    if(this.getConsultant() != null){
      course.setConsultant(new Consultant(this.getConsultant().getId()));
    }

    course.setCover(ExtractCover(body));
    course.setEmbeddedVideo(ExtractEmbeddedVideo(body));
    Collection<Tag> tagsList = new ArrayList<>();
    for (TagData tagData : tags) {
      tagsList.add(tagData.toEntity());
    }
    course.setTags(tagsList);
  }

  private String ExtractCover(String body) {
    String img = null;
    if (body != null) {
      Document doc = Jsoup.parse(body);

      Element el = doc.select("img").first();
      if (el != null) {
        img = el.attr("src");
      }
    }
    return img;
  }

  private String ExtractEmbeddedVideo(String body){
    String embeddedVideo = null;
    if (body != null) {
      Document doc = Jsoup.parse(body);

      Element el = doc.select("embed").first();
      if (el != null) {
        embeddedVideo = el.outerHtml();
      }else{
        el = doc.select("iframe").first();
        if(el != null){
          embeddedVideo = el.outerHtml();
        }
      }
    }
    return embeddedVideo;
}
}
