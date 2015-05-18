package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestCategory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestCategoryRepository extends JpaRepository<PsychTestCategory, Long>{
}
