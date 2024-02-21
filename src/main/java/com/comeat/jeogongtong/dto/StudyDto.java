package com.comeat.jeogongtong.dto;


import com.comeat.jeogongtong.model.StudyEntity;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@ToString
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 필드를 매개변수로 하는 생성자
public class StudyDto {
    private Long studyId;
    private String name;
    private String book;
    private String category;
    private String settingPeriod; // 기한 (일단 int로)
    private int rankerAsk; //질의응답 타입을 int로?
    private int rankerAnswer;
    private String intro;

    private LocalDate createdTime;
//    private LocalDateTime studyUpdatedTime;
    public static StudyDto toStudyDto(StudyEntity studyEntity) {
        StudyDto studyDto = new StudyDto();
        studyDto.setStudyId(studyEntity.getStudyId());
        studyDto.setName(studyEntity.getName());
        studyDto.setBook(studyEntity.getBook());
        studyDto.setCategory(studyEntity.getCategory());
        studyDto.setSettingPeriod(studyEntity.getSettingPeriod());
        studyDto.setRankerAsk(studyEntity.getRankerAsk());
        studyDto.setRankerAnswer(studyEntity.getRankerAnswer());
        studyDto.setIntro(studyEntity.getIntro());
        studyDto.setCreatedTime(studyEntity.getCreatedTime());
        return studyDto;
    }
}
