package com.huixinpn.dionysus.domain.murmur;

import com.huixinpn.dionysus.domain.AbstractDionysusAuditable;
import com.huixinpn.dionysus.domain.user.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "murmurs")
@Data
@NoArgsConstructor
public class Murmur extends AbstractDionysusAuditable<User> {

    private String content;

    @OneToMany(mappedBy = "murmur", cascade = {CascadeType.REMOVE, CascadeType.PERSIST, CascadeType.MERGE})
    private Collection<MComment> comments = new ArrayList<>();

    public Murmur(Long id) {
        super(id);
    }
}
