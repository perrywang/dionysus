package com.huixinpn.dionysus.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "psychtestitems")
public class PsychTestItem extends AbstractDionysusPersistable{

    @Column(name="description")
	private String description;

    @ManyToOne
    private PsychTest test;

    @OneToMany(mappedBy = "testItem",orphanRemoval = true)
    private List<PsychTestItemOption> options;

    public PsychTestItem(String description, PsychTest test, List<PsychTestItemOption> options) {
        this.description = description;
        this.test = test;
        this.options = options;
    }

    public PsychTestItem(String description, PsychTest test) {
        this(description,test,new ArrayList<PsychTestItemOption>());
    }

    public PsychTestItem() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PsychTest getTest() {
        return test;
    }

    public void setTest(PsychTest test) {
        this.test = test;
    }

    public List<PsychTestItemOption> getOptions() {
        return options;
    }

    public void setOptions(List<PsychTestItemOption> options) {
        this.options = options;
    }

    public void addItemOption(PsychTestItemOption option){
        options.add(option);
    }

    public void removeItemOption(PsychTestItemOption option){
        options.remove(option);
    }
}
