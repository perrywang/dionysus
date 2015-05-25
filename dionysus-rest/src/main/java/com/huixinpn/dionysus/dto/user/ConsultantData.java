package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.Consultant;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ConsultantData extends UserData{
  public ConsultantData(Consultant consultant){
    super(consultant);
  }
}
