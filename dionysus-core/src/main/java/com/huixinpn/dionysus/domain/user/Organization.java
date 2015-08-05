package com.huixinpn.dionysus.domain.user;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@Entity
@Table(name = "organizations")
@PrimaryKeyJoinColumn
public class Organization extends User{

    @Enumerated(EnumType.STRING)
    private OrganizationStatus status;

    private String location;

    public Organization(Long id){
        super(id);
    }
}
