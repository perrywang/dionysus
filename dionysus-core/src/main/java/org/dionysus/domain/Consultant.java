
package org.dionysus.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author pengwang, extends User entity
 */
@Entity
@Table(name = "consultants")
@PrimaryKeyJoinColumn
public class Consultant extends User {
    
    private static final long serialVersionUID = 6546337477936620530L;
    
    @OneToMany(mappedBy = "consultant")
    private Collection<Course> publishedCourses;

    public Consultant(String name, String password, String email) {
		super(name,password,email);
                this.setPublishedCourses(new ArrayList<Course>());
    }
    
    public Collection<Course> getPublishedCourses() {
        return publishedCourses;
    }

    public void setPublishedCourses(Collection<Course> publishedCourses) {
        this.publishedCourses = publishedCourses;
    }
    
    public void publishCourse(Course course){
        this.getPublishedCourses().add(course);
    }
    
    @Override
    public String toString(){
        return "consultant:"+this.getName();
    }
}
