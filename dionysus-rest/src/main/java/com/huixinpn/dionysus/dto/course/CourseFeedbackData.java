package com.huixinpn.dionysus.dto.course;

import com.huixinpn.dionysus.domain.course.CourseFeedback;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

@Data
@NoArgsConstructor
public class CourseFeedbackData extends EntityData<CourseFeedback> {

    private String comment;
    private UserData createdBy;
    private DateTime lastModifiedDate;

    public CourseFeedbackData(CourseFeedback entity) {
        super(entity);
        this.createdBy = new UserData(entity.getCreatedBy());
        this.comment = entity.getComment();
        this.lastModifiedDate = entity.getLastModifiedDate();
    }

    @Override
    public void update(CourseFeedback entity) {

    }
}
