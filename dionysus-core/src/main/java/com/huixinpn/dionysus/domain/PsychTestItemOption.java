package com.huixinpn.dionysus.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PsychTestItemOption {
    @Column(name="description")
    private String description;

}
