package com.huixinpn.dionysus.domain.tag;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import java.io.Serializable;

@Data
@NoArgsConstructor
@Entity
@Table(name = "courses_tags",uniqueConstraints = {@UniqueConstraint(columnNames = {"courses_id","tags_id"})})
public class Course_Tag extends AbstractDionysusPersistable{

  private static final long serialVersionUID = -1815965727913284764L;

  private Long tags_id;
  private Long courses_id;
}
