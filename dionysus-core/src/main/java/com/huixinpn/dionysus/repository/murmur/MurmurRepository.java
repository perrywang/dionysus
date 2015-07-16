package com.huixinpn.dionysus.repository.murmur;

import com.huixinpn.dionysus.domain.murmur.Murmur;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MurmurRepository extends JpaRepository<Murmur, Long> {
    @Query(value = "select m from Murmur m where m.createdBy = ?1 order by m.createdDate desc")
    Page<Murmur> findByCreatedBy(User user, Pageable page);
}
