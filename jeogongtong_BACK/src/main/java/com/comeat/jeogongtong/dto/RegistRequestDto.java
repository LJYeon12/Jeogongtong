package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.StudyEntity;
import com.comeat.jeogongtong.model.Users;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RegistRequestDto {
    private String name;
    private String book;
    private String category;
    private String settingPeriod;
    private int rankerAsk;
    private int rankerAnswer;
    private String intro;

    public StudyEntity toEntity() {
        StudyEntity studyEntity = new StudyEntity();
        studyEntity.setName(this.name);
        studyEntity.setBook(this.book);
        studyEntity.setCategory(this.category);
        studyEntity.setSettingPeriod(this.settingPeriod);
        studyEntity.setRankerAsk(this.rankerAsk);
        studyEntity.setRankerAnswer(this.rankerAnswer);
        studyEntity.setIntro(this.intro);

        return studyEntity;
    }
}

