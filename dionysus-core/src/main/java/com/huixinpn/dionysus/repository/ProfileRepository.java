package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.user.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfileRepository extends JpaRepository<Profile, Long> {
}
