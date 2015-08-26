package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.OrganizationStatus;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationRepository extends UserRepository {

    Page<User> findByOrganizationStatus(@Param("status") OrganizationStatus status, Pageable pageable);

    @Query(value = "select u from User u where u.organizationStatus != 'NONE' order by u.lastModifiedDate desc")
    Page<User> allOrganizations(Pageable pageable);
}