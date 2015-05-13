package com.huixinpn.dionysus.domain.psychtest;

import org.hibernate.validator.constraints.NotBlank;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;

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
  
  @OneToMany
  @JoinColumn(name = "test_id") 
  private List<PsychTestItem> items;

  public PsychTest(String title, String description, List<PsychTestItem> items) {
    this.title = title;
    this.description = description;
    this.items = items;
  }

  public PsychTest(String title, String description) {
    this(title, description, new ArrayList<PsychTestItem>());
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

  public void addTestItem(PsychTestItem item) {
    items.add(item);
  }

  public void removeTestItem(PsychTestItem item) {
    items.remove(item);
  }

}
