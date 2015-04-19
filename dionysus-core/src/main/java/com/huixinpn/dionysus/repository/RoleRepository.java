package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.user.Role;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
}
