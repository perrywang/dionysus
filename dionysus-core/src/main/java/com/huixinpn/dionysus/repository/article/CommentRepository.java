package com.huixinpn.dionysus.repository.article;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huixinpn.dionysus.domain.article.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

}
