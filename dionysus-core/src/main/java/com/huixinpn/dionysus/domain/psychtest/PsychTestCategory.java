package com.huixinpn.dionysus.domain.psychtest;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import org.hibernate.validator.constraints.NotEmpty;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestcategories")
public class PsychTestCategory extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336043876229L;

  @NotEmpty
  private String name;

  @ManyToOne
  private PsychTest test;

}
