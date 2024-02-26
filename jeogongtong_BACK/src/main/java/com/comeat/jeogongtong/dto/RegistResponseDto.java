package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.StudyEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Builder;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistResponseDto {
    private Long study_id;
    private String name;
    private String book;
    private String category;
    private String settingPeriod;
    private int rankerAsk;
    private int rankerAnswer;
    private String intro;
    //private String admin_email;



    public static RegistResponseDto of(StudyEntity studyEntity) {
        return RegistResponseDto.builder()
                .study_id(studyEntity.getStudyId())
                .name(studyEntity.getName())
                .book(studyEntity.getBook())
                .category(studyEntity.getCategory())
                .settingPeriod(studyEntity.getSettingPeriod())
                .rankerAsk(studyEntity.getRankerAsk())
                .rankerAnswer(studyEntity.getRankerAnswer())
                .intro(studyEntity.getIntro())
                //.admin_email(studyEntity.getUsers().getEmail())
                .build();
    }
}

