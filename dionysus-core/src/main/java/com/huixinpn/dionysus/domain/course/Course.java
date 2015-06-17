package com.huixinpn.dionysus.domain.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.tag.Tag;
import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "courses")
@EntityListeners(AuditingEntityListener.class)
public class Course extends AbstractDionysusNotifiable<User> {

  private static final long serialVersionUID = 2523934617928638918L;

  @NotBlank
  @Column(name = "title")
  private String title;

  @Lob
  @Column(name = "description")
  private String description;

  @Lob
  private String body;

  @Column(name = "state")
  @Enumerated(EnumType.STRING)
  private CourseState state;

  @Column(name = "calendar")
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
  private Calendar date;

  @ManyToOne
  private Consultant consultant;

  @ManyToMany
  @JoinTable(name = "user_course", joinColumns = @JoinColumn(name = "course_id"),
      inverseJoinColumns = @JoinColumn(name = "user_id"))
  private Collection<User> users = new ArrayList<>();

  @ManyToMany
  private Collection<Tag> tags = new ArrayList<>();

  @OneToMany(mappedBy = "course")
  private Collection<CourseFeedback> feedbacks = new ArrayList<>();

  @ManyToOne
  private CourseCategory category;

  private String cover;

  private String address;

  private Float price = 0.00f;

  private Integer capacity;

  @Enumerated(EnumType.STRING)
  private CourseApproach approach;

  private String videoLink;

  private String embeddedVideo;

  private String groupAddress;

  private String location;

  public Course(String title, String description) {
    this.title = title;
    this.description = description;
  }

  public Course(Long id) {
    super(id);
  }

  @Override
  public Collection<User> sendTo() {
    if (this.state == CourseState.IN_PROGRESS) {
      return this.getUsers();
    } else {
      return new ArrayList<>();
    }
  }

  @Override
  public String getSummary() {
    return this.getTitle();
  }

  @Override
  public String toString() {
    return this.getTitle() + " (" + this.getState() + ")";
  }


}
