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
@Table(name="blog")
@PrimaryKeyJoinColumn
public class Blog extends Article {
    private static final long serialVersionUID = 6574790333326445426L;

}
