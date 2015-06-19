package com.huixinpn.dionysus.domain.user;


import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "expertises")
public class ConsExpertise extends AbstractDionysusPersistable {
    private static final long serialVersionUID = -4397869977138590219L;

    private String name;

  @ManyToMany(mappedBy = "expertises")
  private Collection<Consultant> consultants = new ArrayList<>();

  public ConsExpertise(Long id){
    super(id);
  }
}
