package com.huixinpn.dionysus.domain.article;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * Created by huanghao on 5/30/15.
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name="official_articles")
@PrimaryKeyJoinColumn
public class OfficialArticle extends Article {
    private static final long serialVersionUID = 4106093798543231113L;

}
