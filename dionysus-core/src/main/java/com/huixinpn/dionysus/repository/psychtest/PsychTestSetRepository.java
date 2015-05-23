package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTestSet;

@Repository
@RestResource(path="psychtestsets", rel="psychtestsets")
public interface PsychTestSetRepository extends JpaRepository<PsychTestSet, Long> {

}
