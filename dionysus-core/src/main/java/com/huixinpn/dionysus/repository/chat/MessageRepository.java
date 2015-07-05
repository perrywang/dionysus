package com.huixinpn.dionysus.repository.chat;

import com.huixinpn.dionysus.domain.chat.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 7/5/15.
 */
@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
}
