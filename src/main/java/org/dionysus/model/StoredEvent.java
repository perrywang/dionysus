/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.dionysus.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author pengwang
 */
@Entity
@Table(name = "EVENTS")
public class StoredEvent implements Serializable {
    
    private static final long serialVersionUID = -1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    protected Long id;
    
    @Column(name = "OCCURED")
    protected Date occurredOn;
    
    @Column(name = "EVENT_BODY")
    protected String eventBody;
    
    /*
    this is used Class.forName() to deserialize json string to domain event object
    */
    @Column(name = "TYPE_NAME")
    protected String typeName;
    
    /*
    all the set methods protected only can be used by child class or Spring/Hibernate framework with reflect
     */
    
    /*
    ID is using auto strategy, this can't be called application because id can't get before insert database
    */
    protected StoredEvent(Long id, Date occurredOn, String eventBody, String typeName) {
        this.id = id;
        this.occurredOn = occurredOn;
        this.eventBody = eventBody;
        this.typeName = typeName;
    }

    protected StoredEvent() {
    }

    public StoredEvent(Date occurredOn, String eventBody, String typeName) {
        this.occurredOn = occurredOn;
        this.eventBody = eventBody;
        this.typeName = typeName;
    }
   
    public Long getId() {
        return id;
    }

    protected void setId(Long id) {
        this.id = id;
    }

    public Date getOccurredOn() {
        return occurredOn;
    }

    protected void setOccurredOn(Date occurredOn) {
        this.occurredOn = occurredOn;
    }

    public String getEventBody() {
        return eventBody;
    }

    protected void setEventBody(String eventBody) {
        this.eventBody = eventBody;
    }

    public String getTypeName() {
        return typeName;
    }

    protected void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    
    
}
