package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtestsettestings")
public class PsychTestSetTesting extends AbstractDionysusAuditable<User> {

  private static final long serialVersionUID = -4860166334673876429L;

  @OneToOne
  private PsychTestSet set;

  @OneToMany(mappedBy = "setTesting")
  private Collection<PsychTesting> testings = new ArrayList<>();

  @OneToOne
  private PsychTesting current;

  @Enumerated(EnumType.STRING)
  private PsychTestingState state;

}
