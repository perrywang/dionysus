package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.site.Module;

@Repository
public interface ModuleRepository extends JpaRepository<Module, Long> {

}
