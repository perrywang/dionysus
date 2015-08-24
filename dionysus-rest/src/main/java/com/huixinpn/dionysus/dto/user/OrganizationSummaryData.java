package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrganizationSummaryData extends UserData {
    private String realName;


    public OrganizationSummaryData(User user) {
        super(user);
        this.realName = user.getRealName();
    }

    @Override
    public void update(User entity) {
        super.update(entity);
        entity.setRealName(this.getRealName());
    }
}
