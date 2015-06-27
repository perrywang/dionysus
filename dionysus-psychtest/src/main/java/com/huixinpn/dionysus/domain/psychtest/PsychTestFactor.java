package com.huixinpn.dionysus.domain.psychtest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name = "psychtestfactors")
public class PsychTestFactor extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336043876229L;

  @NonNull
  @Column(name = "factor")
  private String factor;
  
  @NonNull
  @Column(name = "name")
  private String name;

}
