package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTestCategory_16PF;

@Repository
public interface PsychTestCategory16PFRepository extends JpaRepository<PsychTestCategory_16PF, Long>{
}
