package com.huixinpn.dionysus.domain.tag;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table
public class TagCategory extends AbstractDionysusPersistable {
  @NotBlank
  private String name;

  @ManyToMany(mappedBy = "categories")
  private Collection<Tag> tags = new ArrayList<>();
}
