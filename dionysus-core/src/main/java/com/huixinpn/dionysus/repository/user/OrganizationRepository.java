package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.Organization;
import com.huixinpn.dionysus.domain.user.OrganizationStatus;
import com.huixinpn.dionysus.domain.user.projection.SummaryOfOrganizationExcerpt;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(excerptProjection = SummaryOfOrganizationExcerpt.class)
public interface OrganizationRepository extends JpaRepository<Organization, Long> {
    Page<Organization> findByStatus(@Param("status") OrganizationStatus status, Pageable pageable);
}