package com.huixinpn.dionysus.domain.tag;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.course.Course;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table
public class Tag extends AbstractDionysusPersistable {

  @NotBlank
  private String name;

  @ManyToMany
  private Collection<TagCategory> categories = new ArrayList<>();

  @ManyToMany
  private Collection<Course> courses = new ArrayList<>();

  @ManyToMany
  private Collection<Article> articles = new ArrayList<>();


}