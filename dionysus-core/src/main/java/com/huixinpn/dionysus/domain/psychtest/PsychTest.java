package com.huixinpn.dionysus.domain.psychtest;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;

@Data
@NoArgsConstructor
@Entity
@Table(name = "psychtests")
public class PsychTest extends AbstractDionysusPersistable {

  private static final long serialVersionUID = -4860066336073876229L;

  @NotBlank
  @Column(name = "title")
  private String title;

  @Lob
  @Column(name = "description")
  private String description;

  //测试针对对象
  @Column(name = "object")
  private String object;

  //测试时长
  @Column(name = "duration")
  private String duration;

  //测试收费
  @Column(name = "cost")
  private String cost;

  //测试方式 纸笔还是机检
  @Column(name = "approach")
  private String approach;

  //备注
  @Column(name = "comment")
  private String comment;

  @OneToMany(mappedBy = "test")
  private Collection<PsychTestCategory> categories = new ArrayList<>();

  @OneToMany(mappedBy = "test")
  private Collection<PsychTestItem> items = new ArrayList<>();

  @ManyToMany
  @JoinTable(name = "set_test", joinColumns = @JoinColumn(name = "test_id"),
      inverseJoinColumns = @JoinColumn(name = "set_id"))
  private Collection<PsychTestSet> sets = new ArrayList<>();

  public void addTestItem(PsychTestItem item) {
    items.add(item);
  }

  public void removeTestItem(PsychTestItem item) {
    items.remove(item);
  }

}
