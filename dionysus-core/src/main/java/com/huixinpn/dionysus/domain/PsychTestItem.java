package com.huixinpn.dionysus.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "psychtestitems")
public class PsychTestItem extends AbstractDionysusPersistable{

    private static final long serialVersionUID = -3202875107419512957L;

    @Column(name="description")
	private String description;

    @OneToMany
    @JoinColumn(name = "item_id")
    private List<PsychTestItemOption> options;

    public PsychTestItem(String description, List<PsychTestItemOption> options) {
        this.description = description;
        this.options = options;
    }

    public PsychTestItem(String description) {
        this(description,new ArrayList<PsychTestItemOption>());
    }

    public PsychTestItem() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
