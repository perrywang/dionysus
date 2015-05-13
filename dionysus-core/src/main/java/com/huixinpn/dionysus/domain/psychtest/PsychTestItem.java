package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestitems")
public class PsychTestItem extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -3202875107419512957L;

  @Column(name = "description")
  private String description;

  @ManyToOne
  private PsychTest test;

  @ManyToOne
  private PsychTestCategory category;

  @OneToMany(mappedBy = "item")
  private Collection<PsychTestItemOption> options = new ArrayList<>();

  public void addItemOption(PsychTestItemOption option) {
    options.add(option);
  }

  public void removeItemOption(PsychTestItemOption option) {
    options.remove(option);
  }
}
