package com.huixinpn.dionysus.repository.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTestingSelection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PsychTestingSelectionRepository extends JpaRepository<PsychTestingSelection, Long> {
  @Query("select s from PsychTestingSelection s where s.testing.id = ?1 and s.item.id = ?2")
  PsychTestingSelection findByTestingAndItem(Long testing_id, Long item_id);
}
