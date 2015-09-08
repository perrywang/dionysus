package com.huixinpn.dionysus.domain.article;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by huanghao on 9/8/15.
 */

@Data
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "articlesreadcounter")
public class ArticleReadCounter extends AbstractDionysusPersistable {

    @Column(name="value")
    private Integer value;

}
