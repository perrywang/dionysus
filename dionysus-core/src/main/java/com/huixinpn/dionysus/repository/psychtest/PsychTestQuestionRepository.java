package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestQuestionRepository extends JpaRepository<PsychTestQuestion, Long>{

}
