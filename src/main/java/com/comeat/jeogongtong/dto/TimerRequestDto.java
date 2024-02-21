package com.comeat.jeogongtong.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimerRequestDto {
    private Long userId;
    private Long studyId;
    private Long weektime; // 타이머 종료 시 전달된 시간 (예: 초 단위)
}
