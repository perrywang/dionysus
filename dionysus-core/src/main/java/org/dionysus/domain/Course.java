
package org.dionysus.domain;

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
    private String state;
    
    //one consult can published many courses
    @ManyToOne(fetch = FetchType.EAGER)
    private User consultant;
    
    /*
    one course has many registrations, one user can register many courses
    */
    @ManyToMany(mappedBy = "registeredCourses")
    private Collection<User> registrations;

}
