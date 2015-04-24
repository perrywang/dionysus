package com.huixinpn.dionysus.domain.event;

import com.huixinpn.dionysus.domain.user.Inbox;
import com.huixinpn.dionysus.domain.user.Notification;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.NotificationRepository;
import com.huixinpn.dionysus.utils.AutowireInjector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.PostPersist;
import java.util.Collection;

public class NotificationListener {

  @Autowired
  NotificationRepository notificationRepository;

  @PostPersist
  public void sendNotification(Notifiable<User> entity) {
    User from = entity.receiveFrom();
    Collection<User> tos = entity.sendTo();
    String summary = entity.getSummary();

    for (User to : tos) {
      Inbox inbox = to.getInbox();
      Notification notification = new Notification(inbox, from, summary);
      //ugly tentatively using this inject
      if (this.notificationRepository == null) {
        AutowireInjector.inject(this, this.notificationRepository);
      }
      notificationRepository.save(notification);
      //only for testing pass. remove it later
      inbox.addNotification(notification);
    }
  }
}
