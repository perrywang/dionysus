package com.huixinpn.dionysus.domain;

import javax.persistence.*;
import java.util.Calendar;

@Entity
@Table(name = "courseooffline")
@PrimaryKeyJoinColumn
public class CourseOffline extends Course {

  private static final long serialVersionUID = 2523934617928638938L;

  private String address;

  //temp using Integer, use class currency in future
  private Integer price;

  private Integer capacity;

  @Column(name = "calendar")
  @Temporal(TemporalType.DATE)
  private Calendar date;

  public CourseOffline() {
    super();
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
  }

  public Integer getCapacity() {
    return capacity;
  }

  public void setCapacity(Integer capacity) {
    this.capacity = capacity;
  }
}
