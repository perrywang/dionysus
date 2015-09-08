package com.huixinpn.dionysus.repository.article;

import com.huixinpn.dionysus.domain.article.ArticleReadCounter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 9/8/15.
 */
@Repository
public interface ReadCounterRepository extends JpaRepository<ArticleReadCounter, Long> {
}
