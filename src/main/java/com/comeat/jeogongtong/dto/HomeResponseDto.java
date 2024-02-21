package com.comeat.jeogongtong.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class HomeResponseDto {
    private List<StudyDto> myStudy;
    private UserDto user;
}
