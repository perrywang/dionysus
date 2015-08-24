package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.OrganizationStatus;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationRepository extends UserRepository {
    Page<User> findByOrganizationStatus(@Param("status") OrganizationStatus status, Pageable pageable);
}