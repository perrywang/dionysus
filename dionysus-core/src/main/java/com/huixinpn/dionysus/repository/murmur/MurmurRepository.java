package com.huixinpn.dionysus.repository.murmur;

import com.huixinpn.dionysus.domain.murmur.Murmur;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MurmurRepository extends JpaRepository<Murmur, Long> {
    Page<Murmur> findByCreatedBy(User user, Pageable page);
}
