package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionResponseDto {
    private String title;
    private String content;
    private String category;
    private String regiDate;
    private String photoUrl;


    public static QuestionResponseDto of(Questions questions) {
        return QuestionResponseDto.builder()
                .title(questions.getTitle())
                .content(questions.getContent())
                .category(questions.getCategory())
                .regiDate(questions.getRegiDate())
                .photoUrl(questions.getPhotoUrl())
                .build();
    }

}