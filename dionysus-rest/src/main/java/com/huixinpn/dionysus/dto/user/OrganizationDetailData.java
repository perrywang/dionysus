package com.huixinpn.dionysus.dto.user;

import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrganizationDetailData extends OrganizationSummaryData {
    private String contact;
    private String address;
    private String mobile;
    private String email;
    private String about;

    public OrganizationDetailData(User user) {
        super(user);
        this.contact = user.getContact();
        this.address = user.getAddress();
        this.mobile = user.getMobile();
        this.email = user.getEmail();
        this.about = user.getAbout();
    }

    public OrganizationDetailData(Consultant user) {
        this((User)user);
    }

    @Override
    public void update(User entity) {
        super.update(entity);
        entity.setContact(this.getContact());
        entity.setAddress(this.getAddress());
        entity.setMobile(this.getMobile());
        entity.setEmail(this.getEmail());
        entity.setAbout(this.getAbout());
    }
}
