package com.comeat.jeogongtong.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimerResponseDto {
    private boolean success;
    private String message;
    private Long userId;
    private Long studyId;
    private Long weektime; // 업데이트된 누적 공부 시간 (예: 초 단위
}
