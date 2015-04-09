package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.Inbox;

@Repository
public interface InboxRepository extends JpaRepository<Inbox, Long> {

}