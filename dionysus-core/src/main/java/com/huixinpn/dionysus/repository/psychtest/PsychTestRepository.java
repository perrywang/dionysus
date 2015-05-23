package com.huixinpn.dionysus.repository.psychtest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;

@Repository
@RepositoryRestResource(path = "psychtests", 
	collectionResourceRel = "psychtests", 
	itemResourceRel = "psychtest",
	excerptProjection = EmbeddedPsychTestExcerpt.class)
public interface PsychTestRepository extends JpaRepository<PsychTest, Long> {

}
