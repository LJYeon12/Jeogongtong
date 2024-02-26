package com.comeat.jeogongtong.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserRankDto {

    private Long userId;
    private String nickname;
    private Integer rank;
    private Long weektime; // 누적 공부 시간, 초 단위
}

