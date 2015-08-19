package com.huixinpn.dionysus.domain.psychtest.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import com.huixinpn.dionysus.repository.psychtest.PsychTestRepository;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * Created by huanghao on 8/19/15.
 */

@Data
@NoArgsConstructor
@Component
public class PsychTestResultData extends EntityData<PsychTestResult> {

    @Autowired
    private PsychTestRepository psychTestRepository;
    private UserData userData;
    private String state;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm")
    private DateTime date;
    private String testTitle;
    private Long testId;

    @Override
    public void update(PsychTestResult entity) {

    }

    public PsychTestResultData(PsychTestResult entity) {
        super(entity);
        this.userData = new UserData(entity.getCreatedBy());
        this.state = entity.getState().toString();
        this.date = entity.getLastModifiedDate();
        this.testTitle = entity.getTest().getTitle();
        this.testId = entity.getTest().getId();

    }
}
