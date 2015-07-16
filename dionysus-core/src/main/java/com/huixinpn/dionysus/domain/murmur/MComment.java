package com.huixinpn.dionysus.domain.murmur;

import com.huixinpn.dionysus.domain.AbstractDionysusNotifiable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "mcomments")
@Data
@NoArgsConstructor
public class MComment extends AbstractDionysusNotifiable<User> {

    private static final long serialVersionUID = 2523934017908030908L;

    @ManyToOne
    private Murmur murmur;

    private String content;

    public MComment(Long id) {
        super(id);
    }

    @Override
    public List<User> sendTo() {
        User creator = this.murmur.getCreatedBy();
        User updator = this.murmur.getLastModifiedBy();
        List<User> users = new ArrayList<User>();
        if (creator != null) {
            users.add(creator);
        }
        if (updator != null && updator != creator) {
            users.add(updator);
        }
        return users;
    }

    @Override
    public String getSummary() {
        return this.getContent();
    }
}
