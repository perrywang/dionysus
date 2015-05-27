package com.huixinpn.dionysus.domain.course;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "coursecategories")
public class CourseCategory extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -1815965724913284764L;

  @NotEmpty
  @Column(name = "name", unique = true)
  private String name;

  @ManyToOne
  private CourseCategory parent;

  @OneToMany(mappedBy = "parent")
  private Collection<CourseCategory> children = new ArrayList<>();

  @OneToMany(mappedBy = "category")
  private Collection<Course> courses = new ArrayList<>();

  public CourseCategory(String name) {
    this.name = name;
  }

  public CourseCategory(Long id){
    super(id);
  }

  public void addCourse(Course course) {
    this.courses.add(course);
  }

  public void removeCourse(Course course) {
    this.courses.remove(course);
  }

  @Override
  public String toString() {
    StringBuilder out = new StringBuilder();
    if (this.getParent() != null) {
      out.append(this.getParent()).append(" > ");
    }
    out.append(this.name);
    return out.toString();
  }
}
