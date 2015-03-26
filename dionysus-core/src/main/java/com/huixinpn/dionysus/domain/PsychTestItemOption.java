package com.huixinpn.dionysus.domain;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;

@Entity
@Table(name = "psychtestitemoptions")
public class PsychTestItemOption extends AbstractDionysusPersistable{

    private static final long serialVersionUID = -3002875103419512957L;

    @NotBlank
    @Column(name="description")
    private String description;

    public PsychTestItemOption(String description) {
        this.description = description;
    }

    public PsychTestItemOption() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
