package com.huixinpn.dionysus.repository.article;

import com.huixinpn.dionysus.domain.article.ArticleType;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.article.OfficialArticle;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by huanghao on 5/30/15.
 */
@Repository
public interface OfficialArticleRepository extends JpaRepository<OfficialArticle, Long> {

    List<OfficialArticle> findByCategory(@Param("category") Category category);

    @PreAuthorize("#author.username == principal.username or hasRole('ADMIN')")
    List<OfficialArticle> findByCreatedBy(@Param("author") User author);

    Page<OfficialArticle> findByLocationOrderByLastModifiedDateDesc(@Param("location") String location, Pageable pageable);

    Page<OfficialArticle> findByCategoryAndTypeOrderByLastModifiedDateDesc(@Param("category") Category category, @Param("type")ArticleType articleType, Pageable pageable);
}
