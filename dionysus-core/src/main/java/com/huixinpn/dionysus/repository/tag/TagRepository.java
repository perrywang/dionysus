package com.huixinpn.dionysus.repository.tag;

import com.huixinpn.dionysus.domain.tag.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {
  @Query(value = "select a.tags_id as id,b.name from courses_tags a join tags b on a.tags_id=b.id group by a.tags_id order by count(a.tags_id) desc limit ?1", nativeQuery = true)
  List<Tag> findTopNTagForCourse(int N);

  @Query(value = "select t from Tag as t, Course_Tag as c where t.id = c.tags_id")
  Page<Tag> findAllCourseTags(Pageable page);

}
