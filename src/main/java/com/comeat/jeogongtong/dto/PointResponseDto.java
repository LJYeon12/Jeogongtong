package com.comeat.jeogongtong.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PointResponseDto {
    private Long askansId; //질문 답변 ID
    private String pointType;
    private String awardedDate; //포인트 지급일
    private Long points;
}