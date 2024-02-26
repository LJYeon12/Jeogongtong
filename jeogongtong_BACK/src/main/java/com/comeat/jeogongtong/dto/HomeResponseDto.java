package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Users;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class HomeResponseDto {
    private List<StudyDto> myStudy;
    private Users user;
}
