package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.beans.ConstructorProperties;


@Getter
@NoArgsConstructor
@Builder
@JsonDeserialize(builder = QuestionRequestDto.QuestionRequestDtoBuilder.class)
public class QuestionRequestDto {
    private String title;
    private String content;
    private String category;
    private String regiDate;
    private String photoUrl;

    @ConstructorProperties({"title", "content", "category","regiDate","photoUrl"})
    public QuestionRequestDto(String title, String content, String category, String regiDate, String photoUrl) {
        this.title = title;
        this.content = content;
        this.category = category;
        this.regiDate = regiDate;
        this.photoUrl = photoUrl;
    }
    public Questions toEntity() {
        Questions questions = new Questions();
        questions.setTitle(this.title);
        questions.setContent(this.content);
        questions.setCategory(this.category);
        questions.setRegiDate(this.regiDate);
        questions.setPhotoUrl(this.photoUrl);
        return questions;
    }
}