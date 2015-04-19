package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;

@Repository
public interface PsychTestRepository extends JpaRepository<PsychTest, Long> {

}
