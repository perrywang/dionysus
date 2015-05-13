package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestsets")
public class PsychTestSet extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336073876229L;

  @NotBlank
  private String title;

  @Lob
  private String description;

  @ManyToMany(mappedBy = "sets")
  private Collection<PsychTest> tests = new ArrayList<>();

}
