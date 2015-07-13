package com.huixinpn.dionysus.repository.chat;

import com.huixinpn.dionysus.domain.chat.ChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 7/5/15.
 */
@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
}
