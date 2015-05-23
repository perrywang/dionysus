package com.huixinpn.dionysus.domain.psychtest.results;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestingRepository extends JpaRepository<PsychTesting, Long> {
}
