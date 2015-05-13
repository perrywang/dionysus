package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestcategories")
public class PsychTestCategory extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336043876229L;

  @NotEmpty
  private String name;

  @ManyToOne
  private PsychTest test;

  @OneToMany(mappedBy = "category")
  private Collection<PsychTestItem> items = new ArrayList<>();

}
