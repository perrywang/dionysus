package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.repository.psychtest.proj.PsychTestExcerpt;

@Repository
@RepositoryRestResource(excerptProjection = PsychTestExcerpt.class)
public interface PsychTestRepository extends JpaRepository<PsychTest, Long> {

}
