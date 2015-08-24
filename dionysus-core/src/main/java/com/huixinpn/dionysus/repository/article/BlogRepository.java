package com.huixinpn.dionysus.repository.article;

import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by huanghao on 5/30/15.
 */
@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {
    @PreAuthorize("#author.username == principal.username or hasRole('ADMIN')")
    Page<Blog> findByCreatedBy(@Param("author") User author, Pageable pageable);

    @Query(value = "select b from Blog b where b.createdBy = :author")
    Page<Blog> findOrganizationCreated(@Param("author") User author, Pageable pageable);
}
