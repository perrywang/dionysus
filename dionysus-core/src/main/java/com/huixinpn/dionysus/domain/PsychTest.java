package com.huixinpn.dionysus.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "psychtests")
public class PsychTest extends AbstractDionysusPersistable {

	private static final long serialVersionUID = -4860066336073876229L;

	@NotBlank
	@Column(name = "title")
	private String title;

	@Lob @Column(name = "description")
	private String description;

	@OneToMany
    @JoinColumn(name = "test_id")
	private List<PsychTestItem> items;

    public PsychTest(String title, String description, List<PsychTestItem> items) {
        this.title = title;
        this.description = description;
        this.items = items;
    }

    public PsychTest(String title, String description) {
        this(title,description,new ArrayList<PsychTestItem>());
    }

    public PsychTest() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<PsychTestItem> getItems() {
        return items;
    }

    public void setItems(List<PsychTestItem> items) {
        this.items = items;
    }

    public void addTestItem(PsychTestItem item){
        items.add(item);
    }

    public void removeTestItem(PsychTestItem item){
        items.remove(item);
    }
}
