package com.huixinpn.dionysus.repository.question;

import com.huixinpn.dionysus.domain.question.QTag;
import com.huixinpn.dionysus.domain.question.Question;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {

  @Query(value = "select q from Question q where (q.createdBy = ?1 and q.approved = true) or (q.createdBy.id = ?#{principal.id})")
  Page<Question> findByAuthor(User user, Pageable pageable);

  @Query(value = "select q from Question q join q.tags where (?1 in q.tags and q.approved = true) or (q.createdBy.id = ?#{principal.id})")
  Page<Question> findByTag(QTag tag, Pageable pageable);

  @Query(value = "select q from Question q where (q.createdBy.id = ?#{principal.id} or q.approved = true)")
  Page<Question> findAll(Pageable pageable);

}
