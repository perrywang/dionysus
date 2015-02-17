
package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 *
 * @author pengwang, persist courses consultant published
 */
@Entity
@Table(name = "courses")
@EntityListeners(AuditingEntityListener.class)
public class Course extends AbstractPersistable<Long> {
    private static final long serialVersionUID = 2523934617928638918L;
    
    @Column(name = "title")
    @NotBlank(message = "course title is required")
    private String title;
    
    @Column(name = "description")
    private String description;
    
    //course has possible states, active, inactive, completed
    @Column(name = "state")
    @NotBlank(message = "state is required")
    private String state;
    
    //one consult can published many courses,defau
    @ManyToOne(fetch = FetchType.EAGER)
    private Consultant consultant;
    
    /*
    one course has many registrations, one user can register many courses
    */
    @ManyToMany(mappedBy = "registeredCourses")
    private Collection<User> registrations;
    
    public Course(String title,String description, String state){
        super();
        this.setTitle(title);
        this.setDescription(description);
        this.setState(state);
        this.setRegistrations(new ArrayList<User>());
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Consultant getConsultant() {
        return consultant;
    }

    public void setConsultant(Consultant consultant) {
        this.consultant = consultant;
    }

    public Collection<User> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(Collection<User> registrations) {
        this.registrations = registrations;
    }
    
    @Override
    public String toString(){
        return "course:"+this.getTitle()+":"+this.getState();
    }
}
