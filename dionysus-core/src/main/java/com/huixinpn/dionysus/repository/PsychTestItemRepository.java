package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.psychtest.PsychTestItem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestItemRepository extends JpaRepository<PsychTestItem, Long>{
}
