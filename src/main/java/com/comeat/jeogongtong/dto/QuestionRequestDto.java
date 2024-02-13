package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class QuestionRequestDto {
    private String title;
    private String content;
    private String category;
    private String regiDate;
    private String photoUrl;
    private Users users;

    public Questions toEntity() {
        Questions questions = new Questions();
        questions.setTitle(this.title);
        questions.setContent(this.content);
        questions.setCategory(this.category);
        questions.setRegiDate(this.regiDate);
        questions.setPhotoUrl(this.photoUrl);
        questions.setUsers(this.users);

        return questions;
    }
}