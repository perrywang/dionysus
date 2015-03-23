package com.huixinpn.dionysus.domain;

import javax.persistence.*;
import java.util.List;

@Embeddable
public class PsychTestItem {

	@Column(name="description")
	private String description;

    @ElementCollection
    @CollectionTable(name = "psychtestitemoptions")
    private List<PsychTestItemOption> options;

}
