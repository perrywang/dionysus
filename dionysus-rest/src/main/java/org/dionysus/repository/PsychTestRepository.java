package org.dionysus.repository;

import org.dionysus.domain.PsychTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "psychtests", path = "psychtests")
public interface PsychTestRepository extends JpaRepository<PsychTest, Long> {

}
