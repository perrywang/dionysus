package com.huixinpn.dionysus.repository;

import com.huixinpn.dionysus.domain.user.Notification;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
  Page<Notification> findByInboxUser(User user,Pageable pageable);
}
