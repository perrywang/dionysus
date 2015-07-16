package com.huixinpn.dionysus.dto.murmur;

import com.huixinpn.dionysus.domain.murmur.MComment;
import com.huixinpn.dionysus.dto.EntityData;
import com.huixinpn.dionysus.dto.user.UserData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

@Data
@NoArgsConstructor
public class MCommentData extends EntityData<MComment> {

    private UserData createdBy;

    private String content;

    private DateTime createdDate;


    public MCommentData(MComment entity) {
        super(entity);
        this.createdBy = new UserData(entity.getCreatedBy());
        this.content = entity.getContent();
        this.createdDate = entity.getCreatedDate();
    }

    @Override
    public void update(MComment entity) {
        entity.setContent(this.content);
    }
}
