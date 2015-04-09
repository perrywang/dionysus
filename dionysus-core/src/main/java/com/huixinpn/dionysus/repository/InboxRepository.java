package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.Inbox;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 4/9/2015.
 */

@Repository
public interface InboxRepository extends JpaRepository<Inbox, Long>{
}
