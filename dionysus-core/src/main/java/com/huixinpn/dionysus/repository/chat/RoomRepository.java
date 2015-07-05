package com.huixinpn.dionysus.repository.chat;

import com.huixinpn.dionysus.domain.chat.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by huanghao on 7/4/15.
 */
@Repository
public interface RoomRepository extends JpaRepository<Room, Long>{
}
