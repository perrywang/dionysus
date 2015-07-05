package com.huixinpn.dionysus.domain.chat;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by huanghao on 7/4/15.
 */
@Data
@NoArgsConstructor
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name="rooms")
public class Room extends AbstractDionysusAuditable<User> {

    private static final long serialVersionUID = 7238768194716628137L;

    @NonNull
    @Lob
    @Column(name="description")
    private String description;

    @OneToMany(mappedBy = "room")
    private Collection<Message> messages = new ArrayList<>();
}
