package com.comeat.jeogongtong.dto;

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
}

