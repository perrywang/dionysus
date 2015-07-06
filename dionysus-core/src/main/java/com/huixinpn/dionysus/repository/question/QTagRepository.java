package com.huixinpn.dionysus.repository.question;

import com.huixinpn.dionysus.domain.question.QTag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;

public interface QTagRepository extends JpaRepository<QTag, Long> {

  @Query(value = "select t from QTag t join t.questions order by size(t.questions) desc")
  Page<QTag> findTopNTag(Pageable pageable);
}
