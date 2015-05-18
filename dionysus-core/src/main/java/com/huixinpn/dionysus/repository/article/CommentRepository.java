package com.huixinpn.dionysus.repository.article;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.article.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

}
