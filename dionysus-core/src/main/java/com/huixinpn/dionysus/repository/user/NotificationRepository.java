package com.huixinpn.dionysus.repository.user;

import com.huixinpn.dionysus.domain.user.Inbox;
import com.huixinpn.dionysus.domain.user.Notification;
import com.huixinpn.dionysus.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {

    Page<Notification> findByInboxUser(User user, Pageable pageable);
    Long countByInbox(Inbox inbox);

    @Query("select n from Notification n where n.inbox = ?#{principal.inbox}")
    Page<Notification> findMyNotification(Pageable pageable);

}
