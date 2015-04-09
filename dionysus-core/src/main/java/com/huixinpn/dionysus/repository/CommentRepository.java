package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

}
