package org.dionysus.repository;

import org.dionysus.domain.PsychTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestRepository extends JpaRepository<PsychTest, String> {

}
