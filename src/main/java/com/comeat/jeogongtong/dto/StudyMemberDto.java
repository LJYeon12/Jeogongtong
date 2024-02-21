package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.StudyMemberEntity;
import lombok.*;

import java.sql.Time;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StudyMemberDto{ //외래키 복합키 신경 안써도 괜찮
    private Long userId;
    private Long studyId;
    private Long weektime;
    private Integer rank;
    private String state;
    private String studyName;

    // StudyMemberEntity로부터 StudyMemberDto 객체를 생성하는 메서드
    public static StudyMemberDto toStudyMemberDto(StudyMemberEntity studyMemberEntity){
        StudyMemberDto studyMemberDto = new StudyMemberDto();
        if (studyMemberEntity.getUser() != null) {
            studyMemberDto.setUserId(studyMemberEntity.getUser().getUserId());
        }
        if (studyMemberEntity.getStudy() != null){
            studyMemberDto.setStudyId(studyMemberEntity.getStudy().getStudyId());
            studyMemberDto.setStudyName(studyMemberEntity.getStudy().getName()); //스터디 명 받아오기
        }
        studyMemberDto.setWeektime(studyMemberEntity.getWeektime());
        studyMemberDto.setRank(studyMemberEntity.getRank());
        studyMemberDto.setState(studyMemberEntity.getState());
        return studyMemberDto;
    }
}
