package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestItem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestItemRepository extends JpaRepository<PsychTestItem, Long>{
}
