package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Answers;
import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class AnswerRequestDto {
    private String title;
    private String content;
    private String category;
    private String regiDate;
    private String photoUrl;
    private Users users;
    private Questions questions;

    public Answers toEntity() {
        Answers answers = new Answers();
        answers.setTitle(this.title);
        answers.setContent(this.content);
        answers.setCategory(this.category);
        answers.setRegiDate(this.regiDate);
        answers.setPhotoUrl(this.photoUrl);
        answers.setUsers(this.users);
        answers.setQuestions(this.questions);

        return answers;
    }
}