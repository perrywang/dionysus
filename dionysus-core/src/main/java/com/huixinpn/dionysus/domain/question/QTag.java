package com.huixinpn.dionysus.domain.question;


import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "qtags")
@Data
@NoArgsConstructor
public class QTag extends AbstractDionysusPersistable{

  private String name;

  @ManyToMany(mappedBy = "tags")
  private Collection<Question> questions = new ArrayList<>();

  public QTag(Long id) {
    super(id);
  }
}
