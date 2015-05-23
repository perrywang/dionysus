package com.huixinpn.dionysus.domain.psychtest.results;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.psychtest.PsychTestSuite;
import com.huixinpn.dionysus.domain.user.User;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "psychtestsettestings")
public class PsychTestSetTesting extends AbstractDionysusAuditable<User> {

  private static final long serialVersionUID = -4860166334673876429L;

  @OneToOne
  private PsychTestSuite set;

  @OneToMany(mappedBy = "setTesting")
  private Collection<PsychTesting> testings = new ArrayList<>();

  @OneToOne
  private PsychTesting current;

  @Enumerated(EnumType.STRING)
  private PsychTestingState state;

}
