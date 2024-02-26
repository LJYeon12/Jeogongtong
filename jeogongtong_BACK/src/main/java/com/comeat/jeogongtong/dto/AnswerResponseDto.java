package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Answers;
import com.comeat.jeogongtong.model.Questions;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AnswerResponseDto {
    private Long id;
    private String title;
    private String content;
    private String category;
    private String regiDate;
    private String photoUrl;
    private Long userId;
    private Long asking_id;



    public static AnswerResponseDto of(Answers answers) {
        return AnswerResponseDto.builder()
                .id(answers.getId())
                .content(answers.getContent())
                .category(answers.getCategory())
                .regiDate(answers.getRegiDate())
                .photoUrl(answers.getPhotoUrl())
                .userId(answers.getUsers().getUserId())
                .asking_id(answers.getQuestions().getId())
                .build();
    }

}