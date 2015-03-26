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

    @ManyToOne
    private PsychTestItem item;

    public PsychTestItemOption(String description, PsychTestItem testItem) {
        this.description = description;
        this.item = testItem;
    }

    public PsychTestItemOption() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PsychTestItem getTestItem() {
        return item;
    }

    public void setTestItem(PsychTestItem testItem) {
        this.item = testItem;
    }
}
