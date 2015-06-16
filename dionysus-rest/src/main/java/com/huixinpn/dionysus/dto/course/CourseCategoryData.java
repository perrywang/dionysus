package com.huixinpn.dionysus.dto.course;

import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Data
@NoArgsConstructor
public class CourseCategoryData extends EntityData<CourseCategory> {
  private String name;
  private Long parent;
  private Collection<CourseCategoryData> children;

  public CourseCategoryData(CourseCategory courseCategory) {
    super(courseCategory);
    this.name = courseCategory.getName();
    if(courseCategory.getParent() != null){
      this.parent = courseCategory.getParent().getId();
    }
    this.children = new EntityCollectionData<>(courseCategory.getChildren(),CourseCategoryData.class).toDTOCollection();
  }

  @Override
  public void update(CourseCategory courseCategory){
    courseCategory.setName(this.getName());
    if(this.parent != null){
      courseCategory.setParent(new CourseCategory(this.parent));
    }
  }
}
