package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.Profile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ProfileRepository extends JpaRepository<Profile, Long> {

    @Override
    @PostAuthorize("returnObject.user==principal or hasRole('ADMIN')")
    Profile findOne(Long id);
}
