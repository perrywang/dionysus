package com.huixinpn.dionysus.repository.murmur;

import com.huixinpn.dionysus.domain.murmur.MComment;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MCommentRepository extends JpaRepository<MComment, Long> {
    Page<MComment> findByCreatedBy(User user, Pageable page);
}
