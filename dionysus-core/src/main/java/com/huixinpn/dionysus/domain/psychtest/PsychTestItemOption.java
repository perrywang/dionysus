package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestitemoptions")
public class PsychTestItemOption extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -3002875103419512957L;

  @NotBlank
  private String description;

  private Integer score;

  private Integer weight;

  @ManyToOne
  private PsychTestItem item;

  public PsychTestItemOption(Long id){
    super(id);
  }

}
