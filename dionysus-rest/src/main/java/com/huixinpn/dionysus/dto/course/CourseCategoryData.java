package com.huixinpn.dionysus.dto.course;

import com.huixinpn.dionysus.domain.course.CourseCategory;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityData;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Data
@NoArgsConstructor
public class CourseCategoryData extends EntityData {
  private String name;
  private CourseCategoryData parent;
  private Collection<CourseCategoryData> children;

  public CourseCategoryData(CourseCategory courseCategory) {
    super(courseCategory);
    this.name = courseCategory.getName();
    this.children = new EntityCollectionData<>(courseCategory.getChildren(),CourseCategoryData.class).toDTOCollection();
  }

  public CourseCategory toEntity(){
    CourseCategory category = new CourseCategory();
    category.setId(this.getId());
    category.setName(this.getName());
    return category;
  }
  
}
