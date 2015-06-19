package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.ConsExpertise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 6/19/15.
 */
@Repository
public interface ConsExpertiseRepository extends JpaRepository<ConsExpertise, Long>{
}
