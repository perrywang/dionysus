package com.huixinpn.dionysus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huixinpn.dionysus.domain.Notification;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {

}
